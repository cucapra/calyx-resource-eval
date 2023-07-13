#include "syrk.c"
#include "syrk.h"

void main() {
  DATA_TYPE alpha = 2;
  DATA_TYPE beta = 1;
  DATA_TYPE A[N][M];
  DATA_TYPE C[N][N];
  kernel_syrk(alpha, beta, A, C);
}