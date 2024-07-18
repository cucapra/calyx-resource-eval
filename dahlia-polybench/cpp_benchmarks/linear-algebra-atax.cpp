// git.status = dirty, build.date = Thu Jul 18 09:15:33 EDT 2024, git.hash =
// 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &A_int, vector<unsigned int> &x_int,
            vector<unsigned int> &y_int, vector<unsigned int> &tmp_int) {

  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
    vector<vector<unsigned int>> A(8, vector<unsigned int>(8, 0));
    vector<unsigned int> x(8, 0);
    vector<unsigned int> y(8, 0);
    for (int i0 = 0; i0 < 8; i0++) {
      y[i0] = 0;
      x[i0] = x_int[i0];
      for (int j0 = 0; j0 < 8; j0++) {
        A[i0][j0] = A_int[i0][j0];
      }
    }
    //---
    for (int i = 0; i < 8; i++) {
      tmp_int[i] = 0;
      //---
      for (int j = 0; j < 8; j++) {
        unsigned int t = (A[i][j] * x[j]);
        // combiner:
        tmp_int[i] += t;
      }
      //---
      for (int j = 0; j < 8; j++) {
        unsigned int y0 = y[j];
        //---
        y[j] = (y0 + (A[i][j] * tmp_int[i]));
      }
    }
    //---
    for (int i1 = 0; i1 < 8; i1++) {
      y_int[i1] = y[i1];
      x_int[i1] = x[i1];
      for (int j1 = 0; j1 < 8; j1++) {
        A_int[i1][j1] = A[i1][j1];
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
  __["A_int"] = A_int;
  __["x_int"] = x_int;
  __["y_int"] = y_int;
  __["tmp_int"] = tmp_int;
}
int main(int argc, char **argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);
  ;
  auto A_int =
      get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto x_int = get_arg<n_dim_vec_t<unsigned int, 1>>("x_int", "ubit<32>[]", v);
  auto y_int = get_arg<n_dim_vec_t<unsigned int, 1>>("y_int", "ubit<32>[]", v);
  auto tmp_int =
      get_arg<n_dim_vec_t<unsigned int, 1>>("tmp_int", "ubit<32>[]", v);
  kernel(A_int, x_int, y_int, tmp_int);
  return 0;
}