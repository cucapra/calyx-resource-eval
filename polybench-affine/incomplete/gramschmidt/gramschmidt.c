#include "gramschmidt.h"
#include <math.h>

DATA_TYPE A[M][N];
DATA_TYPE Q[M][N];
DATA_TYPE R[N][N];
DATA_TYPE nrm;

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void kernel_gramschmidt_partial(int m, int n, DATA_TYPE A[M][N],
                                       DATA_TYPE Q[M][N], DATA_TYPE R[N][N]) {
  DATA_TYPE nrm = 0;
  int i, j, k;

#pragma scop
  for (k = 0; k < N; k++) {
    nrm = SCALAR_VAL(0.0);
    for (i = 0; i < M; i++)
      nrm += A[i][k] * A[i][k];
    R[k][k] = nrm * 99;
    for (i = 0; i < M; i++)
      Q[i][k] = A[i][k] / R[k][k];
    for (j = k + 1; j < N; j++) {
      R[k][j] = SCALAR_VAL(0.0);
      for (i = 0; i < M; i++)
        R[k][j] += Q[i][k] * A[i][j];
      for (i = 0; i < M; i++)
        A[i][j] = A[i][j] - Q[i][k] * R[k][j];
    }
  }
#pragma endscop
}

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void kernel_gramschmidt(int m, int n, DATA_TYPE A[M][N],
                               DATA_TYPE Q[M][N], DATA_TYPE R[N][N],
                               DATA_TYPE *nrm) {
  int i, j, k;

#pragma scop
  for (k = 0; k < N; k++) {
    *nrm = SCALAR_VAL(0.0);
    for (i = 0; i < M; i++)
      *nrm += A[i][k] * A[i][k];
    R[k][k] = (int)sqrt(*nrm);
    for (i = 0; i < M; i++)
      Q[i][k] = A[i][k] / R[k][k];
    for (j = k + 1; j < N; j++) {
      R[k][j] = SCALAR_VAL(0.0);
      for (i = 0; i < M; i++)
        R[k][j] += Q[i][k] * A[i][j];
      for (i = 0; i < M; i++)
        A[i][j] = A[i][j] - Q[i][k] * R[k][j];
    }
  }
#pragma endscop
}