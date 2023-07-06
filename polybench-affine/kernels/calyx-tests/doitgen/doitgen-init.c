#include "doitgen.h"

/* Array initialization. */
static void init_array(int nr, int nq, int np, DATA_TYPE A[NR][NQ][NP],
                       DATA_TYPE C4[NP][NP]) {
  int i, j, k;
  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++)
        A[i][j][k] = (DATA_TYPE)((i * j + k) % np);
  for (i = 0; i < np; i++)
    for (j = 0; j < np; j++)
      C4[i][j] = (DATA_TYPE)(i * j % np);
}