#include "covariance.h"

DATA_TYPE float_n;
DATA_TYPE data[N][M];
DATA_TYPE cov[M][M];
DATA_TYPE mean[M];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_covariance(int m, int n, DATA_TYPE float_n,
                              DATA_TYPE data[N][M], DATA_TYPE cov[M][M],
                              DATA_TYPE mean[M]) {
  int i, j, k;

#pragma scop
  for (j = 0; j < M; j++) {
    mean[j] = SCALAR_VAL(0.0);
    for (i = 0; i < N; i++)
      mean[j] += data[i][j];
    mean[j] /= float_n;
  }

  for (i = 0; i < N; i++)
    for (j = 0; j < M; j++)
      data[i][j] -= mean[j];

  for (i = 0; i < M; i++)
    for (j = i; j < M; j++) {
      cov[i][j] = SCALAR_VAL(0.0);
      for (k = 0; k < N; k++)
        cov[i][j] += data[k][i] * data[k][j];
      cov[i][j] /= (float_n - SCALAR_VAL(1.0));
      cov[j][i] = cov[i][j];
    }
#pragma endscop
}