#include "gesummv.c"
#include "gesummv.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE alpha;
DATA_TYPE beta;
DATA_TYPE A[N][N];
DATA_TYPE B[N][N];
DATA_TYPE tmp[N];
DATA_TYPE x[N];
DATA_TYPE y[N];

extern "C" {
void kernel_gesummv_affine(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE[N][N],
                           DATA_TYPE[N][N], int64_t a1, int64_t a2, int64_t a3,
                           int64_t a4, int64_t a5, DATA_TYPE[N][N],
                           DATA_TYPE[N][N], int64_t b1, int64_t b2, int64_t b3,
                           int64_t b4, int64_t b5, DATA_TYPE[N], DATA_TYPE[N],
                           int64_t c1, int64_t c2, int64_t c3, DATA_TYPE[N],
                           DATA_TYPE[N], int64_t d1, int64_t d2, int64_t d3,
                           DATA_TYPE[N], DATA_TYPE[N], int64_t e1, int64_t e2,
                           int64_t e3);
}

/* Array initialization. */
static void init_array(int n, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[N][N], DATA_TYPE B[N][N], DATA_TYPE x[N]) {
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;
  for (i = 0; i < n; i++) {
    x[i] = (DATA_TYPE)(i % n) / n;
    for (j = 0; j < n; j++) {
      A[i][j] = (DATA_TYPE)((i * j + 1) % n) / n;
      B[i][j] = (DATA_TYPE)((i * j + 2) % n) / n;
    }
  }
}

void print_arr(double my_array[N]) {
  int i;
  for (i = 0; i < N; i++) {
    if ((i % 20) == 0) {
      printf("\n");
    }
    printf("%f ", my_array[i]);
  }
}

int main(int argc, char *argv[]) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "thru-gcc") == 0) {
      THRU_GCC = true;
    }
  }
  init_array(N, &alpha, &beta, A, B, x);
  if (THRU_GCC) {
    kernel_gesummv(alpha, beta, A, B, tmp, x, y);
  } else {
    kernel_gesummv_affine(alpha, beta, A, A, 0, N, N, 1, 1, B, B, 0, N, N, 1, 1,
                          tmp, tmp, 0, N, 1, x, x, 0, N, 1, y, y, 0, N, 1

    );
  }
  print_arr(y);
  return 0;
}
