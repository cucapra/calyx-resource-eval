#include "seidel-2d.h"

/* Array initialization. */
static void init_array(int n, DATA_TYPE A[N][N]) {
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      A[i][j] = ((DATA_TYPE)i * (j + 2) + 2) / n;
}