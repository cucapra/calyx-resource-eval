#include "durbin.c"
#include "durbin.h"

void main() {
  DATA_TYPE r[N];
  DATA_TYPE y[N];
  DATA_TYPE z[N];
  DATA_TYPE alpha = -r[0];
  DATA_TYPE beta = SCALAR_VAL(1.0);
  DATA_TYPE sum = 0;
  kernel_durbin(N, r, y, z, alpha, beta, sum);
}