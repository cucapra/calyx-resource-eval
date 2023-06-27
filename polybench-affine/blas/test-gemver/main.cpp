#include "gemver.c"
#include "gemver.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE alpha;
DATA_TYPE beta;
DATA_TYPE A[N][N];
DATA_TYPE u1[N];
DATA_TYPE v1[N];
DATA_TYPE u2[N];
DATA_TYPE v2[N];
DATA_TYPE w[N];
DATA_TYPE x[N];
DATA_TYPE y[N];
DATA_TYPE z[N];

extern "C" {
void kernel_gemver_affine(DATA_TYPE alpha, DATA_TYPE beta, DATA_TYPE[N][N],
                          DATA_TYPE[N][N], int64_t a1, int64_t a2, int64_t a3,
                          int64_t a4, int64_t a5, DATA_TYPE[N], DATA_TYPE[N],
                          int64_t b1, int64_t b2, int64_t b3, DATA_TYPE[N],
                          DATA_TYPE[N], int64_t c1, int64_t c2, int64_t c3,
                          DATA_TYPE[N], DATA_TYPE[N], int64_t d1, int64_t d2,
                          int64_t d3, DATA_TYPE[N], DATA_TYPE[N], int64_t e1,
                          int64_t e2, int64_t e3, DATA_TYPE[N], DATA_TYPE[N],
                          int64_t f1, int64_t f2, int64_t f3, DATA_TYPE[N],
                          DATA_TYPE[N], int64_t g1, int64_t g2, int64_t g3,
                          DATA_TYPE[N], DATA_TYPE[N], int64_t h1, int64_t h2,
                          int64_t h3, DATA_TYPE[N], DATA_TYPE[N], int64_t j1,
                          int64_t j2, int64_t j3);
}

static void init_array(int n, DATA_TYPE *alpha, DATA_TYPE *beta,
                       DATA_TYPE A[N][N], DATA_TYPE u1[N], DATA_TYPE v1[N],
                       DATA_TYPE u2[N], DATA_TYPE v2[N], DATA_TYPE w[N],
                       DATA_TYPE x[N], DATA_TYPE y[N], DATA_TYPE z[N]) {
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;

  DATA_TYPE fn = (DATA_TYPE)n;

  for (i = 0; i < n; i++) {
    u1[i] = i;
    u2[i] = ((i + 1) / fn) / 2.0;
    v1[i] = ((i + 1) / fn) / 4.0;
    v2[i] = ((i + 1) / fn) / 6.0;
    y[i] = ((i + 1) / fn) / 8.0;
    z[i] = ((i + 1) / fn) / 9.0;
    x[i] = 0.0;
    w[i] = 0.0;
    for (j = 0; j < n; j++)
      A[i][j] = (DATA_TYPE)(i * j % n) / n;
  }
}

void print_arr_2d(double my_array[N][N]) {
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
  init_array(N, &alpha, &beta, A, u1, v1, u2, v2, w, x, y, z);
  if (THRU_GCC) {
    kernel_gemver(alpha, beta, A, u1, v1, u2, v2, w, x, y, z);
  } else {
    kernel_gemver_affine(alpha, beta, A, A, 0, N, N, 1, 1, u1, u1, 0, N, 1, v1,
                         v1, 0, N, 1, u2, u2, 0, N, 1, v2, v2, 0, N, 1, w, w, 0,
                         N, 1, x, x, 0, N, 1, y, y, 0, N, 1, z, z, 0, N, 1

    );
  }
  print_arr_2d(A);
  print_arr(x);
  print_arr(w);
  return 0;
}
