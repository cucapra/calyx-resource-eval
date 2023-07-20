#include "gesummv.h"

/* Array initialization. */
static void init_array(int n, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[N][N], DATA_TYPE B[N][N], DATA_TYPE x[N]) {
  int i, j;

  *alpha = 3;
  *beta = 2;
  for (i = 0; i < n; i++) {
    x[i] = (DATA_TYPE)(i);
    for (j = 0; j < n; j++) {
      A[i][j] = (DATA_TYPE)((i * j + 1));
      B[i][j] = (DATA_TYPE)((i * j + 2));
    }
  }
}