#include "doitgen.h"

DATA_TYPE A[NR][NQ][NP];
DATA_TYPE C4[NP][NP];
DATA_TYPE sum[NP];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_doitgen(DATA_TYPE A[NR][NQ][NP], DATA_TYPE C4[NP][NP],
                    DATA_TYPE sum[NP]) {
  int r, q, p, s;

#pragma scop
  for (r = 0; r < NR; r++)
    for (q = 0; q < NQ; q++) {
      for (p = 0; p < NP; p++) {
        sum[p] = SCALAR_VAL(0.0);
        for (s = 0; s < NP; s++)
          sum[p] += A[r][q][s] * C4[s][p];
      }
      for (p = 0; p < NP; p++)
        A[r][q][p] = sum[p];
    }
#pragma endscop
}