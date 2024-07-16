// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> alpha_int[1], ap_uint<32> beta_int[1], ap_uint<32> A_int[8][8], ap_uint<32> u1_int[8], ap_uint<32> v1_int[8], ap_uint<32> u2_int[8], ap_uint<32> v2_int[8], ap_uint<32> w_int[8], ap_uint<32> x_int[8], ap_uint<32> y_int[8], ap_uint<32> z_int[8]) {
    #pragma HLS INTERFACE ap_memory port=alpha_int
    #pragma HLS INTERFACE ap_memory port=beta_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=u1_int
    #pragma HLS INTERFACE ap_memory port=v1_int
    #pragma HLS INTERFACE ap_memory port=u2_int
    #pragma HLS INTERFACE ap_memory port=v2_int
    #pragma HLS INTERFACE ap_memory port=w_int
    #pragma HLS INTERFACE ap_memory port=x_int
    #pragma HLS INTERFACE ap_memory port=y_int
    #pragma HLS INTERFACE ap_memory port=z_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> A[8][8];
    #pragma HLS resource variable=A core=RAM_1P_BRAM
    ap_uint<32> u1[8];
    #pragma HLS resource variable=u1 core=RAM_1P_BRAM
    ap_uint<32> v1[8];
    #pragma HLS resource variable=v1 core=RAM_1P_BRAM
    ap_uint<32> u2[8];
    #pragma HLS resource variable=u2 core=RAM_1P_BRAM
    ap_uint<32> v2[8];
    #pragma HLS resource variable=v2 core=RAM_1P_BRAM
    ap_uint<32> w[8];
    #pragma HLS resource variable=w core=RAM_1P_BRAM
    ap_uint<32> x[8];
    #pragma HLS resource variable=x core=RAM_1P_BRAM
    ap_uint<32> y[8];
    #pragma HLS resource variable=y core=RAM_1P_BRAM
    ap_uint<32> z[8];
    #pragma HLS resource variable=z core=RAM_1P_BRAM
    ap_uint<32> alpha_ = alpha_int[0];
    ap_uint<32> beta_ = beta_int[0];
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      u1[i] = u1_int[i];
      v1[i] = v1_int[i];
      u2[i] = u2_int[i];
      v2[i] = v2_int[i];
      w[i] = w_int[i];
      x[i] = x_int[i];
      y[i] = y_int[i];
      z[i] = z_int[i];
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
        ap_uint<32> tmp1 = ((u1[i] * v1[j]) + (u2[i] * v2[j]));
        ap_uint<32> old = A[i][j];
        //---
        A[i][j] = (old + tmp1);
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> tmp2 = ((beta_ * A[j][i]) * y[j]);
        // combiner:
        x[i] += tmp2;
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      ap_uint<32> tmp3 = z[i];
      ap_uint<32> old = x[i];
      //---
      x[i] = (old + tmp3);
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> tmp4 = ((alpha_ * A[i][j]) * x[j]);
        // combiner:
        w[i] += tmp4;
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      u1_int[i] = u1[i];
      v1_int[i] = v1[i];
      u2_int[i] = u2[i];
      v2_int[i] = v2[i];
      w_int[i] = w[i];
      x_int[i] = x[i];
      y_int[i] = y[i];
      z_int[i] = z[i];
    }
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 8; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A_int[i][j] = A[i][j];
      }
    }
  }
}

