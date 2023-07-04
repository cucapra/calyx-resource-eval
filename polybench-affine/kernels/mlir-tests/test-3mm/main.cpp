#include "3mm.c"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;

DATA_TYPE E[NI][NJ];
DATA_TYPE A[NI][NK];
DATA_TYPE B[NK][NJ];
DATA_TYPE F[NJ][NL];
DATA_TYPE C[NJ][NM];
DATA_TYPE D[NM][NL];
DATA_TYPE G[NI][NL];

extern "C" {
void kernel_3mm_affine(
    DATA_TYPE *arg00, DATA_TYPE *arg01, int64_t a1, int64_t a2, int64_t a3,
    int64_t a4, int64_t a5, DATA_TYPE *arg10, DATA_TYPE *arg11, int64_t b1,
    int64_t b2, int64_t b3, int64_t b4, int64_t b5, DATA_TYPE *arg20,
    DATA_TYPE *arg21, int64_t c1, int64_t c2, int64_t c3, int64_t c4,
    int64_t c5, DATA_TYPE *arg30, DATA_TYPE *arg31, int64_t d1, int64_t d2,
    int64_t d3, int64_t d4, int64_t d5, DATA_TYPE *arg40, DATA_TYPE *arg41,
    int64_t e1, int64_t e2, int64_t e3, int64_t e4, int64_t e5,
    DATA_TYPE *arg50, DATA_TYPE *arg51, int64_t f1, int64_t f2, int64_t f3,
    int64_t f4, int64_t f5, DATA_TYPE *arg60, DATA_TYPE *arg61, int64_t g1,
    int64_t g2, int64_t g3, int64_t g4, int64_t g5);
}

/* Array initialization. */
static void init_array(int ni, int nj, int nk, int nl, int nm,
                       DATA_TYPE A[NI][NK], DATA_TYPE B[NK][NJ],
                       DATA_TYPE C[NJ][NM], DATA_TYPE D[NM][NL]) {
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (DATA_TYPE)((i * j + 1) % ni) / (5 * ni);
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (DATA_TYPE)((i * (j + 1) + 2) % nj) / (5 * nj);
  for (i = 0; i < nj; i++)
    for (j = 0; j < nm; j++)
      C[i][j] = (DATA_TYPE)(i * (j + 3) % nl) / (5 * nl);
  for (i = 0; i < nm; i++)
    for (j = 0; j < nl; j++)
      D[i][j] = (DATA_TYPE)((i * (j + 2) + 2) % nk) / (5 * nk);
}

void print_double_array(DATA_TYPE my_array[NI][NL]) {
  int i;
  int j;
  for (i = 0; i < NI; i++) {
    for (j = 0; j < NL; j++) {
      if ((((i * NI) + j) % 20) == 0) {
        printf("\n");
      }
      printf("%f ", my_array[i][j]);
    }
  }
}

int main(int argc, char *argv[]) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "thru-gcc") == 0) {
      THRU_GCC = true;
    }
  }
  init_array(NI, NJ, NK, NL, NM, A, B, C, D);
  if (THRU_GCC) {
    kernel_3mm(A, B, C, D, E, F, G);
  } else {
    kernel_3mm_affine(*A, *A, 0, NI, NK, 1, 1, *B, *B, 0, NK, NJ, 1, 1, *C, *C,
                      0, NJ, NM, 1, 1, *D, *D, 0, NM, NL, 1, 1, *E, *E, 0, NI,
                      NJ, 1, 1, *F, *F, 0, NJ, NL, 1, 1, *G, *G, 0, NI, NL, 1, 1

    );
  }
  print_double_array(G);
  return 0;
}
