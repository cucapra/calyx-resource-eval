#include "ludcmp.c"
#include "ludcmp.h"

void main() {
  DATA_TYPE A[N][N];
  DATA_TYPE b[N];
  DATA_TYPE x[N];
  DATA_TYPE y[N];
  DATA_TYPE w = 0;
  kernel_ludcmp(N, A, b, x, y, w);
}