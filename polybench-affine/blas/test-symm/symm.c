#include "symm.h"

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_symm(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE A[M][M],
                 DATA_TYPE B[M][N], DATA_TYPE C[M][N]) {
  int i, j, k;
  DATA_TYPE temp2;

// BLAS PARAMS
// SIDE = 'L'
// UPLO = 'L'
//  =>  Form  C := alpha*A*B + beta*C
//  A is MxM
//  B is MxN
//  C is MxN
// note that due to Fortran array layout, the code below more closely resembles
// upper triangular case in BLAS
#pragma scop
  for (i = 0; i < M; i++)
    for (j = 0; j < N; j++) {
      temp2 = 0;
      for (k = 0; k < i; k++) {
        C[k][j] += alpha * B[i][j] * A[i][k];
        temp2 += B[k][j] * A[i][k];
      }
      C[i][j] = beta * C[i][j] + alpha * B[i][j] * A[i][i] + alpha * temp2;
    }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_symm;
//   return 0;
// }