#include "syrk.h"

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_syrk(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE A[N][M],
                 DATA_TYPE C[N][N]) {
  int i, j, k;

// BLAS PARAMS
// TRANS = 'N'
// UPLO  = 'L'
//  =>  Form  C := alpha*A*A**T + beta*C.
// A is NxM
// C is NxN
#pragma scop
  for (i = 0; i < N; i++) {
    for (j = 0; j <= i; j++)
      C[i][j] *= beta;
    for (k = 0; k < M; k++) {
      for (j = 0; j <= i; j++)
        C[i][j] += alpha * A[i][k] * A[j][k];
    }
  }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_syrk;
//   return 0;
// }