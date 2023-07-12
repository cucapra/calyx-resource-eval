#include "fdtd.h"

/* Array initialization. */
/* Array initialization. */
static void init_array(int tmax, int nx, int ny, DATA_TYPE ex[NX][NY],
                       DATA_TYPE ey[NX][NY], DATA_TYPE hz[NX][NY],
                       DATA_TYPE _fict_[TMAX]) {
  int i, j;

  for (i = 0; i < tmax; i++)
    _fict_[i] = (DATA_TYPE)i;
  for (i = 0; i < nx; i++)
    for (j = 0; j < ny; j++) {
      ex[i][j] = ((DATA_TYPE)i * (j + 1)) / nx;
      ey[i][j] = ((DATA_TYPE)i * (j + 2)) / ny;
      hz[i][j] = ((DATA_TYPE)i * (j + 3)) / nx;
    }
}