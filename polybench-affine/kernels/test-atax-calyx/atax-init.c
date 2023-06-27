#include "atax.c"
#include "atax.h"

int main() {
  DATA_TYPE A[M][N];
  DATA_TYPE x[N];
  DATA_TYPE y[N];
  DATA_TYPE tmp[M];
  kernel_atax(A, x, y, tmp);
  return 0;
}