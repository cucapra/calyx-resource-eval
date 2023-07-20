#include "mvt.h"

/* Array initialization. */
static void init_array(int n, DATA_TYPE x1[N], DATA_TYPE x2[N],
                       DATA_TYPE y_1[N], DATA_TYPE y_2[N], DATA_TYPE A[N][N]) {
  int i, j;

  for (i = 0; i < n; i++) {
    x1[i] = (DATA_TYPE)(i % n);
    x2[i] = (DATA_TYPE)((i + 1) % n);
    y_1[i] = (DATA_TYPE)((i + 3) % n);
    y_2[i] = (DATA_TYPE)((i + 4) % n);
    for (j = 0; j < n; j++)
      A[i][j] = (DATA_TYPE)(i * j % n);
  }
}