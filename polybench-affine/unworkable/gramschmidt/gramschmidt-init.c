#include "gramschmidt.h"

/* Array initialization. */
/* Array initialization. */
/* Array initialization. */
static void init_array(int m, int n, DATA_TYPE A[M][N], DATA_TYPE R[N][N],
                       DATA_TYPE Q[M][N], DATA_TYPE *nrm) {
  int i, j;
  *nrm = 0;

  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++) {
      A[i][j] = (((DATA_TYPE)((i * j) % m)) * 100) + 10;
      Q[i][j] = (DATA_TYPE)0.0;
    }
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      R[i][j] = (DATA_TYPE)0.0;
}