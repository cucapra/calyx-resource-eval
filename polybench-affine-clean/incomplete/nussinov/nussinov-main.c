#include "nussinov.c"
#include "nussinov.h"

void main() {
  DATA_TYPE seq[N];
  DATA_TYPE table[N][N];
  kernel_nussinov(N, seq, table);
}