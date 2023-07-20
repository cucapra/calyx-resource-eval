#include "syr2k.h"

DATA_TYPE alpha = 2;
DATA_TYPE beta = 1;
DATA_TYPE A[N][M];
DATA_TYPE B[N][M];
DATA_TYPE C[N][N];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_syr2k(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE A[N][M],
                  DATA_TYPE B[N][M], DATA_TYPE C[N][N]) {
  int i, j, k;

// BLAS PARAMS
// UPLO  = 'L'
// TRANS = 'N'
// A is NxM
// B is NxM
// C is NxN
#pragma scop
  for (i = 0; i < N; i++) {
    for (j = 0; j <= i; j++)
      C[i][j] *= beta;
    for (k = 0; k < M; k++)
      for (j = 0; j <= i; j++) {
        C[i][j] += A[j][k] * alpha * B[i][k] + B[j][k] * alpha * A[i][k];
      }
  }
#pragma endscop
}