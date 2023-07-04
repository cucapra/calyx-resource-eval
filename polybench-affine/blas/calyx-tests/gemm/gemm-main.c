#include "gemm.c"
#include "gemm.h"

void main() {
  DATA_TYPE alpha;
  DATA_TYPE beta;
  alpha = 3;
  beta = 2;
  DATA_TYPE A[NI][NK];
  DATA_TYPE B[NK][NJ];
  DATA_TYPE C[NI][NJ];
  kernel_gemm(alpha, beta, A, B, C);
}