#include "trmm.c"
#include "trmm.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE alpha;
DATA_TYPE A[M][M];
DATA_TYPE B[M][N];

extern "C" {
void kernel_trmm_affine(DATA_TYPE alpha, DATA_TYPE[M][M], DATA_TYPE[M][M],
                        int64_t a1, int64_t a2, int64_t a3, int64_t a4,
                        int64_t a5, DATA_TYPE[M][N], DATA_TYPE[M][N],
                        int64_t b1, int64_t b2, int64_t b3, int64_t b4,
                        int64_t b5);
}

/* Array initialization. */
static void init_array(int m, int n, DATA_TYPE *alpha, DATA_TYPE A[M][M],
                       DATA_TYPE B[M][N]) {
  int i, j;

  *alpha = 1.5;
  for (i = 0; i < m; i++) {
    for (j = 0; j < i; j++) {
      A[i][j] = (DATA_TYPE)((i + j) % m) / m;
    }
    A[i][i] = 1.0;
    for (j = 0; j < n; j++) {
      B[i][j] = (DATA_TYPE)((n + (i - j)) % n) / n;
    }
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
  init_array(M, N, &alpha, A, B);
  if (THRU_GCC) {
    kernel_trmm(alpha, A, B);
  } else {
    kernel_trmm_affine(alpha, A, A, 0, M, M, 1, 1, B, B, 0, M, N, 1, 1);
  }
  print_arr(B);
  return 0;
}
