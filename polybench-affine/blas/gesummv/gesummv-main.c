#include "gesummv.c"
#include "gesummv.h"

void main() {
  DATA_TYPE alpha = 3;
  DATA_TYPE beta = 2;
  DATA_TYPE A[N][N];
  DATA_TYPE B[N][N];
  DATA_TYPE tmp[N];
  DATA_TYPE x[N];
  DATA_TYPE y[N];
  kernel_gesummv(alpha, beta, A, B, tmp, x, y);
}