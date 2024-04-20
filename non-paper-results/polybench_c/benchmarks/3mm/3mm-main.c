#include "3mm.c"
#include "3mm.h"

void main() {
  DATA_TYPE A[NI][NK];
  DATA_TYPE B[NK][NJ];
  DATA_TYPE C[NJ][NM];
  DATA_TYPE D[NM][NL];
  DATA_TYPE E[NI][NJ];
  DATA_TYPE F[NJ][NL];
  DATA_TYPE G[NI][NL];
  kernel_3mm(A, B, C, D, E, F, G);
}