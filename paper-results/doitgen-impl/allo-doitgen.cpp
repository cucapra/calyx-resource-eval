//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for High-level Synthesis (HLS).
//
//===----------------------------------------------------------------------===//
#include <algorithm>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <math.h>
#include <stdint.h>
using namespace std;
void kernel(
  int32_t v0[15000],
  int32_t v1[900],
  int32_t v2[30]
) {	// L2
  int32_t buf0[25][20][30];	//
  l_S_buf0_buf0_l_0: for (int buf0_l_0 = 0; buf0_l_0 < 25; buf0_l_0++) {	//
    l_buf0_l_1: for (int buf0_l_1 = 0; buf0_l_1 < 20; buf0_l_1++) {	//
      l_buf0_l_2: for (int buf0_l_2 = 0; buf0_l_2 < 30; buf0_l_2++) {	//
      #pragma HLS pipeline II=1
        int32_t v7 = v0[(((buf0_l_0 * 600) + (buf0_l_1 * 30)) + buf0_l_2)];	//
        buf0[buf0_l_0][buf0_l_1][buf0_l_2] = v7;	//
      }
    }
  }
  int32_t buf1[30][30];	//
  l_S_buf1_buf1_l_0: for (int buf1_l_0 = 0; buf1_l_0 < 30; buf1_l_0++) {	//
    l_buf1_l_1: for (int buf1_l_1 = 0; buf1_l_1 < 30; buf1_l_1++) {	//
    #pragma HLS pipeline II=1
      int32_t v11 = v1[((buf1_l_0 * 30) + buf1_l_1)];	//
      buf1[buf1_l_0][buf1_l_1] = v11;	//
    }
  }
  int32_t buf2[30];	//
  l_S_buf2_buf2_l_0: for (int buf2_l_0 = 0; buf2_l_0 < 30; buf2_l_0++) {	//
  #pragma HLS pipeline II=1
    int32_t v14 = v2[buf2_l_0];	//
    buf2[buf2_l_0] = v14;	//
  }
  l_S_r_q_0_r: for (int r = 0; r < 25; r++) {	// L3
    l_q: for (int q = 0; q < 20; q++) {	// L4
      l_S_p_0_p: for (int p = 0; p < 30; p++) {	// L5
        buf2[p] = 0;	// L7
        l_S_s_0_s: for (int s = 0; s < 30; s++) {	// L8
          int32_t v19 = buf2[p];	// L9
          int32_t v20 = buf0[r][q][s];	// L10
          int32_t v21 = buf1[s][p];	// L11
          int64_t v22 = v20;	// L12
          int64_t v23 = v21;	// L13
          int64_t v24 = v22 * v23;	// L14
          ap_int<65> v25 = v19;	// L15
          ap_int<65> v26 = v24;	// L16
          ap_int<65> v27 = v25 + v26;	// L17
          int32_t v28 = v27;	// L18
          buf2[p] = v28;	// L19
        }
      }
      l_S_p1_2_p1: for (int p1 = 0; p1 < 30; p1++) {	// L22
        int32_t v30 = buf2[p1];	// L23
        buf0[r][q][p1] = v30;	// L24
      }
    }
  }
}