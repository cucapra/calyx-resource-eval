#include "trmm.h"

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_trmm(DATA_TYPE alpha, DATA_TYPE A[M][M], DATA_TYPE B[M][N]) {
  int i, j, k;

// BLAS parameters
// SIDE   = 'L'
// UPLO   = 'L'
// TRANSA = 'T'
// DIAG   = 'U'
//  => Form  B := alpha*A**T*B.
//  A is MxM
//  B is MxN
#pragma scop
  for (i = 0; i < M; i++)
    for (j = 0; j < N; j++) {
      for (k = i + 1; k < M; k++)
        B[i][j] += A[k][i] * B[k][j];
      B[i][j] = alpha * B[i][j];
    }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_trmm;
//   return 0;
// }