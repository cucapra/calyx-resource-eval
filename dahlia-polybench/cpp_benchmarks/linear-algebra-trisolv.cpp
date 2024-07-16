// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> L_int[8][8], ap_uint<32> x_int[8], ap_uint<32> b_int[8]) {
    #pragma HLS INTERFACE ap_memory port=L_int
    #pragma HLS INTERFACE ap_memory port=x_int
    #pragma HLS INTERFACE ap_memory port=b_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      x_int[i] = b_int[i];
      //---
      ap_uint<4> j = 0;
      while((j < i)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=0 max=7 avg=4
        ap_uint<32> x_j = x_int[j];
        //---
        x_int[i] = (L_int[i][j] * x_j);
        j = (j + 1);
      }
      //---
      ap_uint<32> x_i = x_int[i];
      //---
      x_int[i] = (x_i / L_int[i][i]);
    }
  }
}

