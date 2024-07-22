// git.status = dirty, build.date = Thu Jul 18 09:15:33 EDT 2024, git.hash =
// 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &alpha_int, vector<unsigned int> &beta_int,
            vector<vector<unsigned int>> &A_int, vector<unsigned int> &u1_int,
            vector<unsigned int> &v1_int, vector<unsigned int> &u2_int,
            vector<unsigned int> &v2_int, vector<unsigned int> &w_int,
            vector<unsigned int> &x_int, vector<unsigned int> &y_int,
            vector<unsigned int> &z_int) {

  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
    vector<vector<unsigned int>> A(8, vector<unsigned int>(8, 0));
    vector<unsigned int> u1(8, 0);
    vector<unsigned int> v1(8, 0);
    vector<unsigned int> u2(8, 0);
    vector<unsigned int> v2(8, 0);
    vector<unsigned int> w(8, 0);
    vector<unsigned int> x(8, 0);
    vector<unsigned int> y(8, 0);
    vector<unsigned int> z(8, 0);
    unsigned int alpha_ = alpha_int[0];
    unsigned int beta_ = beta_int[0];
    for (int i = 0; i < 8; i++) {
      u1[i] = u1_int[i];
      v1[i] = v1_int[i];
      u2[i] = u2_int[i];
      v2[i] = v2_int[i];
      w[i] = w_int[i];
      x[i] = x_int[i];
      y[i] = y_int[i];
      z[i] = z_int[i];
    }
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        A[i][j] = A_int[i][j];
      }
    }
    //---
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        unsigned int tmp1 = ((u1[i] * v1[j]) + (u2[i] * v2[j]));
        unsigned int old = A[i][j];
        //---
        A[i][j] = (old + tmp1);
      }
    }
    //---
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        unsigned int tmp2 = ((beta_ * A[j][i]) * y[j]);
        // combiner:
        x[i] += tmp2;
      }
    }
    //---
    for (int i = 0; i < 8; i++) {
      unsigned int tmp3 = z[i];
      unsigned int old = x[i];
      //---
      x[i] = (old + tmp3);
    }
    //---
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        unsigned int tmp4 = ((alpha_ * A[i][j]) * x[j]);
        // combiner:
        w[i] += tmp4;
      }
    }
    //---
    for (int i = 0; i < 8; i++) {
      u1_int[i] = u1[i];
      v1_int[i] = v1[i];
      u2_int[i] = u2[i];
      v2_int[i] = v2[i];
      w_int[i] = w[i];
      x_int[i] = x[i];
      y_int[i] = y[i];
      z_int[i] = z[i];
    }
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        A_int[i][j] = A[i][j];
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
  __["beta_int"] = beta_int;
  __["A_int"] = A_int;
  __["u1_int"] = u1_int;
  __["v1_int"] = v1_int;
  __["u2_int"] = u2_int;
  __["v2_int"] = v2_int;
  __["w_int"] = w_int;
  __["x_int"] = x_int;
  __["y_int"] = y_int;
  __["z_int"] = z_int;
}
int main(int argc, char **argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);
  ;
  auto alpha_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("alpha_int", "ubit<32>[]", v);
  auto beta_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("beta_int", "ubit<32>[]", v);
  auto A_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto u1_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("u1_int", "ubit<32>[]", v);
  auto v1_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("v1_int", "ubit<32>[]", v);
  auto u2_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("u2_int", "ubit<32>[]", v);
  auto v2_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("v2_int", "ubit<32>[]", v);
  auto w_int = get_arg<n_dim_vec_t<unsigned int, 1>>("w_int", "ubit<32>[]", v);
  auto x_int = get_arg<n_dim_vec_t<unsigned int, 1>>("x_int", "ubit<32>[]", v);
  auto y_int = get_arg<n_dim_vec_t<unsigned int, 1>>("y_int", "ubit<32>[]", v);
  auto z_int = get_arg<n_dim_vec_t<unsigned int, 1>>("z_int", "ubit<32>[]", v);
  kernel(alpha_int, beta_int, A_int, u1_int, v1_int, u2_int, v2_int, w_int,
         x_int, y_int, z_int);
  return 0;
}