#include "3mm.h"

DATA_TYPE A[NI][NK];
DATA_TYPE B[NK][NJ];
DATA_TYPE C[NJ][NM];
DATA_TYPE D[NM][NL];
DATA_TYPE E[NI][NJ];
DATA_TYPE F[NJ][NL];
DATA_TYPE G[NI][NL];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_3mm(DATA_TYPE A[NI][NK], DATA_TYPE B[NK][NJ], DATA_TYPE C[NJ][NM],
                DATA_TYPE D[NM][NL], DATA_TYPE E[NI][NJ], DATA_TYPE F[NJ][NL],
                DATA_TYPE G[NI][NL]

) {
  int i, j, k;

#pragma scop
  /* E := A*B */
  for (i = 0; i < NI; i++)
    for (j = 0; j < NJ; j++) {
      E[i][j] = 0.0;
      for (k = 0; k < NK; ++k)
        E[i][j] += A[i][k] * B[k][j];
    }
  /* F := C*D */
  for (i = 0; i < NJ; i++)
    for (j = 0; j < NL; j++) {
      F[i][j] = 0.0;
      for (k = 0; k < NM; ++k)
        F[i][j] += C[i][k] * D[k][j];
    }
  /* G := E*F */
  for (i = 0; i < NI; i++)
    for (j = 0; j < NL; j++) {
      G[i][j] = 0.0;
      for (k = 0; k < NJ; ++k)
        G[i][j] += E[i][k] * F[k][j];
    }
#pragma endscop
}