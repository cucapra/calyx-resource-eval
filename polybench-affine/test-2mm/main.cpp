#include "2mm.c"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;
double tmp[800][900];
double A[800][1100];
double B[1100][900];
double C[900][1200];
double D[800][1200];

extern "C" {
void kernel_2mm_affine(double alpha, double beta, double *arg00, double *arg01,
                       int64_t a1, int64_t a2, int64_t a3, int64_t a4,
                       int64_t a5, double *arg10, double *arg11, int64_t b1,
                       int64_t b2, int64_t b3, int64_t b4, int64_t b5,
                       double *arg20, double *arg21, int64_t c1, int64_t c2,
                       int64_t c3, int64_t c4, int64_t c5, double *arg30,
                       double *arg31, int64_t d1, int64_t d2, int64_t d3,
                       int64_t d4, int64_t d5, double *arg40, double *arg41,
                       int64_t e1, int64_t e2, int64_t e3, int64_t e4,
                       int64_t e5);
}

static void init_array(int ni, int nj, int nk, int nl, double *alpha,
                       double *beta, double A[800][1100], double B[1100][900],
                       double C[900][1200], double D[900][1200]) {
  int i, j;

  *alpha = 1.5;
  *beta = 1.2;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (double)((i * j + 1) % ni) / ni;
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (double)(i * (j + 1) % nj) / nj;
  for (i = 0; i < nj; i++)
    for (j = 0; j < nl; j++)
      C[i][j] = (double)((i * (j + 3) + 1) % nl) / nl;
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++)
      D[i][j] = (double)(i * (j + 2) % nk) / nk;
}

void print_double_array(double my_array[800][1200]) {
  int i;
  int j;
  for (i = 0; i < 800; i++) {
    for (j = 0; j < 1200; j++) {
      if ((((i * 800) + j) % 20) == 0) {
        printf("\n");
      }
      printf("%f ", my_array[i][j]);
    }
  }
}

int main(int argc, char *argv[]) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "thru-gcc") == 0) {
      THRU_GCC = true;
    }
  }
  double alpha;
  double beta;
  init_array(800, 900, 1100, 1200, &alpha, &beta, A, B, C, D);
  if (THRU_GCC) {
    kernel_2mm(alpha, beta, tmp, A, B, C, D);
  } else {
    kernel_2mm_affine(alpha, beta, *tmp, *tmp, 0, 800, 900, 1, 1, *A, *A, 0,
                      800, 1100, 1, 1, *B, *B, 0, 1100, 900, 1, 1, *C, *C, 0,
                      900, 1200, 1, 1, *D, *D, 0, 800, 1200, 1, 1);
  }
  print_double_array(D);
  return 0;
}
