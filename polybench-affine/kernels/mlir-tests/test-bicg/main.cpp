#include "bicg.c"
#include "bicg.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE A[N][M];
DATA_TYPE s[M];
DATA_TYPE q[N];
DATA_TYPE p[M];
DATA_TYPE r[N];

extern "C" {
void kernel_bicg_affine(DATA_TYPE *arg00, DATA_TYPE *arg01, int64_t a1,
                        int64_t a2, int64_t a3, int64_t a4, int64_t a5,
                        DATA_TYPE *arg10, DATA_TYPE *arg11, int64_t b1,
                        int64_t b2, int64_t b3, DATA_TYPE *arg20,
                        DATA_TYPE *arg21, int64_t c1, int64_t c2, int64_t c3,
                        DATA_TYPE *arg30, DATA_TYPE *arg31, int64_t d1,
                        int64_t d2, int64_t d3, DATA_TYPE *arg40,
                        DATA_TYPE *arg41, int64_t e1, int64_t e2, int64_t e3

);
}

/* Array initialization. */
static void init_array(DATA_TYPE A[N][M], DATA_TYPE r[N], DATA_TYPE p[M]) {
  int i, j;
  for (i = 0; i < M; i++)
    p[i] = (DATA_TYPE)(i % M) / M;
  for (i = 0; i < N; i++) {
    r[i] = (DATA_TYPE)(i % N) / N;
    for (j = 0; j < M; j++)
      A[i][j] = (DATA_TYPE)(i * (j + 1) % N) / N;
  }
}

void print_n_len(double my_array[N]) {
  int i;
  for (i = 0; i < N; i++) {
    if ((i % 20) == 0) {
      printf("\n");
    }
    printf("%f ", my_array[i]);
  }
}

void print_m_len(double my_array[M]) {
  int i;
  for (i = 0; i < M; i++) {
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
  init_array(A, r, p);
  if (THRU_GCC) {
    kernel_bicg(A, s, q, p, r);
  } else {
    kernel_bicg_affine(*A, *A, 0, N, M, 1, 1, s, s, 0, M, 1, q, q, 0, N, 1, p,
                       p, 0, M, 1, r, r, 0, N, 1);
  }
  print_n_len(q);
  print_m_len(s);
  return 0;
}
