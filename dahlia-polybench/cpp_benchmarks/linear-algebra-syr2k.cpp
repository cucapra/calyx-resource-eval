// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> alpha_int[1], ap_uint<32> beta_int[1], ap_uint<32> C_int[12][12], ap_uint<32> A_int[12][8], ap_uint<32> B_int[12][8]) {
    #pragma HLS INTERFACE ap_memory port=alpha_int
    #pragma HLS INTERFACE ap_memory port=beta_int
    #pragma HLS INTERFACE ap_memory port=C_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=B_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> alpha_ = alpha_int[0];
    ap_uint<32> beta_ = beta_int[0];
    ap_uint<32> A[12][8];
    #pragma HLS resource variable=A core=RAM_1P_BRAM
    ap_uint<32> B[12][8];
    #pragma HLS resource variable=B core=RAM_1P_BRAM
    for(int i0 = 0; i0 < 12; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j0 = 0; j0 < 8; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A[i0][j0] = A_int[i0][j0];
        B[i0][j0] = B_int[i0][j0];
      }
    }
    //---
    for(int i = 0; i < 12; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      ap_uint<4> j = 0;
      while((j <= i)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=1 max=12 avg=6
        ap_uint<32> C_i_j = C_int[i][j];
        //---
        C_int[i][j] = (C_i_j * beta_);
        j = (j + 1);
      }
      //---
      ap_uint<4> j2 = 0;
      while((j2 <= i)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=1 max=12 avg=6
        for(int k = 0; k < 8; k++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> B_i_k = B[i][k];
          ap_uint<32> A_j2_k = A[j2][k];
          //---
          ap_uint<32> t = (((A_j2_k * alpha_) * B_i_k) + ((B[j2][k] * alpha_) * A[i][k]));
          // combiner:
          C_int[i][j2] += t;
        }
        j2 = (j2 + 1);
      }
    }
    //---
    for(int i0 = 0; i0 < 12; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j0 = 0; j0 < 8; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A_int[i0][j0] = A[i0][j0];
        B_int[i0][j0] = B[i0][j0];
      }
    }
  }
}

