#include "trisolv.h"

DATA_TYPE b[N];
DATA_TYPE L[N][N];
DATA_TYPE x[N];
/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_trisolv(int n, DATA_TYPE b[N], DATA_TYPE L[N][N],
                           DATA_TYPE x[N]) {
  int i, j;

#pragma scop
  for (i = 0; i < N; i++) {
    x[i] = b[i];
    for (j = 0; j < i; j++)
      x[i] -= L[i][j] * x[j];
    x[i] = x[i] / L[i][i];
  }
#pragma endscop
}