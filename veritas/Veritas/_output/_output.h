#ifndef sp__output_H_
#define sp__output_H_
#include "ScalaPipe.h"
/* UNSIGNED16 */
struct sp__output_data
{
}
;
void sp__output_init(struct sp__output_data*);
void sp__output_destroy(struct sp__output_data*);
void sp__output_run(struct sp__output_data*);
#endif
