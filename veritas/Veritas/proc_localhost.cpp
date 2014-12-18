#include "ScalaPipe.h"
#include <pthread.h>
#include <signal.h>
#include <sstream>
static bool show_extra_stats = false;
extern "C" {
#include "_input/_input.h"
#include "_output/_output.h"
}
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
static struct {
    SPC clock;
    jmp_buf env;
    volatile uint32_t active_inputs;
    SPKernelData data;
    struct sp__input_data priv;
} instance1;
static struct {
    SPC clock;
    jmp_buf env;
    volatile uint32_t active_inputs;
    SPKernelData data;
    struct sp__output_data priv;
} instance12;
static unsigned long long start_ticks;
static struct timeval start_time;
static pthread_mutex_t sim_mutex = PTHREAD_MUTEX_INITIALIZER;
static void sim_write(int fd, const char *data, size_t size, int count)
{
    pthread_mutex_lock(&sim_mutex);
    const size_t total = size * (count > 0 ? count : 0) + 4;
    char *buffer = (char*)alloca(total);
    *(int*)&buffer[0] = count;
    if(count > 0) {
        memcpy(&buffer[4], data, size * count);
    }
    size_t offset = 0;
    while(offset < total) {
        offset += write(fd, &buffer[offset], total - offset);
    }
    pthread_mutex_unlock(&sim_mutex);
}
static int sim_read(int fd, char *data, ssize_t size, uint32_t max_count)
{
    ssize_t offset = 0;
    char ch = 0;
    ssize_t rc = read(fd, &ch, 1);
    if(rc <= 0) {
        return 0;
    } else if(ch == 0) {
        return -1;
    }
    while(offset < size) {
        rc = read(fd, &data[offset], size - offset);
        if(rc > 0) {
            offset += rc;
        }
    }
    return 1;
}
static char activeedge1 = 1;
static int streamedge1 = -1;
static char activeedge15 = 1;
static int streamedge15 = -1;
static void *edge15_read_value();
static SPQ *q_edge1 = NULL;
static int edge1_get_free()
{
    return spq_get_free(q_edge1);
}
static void *edge1_allocate()
{
    return spq_start_write(q_edge1, 1);
}
static void edge1_send()
{
    spq_finish_write(q_edge1, 1);
    char *data;
    const uint32_t c = spq_start_read(q_edge1, &data);
    sim_write(streamedge1, data, sizeof(UNSIGNED16), c);
    spq_finish_read(q_edge1, c);
}
static void edge1_finish()
{
    activeedge1 = 0;
    sim_write(streamedge1, NULL, 0, -1);
}
static SPQ *q_edge15 = NULL;
static int edge15_get_available()
{
    if(!activeedge15) {
        return spq_get_used(q_edge15);
    }
    const uint32_t f = spq_get_free(q_edge15);
    char *ptr = spq_start_blocking_write(q_edge15, f);
    const int c = sim_read(streamedge15, ptr, sizeof(UNSIGNED16), f);
    if(c >= 0) {
        spq_finish_write(q_edge15, c);
    } else if(c < 0) {
        activeedge15 = 0;
        sp_decrement(&instance12.active_inputs);
    }
    return spq_get_used(q_edge15);
}
static void *edge15_read_value()
{
    if(!activeedge15) {
        return NULL;
    }
    const uint32_t f = spq_get_free(q_edge15);
    char *ptr = spq_start_blocking_write(q_edge15, f);
    const int c = sim_read(streamedge15, ptr, sizeof(UNSIGNED16), f);
    if(c > 0) {
        spq_finish_write(q_edge15, c);
    } else if(c == 0) {
        if(activeedge1) {
            sim_write(streamedge1, NULL, 0, 0);
        }
    } else {
        sp_decrement(&instance12.active_inputs);
        activeedge15 = 0;
    }
    if(spq_start_read(q_edge15, &ptr) > 0) {
        return ptr;
    }
    return NULL;
}
static void edge15_release()
{
    spq_finish_read(q_edge15, 1);
}
static pid_t sim_device4_pid = 0;
static void stopSimulation()
{
    kill(sim_device4_pid, SIGINT);
    waitpid(sim_device4_pid, NULL, 0);
    close(streamedge1);
    unlink("streamedge1");
    close(streamedge15);
    unlink("streamedge15");
}
static void showStats()
{
    struct timeval stop_time;
    unsigned long long q_usage;
    unsigned long long q_size;
    unsigned long long ticks;
    unsigned long long reads;
    unsigned long long us;
    unsigned long long total_ticks;
    unsigned long long total_us;
    unsigned long long stop_ticks = sp_get_ticks();
    gettimeofday(&stop_time, NULL);
    total_ticks = stop_ticks - start_ticks;
    total_us = (stop_time.tv_sec - start_time.tv_sec) * 1000000
             + (stop_time.tv_usec - start_time.tv_usec);
    fprintf(stderr, "Statistics:\n");
    fprintf(stderr, "Total CPU ticks: %llu\n", total_ticks);
    fprintf(stderr, "Total time:      %llu us\n", total_us);
    ticks = instance1.clock.total_ticks;
    reads = instance1.clock.count;
    us = (ticks * total_us) / total_ticks;
    fprintf(stderr, "     _input(instance1): %llu ticks, %llu reads, %llu us\n", ticks, reads, us);
    if (show_extra_stats) {
    }
    ticks = instance12.clock.total_ticks;
    reads = instance12.clock.count;
    us = (ticks * total_us) / total_ticks;
    fprintf(stderr, "     _output(instance12): %llu ticks, %llu reads, %llu us\n", ticks, reads, us);
    if (show_extra_stats) {
        q_size = q_edge15->depth;
        q_usage = spq_get_used(q_edge15);
        fprintf(stderr, "          Input 0: %llu / %llu\n", q_usage, q_size);
    }
}
static void shutdown(int s)
{
    show_extra_stats = true;
    fprintf(stderr, "Shutting down...\n");
    exit(0);
}
static int instance1_get_free(int out_port)
{
    switch(out_port) {
    case 0:
        return edge1_get_free();
    }
    return 0;
}
static void *instance1_allocate(int out_port)
{
    spc_stop(&instance1.clock);
    void *ptr = NULL;
    for(;;) {
        switch(out_port) {
        case 0:
            ptr = edge1_allocate();
            break;
        }
        if(SPLIKELY(ptr != NULL)) {
            spc_start(&instance1.clock);
            return ptr;
        }
        sched_yield();
    }
}
static void instance1_send(int out_port)
{
    spc_stop(&instance1.clock);
    switch(out_port) {
    case 0:
        edge1_send();
        break;
    }
    spc_start(&instance1.clock);
}
static int instance1_get_available(int in_port)
{
    int result = 0;
    spc_stop(&instance1.clock);
    spc_start(&instance1.clock);
    return result;
}
static void *instance1_read_value(int in_port)
{
    void *ptr = NULL;
    int end_count = 0;
    spc_stop(&instance1.clock);
    for(;;) {
        if(SPLIKELY(ptr != NULL)) {
            instance1.clock.count += 1;
            spc_start(&instance1.clock);
            return ptr;
        }
        if(SPUNLIKELY(instance1.active_inputs == 0)) {
            if(end_count > 1) {
                longjmp(instance1.env, 1);
            }
            end_count += 1;
        }
        sched_yield();
    }
}
static void instance1_release(int in_port)
{
    spc_stop(&instance1.clock);
    switch(in_port) {
    }
    spc_start(&instance1.clock);
}
static void *run_thread0(void *arg)
{
    sp_set_affinity(-1);
    instance1.data.in_port_count = 0;
    instance1.data.out_port_count = 1;
    instance1.data.get_free = instance1_get_free;
    instance1.data.allocate = instance1_allocate;
    instance1.data.send = instance1_send;
    instance1.data.get_available = instance1_get_available;
    instance1.data.read_value = instance1_read_value;
    instance1.data.release = instance1_release;
    spc_init(&instance1.clock);
    spc_start(&instance1.clock);
    sp__input_init(&instance1.priv);
    if(setjmp(instance1.env) == 0) {
        sp__input_run(&instance1.priv);
    }
    sp__input_destroy(&instance1.priv);
    spc_stop(&instance1.clock);
    edge1_finish();
    return NULL;
}
static int instance12_get_free(int out_port)
{
    switch(out_port) {
    }
    return 0;
}
static void *instance12_allocate(int out_port)
{
    spc_stop(&instance12.clock);
    void *ptr = NULL;
    for(;;) {
        switch(out_port) {
        }
        if(SPLIKELY(ptr != NULL)) {
            spc_start(&instance12.clock);
            return ptr;
        }
        sched_yield();
    }
}
static void instance12_send(int out_port)
{
}
static int instance12_get_available(int in_port)
{
    int result = 0;
    spc_stop(&instance12.clock);
    switch(in_port) {
    case 0:
        result = edge15_get_available();
        break;
    }
    spc_start(&instance12.clock);
    return result;
}
static void *instance12_read_value(int in_port)
{
    void *ptr = NULL;
    int end_count = 0;
    spc_stop(&instance12.clock);
    for(;;) {
        switch(in_port) {
        case 0:
            ptr = edge15_read_value();
            break;
        }
        if(SPLIKELY(ptr != NULL)) {
            instance12.clock.count += 1;
            spc_start(&instance12.clock);
            return ptr;
        }
        if(SPUNLIKELY(instance12.active_inputs == 0)) {
            if(end_count > 1) {
                longjmp(instance12.env, 1);
            }
            end_count += 1;
        }
        sched_yield();
    }
}
static void instance12_release(int in_port)
{
    spc_stop(&instance12.clock);
    switch(in_port) {
    case 0:
        edge15_release();
        break;
    }
    spc_start(&instance12.clock);
}
static void *run_thread1(void *arg)
{
    sp_set_affinity(-1);
    instance12.data.in_port_count = 1;
    instance12.data.out_port_count = 0;
    instance12.data.get_free = instance12_get_free;
    instance12.data.allocate = instance12_allocate;
    instance12.data.send = instance12_send;
    instance12.data.get_available = instance12_get_available;
    instance12.data.read_value = instance12_read_value;
    instance12.data.release = instance12_release;
    spc_init(&instance12.clock);
    spc_start(&instance12.clock);
    sp__output_init(&instance12.priv);
    if(setjmp(instance12.env) == 0) {
        sp__output_run(&instance12.priv);
    }
    sp__output_destroy(&instance12.priv);
    spc_stop(&instance12.clock);
    return NULL;
}
template<typename T>
static inline T get_arg(int argc, char **argv, const char *name, const T d)
{
    for(int i = 1; i < argc; i++) {
        if(!strcmp(argv[i], name) && i + 1 < argc) {
            std::stringstream str(argv[i + 1]);
            T temp = d;
            str >> temp;
            return temp;
        }
    }
    return d;
}
int main(int argc, char **argv)
{
    pthread_t thread0;
    pthread_t thread1;
    start_ticks = sp_get_ticks();
    gettimeofday(&start_time, NULL);
    signal(SIGINT, shutdown);
    unlink("streamedge1");
    if(mkfifo("streamedge1", 0600) < 0) {
        perror("could not create FIFO\n");
        exit(-1);
    }
    streamedge1 = open("streamedge1", O_RDWR | O_SYNC);
    if(streamedge1 < 0) {
        perror("could not open FIFO");
        exit(-1);
    }
    q_edge1 = (SPQ*)malloc(spq_get_size(256, sizeof(UNSIGNED16)));
    spq_init(q_edge1, 256, sizeof(UNSIGNED16));
    unlink("streamedge15");
    if(mkfifo("streamedge15", 0600) < 0) {
        perror("could not create FIFO\n");
        exit(-1);
    }
    streamedge15 = open("streamedge15", O_RDWR | O_NONBLOCK | O_SYNC);
    if(streamedge15 < 0) {
        perror("could not open FIFO");
        exit(-1);
    }
    q_edge15 = (SPQ*)malloc(spq_get_size(256, sizeof(UNSIGNED16)));
    spq_init(q_edge15, 256, sizeof(UNSIGNED16));
    sim_device4_pid = fork();
    if(sim_device4_pid == 0) {
        int rc = execlp("vvp", "vvp", "hdl_device4", NULL);
        if(rc < 0) {
            perror("could not run hdl_device4");
            exit(-1);
        }
    }
    atexit(stopSimulation);
    instance1.priv.iterations = (UNSIGNED32)1;
    instance1.active_inputs = 0;
    instance12.active_inputs = 1;
    atexit(showStats);
    pthread_create(&thread0, NULL, run_thread0, NULL);
    pthread_create(&thread1, NULL, run_thread1, NULL);
    pthread_join(thread0, NULL);
    pthread_join(thread1, NULL);
    return 0;
}

