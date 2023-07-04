#include "bicg.h"

/* Array initialization. */
static void init_array(DATA_TYPE A[N][M], DATA_TYPE r[N], DATA_TYPE p[M]) {
  int i, j;
  for (i = 0; i < M; i++)
    p[i] = (DATA_TYPE)(i % M) / M;
  for (i = 0; i < N; i++) {
    r[i] = (DATA_TYPE)(i % N) / N;
    for (j = 0; j < M; j++)
      A[i][j] = (DATA_TYPE)(i * (j + 1) % N) / N;
  }
}