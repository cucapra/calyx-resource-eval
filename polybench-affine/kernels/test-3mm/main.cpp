#include "3mm.c"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

bool THRU_GCC = false;

double E[800][900];
double A[800][1000];
double B[1000][900];
double F[900][1100];
double C[900][1200];
double D[1200][1100];
double G[800][1100];

extern "C" {
void kernel_3mm_affine(double *arg00, double *arg01, int64_t a1, int64_t a2,
                       int64_t a3, int64_t a4, int64_t a5, double *arg10,
                       double *arg11, int64_t b1, int64_t b2, int64_t b3,
                       int64_t b4, int64_t b5, double *arg20, double *arg21,
                       int64_t c1, int64_t c2, int64_t c3, int64_t c4,
                       int64_t c5, double *arg30, double *arg31, int64_t d1,
                       int64_t d2, int64_t d3, int64_t d4, int64_t d5,
                       double *arg40, double *arg41, int64_t e1, int64_t e2,
                       int64_t e3, int64_t e4, int64_t e5, double *arg50,
                       double *arg51, int64_t f1, int64_t f2, int64_t f3,
                       int64_t f4, int64_t f5, double *arg60, double *arg61,
                       int64_t g1, int64_t g2, int64_t g3, int64_t g4,
                       int64_t g5);
}

/* Array initialization. */
static void init_array(int ni, int nj, int nk, int nl, int nm,
                       double A[800][1000], double B[1000][900],
                       double C[900][1200], double D[1200][1100]) {
  int i, j;

  for (i = 0; i < ni; i++)
    for (j = 0; j < nk; j++)
      A[i][j] = (double)((i * j + 1) % ni) / (5 * ni);
  for (i = 0; i < nk; i++)
    for (j = 0; j < nj; j++)
      B[i][j] = (double)((i * (j + 1) + 2) % nj) / (5 * nj);
  for (i = 0; i < nj; i++)
    for (j = 0; j < nm; j++)
      C[i][j] = (double)(i * (j + 3) % nl) / (5 * nl);
  for (i = 0; i < nm; i++)
    for (j = 0; j < nl; j++)
      D[i][j] = (double)((i * (j + 2) + 2) % nk) / (5 * nk);
}

void print_double_array(double my_array[800][1100]) {
  int i;
  int j;
  for (i = 0; i < 800; i++) {
    for (j = 0; j < 1100; j++) {
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
  init_array(800, 900, 100, 1100, 1200, A, B, C, D);
  if (THRU_GCC) {
    kernel_3mm(A, B, C, D, E, F, G);
  } else {
    kernel_3mm_affine(*A, *A, 0, 800, 1000, 1, 1, *B, *B, 0, 1000, 900, 1, 1,
                      *C, *C, 0, 900, 1200, 1, 1, *D, *D, 0, 1200, 1100, 1, 1,
                      *E, *E, 0, 800, 900, 1, 1, *F, *F, 0, 900, 1100, 1, 1, *G,
                      *G, 0, 800, 1100, 1, 1

    );
  }
  print_double_array(G);
  return 0;
}
