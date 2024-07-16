// git.status = clean, build.date = Tue Jul 09 21:49:52 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> A_int[8][8], ap_uint<32> b_int[8], ap_uint<32> x_int[8], ap_uint<32> y_int[8]) {
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=b_int
    #pragma HLS INTERFACE ap_memory port=x_int
    #pragma HLS INTERFACE ap_memory port=y_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      ap_uint<4> j = 0;
      while((j < i)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=0 max=7 avg=4
        ap_uint<32> w = A_int[i][j];
        //---
        ap_uint<4> k = 0;
        while((k < j)) {
          #pragma HLS LOOP_FLATTEN off
          #pragma HLS loop_tripcount min=0 max=6 avg=2
          ap_uint<32> A_i_k = A_int[i][k];
          //---
          w = (w - (A_i_k * A_int[k][j]));
          k = (k + 1);
        }
        //---
        ap_uint<32> A_j_j = A_int[j][j];
        //---
        if ((A_j_j != 0)) {
          A_int[i][j] = (w / A_j_j);
        }
        j = (j + 1);
      }
      //---
      j = i;
      while((j < 8)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=1 max=8 avg=4
        ap_uint<32> w = A_int[i][j];
        //---
        ap_uint<4> k = 0;
        while((k < i)) {
          #pragma HLS LOOP_FLATTEN off
          #pragma HLS loop_tripcount min=0 max=7 avg=2
          ap_uint<32> A_i_k = A_int[i][k];
          //---
          w = (w - (A_i_k * A_int[k][j]));
          k = (k + 1);
        }
        //---
        A_int[i][j] = w;
        j = (j + 1);
      }
    }
    //---
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      ap_uint<32> w = b_int[i];
      ap_uint<4> j = 0;
      while((j < i)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=0 max=7 avg=4
        w = (w - (A_int[i][j] * y_int[j]));
        j = (j + 1);
      }
      //---
      y_int[i] = w;
    }
    //---
    ap_uint<4> i = (8 - 1);
    while(((i >= 0) && (i < 8))) {
      #pragma HLS LOOP_FLATTEN off
      #pragma HLS loop_tripcount min=8 max=8 avg=8
      ap_uint<32> w = y_int[i];
      ap_uint<4> j = (i + 1);
      while((j < 8)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=0 max=7 avg=4
        w = (w - (A_int[i][j] * x_int[j]));
        j = (j + 1);
      }
      //---
      if ((A_int[i][i] != 0)) {
        x_int[i] = (w / A_int[i][i]);
      }
      i = (i - 1);
    }
  }
}

