// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> alpha_int[1], ap_uint<32> beta_int[1], ap_uint<32> tmp_int[8], ap_uint<32> A_int[8][8], ap_uint<32> B_int[8][8], ap_uint<32> x_int[8], ap_uint<32> y_int[8]) {
    #pragma HLS INTERFACE ap_memory port=alpha_int
    #pragma HLS INTERFACE ap_memory port=beta_int
    #pragma HLS INTERFACE ap_memory port=tmp_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=B_int
    #pragma HLS INTERFACE ap_memory port=x_int
    #pragma HLS INTERFACE ap_memory port=y_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> tmp[8];
    #pragma HLS resource variable=tmp core=RAM_1P_BRAM
    ap_uint<32> A[8][8];
    #pragma HLS resource variable=A core=RAM_1P_BRAM
    ap_uint<32> B[8][8];
    #pragma HLS resource variable=B core=RAM_1P_BRAM
    ap_uint<32> x[8];
    #pragma HLS resource variable=x core=RAM_1P_BRAM
    ap_uint<32> y[8];
    #pragma HLS resource variable=y core=RAM_1P_BRAM
    ap_uint<32> alpha_ = alpha_int[0];
    ap_uint<32> beta_ = beta_int[0];
    for(int i0 = 0; i0 < 8; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      tmp[i0] = tmp_int[i0];
      x[i0] = x_int[i0];
      y[i0] = y_int[i0];
      for(int j0 = 0; j0 < 8; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A[i0][j0] = A_int[i0][j0];
        B[i0][j0] = B_int[i0][j0];
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      tmp[i] = 0;
      y[i] = 0;
      //---
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> t1 = (A[i][j] * x[j]);
        ap_uint<32> t2 = (B[i][j] * x[j]);
        // combiner:
        tmp[i] += t1;
        y[i] += t2;
      }
      //---
      ap_uint<32> y_i = y[i];
      //---
      y[i] = ((alpha_ * tmp[i]) + (beta_ * y_i));
    }
    //---
    for(int i0 = 0; i0 < 8; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      tmp_int[i0] = tmp[i0];
      x_int[i0] = x[i0];
      y_int[i0] = y[i0];
      for(int j0 = 0; j0 < 8; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A_int[i0][j0] = A[i0][j0];
        B_int[i0][j0] = B[i0][j0];
      }
    }
  }
}

