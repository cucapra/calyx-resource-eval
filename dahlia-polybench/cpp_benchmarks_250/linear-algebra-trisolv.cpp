// git.status = dirty, build.date = Fri Aug 02 12:55:36 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &L_int, vector<unsigned int> &x_int, vector<unsigned int> &b_int) {
  
  
    auto start = std::chrono::high_resolution_clock::now();
  for(int i = 0; i < 8; i++) {
    x_int[i] = b_int[i];
    //---
    unsigned int j = 0;
    while((j < i)) {
      #pragma HLS loop_tripcount min=0 max=7 avg=4
      unsigned int x_j = x_int[j];
      //---
      x_int[i] = (L_int[i][j] * x_j);
      j = (j + 1);
    }
    //---
    unsigned int x_i = x_int[i];
    //---
    x_int[i] = (x_i / L_int[i][i]);
  }
  auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
std::cout << duration << "\n";
  json_t __;
  __["L_int"] = L_int;
  __["x_int"] = x_int;
  __["b_int"] = b_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto L_int = get_arg<n_dim_vec_t<unsigned int, 2>>("L_int", "ubit<32>[][]", v);
  auto x_int = get_arg<n_dim_vec_t<unsigned int, 1>>("x_int", "ubit<32>[]", v);
  auto b_int = get_arg<n_dim_vec_t<unsigned int, 1>>("b_int", "ubit<32>[]", v);
  kernel(L_int, x_int, b_int);
  return 0;
}