// git.status = clean, build.date = Fri Mar 29 09:17:54 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> x1_int[8], ap_uint<32> x2_int[8], ap_uint<32> y1_int[8], ap_uint<32> y2_int[8], ap_uint<32> A_int[8][8]) {
    #pragma HLS INTERFACE ap_memory port=x1_int
    #pragma HLS INTERFACE ap_memory port=x2_int
    #pragma HLS INTERFACE ap_memory port=y1_int
    #pragma HLS INTERFACE ap_memory port=y2_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> x1[8];
    #pragma HLS resource variable=x1 core=RAM_1P_BRAM
    ap_uint<32> x2[8];
    #pragma HLS resource variable=x2 core=RAM_1P_BRAM
    ap_uint<32> y1[8];
    #pragma HLS resource variable=y1 core=RAM_1P_BRAM
    ap_uint<32> y2[8];
    #pragma HLS resource variable=y2 core=RAM_1P_BRAM
    ap_uint<32> A[8][8];
    #pragma HLS resource variable=A core=RAM_1P_BRAM
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      y1[i] = y1_int[i];
      y2[i] = y2_int[i];
      x1[i] = x1_int[i];
      x2[i] = x2_int[i];
    }
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A[i][j] = A_int[i][j];
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> tmp = (A[i][j] * y1[j]);
        // combiner:
        x1[i] += tmp;
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> tmp2 = (A[j][i] * y2[j]);
        // combiner:
        x2[i] += tmp2;
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      x1_int[i] = x1[i];
      x2_int[i] = x2[i];
    }
  }
}

