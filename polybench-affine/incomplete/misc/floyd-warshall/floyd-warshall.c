#include "floyd-warshall.h"

DATA_TYPE path[N][N];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void kernel_floyd_warshall(int n, DATA_TYPE path[N][N]) {
  int i, j, k;

#pragma scop
  for (k = 0; k < N; k++) {
    for (i = 0; i < N; i++)
      for (j = 0; j < N; j++)
        path[i][j] = path[i][j] < path[i][k] + path[k][j]
                         ? path[i][j]
                         : path[i][k] + path[k][j];
  }
#pragma endscop
}