#include "fdtd.c"
#include "fdtd.h"

void main() {
  DATA_TYPE ex[NX][NY];
  DATA_TYPE ey[NX][NY];
  DATA_TYPE hz[NX][NY];
  DATA_TYPE _fict_[TMAX];
  kernel_fdtd_2d(TMAX, NX, NY, ex, ey, hz, _fict_);
}