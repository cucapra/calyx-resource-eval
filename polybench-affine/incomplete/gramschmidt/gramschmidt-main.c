#include "gramschmidt.c"
#include "gramschmidt.h"

void main() {
  DATA_TYPE A[M][N];
  DATA_TYPE Q[M][N];
  DATA_TYPE R[N][N];
  kernel_gramschmidt_partial(M, N, A, Q, R);
}