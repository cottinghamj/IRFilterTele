#include "_input.h"
void sp__input_init(struct sp__input_data *kernel)
{
}
void sp__input_destroy(struct sp__input_data *kernel)
{
}
void sp__input_run(struct sp__input_data *kernel)
{
    UNSIGNED16 *S1;
    for(;;)
    {
        S1 = (UNSIGNED16*)sp_allocate(kernel, 0);
        *S1 = (UNSIGNED16)(rand());
        sp_send(kernel, 0);
        if((kernel->iterations) > (0))
        {
            kernel->iterations = (kernel->iterations) - (1);
        }
        else
        {
            return;
        }
    }
}
