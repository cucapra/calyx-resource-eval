#include "trisolv.h"

/* Array initialization. */
static void init_array(int n, DATA_TYPE b[N], DATA_TYPE L[N][N],
                       DATA_TYPE x[N]) {
  int i, j;

  for (i = 0; i < n; i++) {
    x[i] = -999;
    b[i] = i;
    for (j = 0; j <= i; j++)
      L[i][j] = (DATA_TYPE)(i + n - j + 1) * 2;
  }
}