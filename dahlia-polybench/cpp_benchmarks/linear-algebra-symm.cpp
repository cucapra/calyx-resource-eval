// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> alpha_int[1], ap_uint<32> beta_int[1], ap_uint<32> C_int[8][12], ap_uint<32> A_int[8][8], ap_uint<32> B_int[8][12]) {
    #pragma HLS INTERFACE ap_memory port=alpha_int
    #pragma HLS INTERFACE ap_memory port=beta_int
    #pragma HLS INTERFACE ap_memory port=C_int
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=B_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> temp2 = 0;
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j = 0; j < 12; j++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        temp2 = 0;
        ap_uint<4> k = 0;
        while((k < i)) {
          #pragma HLS LOOP_FLATTEN off
          #pragma HLS loop_tripcount min=0 max=7 avg=4
          ap_uint<32> C_k_j = C_int[k][j];
          //---
          C_int[k][j] = (((alpha_int[0] * B_int[i][j]) * A_int[i][k]) + C_k_j);
          //---
          temp2 = (temp2 + (B_int[k][j] * A_int[i][k]));
          k = (k + 1);
        }
        //---
        ap_uint<32> C_i_j = C_int[i][j];
        //---
        C_int[i][j] = (((beta_int[0] * C_i_j) + ((alpha_int[0] * B_int[i][j]) * A_int[i][i])) + (alpha_int[0] * temp2));
      }
    }
  }
}

