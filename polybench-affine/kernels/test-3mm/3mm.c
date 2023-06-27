
/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_3mm(double A[800][1000], double B[1000][900], double C[900][1200],
                double D[1200][1100], double E[800][900], double F[900][1100],
                double G[800][1100]

) {
  int i, j, k;

#pragma scop
  /* E := A*B */
  for (i = 0; i < 800; i++)
    for (j = 0; j < 900; j++) {
      E[i][j] = 0.0;
      for (k = 0; k < 1000; ++k)
        E[i][j] += A[i][k] * B[k][j];
    }
  /* F := C*D */
  for (i = 0; i < 900; i++)
    for (j = 0; j < 1100; j++) {
      F[i][j] = 0.0;
      for (k = 0; k < 1200; ++k)
        F[i][j] += C[i][k] * D[k][j];
    }
  /* G := E*F */
  for (i = 0; i < 800; i++)
    for (j = 0; j < 1100; j++) {
      G[i][j] = 0.0;
      for (k = 0; k < 900; ++k)
        G[i][j] += E[i][k] * F[k][j];
    }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_3mm;
//   return 0;
// }