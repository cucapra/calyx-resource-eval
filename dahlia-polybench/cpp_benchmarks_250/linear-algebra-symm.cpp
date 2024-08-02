// git.status = dirty, build.date = Fri Aug 02 12:55:36 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &alpha_int, vector<unsigned int> &beta_int, vector<vector<unsigned int>> &C_int, vector<vector<unsigned int>> &A_int, vector<vector<unsigned int>> &B_int) {
  
  
    auto start = std::chrono::high_resolution_clock::now();
  unsigned int temp2 = 0;
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 12; j++) {
      temp2 = 0;
      unsigned int k = 0;
      while((k < i)) {
        #pragma HLS loop_tripcount min=0 max=7 avg=4
        unsigned int C_k_j = C_int[k][j];
        //---
        C_int[k][j] = (((alpha_int[0] * B_int[i][j]) * A_int[i][k]) + C_k_j);
        //---
        temp2 = (temp2 + (B_int[k][j] * A_int[i][k]));
        k = (k + 1);
      }
      //---
      unsigned int C_i_j = C_int[i][j];
      //---
      C_int[i][j] = (((beta_int[0] * C_i_j) + ((alpha_int[0] * B_int[i][j]) * A_int[i][i])) + (alpha_int[0] * temp2));
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