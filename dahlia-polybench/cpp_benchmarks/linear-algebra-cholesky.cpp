// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include "parser.cpp"
#include "math.h"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &A_int) {
  
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
        unsigned int A_j_k = A_int[j][k];
        //---
        A_int[i][j] = (A_i_j - (A_i_k * A_j_k));
        k = (k + 1);
      }
      //---
      unsigned int A_j_j = A_int[j][j];
      //---
      unsigned int A_i_j = A_int[i][j];
      //---
      if ((A_j_j != 0)) {
        A_int[i][j] = (A_i_j / A_j_j);
      } else {
        A_int[i][j] = 0;
      }
      j = (j + 1);
    }
    //---
    unsigned int k = 0;
    while((k < i)) {
      #pragma HLS loop_tripcount min=0 max=7 avg=4
      unsigned int A_i_k = A_int[i][k];
      //---
      unsigned int A_i_i = A_int[i][i];
      //---
      A_int[i][i] = (A_i_i - (A_i_k * A_i_k));
      k = (k + 1);
    }
    //---
    unsigned int A_i_i = A_int[i][i];
    //---
    unsigned int sq = sqrt(A_i_i);
    A_int[i][i] = sq;
  }
  json_t __;
  __["A_int"] = A_int;
  std::cout << __.dump(2) << std::endl;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  kernel(A_int);
  return 0;
}