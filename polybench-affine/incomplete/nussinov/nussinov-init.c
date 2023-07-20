#include "nussinov.h"

typedef char base;
/* Array initialization. */
static void init_array(int n, DATA_TYPE seq[N], DATA_TYPE table[N][N]) {
  int i, j;

  // base is AGCT/0..3
  for (i = 0; i < n; i++) {
    seq[i] = ((i + 1) % 4);
  }

  for (i = 0; i < n; i++)
    for (j = 0; j < n; j++)
      table[i][j] = 0;
}