#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void kernel(int*, int*, int*);
extern "C" void apatb_kernel_hw(volatile void * __xlx_apatb_param_A_int, volatile void * __xlx_apatb_param_C4_int, volatile void * __xlx_apatb_param_sum_int) {
  // Collect __xlx_A_int__tmp_vec
  vector<sc_bv<32> >__xlx_A_int__tmp_vec;
  for (int j = 0, e = 15000; j != e; ++j) {
    __xlx_A_int__tmp_vec.push_back(((int*)__xlx_apatb_param_A_int)[j]);
  }
  int __xlx_size_param_A_int = 15000;
  int __xlx_offset_param_A_int = 0;
  int __xlx_offset_byte_param_A_int = 0*4;
  int* __xlx_A_int__input_buffer= new int[__xlx_A_int__tmp_vec.size()];
  for (int i = 0; i < __xlx_A_int__tmp_vec.size(); ++i) {
    __xlx_A_int__input_buffer[i] = __xlx_A_int__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_C4_int__tmp_vec
  vector<sc_bv<32> >__xlx_C4_int__tmp_vec;
  for (int j = 0, e = 900; j != e; ++j) {
    __xlx_C4_int__tmp_vec.push_back(((int*)__xlx_apatb_param_C4_int)[j]);
  }
  int __xlx_size_param_C4_int = 900;
  int __xlx_offset_param_C4_int = 0;
  int __xlx_offset_byte_param_C4_int = 0*4;
  int* __xlx_C4_int__input_buffer= new int[__xlx_C4_int__tmp_vec.size()];
  for (int i = 0; i < __xlx_C4_int__tmp_vec.size(); ++i) {
    __xlx_C4_int__input_buffer[i] = __xlx_C4_int__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_sum_int__tmp_vec
  vector<sc_bv<32> >__xlx_sum_int__tmp_vec;
  for (int j = 0, e = 30; j != e; ++j) {
    __xlx_sum_int__tmp_vec.push_back(((int*)__xlx_apatb_param_sum_int)[j]);
  }
  int __xlx_size_param_sum_int = 30;
  int __xlx_offset_param_sum_int = 0;
  int __xlx_offset_byte_param_sum_int = 0*4;
  int* __xlx_sum_int__input_buffer= new int[__xlx_sum_int__tmp_vec.size()];
  for (int i = 0; i < __xlx_sum_int__tmp_vec.size(); ++i) {
    __xlx_sum_int__input_buffer[i] = __xlx_sum_int__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  kernel(__xlx_A_int__input_buffer, __xlx_C4_int__input_buffer, __xlx_sum_int__input_buffer);
// print __xlx_apatb_param_A_int
  sc_bv<32>*__xlx_A_int_output_buffer = new sc_bv<32>[__xlx_size_param_A_int];
  for (int i = 0; i < __xlx_size_param_A_int; ++i) {
    __xlx_A_int_output_buffer[i] = __xlx_A_int__input_buffer[i+__xlx_offset_param_A_int];
  }
  for (int i = 0; i < __xlx_size_param_A_int; ++i) {
    ((int*)__xlx_apatb_param_A_int)[i] = __xlx_A_int_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_C4_int
  sc_bv<32>*__xlx_C4_int_output_buffer = new sc_bv<32>[__xlx_size_param_C4_int];
  for (int i = 0; i < __xlx_size_param_C4_int; ++i) {
    __xlx_C4_int_output_buffer[i] = __xlx_C4_int__input_buffer[i+__xlx_offset_param_C4_int];
  }
  for (int i = 0; i < __xlx_size_param_C4_int; ++i) {
    ((int*)__xlx_apatb_param_C4_int)[i] = __xlx_C4_int_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_sum_int
  sc_bv<32>*__xlx_sum_int_output_buffer = new sc_bv<32>[__xlx_size_param_sum_int];
  for (int i = 0; i < __xlx_size_param_sum_int; ++i) {
    __xlx_sum_int_output_buffer[i] = __xlx_sum_int__input_buffer[i+__xlx_offset_param_sum_int];
  }
  for (int i = 0; i < __xlx_size_param_sum_int; ++i) {
    ((int*)__xlx_apatb_param_sum_int)[i] = __xlx_sum_int_output_buffer[i].to_uint64();
  }
}
