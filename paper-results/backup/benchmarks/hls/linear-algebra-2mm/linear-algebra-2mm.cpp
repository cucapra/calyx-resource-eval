// git.status = clean, build.date = Fri Mar 29 09:17:54 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> alpha_int[1], ap_uint<32> beta_int[1], ap_uint<32> tmp_int[8][8], ap_uint<32> A_int[8][8], ap_uint<32> B_int[8][8], ap_uint<32> C_int[8][8], ap_uint<32> D_int[8][8]) {
    #pragma HLS INTERFACE ap_memory port=alpha_int
    #pragma HLS INTERFACE ap_memory port=beta_int
    #pragma HLS INTERFACE ap_memory port=tmp_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=B_int
    #pragma HLS INTERFACE ap_memory port=C_int
    #pragma HLS INTERFACE ap_memory port=D_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> tmp[8][8];
    #pragma HLS resource variable=tmp core=RAM_1P_BRAM
    ap_uint<32> A[8][8];
    #pragma HLS resource variable=A core=RAM_1P_BRAM
    ap_uint<32> B[8][8];
    #pragma HLS resource variable=B core=RAM_1P_BRAM
    ap_uint<32> C[8][8];
    #pragma HLS resource variable=C core=RAM_1P_BRAM
    ap_uint<32> D[8][8];
    #pragma HLS resource variable=D core=RAM_1P_BRAM
    for(int i0 = 0; i0 < 8; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j0 = 0; j0 < 8; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A[i0][j0] = A_int[i0][j0];
        B[i0][j0] = B_int[i0][j0];
        C[i0][j0] = C_int[i0][j0];
        D[i0][j0] = D_int[i0][j0];
        tmp[i0][j0] = tmp_int[i0][j0];
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        tmp[i][j] = 0;
        //---
        for(int k = 0; k < 8; k++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> v = ((alpha_int[0] * A[i][k]) * B[k][j]);
          // combiner:
          tmp[i][j] += v;
        }
      }
    }
    //---
    for(int i1 = 0; i1 < 8; i1++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j1 = 0; j1 < 8; j1++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> d_tmp = D[i1][j1];
        //---
        D[i1][j1] = (beta_int[0] * d_tmp);
        //---
        for(int k1 = 0; k1 < 8; k1++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> v1 = (tmp[i1][k1] * C[k1][j1]);
          // combiner:
          D[i1][j1] += v1;
        }
      }
    }
    //---
    for(int i0 = 0; i0 < 8; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j0 = 0; j0 < 8; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A_int[i0][j0] = A[i0][j0];
        B_int[i0][j0] = B[i0][j0];
        C_int[i0][j0] = C[i0][j0];
        D_int[i0][j0] = D[i0][j0];
        tmp_int[i0][j0] = tmp[i0][j0];
      }
    }
  }
}

