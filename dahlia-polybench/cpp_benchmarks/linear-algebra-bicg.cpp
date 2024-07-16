// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> A_int[8][8], ap_uint<32> s_int[8], ap_uint<32> q_int[8], ap_uint<32> p_int[8], ap_uint<32> r_int[8]) {
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=s_int
    #pragma HLS INTERFACE ap_memory port=q_int
    #pragma HLS INTERFACE ap_memory port=p_int
    #pragma HLS INTERFACE ap_memory port=r_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      s_int[i] = 0;
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      q_int[i] = 0;
      //---
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> s0 = s_int[j];
        ap_uint<32> q0 = q_int[i];
        ap_uint<32> A_i_j = A_int[i][j];
        //---
        s_int[j] = (s0 + (r_int[i] * A_i_j));
        q_int[i] = (q0 + (A_i_j * p_int[j]));
      }
    }
  }
}

