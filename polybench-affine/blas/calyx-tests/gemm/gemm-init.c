#include "gemm.h"

/* Array initialization. */
static void init_array(int ni, int nj, int nk, DATA_TYPE *alpha,
                       DATA_TYPE *beta, DATA_TYPE A[NI][NK],
                       DATA_TYPE B[NK][NJ], DATA_TYPE C[NI][NJ]) {
  int i, j;

  *alpha = 3;
  *beta = 2;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++)
      C[i][j] = (DATA_TYPE)((i * j + 1) % ni) / ni;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (DATA_TYPE)(i * (j + 1) % nk) / nk;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (DATA_TYPE)(i * (j + 2) % nj) / nj;
}