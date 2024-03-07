#include "durbin.h"

DATA_TYPE r[N];
DATA_TYPE y[N];
DATA_TYPE z[N];
DATA_TYPE alpha;
DATA_TYPE beta;
DATA_TYPE sum;

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_durbin(int n, DATA_TYPE r[N], DATA_TYPE y[N], DATA_TYPE z[N],
                          DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE sum) {

  int i, k;

#pragma scop
  y[0] = -r[0];

  for (k = 1; k < N; k++) {
    beta = (1 - alpha * alpha) * beta;
    sum = SCALAR_VAL(0.0);
    for (i = 0; i < k; i++) {
      sum += r[k - i - 1] * y[i];
    }
    alpha = -(r[k] + sum) / beta;

    for (i = 0; i < k; i++) {
      z[i] = y[i] + alpha * y[k - i - 1];
    }
    for (i = 0; i < k; i++) {
      y[i] = z[i];
    }
    y[k] = alpha;
  }
#pragma endscop
}