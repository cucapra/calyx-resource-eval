#include "syr2k.c"
#include "syr2k.h"

void main() {
  DATA_TYPE alpha = 2;
  DATA_TYPE beta = 1;
  DATA_TYPE A[N][M];
  DATA_TYPE B[N][M];
  DATA_TYPE C[N][N];
  kernel_syr2k(alpha, beta, A, B, C);
}