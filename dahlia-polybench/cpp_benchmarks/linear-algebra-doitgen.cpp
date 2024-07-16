// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> A_int[8][8][8], ap_uint<32> C4_int[8][8], ap_uint<32> sum_int[8]) {
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=C4_int
    #pragma HLS INTERFACE ap_memory port=sum_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int r = 0; r < 8; r++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int q = 0; q < 8; q++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        for(int p = 0; p < 8; p++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          sum_int[p] = 0;
          //---
          for(int s = 0; s < 8; s++) {
            #pragma HLS UNROLL factor=1 skip_exit_check
            #pragma HLS LOOP_FLATTEN off
            ap_uint<32> v = (A_int[r][q][s] * C4_int[s][p]);
            // combiner:
            sum_int[p] += v;
          }
        }
        //---
        for(int p = 0; p < 8; p++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          A_int[r][q][p] = sum_int[p];
        }
      }
    }
  }
}

