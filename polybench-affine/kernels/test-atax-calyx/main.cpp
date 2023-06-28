#include "atax-init.c"
#include "atax.c"
#include "atax.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
DATA_TYPE A[M][N];
DATA_TYPE x[N];
DATA_TYPE y[N];
DATA_TYPE tmp[M];

extern "C" {
void kernel_atax_affine(DATA_TYPE *arg00, DATA_TYPE *arg01, int64_t a1,
                        int64_t a2, int64_t a3, int64_t a4, int64_t a5,
                        DATA_TYPE *arg10, DATA_TYPE *arg11, int64_t b1,
                        int64_t b2, int64_t b3, DATA_TYPE *arg20,
                        DATA_TYPE *arg21, int64_t c1, int64_t c2, int64_t c3,
                        DATA_TYPE *arg30, DATA_TYPE *arg31, int64_t d1,
                        int64_t d2, int64_t d3);
}

void print_double_array(DATA_TYPE my_array[N]) {
  int i;
  int j;
  for (i = 0; i < N; i++) {
    if ((i % 20) == 0) {
      printf("\n");
    }
    printf("%d ", my_array[i]);
  }
}

int main(int argc, char *argv[]) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "thru-gcc") == 0) {
      THRU_GCC = true;
    }
  }
  init_array(M, N, A, x);
  if (THRU_GCC) {
    kernel_atax(A, x, y, tmp);
  } else {
    kernel_atax_affine(*A, *A, 0, M, N, 1, 1, x, x, 0, N, 1, y, y, 0, N, 1, tmp,
                       tmp, 0, M, 1);
  }
  print_double_array(y);
  return 0;
}
