#include "cholesky.c"
#include "cholesky.h"

void main() {
  DATA_TYPE A[N][N];
  kernel_cholesky_partial(N, A);
}