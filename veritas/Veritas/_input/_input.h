#ifndef sp__input_H_
#define sp__input_H_
#include "ScalaPipe.h"
#include <stdlib.h>
/* UNSIGNED32 */
/* UNSIGNED16 */
struct sp__input_data
{
    UNSIGNED32 iterations;
}
;
void sp__input_init(struct sp__input_data*);
void sp__input_destroy(struct sp__input_data*);
void sp__input_run(struct sp__input_data*);
#endif
