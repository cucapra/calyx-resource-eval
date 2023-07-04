#include "mvt.c"
#include "mvt.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE x1[N];
DATA_TYPE x2[N];
DATA_TYPE y_1[N];
DATA_TYPE y_2[N];
DATA_TYPE A[N][N];

extern "C" {
void kernel_mvt_affine(DATA_TYPE *arg00, DATA_TYPE *arg01, int64_t a1,
                       int64_t a2, int64_t a3, DATA_TYPE *arg10,
                       DATA_TYPE *arg11, int64_t b1, int64_t b2, int64_t b3,
                       DATA_TYPE *arg20, DATA_TYPE *arg21, int64_t c1,
                       int64_t c2, int64_t c3, DATA_TYPE *arg30,
                       DATA_TYPE *arg31, int64_t d1, int64_t d2, int64_t d3,
                       DATA_TYPE[N][N], DATA_TYPE[N][N], int64_t e1, int64_t e2,
                       int64_t e3, int64_t e4, int64_t e5);
}

/* Array initialization. */
static void init_array(int n, DATA_TYPE x1[N], DATA_TYPE x2[N],
                       DATA_TYPE y_1[N], DATA_TYPE y_2[N], DATA_TYPE A[N][N]) {
  int i, j;

  for (i = 0; i < n; i++) {
    x1[i] = (DATA_TYPE)(i % n) / n;
    x2[i] = (DATA_TYPE)((i + 1) % n) / n;
    y_1[i] = (DATA_TYPE)((i + 3) % n) / n;
    y_2[i] = (DATA_TYPE)((i + 4) % n) / n;
    for (j = 0; j < n; j++)
      A[i][j] = (DATA_TYPE)(i * j % n) / n;
  }
}

void print_arr(double my_array[N]) {
  int i;
  for (i = 0; i < N; i++) {
    if (i % 20 == 0) {
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
  init_array(N, x1, x2, y_1, y_2, A);
  if (THRU_GCC) {
    kernel_mvt(x1, x2, y_1, y_2, A);
  } else {
    kernel_mvt_affine(x1, x1, 0, N, 1, x2, x2, 0, N, 1, y_1, y_1, 0, N, 1, y_2,
                      y_2, 0, N, 1, A, A, 0, N, N, 1, 1);
  }
  print_arr(x1);
  print_arr(x2);
  return 0;
}
