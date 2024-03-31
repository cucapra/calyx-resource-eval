// git.status = clean, build.date = Fri Mar 29 09:17:54 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> E_int[8][8], ap_uint<32> A_int[8][8], ap_uint<32> B_int[8][8], ap_uint<32> F_int[8][8], ap_uint<32> C_int[8][8], ap_uint<32> D_int[8][8], ap_uint<32> G_int[8][8]) {
    #pragma HLS INTERFACE ap_memory port=E_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=B_int
    #pragma HLS INTERFACE ap_memory port=F_int
    #pragma HLS INTERFACE ap_memory port=C_int
    #pragma HLS INTERFACE ap_memory port=D_int
    #pragma HLS INTERFACE ap_memory port=G_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        E_int[i][j] = (ap_uint<32>)0;
        //---
        for(int k = 0; k < 8; k++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> v = (A_int[i][k] * B_int[k][j]);
          // combiner:
          E_int[i][j] += v;
        }
      }
    }
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        F_int[i][j] = (ap_uint<32>)0;
        //---
        for(int k = 0; k < 8; k++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> v = (C_int[i][k] * D_int[k][j]);
          // combiner:
          F_int[i][j] += v;
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
        G_int[i][j] = (ap_uint<32>)0;
        //---
        for(int k = 0; k < 8; k++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> v = (E_int[i][k] * F_int[k][j]);
          // combiner:
          G_int[i][j] += v;
        }
      }
    }
  }
}

