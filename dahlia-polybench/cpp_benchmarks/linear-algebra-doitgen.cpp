// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<vector<unsigned int>>> &A_int, vector<vector<unsigned int>> &C4_int, vector<unsigned int> &sum_int) {
  
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
  json_t __;
  __["A_int"] = A_int;
  __["C4_int"] = C4_int;
  __["sum_int"] = sum_int;
  std::cout << __.dump(2) << std::endl;
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