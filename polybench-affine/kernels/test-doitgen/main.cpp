#include "doitgen.c"
#include "doitgen.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE A[NR][NQ][NP];
DATA_TYPE C4[NP][NP];
DATA_TYPE sum[NP];

extern "C" {
void kernel_doitgen_affine(DATA_TYPE[NR][NQ][NP], DATA_TYPE[NR][NQ][NP],
                           int64_t a1, int64_t a2, int64_t a3, int64_t a4,
                           int64_t a5, int64_t a6, int64_t a7,
                           DATA_TYPE[NP][NP], DATA_TYPE[NP][NP], int64_t b1,
                           int64_t b2, int64_t b3, int64_t b4, int64_t b5,
                           DATA_TYPE *arg20, DATA_TYPE *arg21, int64_t c1,
                           int64_t c2, int64_t c3);
}

/* Array initialization. */
/* Array initialization. */
static void init_array(int nr, int nq, int np, DATA_TYPE A[NR][NQ][NP],
                       DATA_TYPE C4[NP][NP]) {
  int i, j, k;
  for (i = 0; i < nr; i++)
    for (j = 0; j < nq; j++)
      for (k = 0; k < np; k++)
        A[i][j][k] = (DATA_TYPE)((i * j + k) % np) / np;
  for (i = 0; i < np; i++)
    for (j = 0; j < np; j++)
      C4[i][j] = (DATA_TYPE)(i * j % np) / np;
}

void print_arr(double my_array[NR][NQ][NP]) {
  int i;
  int j;
  int k;
  for (i = 0; i < NR; i++) {
    for (j = 0; j < NQ; j++) {
      for (k = 0; k < NP; k++) {
        if ((i * NQ * NP + j * NP + k) % 20 == 0) {
          printf("\n");
        }
        printf("%f ", my_array[i][j][k]);
      }
    }
  }
}

int main(int argc, char *argv[]) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "thru-gcc") == 0) {
      THRU_GCC = true;
    }
  }
  init_array(NR, NQ, NP, A, C4);
  if (THRU_GCC) {
    kernel_doitgen(A, C4, sum);
  } else {
    kernel_doitgen_affine(A, A, 0, NR, NQ, NP, 1, 1, 1, C4, C4, 0, NP, NP, 1, 1,
                          sum, sum, 0, NP, 1);
  }
  print_arr(A);
  return 0;
}
