#include "2mm.h"

static void init_array(int ni, int nj, int nk, int nl, DATA_TYPE *alpha,
                       DATA_TYPE *beta, DATA_TYPE A[NI][NK],
                       DATA_TYPE B[NK][NJ], DATA_TYPE C[NJ][NL],
                       DATA_TYPE D[NJ][NL]) {
  int i, j;

  *alpha = 5;
  *beta = 4;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (DATA_TYPE)((i * j + 1));
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (DATA_TYPE)(i * (j + 1));
  for (i = 0; i < nj; i++)
    for (j = 0; j < nl; j++)
      C[i][j] = (DATA_TYPE)((i * (j + 3) + 1));
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      D[i][j] = (DATA_TYPE)(i * (j + 2));
}