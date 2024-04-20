// git.status = clean, build.date = Fri Mar 29 09:17:54 EDT 2024, git.hash = 9ec9a58
#include <ap_int.h>
#include "fxp_sqrt.h"
extern "C" {
  void kernel(ap_uint<32> A_int[8][12], ap_uint<32> R_int[12][12], ap_uint<32> Q_int[8][12]) {
    #pragma HLS INTERFACE ap_memory port=A_int
    #pragma HLS INTERFACE ap_memory port=R_int
    #pragma HLS INTERFACE ap_memory port=Q_int
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    ap_uint<32> A[8][12];
    #pragma HLS resource variable=A core=RAM_1P_BRAM
    ap_uint<32> R[12][12];
    #pragma HLS resource variable=R core=RAM_1P_BRAM
    ap_uint<32> Q[8][12];
    #pragma HLS resource variable=Q core=RAM_1P_BRAM
    for(int init0 = 0; init0 < 12; init0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int init1 = 0; init1 < 12; init1++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        R[init0][init1] = R_int[init0][init1];
      }
    }
    for(int i0 = 0; i0 < 8; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j0 = 0; j0 < 12; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A[i0][j0] = A_int[i0][j0];
        Q[i0][j0] = Q_int[i0][j0];
      }
    }
    //---
    for(int k = 0; k < 12; k++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      ap_uint<32> nrm = 0;
      for(int i = 0; i < 8; i++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        ap_uint<32> A_i_k = A[i][k];
        // combiner:
        nrm += (A_i_k * A_i_k);
      }
      ap_uint<32> sq = sqrt(nrm);
      R[k][k] = sq;
      //---
      for(int i = 0; i < 8; i++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        Q[i][k] = (A[i][k] / R[k][k]);
      }
      //---
      ap_uint<4> j = (k + (ap_uint<4>)1);
      while((j < 12)) {
        #pragma HLS LOOP_FLATTEN off
        #pragma HLS loop_tripcount min=0 max=11 avg=6
        R[k][j] = 0;
        //---
        for(int i = 0; i < 8; i++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> v = (Q[i][k] * A[i][j]);
          // combiner:
          R[k][j] += v;
        }
        //---
        for(int i = 0; i < 8; i++) {
          #pragma HLS UNROLL factor=1 skip_exit_check
          #pragma HLS LOOP_FLATTEN off
          ap_uint<32> A_i_j = A[i][j];
          //---
          A[i][j] = (A_i_j - (Q[i][k] * R[k][j]));
        }
        j = (j + (ap_uint<4>)1);
      }
    }
    //---
    for(int init0 = 0; init0 < 12; init0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int init1 = 0; init1 < 12; init1++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        R_int[init0][init1] = R[init0][init1];
      }
    }
    for(int i0 = 0; i0 < 8; i0++) {
      #pragma HLS UNROLL factor=1 skip_exit_check
      #pragma HLS LOOP_FLATTEN off
      for(int j0 = 0; j0 < 12; j0++) {
        #pragma HLS UNROLL factor=1 skip_exit_check
        #pragma HLS LOOP_FLATTEN off
        A_int[i0][j0] = A[i0][j0];
        Q_int[i0][j0] = Q[i0][j0];
      }
    }
  }
}

