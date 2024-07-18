// git.status = dirty, build.date = Thu Jul 18 09:15:33 EDT 2024, git.hash =
// 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &alpha_int, vector<unsigned int> &beta_int,
            vector<vector<unsigned int>> &tmp_int,
            vector<vector<unsigned int>> &A_int,
            vector<vector<unsigned int>> &B_int,
            vector<vector<unsigned int>> &C_int,
            vector<vector<unsigned int>> &D_int) {

  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
    vector<vector<unsigned int>> tmp(8, vector<unsigned int>(8, 0));
    vector<vector<unsigned int>> A(8, vector<unsigned int>(8, 0));
    vector<vector<unsigned int>> B(8, vector<unsigned int>(8, 0));
    vector<vector<unsigned int>> C(8, vector<unsigned int>(8, 0));
    vector<vector<unsigned int>> D(8, vector<unsigned int>(8, 0));
    for (int i0 = 0; i0 < 8; i0++) {
      for (int j0 = 0; j0 < 8; j0++) {
        A[i0][j0] = A_int[i0][j0];
        B[i0][j0] = B_int[i0][j0];
        C[i0][j0] = C_int[i0][j0];
        D[i0][j0] = D_int[i0][j0];
        tmp[i0][j0] = tmp_int[i0][j0];
      }
    }
    //---
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        tmp[i][j] = 0;
        //---
        for (int k = 0; k < 8; k++) {
          unsigned int v = ((alpha_int[0] * A[i][k]) * B[k][j]);
          // combiner:
          tmp[i][j] += v;
        }
      }
    }
    //---
    for (int i1 = 0; i1 < 8; i1++) {
      for (int j1 = 0; j1 < 8; j1++) {
        unsigned int d_tmp = D[i1][j1];
        //---
        D[i1][j1] = (beta_int[0] * d_tmp);
        //---
        for (int k1 = 0; k1 < 8; k1++) {
          unsigned int v1 = (tmp[i1][k1] * C[k1][j1]);
          // combiner:
          D[i1][j1] += v1;
        }
      }
    }
    //---
    for (int i0 = 0; i0 < 8; i0++) {
      for (int j0 = 0; j0 < 8; j0++) {
        A_int[i0][j0] = A[i0][j0];
        B_int[i0][j0] = B[i0][j0];
        C_int[i0][j0] = C[i0][j0];
        D_int[i0][j0] = D[i0][j0];
        tmp_int[i0][j0] = tmp[i0][j0];
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
  __["tmp_int"] = tmp_int;
  __["A_int"] = A_int;
  __["B_int"] = B_int;
  __["C_int"] = C_int;
  __["D_int"] = D_int;
}
int main(int argc, char **argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);
  ;
  auto alpha_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("alpha_int", "ubit<32>[]", v);
  auto beta_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("beta_int", "ubit<32>[]", v);
  auto tmp_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("tmp_int", "ubit<32>[][]", v);
  auto A_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto B_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("B_int", "ubit<32>[][]", v);
  auto C_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("C_int", "ubit<32>[][]", v);
  auto D_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("D_int", "ubit<32>[][]", v);
  kernel(alpha_int, beta_int, tmp_int, A_int, B_int, C_int, D_int);
  return 0;
}