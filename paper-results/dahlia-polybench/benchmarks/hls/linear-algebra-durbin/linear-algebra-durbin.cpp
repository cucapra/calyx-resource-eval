// git.status = clean, build.date = Fri Mar 29 09:17:54 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> r_int[8], ap_uint<32> y_int[8], ap_uint<32> z_int[8]) {
    #pragma HLS INTERFACE ap_memory port=r_int
    #pragma HLS INTERFACE ap_memory port=y_int
    #pragma HLS INTERFACE ap_memory port=z_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> alpha = (0 - r_int[0]);
    ap_uint<32> beta = 1;
    y_int[0] = alpha;
    //---
    for(int k = 1; k < 8; k++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      beta = ((1 - (alpha * alpha)) * beta);
      ap_uint<32> sum = 0;
      ap_uint<4> i = 0;
      while((i < k)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=1 max=7 avg=4
        sum = (sum + (r_int[((k - i) - 1)] * y_int[i]));
        i = (i + 1);
      }
      //---
      if ((beta != 0)) {
        alpha = (0 - ((r_int[k] + sum) / beta));
      } else {
        alpha = 0;
      }
      i = 0;
      while((i < k)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=1 max=7 avg=4
        ap_uint<32> y_i = y_int[i];
        //---
        z_int[i] = (y_i + (alpha * y_int[((k - i) - 1)]));
        i = (i + 1);
      }
      //---
      i = 0;
      while((i < k)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=1 max=7 avg=4
        y_int[i] = z_int[i];
        i = (i + 1);
      }
      //---
      y_int[k] = alpha;
    }
  }
}

