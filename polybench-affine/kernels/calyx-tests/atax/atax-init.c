#include "atax.h"

static void init_array(int m, int n, DATA_TYPE A[M][N], DATA_TYPE x[N]) {
  int i, j;
  DATA_TYPE fn;
  fn = (DATA_TYPE)n;

  for (i = 0; i < n; i++)
    x[i] = 1 + i;
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++)
      A[i][j] = (DATA_TYPE)((i + j));
}