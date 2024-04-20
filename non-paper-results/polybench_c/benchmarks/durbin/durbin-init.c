#include "durbin.h"

/* Array initialization. */
/* Array initialization. */
static void init_array(int n, DATA_TYPE r[N], DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE *sum) {
  int i, j;

  *beta = SCALAR_VAL(1.0);
  *sum = 0;

  for (i = 0; i < n; i++) {
    r[i] = (n + 1 - i);
  }
  *alpha = -r[0];
}