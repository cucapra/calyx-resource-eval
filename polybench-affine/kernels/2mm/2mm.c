#include "2mm.h"

DATA_TYPE tmp[NI][NJ];
DATA_TYPE A[NI][NK];
DATA_TYPE B[NK][NJ];
DATA_TYPE C[NJ][NL];
DATA_TYPE D[NI][NL];
DATA_TYPE alpha = 5;
DATA_TYPE beta = 4;

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_2mm(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE tmp[NI][NJ],
                DATA_TYPE A[NI][NK], DATA_TYPE B[NK][NJ], DATA_TYPE C[NJ][NL],
                DATA_TYPE D[NI][NL]) {
  int i, j, k;

#pragma scop
  /* D := alpha*A*B*C + beta*D */
  for (i = 0; i < NI; i++)
    for (j = 0; j < NJ; j++) {
      tmp[i][j] = SCALAR_VAL(0.0);
      for (k = 0; k < NK; ++k)
        tmp[i][j] += alpha * A[i][k] * B[k][j];
    }
  for (i = 0; i < NI; i++)
    for (j = 0; j < NL; j++) {
      D[i][j] *= beta;
      for (k = 0; k < NJ; ++k)
        D[i][j] += tmp[i][k] * C[k][j];
    }
#pragma endscop
}