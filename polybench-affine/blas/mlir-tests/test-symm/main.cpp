#include "symm.c"
#include "symm.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE alpha;
DATA_TYPE beta;
DATA_TYPE A[M][M];
DATA_TYPE B[M][N];
DATA_TYPE C[M][N];

extern "C" {
void kernel_symm_affine(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE[M][M],
                        DATA_TYPE[M][M], int64_t a1, int64_t a2, int64_t a3,
                        int64_t a4, int64_t a5, DATA_TYPE[M][N],
                        DATA_TYPE[M][N], int64_t b1, int64_t b2, int64_t b3,
                        int64_t b4, int64_t b5, DATA_TYPE[M][N],
                        DATA_TYPE[M][N], int64_t c1, int64_t c2, int64_t c3,
                        int64_t c4, int64_t c5);
}

/* Array initialization. */
static void init_array(int m, int n, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[M][M], DATA_TYPE B[M][N],
                       DATA_TYPE C[M][N]) {
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;
  for (i = 0; i < m; i++)
    for (j = 0; j < n; j++) {
      C[i][j] = (DATA_TYPE)((i + j) % 100) / m;
      B[i][j] = (DATA_TYPE)((n + i - j) % 100) / m;
    }
  for (i = 0; i < m; i++) {
    for (j = 0; j <= i; j++)
      A[i][j] = (DATA_TYPE)((i + j) % 100) / m;
    for (j = i + 1; j < m; j++)
      A[i][j] = -999; // regions of arrays that should not be used
  }
}

void print_arr(double my_array[M][N]) {
  int i;
  int j;
  for (i = 0; i < M; i++) {
    for (j = 0; j < N; j++) {
      if ((((i * M) + j) % 20) == 0) {
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
  init_array(M, N, &alpha, &beta, A, B, C);
  if (THRU_GCC) {
    kernel_symm(alpha, beta, A, B, C);
  } else {
    kernel_symm_affine(alpha, beta, A, A, 0, M, M, 1, 1, B, B, 0, M, N, 1, 1, C,
                       C, 0, M, N, 1, 1

    );
  }
  print_arr(C);
  return 0;
}
