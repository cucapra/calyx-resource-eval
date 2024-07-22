// git.status = dirty, build.date = Mon Jul 22 10:54:10 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &A_int) {
  
  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
  for(int i = 0; i < 8; i++) {
    unsigned int j = 0;
    while((j < i)) {
      #pragma HLS loop_tripcount min=0 max=7 avg=4
      unsigned int k = 0;
      while((k < j)) {
        #pragma HLS loop_tripcount min=0 max=6 avg=2
        unsigned int A_i_j = A_int[i][j];
        //---
        unsigned int A_i_k = A_int[i][k];
        //---
        unsigned int A_k_j = A_int[k][j];
        //---
        A_int[i][j] = (A_i_j - (A_i_k * A_k_j));
        k = (k + 1);
      }
      //---
      unsigned int A_i_j = A_int[i][j];
      //---
      unsigned int A_j_j = A_int[j][j];
      //---
      A_int[i][j] = (A_i_j / A_j_j);
      j = (j + 1);
    }
    //---
    j = i;
    while((j < 8)) {
      #pragma HLS loop_tripcount min=1 max=8 avg=4
      unsigned int k = 0;
      while((k < i)) {
        #pragma HLS loop_tripcount min=0 max=7 avg=2
        unsigned int A_i_j = A_int[i][j];
        //---
        unsigned int A_i_k = A_int[i][k];
        //---
        unsigned int A_k_j = A_int[k][j];
        //---
        A_int[i][j] = (A_i_j - (A_i_k * A_k_j));
        k = (k + 1);
      }
      j = (j + 1);
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
  __["A_int"] = A_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  kernel(A_int);
  return 0;
}