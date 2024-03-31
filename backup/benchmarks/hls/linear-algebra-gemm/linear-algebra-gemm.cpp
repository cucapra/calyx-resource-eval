// git.status = clean, build.date = Fri Mar 29 09:17:54 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> alpha_int[1], ap_uint<32> beta_int[1], ap_uint<32> C_int[8][8], ap_uint<32> A_int[8][8], ap_uint<32> B_int[8][8]) {
    #pragma HLS INTERFACE ap_memory port=alpha_int
    #pragma HLS INTERFACE ap_memory port=beta_int
    #pragma HLS INTERFACE ap_memory port=C_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=B_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> C[8][8];
    #pragma HLS resource variable=C core=RAM_1P_BRAM
    ap_uint<32> A[8][8];
    #pragma HLS resource variable=A core=RAM_1P_BRAM
    ap_uint<32> B[8][8];
    #pragma HLS resource variable=B core=RAM_1P_BRAM
    ap_uint<32> alpha_ = alpha_int[0];
    ap_uint<32> beta_ = beta_int[0];
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A[i][j] = A_int[i][j];
        B[i][j] = B_int[i][j];
        C[i][j] = C_int[i][j];
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> C_i_j = C[i][j];
        //---
        C[i][j] = (C_i_j * beta_);
      }
      //---
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        for(int k = 0; k < 8; k++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> v = ((alpha_ * A[i][k]) * B[k][j]);
          // combiner:
          C[i][j] += v;
        }
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        C_int[i][j] = C[i][j];
      }
    }
  }
}

