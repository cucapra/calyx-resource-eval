#include "lu.h"

DATA_TYPE A[N][N];
DATA_TYPE B[N][N];
/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_lu(int n, DATA_TYPE A[N][N]) {
  int i, j, k;

#pragma scop
  for (i = 0; i < N; i++) {
    for (j = 0; j < i; j++) {
      for (k = 0; k < j; k++) {
        A[i][j] -= A[i][k] * A[k][j];
      }
      A[i][j] /= A[j][j];
    }
    for (j = i; j < N; j++) {
      for (k = 0; k < i; k++) {
        A[i][j] -= A[i][k] * A[k][j];
      }
    }
  }
#pragma endscop
}