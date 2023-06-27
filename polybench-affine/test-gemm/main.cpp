#include "gemm.c"
#include "gemm.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE A[NI][NK];
DATA_TYPE B[NK][NJ];
DATA_TYPE C[NI][NJ];

extern "C" {
void kernel_gemm_affine(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE[NI][NK],
                        DATA_TYPE[NI][NK], int64_t a1, int64_t a2, int64_t a3,
                        int64_t a4, int64_t a5, DATA_TYPE[NK][NJ],
                        DATA_TYPE[NK][NJ], int64_t b1, int64_t b2, int64_t b3,
                        int64_t b4, int64_t b5, DATA_TYPE[NI][NJ],
                        DATA_TYPE[NI][NJ], int64_t c1, int64_t c2, int64_t c3,
                        int64_t c4, int64_t c5);
}

static void init_array(int ni, int nj, int nk, DATA_TYPE *alpha,
                       DATA_TYPE *beta, DATA_TYPE A[NI][NK],
                       DATA_TYPE B[NK][NJ], DATA_TYPE C[NI][NJ]) {
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;
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

void print_arr(double my_array[NI][NJ]) {
  int i;
  int j;
  for (i = 0; i < NI; i++) {
    for (j = 0; j < NJ; j++) {
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
  init_array(NI, NJ, NK, &alpha, &beta, A, B, C);
  if (THRU_GCC) {
    kernel_gemm(alpha, beta, A, B, C);
  } else {
    kernel_gemm_affine(alpha, beta, A, A, 0, NI, NK, 1, 1, B, B, 0, NK, NJ, 1,
                       1, C, C, 0, NI, NJ, 1, 1);
  }
  print_arr(C);
  return 0;
}
