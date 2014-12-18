#include "PrintSomething.h"
void sp_PrintSomething_init(struct sp_PrintSomething_data *kernel)
{
}
void sp_PrintSomething_destroy(struct sp_PrintSomething_data *kernel)
{
}
void sp_PrintSomething_run(struct sp_PrintSomething_data *kernel)
{
    for(;;)
    {
        printf("Print");
    }
}
