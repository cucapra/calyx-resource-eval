#include "symm.h"

/* Array initialization. */
static void init_array(int m, int n, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[M][M], DATA_TYPE B[M][N],
                       DATA_TYPE C[M][N]) {
  int i, j;

  *alpha = 2;
  *beta = 1;
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++) {
      C[i][j] = (DATA_TYPE)((i + j));
      B[i][j] = (DATA_TYPE)((n + i - j));
    }
  for (i = 0; i < m; i++) {
    for (j = 0; j <= i; j++)
      A[i][j] = (DATA_TYPE)((i + j));
    for (j = i + 1; j < m; j++)
      A[i][j] = -999; // regions of arrays that should not be used
  }
}