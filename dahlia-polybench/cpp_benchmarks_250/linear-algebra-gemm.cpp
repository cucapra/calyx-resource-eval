// git.status = dirty, build.date = Fri Aug 02 12:55:36 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &alpha_int, vector<unsigned int> &beta_int, vector<vector<unsigned int>> &C_int, vector<vector<unsigned int>> &A_int, vector<vector<unsigned int>> &B_int) {
  
  
    auto start = std::chrono::high_resolution_clock::now();
  vector<vector<unsigned int>> C(8, vector<unsigned int>(8, 0));
  vector<vector<unsigned int>> A(8, vector<unsigned int>(8, 0));
  vector<vector<unsigned int>> B(8, vector<unsigned int>(8, 0));
  unsigned int alpha_ = alpha_int[0];
  unsigned int beta_ = beta_int[0];
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      A[i][j] = A_int[i][j];
      B[i][j] = B_int[i][j];
      C[i][j] = C_int[i][j];
    }
  }
  //---
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      unsigned int C_i_j = C[i][j];
      //---
      C[i][j] = (C_i_j * beta_);
    }
    //---
    for(int j = 0; j < 8; j++) {
      for(int k = 0; k < 8; k++) {
        unsigned int v = ((alpha_ * A[i][k]) * B[k][j]);
        // combiner:
        C[i][j] += v;
      }
    }
  }
  //---
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      C_int[i][j] = C[i][j];
    }
  }
  auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
std::cout << duration << "\n";
  json_t __;
  __["alpha_int"] = alpha_int;
  __["beta_int"] = beta_int;
  __["C_int"] = C_int;
  __["A_int"] = A_int;
  __["B_int"] = B_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto alpha_int = get_arg<n_dim_vec_t<unsigned int, 1>>("alpha_int", "ubit<32>[]", v);
  auto beta_int = get_arg<n_dim_vec_t<unsigned int, 1>>("beta_int", "ubit<32>[]", v);
  auto C_int = get_arg<n_dim_vec_t<unsigned int, 2>>("C_int", "ubit<32>[][]", v);
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto B_int = get_arg<n_dim_vec_t<unsigned int, 2>>("B_int", "ubit<32>[][]", v);
  kernel(alpha_int, beta_int, C_int, A_int, B_int);
  return 0;
}