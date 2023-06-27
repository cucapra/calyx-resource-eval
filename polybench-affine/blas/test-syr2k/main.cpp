#include "syr2k.c"
#include "syr2k.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE alpha;
DATA_TYPE beta;
DATA_TYPE A[N][M];
DATA_TYPE B[N][M];
DATA_TYPE C[N][N];

extern "C" {
void kernel_syr2k_affine(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE[N][M],
                         DATA_TYPE[N][M], int64_t a1, int64_t a2, int64_t a3,
                         int64_t a4, int64_t a5, DATA_TYPE[N][M],
                         DATA_TYPE[N][M], int64_t b1, int64_t b2, int64_t b3,
                         int64_t b4, int64_t b5, DATA_TYPE[N][N],
                         DATA_TYPE[N][N], int64_t c1, int64_t c2, int64_t c3,
                         int64_t c4, int64_t c5);
}

/* Array initialization. */
static void init_array(int n, int m, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[N][M], DATA_TYPE B[N][M],
                       DATA_TYPE C[N][N]) {
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;
  for (i = 0; i < n; i++)
    for (j = 0; j < m; j++) {
      A[i][j] = (DATA_TYPE)((i * j + 1) % n) / n;
      B[i][j] = (DATA_TYPE)((i * j + 2) % m) / m;
    }
  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      C[i][j] = (DATA_TYPE)((i * j + 3) % n) / m;
    }
}

void print_arr(double my_array[N][N]) {
  int i;
  int j;
  for (i = 0; i < N; i++) {
    for (j = 0; j < N; j++) {
      if ((((i * N) + j) % 20) == 0) {
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
  init_array(N, M, &alpha, &beta, A, B, C);
  if (THRU_GCC) {
    kernel_syr2k(alpha, beta, A, B, C);
  } else {
    kernel_syr2k_affine(alpha, beta, A, A, 0, N, M, 1, 1, B, B, 0, N, M, 1, 1,
                        C, C, 0, N, N, 1, 1

    );
  }
  print_arr(C);
  return 0;
}
