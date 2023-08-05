#include "fdtd.h"

DATA_TYPE ex[NX][NY];
DATA_TYPE ey[NX][NY];
DATA_TYPE hz[NX][NY];
DATA_TYPE _fict_[TMAX];

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void kernel_fdtd_2d(int tmax, int nx, int ny, DATA_TYPE ex[NX][NY],
                           DATA_TYPE ey[NX][NY], DATA_TYPE hz[NX][NY],
                           DATA_TYPE _fict_[TMAX]) {
  int t, i, j;

#pragma scop

  for (t = 0; t < TMAX; t++) {
    for (j = 0; j < NY; j++)
      ey[0][j] = _fict_[t];
    for (i = 1; i < NX; i++)
      for (j = 0; j < NY; j++)
        ey[i][j] = ey[i][j] - SCALAR_VAL(0.5) * (hz[i][j] - hz[i - 1][j]);
    for (i = 0; i < NX; i++)
      for (j = 1; j < NY; j++)
        ex[i][j] = ex[i][j] - SCALAR_VAL(0.5) * (hz[i][j] - hz[i][j - 1]);
    for (i = 0; i < NX - 1; i++)
      for (j = 0; j < NY - 1; j++)
        hz[i][j] = hz[i][j] - SCALAR_VAL(0.7) * (ex[i][j + 1] - ex[i][j] +
                                                 ey[i + 1][j] - ey[i][j]);
  }

#pragma endscop
}