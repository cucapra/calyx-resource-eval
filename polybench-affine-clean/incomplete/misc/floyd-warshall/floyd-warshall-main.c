#include "floyd-warshall.c"
#include "floyd-warshall.h"

void main() {
  DATA_TYPE path[N][N];
  kernel_floyd_warshall(N, path);
}