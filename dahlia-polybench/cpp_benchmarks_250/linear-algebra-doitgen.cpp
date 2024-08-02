// git.status = dirty, build.date = Fri Aug 02 12:55:36 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<vector<unsigned int>>> &A_int, vector<vector<unsigned int>> &C4_int, vector<unsigned int> &sum_int) {
  
  
    auto start = std::chrono::high_resolution_clock::now();
  for(int r = 0; r < 8; r++) {
    for(int q = 0; q < 8; q++) {
      for(int p = 0; p < 8; p++) {
        sum_int[p] = 0;
        //---
        for(int s = 0; s < 8; s++) {
          unsigned int v = (A_int[r][q][s] * C4_int[s][p]);
          // combiner:
          sum_int[p] += v;
        }
      }
      //---
      for(int p = 0; p < 8; p++) {
        A_int[r][q][p] = sum_int[p];
      }
    }
  }
  auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
std::cout << duration << "\n";
  json_t __;
  __["A_int"] = A_int;
  __["C4_int"] = C4_int;
  __["sum_int"] = sum_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 3>>("A_int", "ubit<32>[][][]", v);
  auto C4_int = get_arg<n_dim_vec_t<unsigned int, 2>>("C4_int", "ubit<32>[][]", v);
  auto sum_int = get_arg<n_dim_vec_t<unsigned int, 1>>("sum_int", "ubit<32>[]", v);
  kernel(A_int, C4_int, sum_int);
  return 0;
}