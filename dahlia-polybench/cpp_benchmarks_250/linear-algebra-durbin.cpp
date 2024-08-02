// git.status = dirty, build.date = Fri Aug 02 12:55:36 EDT 2024, git.hash = 9ec9a58
#include "chrono"
#include "parser.cpp"
/***************** Parse helpers  ******************/
/***************************************************/
void kernel(vector<unsigned int> &r_int, vector<unsigned int> &y_int, vector<unsigned int> &z_int) {
  
  
    auto start = std::chrono::high_resolution_clock::now();
  unsigned int alpha = (0 - r_int[0]);
  unsigned int beta = 1;
  y_int[0] = alpha;
  //---
  for(int k = 1; k < 8; k++) {
    beta = ((1 - (alpha * alpha)) * beta);
    unsigned int sum = 0;
    unsigned int i = 0;
    while((i < k)) {
      #pragma HLS loop_tripcount min=1 max=7 avg=4
      sum = (sum + (r_int[((k - i) - 1)] * y_int[i]));
      i = (i + 1);
    }
    //---
    if ((beta != 0)) {
      alpha = (0 - ((r_int[k] + sum) / beta));
    } else {
      alpha = 0;
    }
    i = 0;
    while((i < k)) {
      #pragma HLS loop_tripcount min=1 max=7 avg=4
      unsigned int y_i = y_int[i];
      //---
      z_int[i] = (y_i + (alpha * y_int[((k - i) - 1)]));
      i = (i + 1);
    }
    //---
    i = 0;
    while((i < k)) {
      #pragma HLS loop_tripcount min=1 max=7 avg=4
      y_int[i] = z_int[i];
      i = (i + 1);
    }
    //---
    y_int[k] = alpha;
  }
  auto end = std::chrono::high_resolution_clock::now();
auto duration = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count();
std::cout << duration << "\n";
  json_t __;
  __["r_int"] = r_int;
  __["y_int"] = y_int;
  __["z_int"] = z_int;
}
int main(int argc, char** argv) {
  using namespace flattening;
  auto v = parse_data(argc, argv);;
  auto r_int = get_arg<n_dim_vec_t<unsigned int, 1>>("r_int", "ubit<32>[]", v);
  auto y_int = get_arg<n_dim_vec_t<unsigned int, 1>>("y_int", "ubit<32>[]", v);
  auto z_int = get_arg<n_dim_vec_t<unsigned int, 1>>("z_int", "ubit<32>[]", v);
  kernel(r_int, y_int, z_int);
  return 0;
}