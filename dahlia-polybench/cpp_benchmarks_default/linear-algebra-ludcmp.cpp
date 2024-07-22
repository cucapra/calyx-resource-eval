// git.status = dirty, build.date = Thu Jul 18 09:15:33 EDT 2024, git.hash =
// 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &A_int, vector<unsigned int> &b_int,
            vector<unsigned int> &x_int, vector<unsigned int> &y_int) {

  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 8; i++) {
      unsigned int j = 0;
      while ((j < i)) {
#pragma HLS loop_tripcount min = 0 max = 7 avg = 4
        unsigned int w = A_int[i][j];
        //---
        unsigned int k = 0;
        while ((k < j)) {
#pragma HLS loop_tripcount min = 0 max = 6 avg = 2
          unsigned int A_i_k = A_int[i][k];
          //---
          w = (w - (A_i_k * A_int[k][j]));
          k = (k + 1);
        }
        //---
        unsigned int A_j_j = A_int[j][j];
        //---
        if ((A_j_j != 0)) {
          A_int[i][j] = (w / A_j_j);
        }
        j = (j + 1);
      }
      //---
      j = i;
      while ((j < 8)) {
#pragma HLS loop_tripcount min = 1 max = 8 avg = 4
        unsigned int w = A_int[i][j];
        //---
        unsigned int k = 0;
        while ((k < i)) {
#pragma HLS loop_tripcount min = 0 max = 7 avg = 2
          unsigned int A_i_k = A_int[i][k];
          //---
          w = (w - (A_i_k * A_int[k][j]));
          k = (k + 1);
        }
        //---
        A_int[i][j] = w;
        j = (j + 1);
      }
    }
    //---
    for (int i = 0; i < 8; i++) {
      unsigned int w = b_int[i];
      unsigned int j = 0;
      while ((j < i)) {
#pragma HLS loop_tripcount min = 0 max = 7 avg = 4
        w = (w - (A_int[i][j] * y_int[j]));
        j = (j + 1);
      }
      //---
      y_int[i] = w;
    }
    //---
    unsigned int i = (8 - 1);
    while (((i >= 0) && (i < 8))) {
#pragma HLS loop_tripcount min = 8 max = 8 avg = 8
      unsigned int w = y_int[i];
      unsigned int j = (i + 1);
      while ((j < 8)) {
#pragma HLS loop_tripcount min = 0 max = 7 avg = 4
        w = (w - (A_int[i][j] * x_int[j]));
        j = (j + 1);
      }
      //---
      if ((A_int[i][i] != 0)) {
        x_int[i] = (w / A_int[i][i]);
      }
      i = (i - 1);
    }
    auto end = std::chrono::high_resolution_clock::now();
    times[i] = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start)
                   .count();
  }
  long sum = 0;
  for (auto i = 0; i < numRuns; i++) {
    std::cout << times[i];
    if (i == numRuns - 1) {
      std::cout << "\n";
    } else {
      std::cout << ",";
    }
    sum += times[i];
  }
  std::cout << (sum / numRuns) << "\n";
  json_t __;
  __["A_int"] = A_int;
  __["b_int"] = b_int;
  __["x_int"] = x_int;
  __["y_int"] = y_int;
}
int main(int argc, char **argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);
  ;
  auto A_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto b_int = get_arg<n_dim_vec_t<unsigned int, 1>>("b_int", "ubit<32>[]", v);
  auto x_int = get_arg<n_dim_vec_t<unsigned int, 1>>("x_int", "ubit<32>[]", v);
  auto y_int = get_arg<n_dim_vec_t<unsigned int, 1>>("y_int", "ubit<32>[]", v);
  kernel(A_int, b_int, x_int, y_int);
  return 0;
}