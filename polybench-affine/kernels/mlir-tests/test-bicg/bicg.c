#include "bicg.h"

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_bicg(DATA_TYPE A[N][M], DATA_TYPE s[M], DATA_TYPE q[N],
                 DATA_TYPE p[M], DATA_TYPE r[N]) {
  int i, j;
#pragma scop
  for (i = 0; i < M; i++)
    s[i] = 0;
  for (i = 0; i < N; i++) {
    q[i] = SCALAR_VAL(0.0);
    for (j = 0; j < M; j++) {
      s[j] = s[j] + r[i] * A[i][j];
      q[i] = q[i] + A[i][j] * p[j];
    }
  }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_bicg;
//   return 0;
// }