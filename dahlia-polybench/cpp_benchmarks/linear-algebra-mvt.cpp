// git.status = dirty, build.date = Mon Jul 22 10:54:10 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &x1_int, vector<unsigned int> &x2_int, vector<unsigned int> &y1_int, vector<unsigned int> &y2_int, vector<vector<unsigned int>> &A_int) {
  
  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
  vector<unsigned int> x1(8, 0);
  vector<unsigned int> x2(8, 0);
  vector<unsigned int> y1(8, 0);
  vector<unsigned int> y2(8, 0);
  vector<vector<unsigned int>> A(8, vector<unsigned int>(8, 0));
  for(int i = 0; i < 8; i++) {
    y1[i] = y1_int[i];
    y2[i] = y2_int[i];
    x1[i] = x1_int[i];
    x2[i] = x2_int[i];
  }
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      A[i][j] = A_int[i][j];
    }
  }
  //---
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      unsigned int tmp = (A[i][j] * y1[j]);
      // combiner:
      x1[i] += tmp;
    }
  }
  //---
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      unsigned int tmp2 = (A[j][i] * y2[j]);
      // combiner:
      x2[i] += tmp2;
    }
  }
  //---
  for(int i = 0; i < 8; i++) {
    x1_int[i] = x1[i];
    x2_int[i] = x2[i];
  }
  auto end = std::chrono::high_resolution_clock::now();
    times[i] = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
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
  __["x1_int"] = x1_int;
  __["x2_int"] = x2_int;
  __["y1_int"] = y1_int;
  __["y2_int"] = y2_int;
  __["A_int"] = A_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto x1_int = get_arg<n_dim_vec_t<unsigned int, 1>>("x1_int", "ubit<32>[]", v);
  auto x2_int = get_arg<n_dim_vec_t<unsigned int, 1>>("x2_int", "ubit<32>[]", v);
  auto y1_int = get_arg<n_dim_vec_t<unsigned int, 1>>("y1_int", "ubit<32>[]", v);
  auto y2_int = get_arg<n_dim_vec_t<unsigned int, 1>>("y2_int", "ubit<32>[]", v);
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  kernel(x1_int, x2_int, y1_int, y2_int, A_int);
  return 0;
}