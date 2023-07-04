#include "2mm.c"
#include "2mm.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE tmp[NI][NJ];
DATA_TYPE A[NI][NK];
DATA_TYPE B[NK][NJ];
DATA_TYPE C[NJ][NL];
DATA_TYPE D[NI][NL];

extern "C" {
void kernel_2mm_affine(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE *arg00,
                       DATA_TYPE *arg01, int64_t a1, int64_t a2, int64_t a3,
                       int64_t a4, int64_t a5, DATA_TYPE *arg10,
                       DATA_TYPE *arg11, int64_t b1, int64_t b2, int64_t b3,
                       int64_t b4, int64_t b5, DATA_TYPE *arg20,
                       DATA_TYPE *arg21, int64_t c1, int64_t c2, int64_t c3,
                       int64_t c4, int64_t c5, DATA_TYPE *arg30,
                       DATA_TYPE *arg31, int64_t d1, int64_t d2, int64_t d3,
                       int64_t d4, int64_t d5, DATA_TYPE *arg40,
                       DATA_TYPE *arg41, int64_t e1, int64_t e2, int64_t e3,
                       int64_t e4, int64_t e5);
}

static void init_array(int ni, int nj, int nk, int nl, DATA_TYPE *alpha,
                       DATA_TYPE *beta, DATA_TYPE A[NI][NK],
                       DATA_TYPE B[NK][NJ], DATA_TYPE C[NJ][NL],
                       DATA_TYPE D[NJ][NL]) {
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (DATA_TYPE)((i * j + 1) % ni) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (DATA_TYPE)(i * (j + 1) % nj) / nj;
  for (i = 0; i < nj; i++)
    for (j = 0; j < nl; j++)
      C[i][j] = (DATA_TYPE)((i * (j + 3) + 1) % nl) / nl;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      D[i][j] = (DATA_TYPE)(i * (j + 2) % nk) / nk;
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
  DATA_TYPE alpha;
  DATA_TYPE beta;
  init_array(NI, NJ, NK, NL, &alpha, &beta, A, B, C, D);
  if (THRU_GCC) {
    kernel_2mm(alpha, beta, tmp, A, B, C, D);
  } else {
    kernel_2mm_affine(alpha, beta, *tmp, *tmp, 0, NI, NJ, 1, 1, *A, *A, 0, NI,
                      NK, 1, 1, *B, *B, 0, NK, NJ, 1, 1, *C, *C, 0, NJ, NL, 1,
                      1, *D, *D, 0, NI, NL, 1, 1);
  }
  print_double_array(D);
  return 0;
}
