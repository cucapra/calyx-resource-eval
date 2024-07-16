// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> A_int[8][8]) {
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      ap_uint<4> j = 0;
      while((j < i)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=0 max=7 avg=4
        ap_uint<4> k = 0;
        while((k < j)) {
          #pragma HLS LOOP_FLATTEN off
          #pragma HLS loop_tripcount min=0 max=6 avg=2
          ap_uint<32> A_i_j = A_int[i][j];
          //---
          ap_uint<32> A_i_k = A_int[i][k];
          //---
          ap_uint<32> A_k_j = A_int[k][j];
          //---
          A_int[i][j] = (A_i_j - (A_i_k * A_k_j));
          k = (k + 1);
        }
        //---
        ap_uint<32> A_i_j = A_int[i][j];
        //---
        ap_uint<32> A_j_j = A_int[j][j];
        //---
        A_int[i][j] = (A_i_j / A_j_j);
        j = (j + 1);
      }
      //---
      j = i;
      while((j < 8)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=1 max=8 avg=4
        ap_uint<4> k = 0;
        while((k < i)) {
          #pragma HLS LOOP_FLATTEN off
          #pragma HLS loop_tripcount min=0 max=7 avg=2
          ap_uint<32> A_i_j = A_int[i][j];
          //---
          ap_uint<32> A_i_k = A_int[i][k];
          //---
          ap_uint<32> A_k_j = A_int[k][j];
          //---
          A_int[i][j] = (A_i_j - (A_i_k * A_k_j));
          k = (k + 1);
        }
        j = (j + 1);
      }
    }
  }
}

