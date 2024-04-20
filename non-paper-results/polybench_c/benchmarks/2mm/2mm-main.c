#include "2mm.c"
#include "2mm.h"

void main() {
  DATA_TYPE alpha = 5;
  DATA_TYPE beta = 4;
  DATA_TYPE tmp[NI][NJ];
  DATA_TYPE A[NI][NK];
  DATA_TYPE B[NK][NJ];
  DATA_TYPE C[NJ][NL];
  DATA_TYPE D[NI][NL];
  kernel_2mm(alpha, beta, tmp, A, B, C, D);
}