#include "gemver.c"
#include "gemver.h"

void main() {
  DATA_TYPE alpha = 3;
  DATA_TYPE beta = 2;
  DATA_TYPE A[N][N];
  DATA_TYPE u1[N];
  DATA_TYPE v1[N];
  DATA_TYPE u2[N];
  DATA_TYPE v2[N];
  DATA_TYPE w[N];
  DATA_TYPE x[N];
  DATA_TYPE y[N];
  DATA_TYPE z[N];
  kernel_gemver(alpha, beta, A, u1, v1, u2, v2, w, x, y, z);
}