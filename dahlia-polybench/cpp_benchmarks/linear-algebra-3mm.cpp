// git.status = dirty, build.date = Mon Jul 22 10:54:10 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &E_int, vector<vector<unsigned int>> &A_int, vector<vector<unsigned int>> &B_int, vector<vector<unsigned int>> &F_int, vector<vector<unsigned int>> &C_int, vector<vector<unsigned int>> &D_int, vector<vector<unsigned int>> &G_int) {
  
  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      E_int[i][j] = (unsigned int)0;
      //---
      for(int k = 0; k < 8; k++) {
        unsigned int v = (A_int[i][k] * B_int[k][j]);
        // combiner:
        E_int[i][j] += v;
      }
    }
  }
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      F_int[i][j] = (unsigned int)0;
      //---
      for(int k = 0; k < 8; k++) {
        unsigned int v = (C_int[i][k] * D_int[k][j]);
        // combiner:
        F_int[i][j] += v;
      }
    }
  }
  //---
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      G_int[i][j] = (unsigned int)0;
      //---
      for(int k = 0; k < 8; k++) {
        unsigned int v = (E_int[i][k] * F_int[k][j]);
        // combiner:
        G_int[i][j] += v;
      }
    }
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
  __["E_int"] = E_int;
  __["A_int"] = A_int;
  __["B_int"] = B_int;
  __["F_int"] = F_int;
  __["C_int"] = C_int;
  __["D_int"] = D_int;
  __["G_int"] = G_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto E_int = get_arg<n_dim_vec_t<unsigned int, 2>>("E_int", "ubit<32>[][]", v);
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto B_int = get_arg<n_dim_vec_t<unsigned int, 2>>("B_int", "ubit<32>[][]", v);
  auto F_int = get_arg<n_dim_vec_t<unsigned int, 2>>("F_int", "ubit<32>[][]", v);
  auto C_int = get_arg<n_dim_vec_t<unsigned int, 2>>("C_int", "ubit<32>[][]", v);
  auto D_int = get_arg<n_dim_vec_t<unsigned int, 2>>("D_int", "ubit<32>[][]", v);
  auto G_int = get_arg<n_dim_vec_t<unsigned int, 2>>("G_int", "ubit<32>[][]", v);
  kernel(E_int, A_int, B_int, F_int, C_int, D_int, G_int);
  return 0;
}