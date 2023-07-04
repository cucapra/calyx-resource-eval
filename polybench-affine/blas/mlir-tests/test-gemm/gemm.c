#include "gemm.h"

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_gemm(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE A[NI][NK],
                 DATA_TYPE B[NK][NJ], DATA_TYPE C[NI][NJ]) {
  int i, j, k;
// BLAS PARAMS
// TRANSA = 'N'
// TRANSB = 'N'
//  => Form C := alpha*A*B + beta*C,
// A is NIxNK
// B is NKxNJ
// C is NIxNJ
#pragma scop
  for (i = 0; i < NI; i++) {
    for (j = 0; j < NJ; j++)
      C[i][j] *= beta;
    for (k = 0; k < NK; k++) {
      for (j = 0; j < NJ; j++)
        C[i][j] += alpha * A[i][k] * B[k][j];
    }
  }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_gemm;
//   return 0;
// }