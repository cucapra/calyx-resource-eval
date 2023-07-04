#include "atax.h"

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_atax(DATA_TYPE A[M][N], DATA_TYPE x[N], DATA_TYPE y[N],
                 DATA_TYPE tmp[M]) {
  int i, j;
#pragma scop
  for (i = 0; i < N; i++)
    y[i] = 0;
  for (i = 0; i < M; i++) {
    tmp[i] = SCALAR_VAL(0.0);
    for (j = 0; j < N; j++)
      tmp[i] = tmp[i] + A[i][j] * x[j];
    for (j = 0; j < N; j++)
      y[j] = y[j] + A[i][j] * tmp[i];
  }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_atax;
//   return 0;
// }