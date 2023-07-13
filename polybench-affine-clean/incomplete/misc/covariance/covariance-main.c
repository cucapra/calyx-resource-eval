#include "covariance.c"
#include "covariance.h"

void main() {
  DATA_TYPE data[N][M];
  DATA_TYPE cov[M][M];
  DATA_TYPE mean[M];
  DATA_TYPE float_n = N;
  kernel_covariance(M, N, float_n, data, cov, mean);
}