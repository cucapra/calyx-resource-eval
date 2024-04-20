#include "gesummv.h"

DATA_TYPE alpha = 3;
DATA_TYPE beta = 2;
DATA_TYPE A[N][N];
DATA_TYPE B[N][N];
DATA_TYPE tmp[N];
DATA_TYPE x[N];
DATA_TYPE y[N];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_gesummv(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE A[N][N],
                    DATA_TYPE B[N][N], DATA_TYPE tmp[N], DATA_TYPE x[N],
                    DATA_TYPE y[N]) {
  int i, j;

#pragma scop
  for (i = 0; i < N; i++) {
    tmp[i] = SCALAR_VAL(0.0);
    y[i] = SCALAR_VAL(0.0);
    for (j = 0; j < N; j++) {
      tmp[i] = A[i][j] * x[j] + tmp[i];
      y[i] = B[i][j] * x[j] + y[i];
    }
    y[i] = alpha * tmp[i] + beta * y[i];
  }
#pragma endscop
}