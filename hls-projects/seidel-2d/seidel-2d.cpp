#include "seidel-2d.h"

DATA_TYPE A[N][N];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_seidel_2d(int tsteps, int n, DATA_TYPE A[N][N]) {
  int t, i, j;

#pragma scop
  for (t = 0; t <= TSTEPS - 1; t++)
    for (i = 1; i <= N - 2; i++)
      for (j = 1; j <= N - 2; j++)
        A[i][j] = (A[i - 1][j - 1] + A[i - 1][j] + A[i - 1][j + 1] +
                   A[i][j - 1] + A[i][j] + A[i][j + 1] + A[i + 1][j - 1] +
                   A[i + 1][j] + A[i + 1][j + 1]) /
                  SCALAR_VAL(9.0);
#pragma endscop
}