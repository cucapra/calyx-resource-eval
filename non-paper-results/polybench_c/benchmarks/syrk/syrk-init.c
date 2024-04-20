#include "syrk.h"

/* Array initialization. */
static void init_array(int n, int m, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[N][M], DATA_TYPE C[N][N]) {
  int i, j;

  *alpha = 2;
  *beta = 1;
  for (i = 0; i < n; i++)
    for (j = 0; j < m; j++)
      A[i][j] = (DATA_TYPE)((i * j + 1) % n);
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      C[i][j] = (DATA_TYPE)((i * j + 2) % m);
}