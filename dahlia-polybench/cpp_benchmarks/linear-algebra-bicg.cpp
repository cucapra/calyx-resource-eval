// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &A_int, vector<unsigned int> &s_int, vector<unsigned int> &q_int, vector<unsigned int> &p_int, vector<unsigned int> &r_int) {
  
  for(int i = 0; i < 8; i++) {
    s_int[i] = 0;
  }
  //---
  for(int i = 0; i < 8; i++) {
    q_int[i] = 0;
    //---
    for(int j = 0; j < 8; j++) {
      unsigned int s0 = s_int[j];
      unsigned int q0 = q_int[i];
      unsigned int A_i_j = A_int[i][j];
      //---
      s_int[j] = (s0 + (r_int[i] * A_i_j));
      q_int[i] = (q0 + (A_i_j * p_int[j]));
    }
  }
  json_t __;
  __["A_int"] = A_int;
  __["s_int"] = s_int;
  __["q_int"] = q_int;
  __["p_int"] = p_int;
  __["r_int"] = r_int;
  std::cout << __.dump(2) << std::endl;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto s_int = get_arg<n_dim_vec_t<unsigned int, 1>>("s_int", "ubit<32>[]", v);
  auto q_int = get_arg<n_dim_vec_t<unsigned int, 1>>("q_int", "ubit<32>[]", v);
  auto p_int = get_arg<n_dim_vec_t<unsigned int, 1>>("p_int", "ubit<32>[]", v);
  auto r_int = get_arg<n_dim_vec_t<unsigned int, 1>>("r_int", "ubit<32>[]", v);
  kernel(A_int, s_int, q_int, p_int, r_int);
  return 0;
}