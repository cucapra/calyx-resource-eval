#include "gemver.h"

/* Array initialization. */
static void init_array(int n, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[N][N], DATA_TYPE u1[N], DATA_TYPE v1[N],
                       DATA_TYPE u2[N], DATA_TYPE v2[N], DATA_TYPE w[N],
                       DATA_TYPE x[N], DATA_TYPE y[N], DATA_TYPE z[N]) {
  int i, j;

  *alpha = 3;
  *beta = 2;

  DATA_TYPE fn = (DATA_TYPE)n;

  for (i = 0; i < n; i++) {
    u1[i] = i;
    u2[i] = ((i + 1) / fn) / 2.0;
    v1[i] = ((i + 1) / fn) / 4.0;
    v2[i] = ((i + 1) / fn) / 6.0;
    y[i] = ((i + 1) / fn) / 8.0;
    z[i] = ((i + 1) / fn) / 9.0;
    x[i] = 0.0;
    w[i] = 0.0;
    for (j = 0; j < n; j++)
      A[i][j] = (DATA_TYPE)(i * j % n) / n;
  }
}