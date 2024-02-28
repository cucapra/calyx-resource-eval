#include "lu.c"
#include "lu.h"

void main() {
  DATA_TYPE A[N][N];
  kernel_lu(N, A);
}