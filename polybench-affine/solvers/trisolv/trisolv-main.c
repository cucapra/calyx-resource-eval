#include "trisolv.c"
#include "trisolv.h"

void main() {
  DATA_TYPE b[N];
  DATA_TYPE L[N][N];
  DATA_TYPE x[N];
  kernel_trisolv(N, b, L, x);
}