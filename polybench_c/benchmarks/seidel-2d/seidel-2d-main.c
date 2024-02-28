#include "seidel-2d.c"
#include "seidel-2d.h"

void main() {
  DATA_TYPE A[N][N];
  kernel_seidel_2d(TSTEPS, N, A);
}