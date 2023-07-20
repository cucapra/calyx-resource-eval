#include "covariance.h"

/* Array initialization. */
static void init_array(int m, int n, DATA_TYPE *float_n, DATA_TYPE data[N][M]) {
  int i, j;

  *float_n = (DATA_TYPE)n;

  for (i = 0; i < N; i++)
    for (j = 0; j < M; j++)
      data[i][j] = ((DATA_TYPE)i * j) / M;
}