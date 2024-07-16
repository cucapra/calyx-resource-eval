// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> alpha_int[1], ap_uint<32> A_int[8][8], ap_uint<32> B_int[8][12]) {
    #pragma HLS INTERFACE ap_memory port=alpha_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=B_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 12; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<4> k = (i + (ap_uint<4>)1);
        while((k < 8)) {
          #pragma HLS LOOP_FLATTEN off
          #pragma HLS loop_tripcount min=0 max=7 avg=4
          ap_uint<32> B_i_j = B_int[i][j];
          //---
          ap_uint<32> B_k_j = B_int[k][j];
          //---
          B_int[i][j] = ((A_int[k][i] * B_k_j) + B_i_j);
          k = (k + (ap_uint<4>)1);
        }
        //---
        ap_uint<32> B_i_j = B_int[i][j];
        //---
        B_int[i][j] = (alpha_int[0] * B_i_j);
      }
    }
  }
}

