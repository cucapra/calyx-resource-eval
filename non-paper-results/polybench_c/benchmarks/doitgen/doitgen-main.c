#include "doitgen.c"
#include "doitgen.h"

void main() {
  DATA_TYPE A[NR][NQ][NP];
  DATA_TYPE C4[NP][NP];
  DATA_TYPE sum[NP];
  kernel_doitgen(A, C4, sum);
}