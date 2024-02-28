#include "mvt.c"
#include "mvt.h"

void main() {
  DATA_TYPE x1[N];
  DATA_TYPE x2[N];
  DATA_TYPE y_1[N];
  DATA_TYPE y_2[N];
  DATA_TYPE A[N][N];
  kernel_mvt(x1, x2, y_1, y_2, A);
}