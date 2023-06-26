/* Main computational kernel. The whole function will be timed,
   including the call and return. */
void kernel_2mm(double alpha, double beta, double tmp[800][900],
                double A[800][1100], double B[1100][900], double C[900][1200],
                double D[800][1200]) {
  int i, j, k;

#pragma scop
  /* D := alpha*A*B*C + beta*D */
  for (i = 0; i < 800; i++)
    for (j = 0; j < 900; j++) {
      tmp[i][j] = 0.0;
      for (k = 0; k < 1100; ++k)
        tmp[i][j] += alpha * A[i][k] * B[k][j];
    }
  for (i = 0; i < 800; i++)
    for (j = 0; j < 1200; j++) {
      D[i][j] *= beta;
      for (k = 0; k < 900; ++k)
        D[i][j] += tmp[i][k] * C[k][j];
    }
#pragma endscop
}

// int main(int argc, char **argv) {
//   kernel_2mm;
//   return 0;
// }