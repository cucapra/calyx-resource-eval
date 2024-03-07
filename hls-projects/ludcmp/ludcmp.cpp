#include "ludcmp.h"

DATA_TYPE A[N][N];
DATA_TYPE b[N];
DATA_TYPE x[N];
DATA_TYPE y[N];
DATA_TYPE w;
/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_ludcmp(int n, DATA_TYPE A[N][N], DATA_TYPE b[N],
                          DATA_TYPE x[N], DATA_TYPE y[N], DATA_TYPE w) {
  int i, j, k;

#pragma scop
  for (i = 0; i < N; i++) {
    for (j = 0; j < i; j++) {
      w = A[i][j];
      for (k = 0; k < j; k++) {
        w -= A[i][k] * A[k][j];
      }
      A[i][j] = w / A[j][j];
    }
    for (j = i; j < N; j++) {
      w = A[i][j];
      for (k = 0; k < i; k++) {
        w -= A[i][k] * A[k][j];
      }
      A[i][j] = w;
    }
  }

  for (i = 0; i < N; i++) {
    w = b[i];
    for (j = 0; j < i; j++)
      w -= A[i][j] * y[j];
    y[i] = w;
  }

  for (i = N - 1; i >= 0; i--) {
    w = y[i];
    for (j = i + 1; j < N; j++)
      w -= A[i][j] * x[j];
    x[i] = w / A[i][i];
  }
#pragma endscop
}