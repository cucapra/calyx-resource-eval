#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_A_int "../tv/cdatafile/c.kernel.autotvin_A_int.dat"
#define AUTOTB_TVOUT_A_int "../tv/cdatafile/c.kernel.autotvout_A_int.dat"
// wrapc file define:
#define AUTOTB_TVIN_C4_int "../tv/cdatafile/c.kernel.autotvin_C4_int.dat"
#define AUTOTB_TVOUT_C4_int "../tv/cdatafile/c.kernel.autotvout_C4_int.dat"
// wrapc file define:
#define AUTOTB_TVIN_sum_int "../tv/cdatafile/c.kernel.autotvin_sum_int.dat"
#define AUTOTB_TVOUT_sum_int "../tv/cdatafile/c.kernel.autotvout_sum_int.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_A_int "../tv/rtldatafile/rtl.kernel.autotvout_A_int.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_C4_int "../tv/rtldatafile/rtl.kernel.autotvout_C4_int.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_sum_int "../tv/rtldatafile/rtl.kernel.autotvout_sum_int.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  A_int_depth = 0;
  C4_int_depth = 0;
  sum_int_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{A_int " << A_int_depth << "}\n";
  total_list << "{C4_int " << C4_int_depth << "}\n";
  total_list << "{sum_int " << sum_int_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int A_int_depth;
    int C4_int_depth;
    int sum_int_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void kernel_hw_stub_wrapper(volatile void *, volatile void *, volatile void *);

extern "C" void apatb_kernel_hw(volatile void * __xlx_apatb_param_A_int, volatile void * __xlx_apatb_param_C4_int, volatile void * __xlx_apatb_param_sum_int) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_A_int);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > A_int_pc_buffer(15000);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "A_int");
  
            // push token into output port buffer
            if (AESL_token != "") {
              A_int_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 15000; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_A_int)[j] = A_int_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_sum_int);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > sum_int_pc_buffer(30);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "sum_int");
  
            // push token into output port buffer
            if (AESL_token != "") {
              sum_int_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 30; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_sum_int)[j] = sum_int_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//A_int
aesl_fh.touch(AUTOTB_TVIN_A_int);
aesl_fh.touch(AUTOTB_TVOUT_A_int);
//C4_int
aesl_fh.touch(AUTOTB_TVIN_C4_int);
aesl_fh.touch(AUTOTB_TVOUT_C4_int);
//sum_int
aesl_fh.touch(AUTOTB_TVIN_sum_int);
aesl_fh.touch(AUTOTB_TVOUT_sum_int);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_A_int = 0;
// print A_int Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_A_int, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_A_int = 0*4;
  if (__xlx_apatb_param_A_int) {
    for (int j = 0  - 0, e = 15000 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_A_int)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_A_int, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(15000, &tcl_file.A_int_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_A_int, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_C4_int = 0;
// print C4_int Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_C4_int, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_C4_int = 0*4;
  if (__xlx_apatb_param_C4_int) {
    for (int j = 0  - 0, e = 900 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_C4_int)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_C4_int, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(900, &tcl_file.C4_int_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_C4_int, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_sum_int = 0;
// print sum_int Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_sum_int, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_sum_int = 0*4;
  if (__xlx_apatb_param_sum_int) {
    for (int j = 0  - 0, e = 30 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_sum_int)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_sum_int, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(30, &tcl_file.sum_int_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_sum_int, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
kernel_hw_stub_wrapper(__xlx_apatb_param_A_int, __xlx_apatb_param_C4_int, __xlx_apatb_param_sum_int);
CodeState = DUMP_OUTPUTS;
// print A_int Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_A_int, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_A_int = 0*4;
  if (__xlx_apatb_param_A_int) {
    for (int j = 0  - 0, e = 15000 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_A_int)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_A_int, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(15000, &tcl_file.A_int_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_A_int, __xlx_sprintf_buffer.data());
}
// print sum_int Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_sum_int, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_sum_int = 0*4;
  if (__xlx_apatb_param_sum_int) {
    for (int j = 0  - 0, e = 30 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_sum_int)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_sum_int, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(30, &tcl_file.sum_int_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_sum_int, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
