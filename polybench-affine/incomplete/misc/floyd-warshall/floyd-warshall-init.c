#include "floyd-warshall.h"

/* Array initialization. */
/* Array initialization. */
static void init_array(int n, DATA_TYPE path[N][N]) {
  int i, j;

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++) {
      path[i][j] = i * j % 7 + 1;
      if ((i + j) % 13 == 0 || (i + j) % 7 == 0 || (i + j) % 11 == 0)
        path[i][j] = 999;
    }
}