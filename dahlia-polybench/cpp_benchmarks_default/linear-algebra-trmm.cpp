// git.status = dirty, build.date = Thu Jul 18 09:15:33 EDT 2024, git.hash =
// 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &alpha_int,
            vector<vector<unsigned int>> &A_int,
            vector<vector<unsigned int>> &B_int) {

  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 12; j++) {
        unsigned int k = (i + (unsigned int)1);
        while ((k < 8)) {
#pragma HLS loop_tripcount min = 0 max = 7 avg = 4
          unsigned int B_i_j = B_int[i][j];
          //---
          unsigned int B_k_j = B_int[k][j];
          //---
          B_int[i][j] = ((A_int[k][i] * B_k_j) + B_i_j);
          k = (k + (unsigned int)1);
        }
        //---
        unsigned int B_i_j = B_int[i][j];
        //---
        B_int[i][j] = (alpha_int[0] * B_i_j);
      }
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
  __["alpha_int"] = alpha_int;
  __["A_int"] = A_int;
  __["B_int"] = B_int;
}
int main(int argc, char **argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);
  ;
  auto alpha_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("alpha_int", "ubit<32>[]", v);
  auto A_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto B_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("B_int", "ubit<32>[][]", v);
  kernel(alpha_int, A_int, B_int);
  return 0;
}