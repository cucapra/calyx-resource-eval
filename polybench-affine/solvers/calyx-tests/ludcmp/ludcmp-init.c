#include "ludcmp.h"

/* Array initialization. */
static void init_array(int n, DATA_TYPE A[N][N], DATA_TYPE b[N], DATA_TYPE x[N],
                       DATA_TYPE y[N]) {
  int i, j;
  DATA_TYPE fn = (DATA_TYPE)n;

  for (i = 0; i < n; i++) {
    x[i] = 0;
    y[i] = 0;
    b[i] = (i + 1) / 2 + 4;
  }

  for (i = 0; i < n; i++) {
    for (j = 0; j <= i; j++)
      A[i][j] = (DATA_TYPE)(-j % n) + 1;
    for (j = i + 1; j < n; j++) {
      A[i][j] = 0;
    }
    A[i][i] = 1;
  }

  /* Make the matrix positive semi-definite. */
  /* not necessary for LU, but using same code as cholesky */
  int r, s, t;
  DATA_TYPE B[N][N];
  for (r = 0; r < n; ++r)
    for (s = 0; s < n; ++s)
      B[r][s] = 0;
  for (t = 0; t < n; ++t)
    for (r = 0; r < n; ++r)
      for (s = 0; s < n; ++s)
        B[r][s] += A[r][t] * A[s][t];
  for (r = 0; r < n; ++r)
    for (s = 0; s < n; ++s)
      A[r][s] = B[r][s];
}