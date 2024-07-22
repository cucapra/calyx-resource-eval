// git.status = dirty, build.date = Mon Jul 22 10:54:10 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &alpha_int, vector<unsigned int> &beta_int, vector<vector<unsigned int>> &C, vector<vector<unsigned int>> &A_int) {
  
  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
  vector<vector<unsigned int>> A(12, vector<unsigned int>(8, 0));
  for(int i0 = 0; i0 < 12; i0++) {
    for(int j0 = 0; j0 < 8; j0++) {
      A[i0][j0] = A_int[i0][j0];
    }
  }
  //---
  for(int i = 0; i < 12; i++) {
    unsigned int j = 0;
    while((j <= i)) {
      #pragma HLS loop_tripcount min=1 max=8 avg=4
      unsigned int C_i_j = C[i][j];
      //---
      C[i][j] = (C_i_j * beta_int[0]);
      j = (j + (unsigned int)1);
    }
    //---
    unsigned int j2 = 0;
    while((j2 <= i)) {
      #pragma HLS loop_tripcount min=1 max=8 avg=4
      for(int k = 0; k < 8; k++) {
        unsigned int A_i_k = A[i][k];
        //---
        unsigned int t = ((alpha_int[0] * A_i_k) * A[j2][k]);
        // combiner:
        C[i][j2] += t;
      }
      j2 = (j2 + (unsigned int)1);
    }
  }
  //---
  for(int i0 = 0; i0 < 12; i0++) {
    for(int j0 = 0; j0 < 8; j0++) {
      A_int[i0][j0] = A[i0][j0];
    }
  }
  auto end = std::chrono::high_resolution_clock::now();
    times[i] = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
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
  __["beta_int"] = beta_int;
  __["C"] = C;
  __["A_int"] = A_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto alpha_int = get_arg<n_dim_vec_t<unsigned int, 1>>("alpha_int", "ubit<32>[]", v);
  auto beta_int = get_arg<n_dim_vec_t<unsigned int, 1>>("beta_int", "ubit<32>[]", v);
  auto C = get_arg<n_dim_vec_t<unsigned int, 2>>("C", "ubit<32>[][]", v);
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  kernel(alpha_int, beta_int, C, A_int);
  return 0;
}