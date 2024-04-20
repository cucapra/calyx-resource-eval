#include "trmm.c"
#include "trmm.h"

void main() {
  DATA_TYPE alpha = 2;
  DATA_TYPE A[M][M];
  DATA_TYPE B[M][N];
  kernel_trmm(alpha, A, B);
}