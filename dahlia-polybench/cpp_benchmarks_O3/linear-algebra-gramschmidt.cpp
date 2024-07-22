// git.status = dirty, build.date = Mon Jul 22 10:54:10 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
#include "math.h"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<vector<unsigned int>> &A_int, vector<vector<unsigned int>> &R_int, vector<vector<unsigned int>> &Q_int) {
  
  const int numRuns = 10;
  std::vector<long> times(numRuns);

  for (auto i = 0; i < numRuns; i++) {
    auto start = std::chrono::high_resolution_clock::now();
  vector<vector<unsigned int>> A(8, vector<unsigned int>(12, 0));
  vector<vector<unsigned int>> R(12, vector<unsigned int>(12, 0));
  vector<vector<unsigned int>> Q(8, vector<unsigned int>(12, 0));
  for(int init0 = 0; init0 < 12; init0++) {
    for(int init1 = 0; init1 < 12; init1++) {
      R[init0][init1] = R_int[init0][init1];
    }
  }
  for(int i0 = 0; i0 < 8; i0++) {
    for(int j0 = 0; j0 < 12; j0++) {
      A[i0][j0] = A_int[i0][j0];
      Q[i0][j0] = Q_int[i0][j0];
    }
  }
  //---
  for(int k = 0; k < 12; k++) {
    unsigned int nrm = 0;
    for(int i = 0; i < 8; i++) {
      unsigned int A_i_k = A[i][k];
      // combiner:
      nrm += (A_i_k * A_i_k);
    }
    unsigned int sq = sqrt(nrm);
    R[k][k] = sq;
    //---
    for(int i = 0; i < 8; i++) {
      Q[i][k] = (A[i][k] / R[k][k]);
    }
    //---
    unsigned int j = (k + (unsigned int)1);
    while((j < 12)) {
      #pragma HLS loop_tripcount min=0 max=11 avg=6
      R[k][j] = 0;
      //---
      for(int i = 0; i < 8; i++) {
        unsigned int v = (Q[i][k] * A[i][j]);
        // combiner:
        R[k][j] += v;
      }
      //---
      for(int i = 0; i < 8; i++) {
        unsigned int A_i_j = A[i][j];
        //---
        A[i][j] = (A_i_j - (Q[i][k] * R[k][j]));
      }
      j = (j + (unsigned int)1);
    }
  }
  //---
  for(int init0 = 0; init0 < 12; init0++) {
    for(int init1 = 0; init1 < 12; init1++) {
      R_int[init0][init1] = R[init0][init1];
    }
  }
  for(int i0 = 0; i0 < 8; i0++) {
    for(int j0 = 0; j0 < 12; j0++) {
      A_int[i0][j0] = A[i0][j0];
      Q_int[i0][j0] = Q[i0][j0];
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
  __["R_int"] = R_int;
  __["Q_int"] = Q_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto A_int = get_arg<n_dim_vec_t<unsigned int, 2>>("A_int", "ubit<32>[][]", v);
  auto R_int = get_arg<n_dim_vec_t<unsigned int, 2>>("R_int", "ubit<32>[][]", v);
  auto Q_int = get_arg<n_dim_vec_t<unsigned int, 2>>("Q_int", "ubit<32>[][]", v);
  kernel(A_int, R_int, Q_int);
  return 0;
}