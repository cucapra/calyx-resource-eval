// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &alpha_int, vector<unsigned int> &beta_int, vector<unsigned int> &tmp_int, vector<vector<unsigned int>> &A_int, vector<vector<unsigned int>> &B_int, vector<unsigned int> &x_int, vector<unsigned int> &y_int) {
  
  vector<unsigned int> tmp(8, 0);
  vector<vector<unsigned int>> A(8, vector<unsigned int>(8, 0));
  vector<vector<unsigned int>> B(8, vector<unsigned int>(8, 0));
  vector<unsigned int> x(8, 0);
  vector<unsigned int> y(8, 0);
  unsigned int alpha_ = alpha_int[0];
  unsigned int beta_ = beta_int[0];
  for(int i0 = 0; i0 < 8; i0++) {
    tmp[i0] = tmp_int[i0];
    x[i0] = x_int[i0];
    y[i0] = y_int[i0];
    for(int j0 = 0; j0 < 8; j0++) {
      A[i0][j0] = A_int[i0][j0];
      B[i0][j0] = B_int[i0][j0];
    }
  }
  //---
  for(int i = 0; i < 8; i++) {
    tmp[i] = 0;
    y[i] = 0;
    //---
    for(int j = 0; j < 8; j++) {
      unsigned int t1 = (A[i][j] * x[j]);
      unsigned int t2 = (B[i][j] * x[j]);
      // combiner:
      tmp[i] += t1;
      y[i] += t2;
    }
    //---
    unsigned int y_i = y[i];
    //---
    y[i] = ((alpha_ * tmp[i]) + (beta_ * y_i));
  }
  //---
  for(int i0 = 0; i0 < 8; i0++) {
    tmp_int[i0] = tmp[i0];
    x_int[i0] = x[i0];
    y_int[i0] = y[i0];
    for(int j0 = 0; j0 < 8; j0++) {
      A_int[i0][j0] = A[i0][j0];
      B_int[i0][j0] = B[i0][j0];
    }
  }
  json_t __;
  __["alpha_int"] = alpha_int;
  __["beta_int"] = beta_int;
  __["tmp_int"] = tmp_int;
  __["A_int"] = A_int;
  __["B_int"] = B_int;
  __["x_int"] = x_int;
  __["y_int"] = y_int;
  std::cout << __.dump(2) << std::endl;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto alpha_int = get_arg<n_dim_vec_t<unsigned int, 1>>("alpha_int", "ubit<32>[]", v);
  auto beta_int = get_arg<n_dim_vec_t<unsigned int, 1>>("beta_int", "ubit<32>[]", v);
  auto tmp_int = get_arg<n_dim_vec_t<unsigned int, 1>>("tmp_int", "ubit<32>[]", v);
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto B_int = get_arg<n_dim_vec_t<unsigned int, 2>>("B_int", "ubit<32>[][]", v);
  auto x_int = get_arg<n_dim_vec_t<unsigned int, 1>>("x_int", "ubit<32>[]", v);
  auto y_int = get_arg<n_dim_vec_t<unsigned int, 1>>("y_int", "ubit<32>[]", v);
  kernel(alpha_int, beta_int, tmp_int, A_int, B_int, x_int, y_int);
  return 0;
}