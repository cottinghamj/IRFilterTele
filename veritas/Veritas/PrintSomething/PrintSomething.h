#ifndef sp_PrintSomething_H_
#define sp_PrintSomething_H_
#include "ScalaPipe.h"
#include <stdio.h>
struct sp_PrintSomething_data
{
}
;
void sp_PrintSomething_init(struct sp_PrintSomething_data*);
void sp_PrintSomething_destroy(struct sp_PrintSomething_data*);
void sp_PrintSomething_run(struct sp_PrintSomething_data*);
#endif
