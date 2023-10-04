// git.status = clean, build.date = Wed Oct 04 08:28:19 EDT 2023, git.hash = 806c53c
#include <ap_int.h>
extern "C" {
  void kernel(ap_uint<32> A[8], ap_uint<32> B[8], ap_uint<32> v[1]) {
    #pragma HLS INTERFACE ap_memory port=A
    #pragma HLS INTERFACE ap_memory port=B
    #pragma HLS INTERFACE ap_memory port=v
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    for(int i = 0; i < 8; i++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      ap_uint<32> dot = (A[i] * B[i]);
      // combiner:
      v[0] += dot;
    }
  }
}
