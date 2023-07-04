#include "bicg.c"
#include "bicg.h"

void main() {
  DATA_TYPE A[N][M];
  DATA_TYPE s[M];
  DATA_TYPE q[N];
  DATA_TYPE p[M];
  DATA_TYPE r[N];
  kernel_bicg(A, s, q, p, r);
}