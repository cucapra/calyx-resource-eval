// git.status = clean, build.date = Fri Mar 29 09:17:54 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
#include "fxp_sqrt.h"
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
          ap_uint<32> A_j_k = A_int[j][k];
          //---
          A_int[i][j] = (A_i_j - (A_i_k * A_j_k));
          k = (k + 1);
        }
        //---
        ap_uint<32> A_j_j = A_int[j][j];
        //---
        ap_uint<32> A_i_j = A_int[i][j];
        //---
        if ((A_j_j != 0)) {
          A_int[i][j] = (A_i_j / A_j_j);
        } else {
          A_int[i][j] = 0;
        }
        j = (j + 1);
      }
      //---
      ap_uint<4> k = 0;
      while((k < i)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=0 max=7 avg=4
        ap_uint<32> A_i_k = A_int[i][k];
        //---
        ap_uint<32> A_i_i = A_int[i][i];
        //---
        A_int[i][i] = (A_i_i - (A_i_k * A_i_k));
        k = (k + 1);
      }
      //---
      ap_uint<32> A_i_i = A_int[i][i];
      //---
      ap_uint<32> sq = sqrt(A_i_i);
      A_int[i][i] = sq;
    }
  }
}

