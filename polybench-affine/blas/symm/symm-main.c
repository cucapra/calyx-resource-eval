#include "symm.c"
#include "symm.h"

void main() {
  DATA_TYPE alpha = 2;
  DATA_TYPE beta = 1;
  DATA_TYPE A[M][M];
  DATA_TYPE B[M][N];
  DATA_TYPE C[M][N];
  // int i, j, k = 0;
  // DATA_TYPE temp2 = 0;
  kernel_symm(alpha, beta, A, B, C);
}