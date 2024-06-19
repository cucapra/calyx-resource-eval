#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> A_int[25][20][30], ap_uint<32> C4_int[30][30], ap_uint<32> sum_int[30]) {
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=C4_int
    #pragma HLS INTERFACE ap_memory port=sum_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    loop0: for(int r = 0; r < 25; r++) {
      // #pragma HLS LOOP_FLATTEN off
      loop1: for(int q = 0; q < 20; q++) {
        // #pragma HLS LOOP_FLATTEN off
        loop2: for(int p = 0; p < 30; p++) {
          // #pragma HLS LOOP_FLATTEN off
          sum_int[p] = 0;
          //---
          loop3: for(int s = 0; s < 30; s++) {
            #pragma HLS PIPELINE II=1
            //#pragma HLS LOOP_FLATTEN off
            ap_uint<32> v = (A_int[r][q][s] * C4_int[s][p]);
            // combiner:
            sum_int[p] += v;
          }
        }
        //---
        loop4: for(int p = 0; p < 30; p++) {
          #pragma HLS PIPELINE II=1
          // #pragma HLS LOOP_FLATTEN off
          A_int[r][q][p] = sum_int[p];
        }
      }
    }
  }
}