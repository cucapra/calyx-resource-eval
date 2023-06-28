// #include "../../../json.hpp"

// #include "atax.h"
// #include <stdio.h>

// using json = nlohmann::json;
// DATA_TYPE A[M][N];
// DATA_TYPE x[N];
// DATA_TYPE y[N];
// DATA_TYPE tmp[M];

// static void init_array(int m, int n, DATA_TYPE A[M][N], DATA_TYPE x[N]) {
//   int i, j;
//   DATA_TYPE fn;
//   fn = (DATA_TYPE)n;

//   for (i = 0; i < n; i++)
//     x[i] = 1 + (i / fn);
//   for (i = 0; i < m; i++)
//     for (j = 0; j < n; j++)
//       A[i][j] = (DATA_TYPE)((i + j) % n) / (5 * m);
// }

// json build_json() {
//   json j;
//   j["A"] = A;
//   j["x"] = x;
//   j["y"] = y;
//   j["tmp"] = tmp;
//   return j;
// }

// json build_json() {
//   json j;
//   j["A"] = 2.2;
//   j["x"] = 3.2;
//   j["y"] = 4.3;
//   j["tmp"] = 5.2;
//   return j;
// }

int main(int argc, char *argv[]) {
  // init_array(M, N, A, x);
  // json j = build_json();
  return 0;
}