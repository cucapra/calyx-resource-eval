#include "trmm.h"

/* Array initialization. */
static void init_array(int m, int n, DATA_TYPE *alpha, DATA_TYPE A[M][M],
                       DATA_TYPE B[M][N]) {
  int i, j;

  *alpha = 2;
  for (i = 0; i < m; i++) {
    for (j = 0; j < i; j++) {
      A[i][j] = (DATA_TYPE)((i + j) % m);
    }
    A[i][i] = 1.0;
    for (j = 0; j < n; j++) {
      B[i][j] = (DATA_TYPE)((n + (i - j)) % n);
    }
  }
}