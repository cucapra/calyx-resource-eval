module MulFIP(
  input         clock,
  input  [31:0] operand0,
  input  [31:0] operand1,
  input         ce,
  output [31:0] result
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  IPCore_aclk; // @[fpunits.scala 315:22]
  wire  IPCore_aclken; // @[fpunits.scala 315:22]
  wire [31:0] IPCore_s_axis_a_tdata; // @[fpunits.scala 315:22]
  wire  IPCore_s_axis_a_tvalid; // @[fpunits.scala 315:22]
  wire [31:0] IPCore_s_axis_b_tdata; // @[fpunits.scala 315:22]
  wire  IPCore_s_axis_b_tvalid; // @[fpunits.scala 315:22]
  wire  IPCore_m_axis_result_tvalid; // @[fpunits.scala 315:22]
  wire [31:0] IPCore_m_axis_result_tdata; // @[fpunits.scala 315:22]
  reg [31:0] operand0Reg; // @[fpunits.scala 317:24]
  reg [31:0] operand1Reg; // @[fpunits.scala 318:24]
  reg  ceReg; // @[fpunits.scala 319:28]
  mulf_3_8_24_ip IPCore ( // @[fpunits.scala 315:22]
    .aclk(IPCore_aclk),
    .aclken(IPCore_aclken),
    .s_axis_a_tdata(IPCore_s_axis_a_tdata),
    .s_axis_a_tvalid(IPCore_s_axis_a_tvalid),
    .s_axis_b_tdata(IPCore_s_axis_b_tdata),
    .s_axis_b_tvalid(IPCore_s_axis_b_tvalid),
    .m_axis_result_tvalid(IPCore_m_axis_result_tvalid),
    .m_axis_result_tdata(IPCore_m_axis_result_tdata)
  );
  assign result = IPCore_m_axis_result_tdata; // @[fpunits.scala 332:29]
  assign IPCore_aclk = clock; // @[fpunits.scala 326:29]
  assign IPCore_aclken = ceReg; // @[fpunits.scala 327:29]
  assign IPCore_s_axis_a_tdata = operand0Reg; // @[fpunits.scala 328:29]
  assign IPCore_s_axis_a_tvalid = 1'h1; // @[fpunits.scala 329:29]
  assign IPCore_s_axis_b_tdata = operand1Reg; // @[fpunits.scala 330:29]
  assign IPCore_s_axis_b_tvalid = 1'h1; // @[fpunits.scala 331:29]
  always @(posedge clock) begin
    if (ce) begin // @[fpunits.scala 321:12]
      operand0Reg <= operand0; // @[fpunits.scala 322:17]
    end
    if (ce) begin // @[fpunits.scala 321:12]
      operand1Reg <= operand1; // @[fpunits.scala 323:17]
    end
    ceReg <= ce; // @[fpunits.scala 319:28]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  operand0Reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  operand1Reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  ceReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddSubFIP(
  input         clock,
  input  [31:0] operand0,
  input  [31:0] operand1,
  input         ce,
  output [31:0] result
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  IPCore_aclk; // @[fpunits.scala 315:22]
  wire  IPCore_aclken; // @[fpunits.scala 315:22]
  wire [31:0] IPCore_s_axis_a_tdata; // @[fpunits.scala 315:22]
  wire  IPCore_s_axis_a_tvalid; // @[fpunits.scala 315:22]
  wire [31:0] IPCore_s_axis_b_tdata; // @[fpunits.scala 315:22]
  wire  IPCore_s_axis_b_tvalid; // @[fpunits.scala 315:22]
  wire  IPCore_m_axis_result_tvalid; // @[fpunits.scala 315:22]
  wire [31:0] IPCore_m_axis_result_tdata; // @[fpunits.scala 315:22]
  reg [31:0] operand0Reg; // @[fpunits.scala 317:24]
  reg [31:0] operand1Reg; // @[fpunits.scala 318:24]
  reg  ceReg; // @[fpunits.scala 319:28]
  addsubf_true_4_8_24_ip IPCore ( // @[fpunits.scala 315:22]
    .aclk(IPCore_aclk),
    .aclken(IPCore_aclken),
    .s_axis_a_tdata(IPCore_s_axis_a_tdata),
    .s_axis_a_tvalid(IPCore_s_axis_a_tvalid),
    .s_axis_b_tdata(IPCore_s_axis_b_tdata),
    .s_axis_b_tvalid(IPCore_s_axis_b_tvalid),
    .m_axis_result_tvalid(IPCore_m_axis_result_tvalid),
    .m_axis_result_tdata(IPCore_m_axis_result_tdata)
  );
  assign result = IPCore_m_axis_result_tdata; // @[fpunits.scala 332:29]
  assign IPCore_aclk = clock; // @[fpunits.scala 326:29]
  assign IPCore_aclken = ceReg; // @[fpunits.scala 327:29]
  assign IPCore_s_axis_a_tdata = operand0Reg; // @[fpunits.scala 328:29]
  assign IPCore_s_axis_a_tvalid = 1'h1; // @[fpunits.scala 329:29]
  assign IPCore_s_axis_b_tdata = operand1Reg; // @[fpunits.scala 330:29]
  assign IPCore_s_axis_b_tvalid = 1'h1; // @[fpunits.scala 331:29]
  always @(posedge clock) begin
    if (ce) begin // @[fpunits.scala 321:12]
      operand0Reg <= operand0; // @[fpunits.scala 322:17]
    end
    if (ce) begin // @[fpunits.scala 321:12]
      operand1Reg <= operand1; // @[fpunits.scala 323:17]
    end
    ceReg <= ce; // @[fpunits.scala 319:28]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  operand0Reg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  operand1Reg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  ceReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DelayBuffer(
  input         clock,
  input         reset,
  input  [32:0] valid_in,
  input         ready_in,
  output [32:0] valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [32:0] shift_register_0; // @[elastic_component.scala 564:31]
  reg [32:0] shift_register_1; // @[elastic_component.scala 564:31]
  reg [32:0] shift_register_2; // @[elastic_component.scala 564:31]
  reg [32:0] shift_register_3; // @[elastic_component.scala 564:31]
  reg [32:0] shift_register_4; // @[elastic_component.scala 564:31]
  reg [32:0] shift_register_5; // @[elastic_component.scala 564:31]
  reg [32:0] shift_register_6; // @[elastic_component.scala 564:31]
  assign valid_out = shift_register_6; // @[elastic_component.scala 572:13]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_0 <= 33'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_0 <= valid_in; // @[elastic_component.scala 567:23]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_1 <= 33'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_1 <= shift_register_0; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_2 <= 33'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_2 <= shift_register_1; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_3 <= 33'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_3 <= shift_register_2; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_4 <= 33'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_4 <= shift_register_3; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_5 <= 33'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_5 <= shift_register_4; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_6 <= 33'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_6 <= shift_register_5; // @[elastic_component.scala 569:25]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  shift_register_0 = _RAND_0[32:0];
  _RAND_1 = {2{`RANDOM}};
  shift_register_1 = _RAND_1[32:0];
  _RAND_2 = {2{`RANDOM}};
  shift_register_2 = _RAND_2[32:0];
  _RAND_3 = {2{`RANDOM}};
  shift_register_3 = _RAND_3[32:0];
  _RAND_4 = {2{`RANDOM}};
  shift_register_4 = _RAND_4[32:0];
  _RAND_5 = {2{`RANDOM}};
  shift_register_5 = _RAND_5[32:0];
  _RAND_6 = {2{`RANDOM}};
  shift_register_6 = _RAND_6[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DelayBuffer_1(
  input         clock,
  input         reset,
  input  [31:0] valid_in,
  input         ready_in,
  output [31:0] valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] shift_register_0; // @[elastic_component.scala 564:31]
  reg [31:0] shift_register_1; // @[elastic_component.scala 564:31]
  reg [31:0] shift_register_2; // @[elastic_component.scala 564:31]
  assign valid_out = shift_register_2; // @[elastic_component.scala 572:13]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_0 <= 32'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_0 <= valid_in; // @[elastic_component.scala 567:23]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_1 <= 32'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_1 <= shift_register_0; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_2 <= 32'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_2 <= shift_register_1; // @[elastic_component.scala 569:25]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shift_register_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  shift_register_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  shift_register_2 = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c2a000; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42b28b21; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41c9ef21; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42923eae; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41535d86; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42b47dbd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b880aa; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_1(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c5995e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41bab208; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h412ce066; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4295e79d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h423917b1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4197d23c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h40cce28a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_2(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c5f083; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4142cfba; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42b15743; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42537d9c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h427ad508; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42154e57; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41a0908e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_3(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c5c2a6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a26a76; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4268dbfd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4257de75; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42040597; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h428105cb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h40167080; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_4(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c4f8d7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4281e63d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4086b9bf; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h429d911a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h422941a7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42803fbf; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h423187f9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_5(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c55492; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41d71500; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42823e26; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42993040; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h3fdc111c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h411c13f5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h429fa53b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_6(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f0e2aec; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h424938cb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42af7820; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4292ff45; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4288e32a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42844f81; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42936d84; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_7(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3ef30de0; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42b8de72; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42214c5d; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42bcf7a7; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a36c37; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41a4f90e; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h429b8829; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_1 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_2 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_3 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_4 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_5 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_6 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_7 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module PE_8(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3e8e26a0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a89c55; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h415527ec; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4263912e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42117675; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41a36cf6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42c59064; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_9(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3e52eb50; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42c70fed; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4243d4c0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42c388ee; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b9350d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h400b448a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41c4d930; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_10(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3ed78958; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42576a47; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42283471; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h429647e9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41bf1e55; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4263bae2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h423c892c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_11(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3eb76dd0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4228b493; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4272eddd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h420fa06a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41b8c8b6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4283ec7b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42bd75c0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_12(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c7f6cc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4290392b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4291a334; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h3f00ff70; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4192c703; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41a11ad2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42a09cbf; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_13(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c7e909; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42534908; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41bd74e4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4223543e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b2df70; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42192c96; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h416fd7af; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_14(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c7bb2c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41aed40b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42ba73f4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4227b518; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h426eef6e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4282f4eb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42c28a57; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_15(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3e0987d0; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h416c1c30; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a92fc2; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h421a928b; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42435dc2; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a7d90b; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4249b866; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line_1(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE_8 PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_9 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_10 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_11 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_12 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_13 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_14 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_15 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module PE_16(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c76d33; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h429e6aa7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a2e765; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h407268bd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41e9ea60; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h3fd8a522; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41d92b8b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_17(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c73f55; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4240f64c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h424bfc40; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h409c3b2a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42c712df; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41e704d2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4116d21c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_18(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c73629; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h40030180; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a9cf79; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h428233c8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41598aa0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4294a0ef; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4283c3be; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_19(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c7b1ff; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h429751e9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41d91532; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40095440; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4293962c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h412ea522; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4256e7a2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_20(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c788b7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h418e4fd3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h429f735b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41b90c12; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42ae1f3a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4282c368; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42671ceb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_21(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h42c77f8c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h428f30db; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h415a25a1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42a6b31a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h3f8f6ba0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h412d190a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4163bf78; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_22(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fdb0010; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h429f9468; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h3f1ca5f4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h421d838f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4139b604; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42aaf13d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42a49a51; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_23(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fd0ae44; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41af59cf; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4254ceb4; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42717454; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41c6ff3a; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h421fc001; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42acb4f5; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line_2(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE_16 PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_17 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_18 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_19 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_20 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_21 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_22 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_23 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module PE_24(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fe79cf8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a7b576; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4161cf21; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4268b2a0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a88f3f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42ab22c0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41ae58cd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_25(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fe1e164; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4192f6d7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42c5c542; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h426ae30c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h428adb62; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4244a420; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h414eef1f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_26(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fe0bbd6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42351851; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h417d6f72; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h421b5322; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41d3aa73; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41af07b4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b652a1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_27(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fb64ee6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4222c594; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h422c9dab; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40386497; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42123c19; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h414766b4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42ab31ef; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_28(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fabfce8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a5a4d6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42bf7ce4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41beee1a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42474e33; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4285db99; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b34c93; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_29(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fa64154; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h418ab456; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a10842; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41c34ef3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h420be67c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41f42ba7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42a19444; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_30(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fc9ccf0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a6ad26; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h425bb6c9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h422414d7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42861b2c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42987f2d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h425ee2c7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_31(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fc536ea; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42b5e6f2; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41b5f857; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4275d52e; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42be5816; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42863ea0; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42894457; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line_3(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE_24 PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_25 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_26 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_27 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_28 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_29 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_30 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_31 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module PE_32(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f8f526e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h425d9c27; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h419cd6e1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41d4d25c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h429723cd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a9c82a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4235660d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_33(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f8e2ce0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a49c86; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42123cc9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40d6ca22; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4202660e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4266700e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41bc9f0c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_34(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f88714c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41869316; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41aaa709; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40e84d88; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h418dfcab; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41a99d5a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h416b7b9e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_35(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f83db14; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41c37a49; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42b24c74; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41dd940f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42377828; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4141364e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41dd099c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_36(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3fa3f638; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h428e49fc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4166ccd7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42a943d3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42442365; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4297eaa3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4214fb7a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_37(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f99a43a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4154603d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h428607a9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40b3c34a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4279357f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41f3659b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h422530c3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_38(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f950e34; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41a71751; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h420b54b5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41d07183; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b4d7a9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41aa6369; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4258d6ab; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_39(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f554288; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h418271d9; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42789685; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b435f3; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h3f058c48; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h413e1e1e; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42429546; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line_4(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE_32 PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_33 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_34 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_35 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_36 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_37 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_38 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_39 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module PE_40(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f49cafc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h424b496b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h423bad40; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b54e2a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42ab573c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4296f314; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h421f24a8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_41(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f409e8c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4269bd03; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h416bca86; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h413172af; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h415ca12d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4284b287; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4252ca90; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_42(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f806a6a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h40a49eba; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42200cf1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42880d24; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4187a70d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41f1d980; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4279413c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_43(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f77a864; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h414c1dbc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h40fa9295; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b0ed50; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42344d59; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41a8d74e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42967392; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_44(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f6c313c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h423d17ee; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42b93487; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b20587; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41f1cb44; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a96524; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4284bb43; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_45(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h3f654fe8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41dfdd41; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h422ddd18; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41eab69c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h3fa8200a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h40369743; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h3f865e3e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_46(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f3165f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h427a4edd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41eb9af1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41100c52; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h426d9bfa; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4159ca58; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4294ec12; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_47(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f2ccff; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h428c613b; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42c2896e; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41eb86d6; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42af0ae7; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h408f8be6; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42aebf05; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line_5(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE_40 PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_41 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_42 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_43 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_44 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_45 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_46 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_47 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module PE_48(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f227df; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41451a3a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42476ef9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4249b430; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h3f49fa40; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h426bcf03; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b6d9a9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_49(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f42991; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h426c1d61; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h429644a4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40eb8e71; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h407d3243; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41b6ad6b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h3f853fea; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_50(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f3e031; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4285487d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h422bceaa; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41de644a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42004cf7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h415b5670; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h415f3f9c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_51(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f3a926; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h423d67ac; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42bba15a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42884133; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h404a8550; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41fee992; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42428c54; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_52(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f35fc2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h425bdb45; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42768817; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b1215f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41fa4450; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41b5e75f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4276323c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_53(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f09442; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h408612a8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41b6d92e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h414d583d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h425dc5f0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h426b08f7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41470f2e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_54(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f04ade; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h413cd7ba; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42b558fd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42051666; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a71fe1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h424687dd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41cad367; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_55(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f013d7; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42b90651; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42262604; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42933354; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h425a9b21; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42879385; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42702620; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line_6(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE_48 PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_49 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_50 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_51 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_52 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_53 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_54 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_55 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module PE_56(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f1cc26; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h423b570d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h420a85b5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h424be49d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42abe018; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41b45b47; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42a5215a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_57(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f182c2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4259caa5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h401cb17a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h428ed27a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4160e80d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4156b228; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42bef44d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_58(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f1951b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41dc5b80; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42aafcdf; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b69a6f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42641b8e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4222ccd0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4189fe42; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_59(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f15e10; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h410411c4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42116dc7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41fd0a3f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41e0edd9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h426b6bfd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h424fbb8f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_60(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41f0dda5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42c1275f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h425c2734; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b8cadc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41da983b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4287c508; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42c70ef2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_61(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41ee5b85; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4218c235; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4241c653; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42c0745a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41baec26; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h415081c2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4216098c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_62(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         A_out_ready,
  output        A_out_valid,
  output [31:0] A_out_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  wire  ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign A_out_bits = A_buf_valid_out[32:1]; // @[systolic.scala 56:33]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = A_out_ready & C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41ee1224; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h423735cd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4182176b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41855214; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h424defe6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4079f574; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4249af74; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_63(
  input         clock,
  input         reset,
  output        A_in_ready,
  input         A_in_valid,
  input  [31:0] A_in_bits,
  output        C_in_ready,
  input         C_in_valid,
  input  [31:0] C_in_bits,
  input         C_out_ready,
  output        C_out_valid,
  output [31:0] C_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  mul_clock; // @[systolic.scala 37:19]
  wire [31:0] mul_operand0; // @[systolic.scala 37:19]
  wire [31:0] mul_operand1; // @[systolic.scala 37:19]
  wire  mul_ce; // @[systolic.scala 37:19]
  wire [31:0] mul_result; // @[systolic.scala 37:19]
  wire  add_clock; // @[systolic.scala 40:19]
  wire [31:0] add_operand0; // @[systolic.scala 40:19]
  wire [31:0] add_operand1; // @[systolic.scala 40:19]
  wire  add_ce; // @[systolic.scala 40:19]
  wire [31:0] add_result; // @[systolic.scala 40:19]
  wire  A_buf_clock; // @[systolic.scala 43:21]
  wire  A_buf_reset; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_in; // @[systolic.scala 43:21]
  wire  A_buf_ready_in; // @[systolic.scala 43:21]
  wire [32:0] A_buf_valid_out; // @[systolic.scala 43:21]
  wire  C_buf_clock; // @[systolic.scala 50:21]
  wire  C_buf_reset; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_in; // @[systolic.scala 50:21]
  wire  C_buf_ready_in; // @[systolic.scala 50:21]
  wire [31:0] C_buf_valid_out; // @[systolic.scala 50:21]
  wire  valid_in = A_in_valid & C_in_valid; // @[systolic.scala 20:29]
  reg [31:0] B; // @[systolic.scala 26:49]
  reg [31:0] B_reg_1; // @[systolic.scala 26:49]
  reg [31:0] B_reg_2; // @[systolic.scala 26:49]
  reg [31:0] B_reg_3; // @[systolic.scala 26:49]
  reg [31:0] B_reg_4; // @[systolic.scala 26:49]
  reg [31:0] B_reg_5; // @[systolic.scala 26:49]
  reg [31:0] B_reg_6; // @[systolic.scala 26:49]
  wire [32:0] _A_buf_valid_in_T = {A_in_bits, 1'h0}; // @[systolic.scala 44:32]
  wire [32:0] _GEN_7 = {{32'd0}, valid_in}; // @[systolic.scala 44:38]
  wire [32:0] _valid_out_T = A_buf_valid_out & 33'h1; // @[systolic.scala 59:32]
  MulFIP mul ( // @[systolic.scala 37:19]
    .clock(mul_clock),
    .operand0(mul_operand0),
    .operand1(mul_operand1),
    .ce(mul_ce),
    .result(mul_result)
  );
  AddSubFIP add ( // @[systolic.scala 40:19]
    .clock(add_clock),
    .operand0(add_operand0),
    .operand1(add_operand1),
    .ce(add_ce),
    .result(add_result)
  );
  DelayBuffer A_buf ( // @[systolic.scala 43:21]
    .clock(A_buf_clock),
    .reset(A_buf_reset),
    .valid_in(A_buf_valid_in),
    .ready_in(A_buf_ready_in),
    .valid_out(A_buf_valid_out)
  );
  DelayBuffer_1 C_buf ( // @[systolic.scala 50:21]
    .clock(C_buf_clock),
    .reset(C_buf_reset),
    .valid_in(C_buf_valid_in),
    .ready_in(C_buf_ready_in),
    .valid_out(C_buf_valid_out)
  );
  assign A_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_in_ready = C_out_ready; // @[systolic.scala 22:31]
  assign C_out_valid = _valid_out_T[0]; // @[systolic.scala 21:23 systolic.scala 59:13]
  assign C_out_bits = add_result; // @[systolic.scala 57:14]
  assign mul_clock = clock;
  assign mul_operand0 = A_in_bits; // @[systolic.scala 47:16]
  assign mul_operand1 = B; // @[systolic.scala 48:16]
  assign mul_ce = C_out_ready; // @[systolic.scala 22:31]
  assign add_clock = clock;
  assign add_operand0 = C_buf_valid_out; // @[systolic.scala 53:16]
  assign add_operand1 = mul_result; // @[systolic.scala 54:16]
  assign add_ce = C_out_ready; // @[systolic.scala 22:31]
  assign A_buf_clock = clock;
  assign A_buf_reset = reset;
  assign A_buf_valid_in = _A_buf_valid_in_T | _GEN_7; // @[systolic.scala 44:38]
  assign A_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  assign C_buf_clock = clock;
  assign C_buf_reset = reset;
  assign C_buf_valid_in = C_in_bits; // @[systolic.scala 51:18]
  assign C_buf_ready_in = C_out_ready; // @[systolic.scala 22:31]
  always @(posedge clock) begin
    if (reset) begin // @[systolic.scala 26:49]
      B <= 32'h41ee247d; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h419731cc; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42c69d2e; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h421238f4; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42bce8b9; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41f97f3a; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h429062fd; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_6 <= B; // @[systolic.scala 33:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  B = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  B_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  B_reg_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  B_reg_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  B_reg_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  B_reg_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  B_reg_6 = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_line_7(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input  [31:0] var0_bits,
  output        var1_ready,
  input         var1_valid,
  input  [31:0] var1_bits,
  output        var2_ready,
  input         var2_valid,
  input  [31:0] var2_bits,
  output        var3_ready,
  input         var3_valid,
  input  [31:0] var3_bits,
  output        var4_ready,
  input         var4_valid,
  input  [31:0] var4_bits,
  output        var5_ready,
  input         var5_valid,
  input  [31:0] var5_bits,
  output        var6_ready,
  input         var6_valid,
  input  [31:0] var6_bits,
  output        var7_ready,
  input         var7_valid,
  input  [31:0] var7_bits,
  output        var8_ready,
  input         var8_valid,
  input  [31:0] var8_bits,
  input         var9_ready,
  output        var9_valid,
  output [31:0] var9_bits,
  input         var10_ready,
  output        var10_valid,
  output [31:0] var10_bits,
  input         var11_ready,
  output        var11_valid,
  output [31:0] var11_bits,
  input         var12_ready,
  output        var12_valid,
  output [31:0] var12_bits,
  input         var13_ready,
  output        var13_valid,
  output [31:0] var13_bits,
  input         var14_ready,
  output        var14_valid,
  output [31:0] var14_bits,
  input         var15_ready,
  output        var15_valid,
  output [31:0] var15_bits,
  input         var16_ready,
  output        var16_valid,
  output [31:0] var16_bits
);
  wire  PE_0_clock; // @[systolic_array.scala 36:26]
  wire  PE_0_reset; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_in_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_in_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_A_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_A_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_ready; // @[systolic_array.scala 36:26]
  wire  PE_0_C_out_valid; // @[systolic_array.scala 36:26]
  wire [31:0] PE_0_C_out_bits; // @[systolic_array.scala 36:26]
  wire  PE_1_clock; // @[systolic_array.scala 37:26]
  wire  PE_1_reset; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_in_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_in_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_A_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_A_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_ready; // @[systolic_array.scala 37:26]
  wire  PE_1_C_out_valid; // @[systolic_array.scala 37:26]
  wire [31:0] PE_1_C_out_bits; // @[systolic_array.scala 37:26]
  wire  PE_2_clock; // @[systolic_array.scala 38:26]
  wire  PE_2_reset; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_in_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_in_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_A_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_A_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_ready; // @[systolic_array.scala 38:26]
  wire  PE_2_C_out_valid; // @[systolic_array.scala 38:26]
  wire [31:0] PE_2_C_out_bits; // @[systolic_array.scala 38:26]
  wire  PE_3_clock; // @[systolic_array.scala 39:26]
  wire  PE_3_reset; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_in_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_in_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_A_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_A_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_ready; // @[systolic_array.scala 39:26]
  wire  PE_3_C_out_valid; // @[systolic_array.scala 39:26]
  wire [31:0] PE_3_C_out_bits; // @[systolic_array.scala 39:26]
  wire  PE_4_clock; // @[systolic_array.scala 40:26]
  wire  PE_4_reset; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_in_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_in_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_A_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_A_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_ready; // @[systolic_array.scala 40:26]
  wire  PE_4_C_out_valid; // @[systolic_array.scala 40:26]
  wire [31:0] PE_4_C_out_bits; // @[systolic_array.scala 40:26]
  wire  PE_5_clock; // @[systolic_array.scala 41:26]
  wire  PE_5_reset; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_in_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_in_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_A_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_A_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_ready; // @[systolic_array.scala 41:26]
  wire  PE_5_C_out_valid; // @[systolic_array.scala 41:26]
  wire [31:0] PE_5_C_out_bits; // @[systolic_array.scala 41:26]
  wire  PE_6_clock; // @[systolic_array.scala 42:26]
  wire  PE_6_reset; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_in_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_in_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_A_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_A_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_ready; // @[systolic_array.scala 42:26]
  wire  PE_6_C_out_valid; // @[systolic_array.scala 42:26]
  wire [31:0] PE_6_C_out_bits; // @[systolic_array.scala 42:26]
  wire  PE_7_clock; // @[systolic_array.scala 43:26]
  wire  PE_7_reset; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_A_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_A_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_in_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_in_bits; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_ready; // @[systolic_array.scala 43:26]
  wire  PE_7_C_out_valid; // @[systolic_array.scala 43:26]
  wire [31:0] PE_7_C_out_bits; // @[systolic_array.scala 43:26]
  PE_56 PE_0 ( // @[systolic_array.scala 36:26]
    .clock(PE_0_clock),
    .reset(PE_0_reset),
    .A_in_ready(PE_0_A_in_ready),
    .A_in_valid(PE_0_A_in_valid),
    .A_in_bits(PE_0_A_in_bits),
    .C_in_ready(PE_0_C_in_ready),
    .C_in_valid(PE_0_C_in_valid),
    .C_in_bits(PE_0_C_in_bits),
    .A_out_ready(PE_0_A_out_ready),
    .A_out_valid(PE_0_A_out_valid),
    .A_out_bits(PE_0_A_out_bits),
    .C_out_ready(PE_0_C_out_ready),
    .C_out_valid(PE_0_C_out_valid),
    .C_out_bits(PE_0_C_out_bits)
  );
  PE_57 PE_1 ( // @[systolic_array.scala 37:26]
    .clock(PE_1_clock),
    .reset(PE_1_reset),
    .A_in_ready(PE_1_A_in_ready),
    .A_in_valid(PE_1_A_in_valid),
    .A_in_bits(PE_1_A_in_bits),
    .C_in_ready(PE_1_C_in_ready),
    .C_in_valid(PE_1_C_in_valid),
    .C_in_bits(PE_1_C_in_bits),
    .A_out_ready(PE_1_A_out_ready),
    .A_out_valid(PE_1_A_out_valid),
    .A_out_bits(PE_1_A_out_bits),
    .C_out_ready(PE_1_C_out_ready),
    .C_out_valid(PE_1_C_out_valid),
    .C_out_bits(PE_1_C_out_bits)
  );
  PE_58 PE_2 ( // @[systolic_array.scala 38:26]
    .clock(PE_2_clock),
    .reset(PE_2_reset),
    .A_in_ready(PE_2_A_in_ready),
    .A_in_valid(PE_2_A_in_valid),
    .A_in_bits(PE_2_A_in_bits),
    .C_in_ready(PE_2_C_in_ready),
    .C_in_valid(PE_2_C_in_valid),
    .C_in_bits(PE_2_C_in_bits),
    .A_out_ready(PE_2_A_out_ready),
    .A_out_valid(PE_2_A_out_valid),
    .A_out_bits(PE_2_A_out_bits),
    .C_out_ready(PE_2_C_out_ready),
    .C_out_valid(PE_2_C_out_valid),
    .C_out_bits(PE_2_C_out_bits)
  );
  PE_59 PE_3 ( // @[systolic_array.scala 39:26]
    .clock(PE_3_clock),
    .reset(PE_3_reset),
    .A_in_ready(PE_3_A_in_ready),
    .A_in_valid(PE_3_A_in_valid),
    .A_in_bits(PE_3_A_in_bits),
    .C_in_ready(PE_3_C_in_ready),
    .C_in_valid(PE_3_C_in_valid),
    .C_in_bits(PE_3_C_in_bits),
    .A_out_ready(PE_3_A_out_ready),
    .A_out_valid(PE_3_A_out_valid),
    .A_out_bits(PE_3_A_out_bits),
    .C_out_ready(PE_3_C_out_ready),
    .C_out_valid(PE_3_C_out_valid),
    .C_out_bits(PE_3_C_out_bits)
  );
  PE_60 PE_4 ( // @[systolic_array.scala 40:26]
    .clock(PE_4_clock),
    .reset(PE_4_reset),
    .A_in_ready(PE_4_A_in_ready),
    .A_in_valid(PE_4_A_in_valid),
    .A_in_bits(PE_4_A_in_bits),
    .C_in_ready(PE_4_C_in_ready),
    .C_in_valid(PE_4_C_in_valid),
    .C_in_bits(PE_4_C_in_bits),
    .A_out_ready(PE_4_A_out_ready),
    .A_out_valid(PE_4_A_out_valid),
    .A_out_bits(PE_4_A_out_bits),
    .C_out_ready(PE_4_C_out_ready),
    .C_out_valid(PE_4_C_out_valid),
    .C_out_bits(PE_4_C_out_bits)
  );
  PE_61 PE_5 ( // @[systolic_array.scala 41:26]
    .clock(PE_5_clock),
    .reset(PE_5_reset),
    .A_in_ready(PE_5_A_in_ready),
    .A_in_valid(PE_5_A_in_valid),
    .A_in_bits(PE_5_A_in_bits),
    .C_in_ready(PE_5_C_in_ready),
    .C_in_valid(PE_5_C_in_valid),
    .C_in_bits(PE_5_C_in_bits),
    .A_out_ready(PE_5_A_out_ready),
    .A_out_valid(PE_5_A_out_valid),
    .A_out_bits(PE_5_A_out_bits),
    .C_out_ready(PE_5_C_out_ready),
    .C_out_valid(PE_5_C_out_valid),
    .C_out_bits(PE_5_C_out_bits)
  );
  PE_62 PE_6 ( // @[systolic_array.scala 42:26]
    .clock(PE_6_clock),
    .reset(PE_6_reset),
    .A_in_ready(PE_6_A_in_ready),
    .A_in_valid(PE_6_A_in_valid),
    .A_in_bits(PE_6_A_in_bits),
    .C_in_ready(PE_6_C_in_ready),
    .C_in_valid(PE_6_C_in_valid),
    .C_in_bits(PE_6_C_in_bits),
    .A_out_ready(PE_6_A_out_ready),
    .A_out_valid(PE_6_A_out_valid),
    .A_out_bits(PE_6_A_out_bits),
    .C_out_ready(PE_6_C_out_ready),
    .C_out_valid(PE_6_C_out_valid),
    .C_out_bits(PE_6_C_out_bits)
  );
  PE_63 PE_7 ( // @[systolic_array.scala 43:26]
    .clock(PE_7_clock),
    .reset(PE_7_reset),
    .A_in_ready(PE_7_A_in_ready),
    .A_in_valid(PE_7_A_in_valid),
    .A_in_bits(PE_7_A_in_bits),
    .C_in_ready(PE_7_C_in_ready),
    .C_in_valid(PE_7_C_in_valid),
    .C_in_bits(PE_7_C_in_bits),
    .C_out_ready(PE_7_C_out_ready),
    .C_out_valid(PE_7_C_out_valid),
    .C_out_bits(PE_7_C_out_bits)
  );
  assign var0_ready = PE_0_A_in_ready; // @[systolic_array.scala 45:19]
  assign var1_ready = PE_0_C_in_ready; // @[systolic_array.scala 46:19]
  assign var2_ready = PE_1_C_in_ready; // @[systolic_array.scala 49:19]
  assign var3_ready = PE_2_C_in_ready; // @[systolic_array.scala 52:19]
  assign var4_ready = PE_3_C_in_ready; // @[systolic_array.scala 55:19]
  assign var5_ready = PE_4_C_in_ready; // @[systolic_array.scala 58:19]
  assign var6_ready = PE_5_C_in_ready; // @[systolic_array.scala 61:19]
  assign var7_ready = PE_6_C_in_ready; // @[systolic_array.scala 64:19]
  assign var8_ready = PE_7_C_in_ready; // @[systolic_array.scala 67:19]
  assign var9_valid = PE_0_C_out_valid; // @[systolic_array.scala 47:14]
  assign var9_bits = PE_0_C_out_bits; // @[systolic_array.scala 47:14]
  assign var10_valid = PE_1_C_out_valid; // @[systolic_array.scala 50:15]
  assign var10_bits = PE_1_C_out_bits; // @[systolic_array.scala 50:15]
  assign var11_valid = PE_2_C_out_valid; // @[systolic_array.scala 53:15]
  assign var11_bits = PE_2_C_out_bits; // @[systolic_array.scala 53:15]
  assign var12_valid = PE_3_C_out_valid; // @[systolic_array.scala 56:15]
  assign var12_bits = PE_3_C_out_bits; // @[systolic_array.scala 56:15]
  assign var13_valid = PE_4_C_out_valid; // @[systolic_array.scala 59:15]
  assign var13_bits = PE_4_C_out_bits; // @[systolic_array.scala 59:15]
  assign var14_valid = PE_5_C_out_valid; // @[systolic_array.scala 62:15]
  assign var14_bits = PE_5_C_out_bits; // @[systolic_array.scala 62:15]
  assign var15_valid = PE_6_C_out_valid; // @[systolic_array.scala 65:15]
  assign var15_bits = PE_6_C_out_bits; // @[systolic_array.scala 65:15]
  assign var16_valid = PE_7_C_out_valid; // @[systolic_array.scala 68:15]
  assign var16_bits = PE_7_C_out_bits; // @[systolic_array.scala 68:15]
  assign PE_0_clock = clock;
  assign PE_0_reset = reset;
  assign PE_0_A_in_valid = var0_valid; // @[systolic_array.scala 45:19]
  assign PE_0_A_in_bits = var0_bits; // @[systolic_array.scala 45:19]
  assign PE_0_C_in_valid = var1_valid; // @[systolic_array.scala 46:19]
  assign PE_0_C_in_bits = var1_bits; // @[systolic_array.scala 46:19]
  assign PE_0_A_out_ready = PE_1_A_in_ready; // @[systolic_array.scala 48:19]
  assign PE_0_C_out_ready = var9_ready; // @[systolic_array.scala 47:14]
  assign PE_1_clock = clock;
  assign PE_1_reset = reset;
  assign PE_1_A_in_valid = PE_0_A_out_valid; // @[systolic_array.scala 48:19]
  assign PE_1_A_in_bits = PE_0_A_out_bits; // @[systolic_array.scala 48:19]
  assign PE_1_C_in_valid = var2_valid; // @[systolic_array.scala 49:19]
  assign PE_1_C_in_bits = var2_bits; // @[systolic_array.scala 49:19]
  assign PE_1_A_out_ready = PE_2_A_in_ready; // @[systolic_array.scala 51:19]
  assign PE_1_C_out_ready = var10_ready; // @[systolic_array.scala 50:15]
  assign PE_2_clock = clock;
  assign PE_2_reset = reset;
  assign PE_2_A_in_valid = PE_1_A_out_valid; // @[systolic_array.scala 51:19]
  assign PE_2_A_in_bits = PE_1_A_out_bits; // @[systolic_array.scala 51:19]
  assign PE_2_C_in_valid = var3_valid; // @[systolic_array.scala 52:19]
  assign PE_2_C_in_bits = var3_bits; // @[systolic_array.scala 52:19]
  assign PE_2_A_out_ready = PE_3_A_in_ready; // @[systolic_array.scala 54:19]
  assign PE_2_C_out_ready = var11_ready; // @[systolic_array.scala 53:15]
  assign PE_3_clock = clock;
  assign PE_3_reset = reset;
  assign PE_3_A_in_valid = PE_2_A_out_valid; // @[systolic_array.scala 54:19]
  assign PE_3_A_in_bits = PE_2_A_out_bits; // @[systolic_array.scala 54:19]
  assign PE_3_C_in_valid = var4_valid; // @[systolic_array.scala 55:19]
  assign PE_3_C_in_bits = var4_bits; // @[systolic_array.scala 55:19]
  assign PE_3_A_out_ready = PE_4_A_in_ready; // @[systolic_array.scala 57:19]
  assign PE_3_C_out_ready = var12_ready; // @[systolic_array.scala 56:15]
  assign PE_4_clock = clock;
  assign PE_4_reset = reset;
  assign PE_4_A_in_valid = PE_3_A_out_valid; // @[systolic_array.scala 57:19]
  assign PE_4_A_in_bits = PE_3_A_out_bits; // @[systolic_array.scala 57:19]
  assign PE_4_C_in_valid = var5_valid; // @[systolic_array.scala 58:19]
  assign PE_4_C_in_bits = var5_bits; // @[systolic_array.scala 58:19]
  assign PE_4_A_out_ready = PE_5_A_in_ready; // @[systolic_array.scala 60:19]
  assign PE_4_C_out_ready = var13_ready; // @[systolic_array.scala 59:15]
  assign PE_5_clock = clock;
  assign PE_5_reset = reset;
  assign PE_5_A_in_valid = PE_4_A_out_valid; // @[systolic_array.scala 60:19]
  assign PE_5_A_in_bits = PE_4_A_out_bits; // @[systolic_array.scala 60:19]
  assign PE_5_C_in_valid = var6_valid; // @[systolic_array.scala 61:19]
  assign PE_5_C_in_bits = var6_bits; // @[systolic_array.scala 61:19]
  assign PE_5_A_out_ready = PE_6_A_in_ready; // @[systolic_array.scala 63:19]
  assign PE_5_C_out_ready = var14_ready; // @[systolic_array.scala 62:15]
  assign PE_6_clock = clock;
  assign PE_6_reset = reset;
  assign PE_6_A_in_valid = PE_5_A_out_valid; // @[systolic_array.scala 63:19]
  assign PE_6_A_in_bits = PE_5_A_out_bits; // @[systolic_array.scala 63:19]
  assign PE_6_C_in_valid = var7_valid; // @[systolic_array.scala 64:19]
  assign PE_6_C_in_bits = var7_bits; // @[systolic_array.scala 64:19]
  assign PE_6_A_out_ready = PE_7_A_in_ready; // @[systolic_array.scala 66:19]
  assign PE_6_C_out_ready = var15_ready; // @[systolic_array.scala 65:15]
  assign PE_7_clock = clock;
  assign PE_7_reset = reset;
  assign PE_7_A_in_valid = PE_6_A_out_valid; // @[systolic_array.scala 66:19]
  assign PE_7_A_in_bits = PE_6_A_out_bits; // @[systolic_array.scala 66:19]
  assign PE_7_C_in_valid = var8_valid; // @[systolic_array.scala 67:19]
  assign PE_7_C_in_bits = var8_bits; // @[systolic_array.scala 67:19]
  assign PE_7_C_out_ready = var16_ready; // @[systolic_array.scala 68:15]
endmodule
module main(
  input         clock,
  input         reset,
  output        var17_ready,
  input         var17_valid,
  input  [31:0] var17_bits,
  output        var18_ready,
  input         var18_valid,
  input  [31:0] var18_bits,
  output        var19_ready,
  input         var19_valid,
  input  [31:0] var19_bits,
  output        var20_ready,
  input         var20_valid,
  input  [31:0] var20_bits,
  output        var21_ready,
  input         var21_valid,
  input  [31:0] var21_bits,
  output        var22_ready,
  input         var22_valid,
  input  [31:0] var22_bits,
  output        var23_ready,
  input         var23_valid,
  input  [31:0] var23_bits,
  output        var24_ready,
  input         var24_valid,
  input  [31:0] var24_bits,
  output        var25_ready,
  input         var25_valid,
  input  [31:0] var25_bits,
  output        var26_ready,
  input         var26_valid,
  input  [31:0] var26_bits,
  output        var27_ready,
  input         var27_valid,
  input  [31:0] var27_bits,
  output        var28_ready,
  input         var28_valid,
  input  [31:0] var28_bits,
  output        var29_ready,
  input         var29_valid,
  input  [31:0] var29_bits,
  output        var30_ready,
  input         var30_valid,
  input  [31:0] var30_bits,
  output        var31_ready,
  input         var31_valid,
  input  [31:0] var31_bits,
  output        var32_ready,
  input         var32_valid,
  input  [31:0] var32_bits,
  input         var33_ready,
  output        var33_valid,
  output [31:0] var33_bits,
  input         var34_ready,
  output        var34_valid,
  output [31:0] var34_bits,
  input         var35_ready,
  output        var35_valid,
  output [31:0] var35_bits,
  input         var36_ready,
  output        var36_valid,
  output [31:0] var36_bits,
  input         var37_ready,
  output        var37_valid,
  output [31:0] var37_bits,
  input         var38_ready,
  output        var38_valid,
  output [31:0] var38_bits,
  input         var39_ready,
  output        var39_valid,
  output [31:0] var39_bits,
  input         var40_ready,
  output        var40_valid,
  output [31:0] var40_bits
);
  wire  Line_0_clock; // @[systolic_array.scala 103:28]
  wire  Line_0_reset; // @[systolic_array.scala 103:28]
  wire  Line_0_var0_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var0_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var0_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var1_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var1_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var1_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var2_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var2_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var2_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var3_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var3_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var3_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var4_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var4_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var4_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var5_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var5_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var5_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var6_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var6_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var6_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var7_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var7_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var7_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var8_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var8_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var8_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var9_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var9_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var9_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var10_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var10_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var10_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var11_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var11_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var11_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var12_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var12_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var12_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var13_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var13_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var13_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var14_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var14_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var14_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var15_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var15_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var15_bits; // @[systolic_array.scala 103:28]
  wire  Line_0_var16_ready; // @[systolic_array.scala 103:28]
  wire  Line_0_var16_valid; // @[systolic_array.scala 103:28]
  wire [31:0] Line_0_var16_bits; // @[systolic_array.scala 103:28]
  wire  Line_1_clock; // @[systolic_array.scala 104:28]
  wire  Line_1_reset; // @[systolic_array.scala 104:28]
  wire  Line_1_var0_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var0_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var0_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var1_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var1_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var1_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var2_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var2_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var2_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var3_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var3_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var3_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var4_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var4_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var4_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var5_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var5_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var5_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var6_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var6_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var6_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var7_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var7_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var7_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var8_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var8_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var8_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var9_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var9_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var9_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var10_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var10_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var10_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var11_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var11_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var11_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var12_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var12_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var12_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var13_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var13_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var13_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var14_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var14_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var14_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var15_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var15_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var15_bits; // @[systolic_array.scala 104:28]
  wire  Line_1_var16_ready; // @[systolic_array.scala 104:28]
  wire  Line_1_var16_valid; // @[systolic_array.scala 104:28]
  wire [31:0] Line_1_var16_bits; // @[systolic_array.scala 104:28]
  wire  Line_2_clock; // @[systolic_array.scala 105:28]
  wire  Line_2_reset; // @[systolic_array.scala 105:28]
  wire  Line_2_var0_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var0_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var0_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var1_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var1_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var1_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var2_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var2_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var2_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var3_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var3_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var3_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var4_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var4_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var4_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var5_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var5_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var5_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var6_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var6_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var6_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var7_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var7_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var7_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var8_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var8_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var8_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var9_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var9_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var9_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var10_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var10_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var10_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var11_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var11_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var11_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var12_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var12_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var12_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var13_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var13_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var13_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var14_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var14_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var14_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var15_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var15_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var15_bits; // @[systolic_array.scala 105:28]
  wire  Line_2_var16_ready; // @[systolic_array.scala 105:28]
  wire  Line_2_var16_valid; // @[systolic_array.scala 105:28]
  wire [31:0] Line_2_var16_bits; // @[systolic_array.scala 105:28]
  wire  Line_3_clock; // @[systolic_array.scala 106:28]
  wire  Line_3_reset; // @[systolic_array.scala 106:28]
  wire  Line_3_var0_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var0_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var0_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var1_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var1_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var1_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var2_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var2_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var2_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var3_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var3_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var3_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var4_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var4_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var4_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var5_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var5_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var5_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var6_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var6_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var6_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var7_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var7_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var7_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var8_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var8_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var8_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var9_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var9_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var9_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var10_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var10_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var10_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var11_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var11_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var11_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var12_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var12_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var12_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var13_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var13_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var13_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var14_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var14_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var14_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var15_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var15_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var15_bits; // @[systolic_array.scala 106:28]
  wire  Line_3_var16_ready; // @[systolic_array.scala 106:28]
  wire  Line_3_var16_valid; // @[systolic_array.scala 106:28]
  wire [31:0] Line_3_var16_bits; // @[systolic_array.scala 106:28]
  wire  Line_4_clock; // @[systolic_array.scala 107:28]
  wire  Line_4_reset; // @[systolic_array.scala 107:28]
  wire  Line_4_var0_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var0_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var0_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var1_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var1_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var1_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var2_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var2_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var2_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var3_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var3_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var3_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var4_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var4_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var4_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var5_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var5_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var5_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var6_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var6_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var6_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var7_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var7_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var7_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var8_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var8_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var8_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var9_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var9_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var9_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var10_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var10_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var10_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var11_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var11_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var11_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var12_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var12_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var12_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var13_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var13_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var13_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var14_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var14_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var14_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var15_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var15_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var15_bits; // @[systolic_array.scala 107:28]
  wire  Line_4_var16_ready; // @[systolic_array.scala 107:28]
  wire  Line_4_var16_valid; // @[systolic_array.scala 107:28]
  wire [31:0] Line_4_var16_bits; // @[systolic_array.scala 107:28]
  wire  Line_5_clock; // @[systolic_array.scala 108:28]
  wire  Line_5_reset; // @[systolic_array.scala 108:28]
  wire  Line_5_var0_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var0_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var0_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var1_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var1_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var1_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var2_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var2_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var2_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var3_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var3_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var3_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var4_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var4_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var4_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var5_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var5_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var5_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var6_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var6_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var6_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var7_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var7_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var7_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var8_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var8_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var8_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var9_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var9_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var9_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var10_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var10_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var10_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var11_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var11_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var11_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var12_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var12_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var12_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var13_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var13_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var13_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var14_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var14_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var14_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var15_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var15_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var15_bits; // @[systolic_array.scala 108:28]
  wire  Line_5_var16_ready; // @[systolic_array.scala 108:28]
  wire  Line_5_var16_valid; // @[systolic_array.scala 108:28]
  wire [31:0] Line_5_var16_bits; // @[systolic_array.scala 108:28]
  wire  Line_6_clock; // @[systolic_array.scala 109:28]
  wire  Line_6_reset; // @[systolic_array.scala 109:28]
  wire  Line_6_var0_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var0_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var0_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var1_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var1_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var1_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var2_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var2_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var2_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var3_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var3_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var3_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var4_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var4_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var4_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var5_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var5_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var5_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var6_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var6_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var6_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var7_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var7_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var7_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var8_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var8_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var8_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var9_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var9_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var9_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var10_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var10_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var10_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var11_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var11_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var11_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var12_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var12_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var12_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var13_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var13_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var13_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var14_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var14_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var14_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var15_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var15_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var15_bits; // @[systolic_array.scala 109:28]
  wire  Line_6_var16_ready; // @[systolic_array.scala 109:28]
  wire  Line_6_var16_valid; // @[systolic_array.scala 109:28]
  wire [31:0] Line_6_var16_bits; // @[systolic_array.scala 109:28]
  wire  Line_7_clock; // @[systolic_array.scala 110:28]
  wire  Line_7_reset; // @[systolic_array.scala 110:28]
  wire  Line_7_var0_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var0_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var0_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var1_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var1_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var1_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var2_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var2_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var2_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var3_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var3_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var3_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var4_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var4_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var4_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var5_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var5_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var5_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var6_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var6_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var6_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var7_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var7_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var7_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var8_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var8_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var8_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var9_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var9_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var9_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var10_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var10_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var10_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var11_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var11_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var11_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var12_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var12_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var12_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var13_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var13_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var13_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var14_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var14_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var14_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var15_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var15_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var15_bits; // @[systolic_array.scala 110:28]
  wire  Line_7_var16_ready; // @[systolic_array.scala 110:28]
  wire  Line_7_var16_valid; // @[systolic_array.scala 110:28]
  wire [31:0] Line_7_var16_bits; // @[systolic_array.scala 110:28]
  PE_line Line_0 ( // @[systolic_array.scala 103:28]
    .clock(Line_0_clock),
    .reset(Line_0_reset),
    .var0_ready(Line_0_var0_ready),
    .var0_valid(Line_0_var0_valid),
    .var0_bits(Line_0_var0_bits),
    .var1_ready(Line_0_var1_ready),
    .var1_valid(Line_0_var1_valid),
    .var1_bits(Line_0_var1_bits),
    .var2_ready(Line_0_var2_ready),
    .var2_valid(Line_0_var2_valid),
    .var2_bits(Line_0_var2_bits),
    .var3_ready(Line_0_var3_ready),
    .var3_valid(Line_0_var3_valid),
    .var3_bits(Line_0_var3_bits),
    .var4_ready(Line_0_var4_ready),
    .var4_valid(Line_0_var4_valid),
    .var4_bits(Line_0_var4_bits),
    .var5_ready(Line_0_var5_ready),
    .var5_valid(Line_0_var5_valid),
    .var5_bits(Line_0_var5_bits),
    .var6_ready(Line_0_var6_ready),
    .var6_valid(Line_0_var6_valid),
    .var6_bits(Line_0_var6_bits),
    .var7_ready(Line_0_var7_ready),
    .var7_valid(Line_0_var7_valid),
    .var7_bits(Line_0_var7_bits),
    .var8_ready(Line_0_var8_ready),
    .var8_valid(Line_0_var8_valid),
    .var8_bits(Line_0_var8_bits),
    .var9_ready(Line_0_var9_ready),
    .var9_valid(Line_0_var9_valid),
    .var9_bits(Line_0_var9_bits),
    .var10_ready(Line_0_var10_ready),
    .var10_valid(Line_0_var10_valid),
    .var10_bits(Line_0_var10_bits),
    .var11_ready(Line_0_var11_ready),
    .var11_valid(Line_0_var11_valid),
    .var11_bits(Line_0_var11_bits),
    .var12_ready(Line_0_var12_ready),
    .var12_valid(Line_0_var12_valid),
    .var12_bits(Line_0_var12_bits),
    .var13_ready(Line_0_var13_ready),
    .var13_valid(Line_0_var13_valid),
    .var13_bits(Line_0_var13_bits),
    .var14_ready(Line_0_var14_ready),
    .var14_valid(Line_0_var14_valid),
    .var14_bits(Line_0_var14_bits),
    .var15_ready(Line_0_var15_ready),
    .var15_valid(Line_0_var15_valid),
    .var15_bits(Line_0_var15_bits),
    .var16_ready(Line_0_var16_ready),
    .var16_valid(Line_0_var16_valid),
    .var16_bits(Line_0_var16_bits)
  );
  PE_line_1 Line_1 ( // @[systolic_array.scala 104:28]
    .clock(Line_1_clock),
    .reset(Line_1_reset),
    .var0_ready(Line_1_var0_ready),
    .var0_valid(Line_1_var0_valid),
    .var0_bits(Line_1_var0_bits),
    .var1_ready(Line_1_var1_ready),
    .var1_valid(Line_1_var1_valid),
    .var1_bits(Line_1_var1_bits),
    .var2_ready(Line_1_var2_ready),
    .var2_valid(Line_1_var2_valid),
    .var2_bits(Line_1_var2_bits),
    .var3_ready(Line_1_var3_ready),
    .var3_valid(Line_1_var3_valid),
    .var3_bits(Line_1_var3_bits),
    .var4_ready(Line_1_var4_ready),
    .var4_valid(Line_1_var4_valid),
    .var4_bits(Line_1_var4_bits),
    .var5_ready(Line_1_var5_ready),
    .var5_valid(Line_1_var5_valid),
    .var5_bits(Line_1_var5_bits),
    .var6_ready(Line_1_var6_ready),
    .var6_valid(Line_1_var6_valid),
    .var6_bits(Line_1_var6_bits),
    .var7_ready(Line_1_var7_ready),
    .var7_valid(Line_1_var7_valid),
    .var7_bits(Line_1_var7_bits),
    .var8_ready(Line_1_var8_ready),
    .var8_valid(Line_1_var8_valid),
    .var8_bits(Line_1_var8_bits),
    .var9_ready(Line_1_var9_ready),
    .var9_valid(Line_1_var9_valid),
    .var9_bits(Line_1_var9_bits),
    .var10_ready(Line_1_var10_ready),
    .var10_valid(Line_1_var10_valid),
    .var10_bits(Line_1_var10_bits),
    .var11_ready(Line_1_var11_ready),
    .var11_valid(Line_1_var11_valid),
    .var11_bits(Line_1_var11_bits),
    .var12_ready(Line_1_var12_ready),
    .var12_valid(Line_1_var12_valid),
    .var12_bits(Line_1_var12_bits),
    .var13_ready(Line_1_var13_ready),
    .var13_valid(Line_1_var13_valid),
    .var13_bits(Line_1_var13_bits),
    .var14_ready(Line_1_var14_ready),
    .var14_valid(Line_1_var14_valid),
    .var14_bits(Line_1_var14_bits),
    .var15_ready(Line_1_var15_ready),
    .var15_valid(Line_1_var15_valid),
    .var15_bits(Line_1_var15_bits),
    .var16_ready(Line_1_var16_ready),
    .var16_valid(Line_1_var16_valid),
    .var16_bits(Line_1_var16_bits)
  );
  PE_line_2 Line_2 ( // @[systolic_array.scala 105:28]
    .clock(Line_2_clock),
    .reset(Line_2_reset),
    .var0_ready(Line_2_var0_ready),
    .var0_valid(Line_2_var0_valid),
    .var0_bits(Line_2_var0_bits),
    .var1_ready(Line_2_var1_ready),
    .var1_valid(Line_2_var1_valid),
    .var1_bits(Line_2_var1_bits),
    .var2_ready(Line_2_var2_ready),
    .var2_valid(Line_2_var2_valid),
    .var2_bits(Line_2_var2_bits),
    .var3_ready(Line_2_var3_ready),
    .var3_valid(Line_2_var3_valid),
    .var3_bits(Line_2_var3_bits),
    .var4_ready(Line_2_var4_ready),
    .var4_valid(Line_2_var4_valid),
    .var4_bits(Line_2_var4_bits),
    .var5_ready(Line_2_var5_ready),
    .var5_valid(Line_2_var5_valid),
    .var5_bits(Line_2_var5_bits),
    .var6_ready(Line_2_var6_ready),
    .var6_valid(Line_2_var6_valid),
    .var6_bits(Line_2_var6_bits),
    .var7_ready(Line_2_var7_ready),
    .var7_valid(Line_2_var7_valid),
    .var7_bits(Line_2_var7_bits),
    .var8_ready(Line_2_var8_ready),
    .var8_valid(Line_2_var8_valid),
    .var8_bits(Line_2_var8_bits),
    .var9_ready(Line_2_var9_ready),
    .var9_valid(Line_2_var9_valid),
    .var9_bits(Line_2_var9_bits),
    .var10_ready(Line_2_var10_ready),
    .var10_valid(Line_2_var10_valid),
    .var10_bits(Line_2_var10_bits),
    .var11_ready(Line_2_var11_ready),
    .var11_valid(Line_2_var11_valid),
    .var11_bits(Line_2_var11_bits),
    .var12_ready(Line_2_var12_ready),
    .var12_valid(Line_2_var12_valid),
    .var12_bits(Line_2_var12_bits),
    .var13_ready(Line_2_var13_ready),
    .var13_valid(Line_2_var13_valid),
    .var13_bits(Line_2_var13_bits),
    .var14_ready(Line_2_var14_ready),
    .var14_valid(Line_2_var14_valid),
    .var14_bits(Line_2_var14_bits),
    .var15_ready(Line_2_var15_ready),
    .var15_valid(Line_2_var15_valid),
    .var15_bits(Line_2_var15_bits),
    .var16_ready(Line_2_var16_ready),
    .var16_valid(Line_2_var16_valid),
    .var16_bits(Line_2_var16_bits)
  );
  PE_line_3 Line_3 ( // @[systolic_array.scala 106:28]
    .clock(Line_3_clock),
    .reset(Line_3_reset),
    .var0_ready(Line_3_var0_ready),
    .var0_valid(Line_3_var0_valid),
    .var0_bits(Line_3_var0_bits),
    .var1_ready(Line_3_var1_ready),
    .var1_valid(Line_3_var1_valid),
    .var1_bits(Line_3_var1_bits),
    .var2_ready(Line_3_var2_ready),
    .var2_valid(Line_3_var2_valid),
    .var2_bits(Line_3_var2_bits),
    .var3_ready(Line_3_var3_ready),
    .var3_valid(Line_3_var3_valid),
    .var3_bits(Line_3_var3_bits),
    .var4_ready(Line_3_var4_ready),
    .var4_valid(Line_3_var4_valid),
    .var4_bits(Line_3_var4_bits),
    .var5_ready(Line_3_var5_ready),
    .var5_valid(Line_3_var5_valid),
    .var5_bits(Line_3_var5_bits),
    .var6_ready(Line_3_var6_ready),
    .var6_valid(Line_3_var6_valid),
    .var6_bits(Line_3_var6_bits),
    .var7_ready(Line_3_var7_ready),
    .var7_valid(Line_3_var7_valid),
    .var7_bits(Line_3_var7_bits),
    .var8_ready(Line_3_var8_ready),
    .var8_valid(Line_3_var8_valid),
    .var8_bits(Line_3_var8_bits),
    .var9_ready(Line_3_var9_ready),
    .var9_valid(Line_3_var9_valid),
    .var9_bits(Line_3_var9_bits),
    .var10_ready(Line_3_var10_ready),
    .var10_valid(Line_3_var10_valid),
    .var10_bits(Line_3_var10_bits),
    .var11_ready(Line_3_var11_ready),
    .var11_valid(Line_3_var11_valid),
    .var11_bits(Line_3_var11_bits),
    .var12_ready(Line_3_var12_ready),
    .var12_valid(Line_3_var12_valid),
    .var12_bits(Line_3_var12_bits),
    .var13_ready(Line_3_var13_ready),
    .var13_valid(Line_3_var13_valid),
    .var13_bits(Line_3_var13_bits),
    .var14_ready(Line_3_var14_ready),
    .var14_valid(Line_3_var14_valid),
    .var14_bits(Line_3_var14_bits),
    .var15_ready(Line_3_var15_ready),
    .var15_valid(Line_3_var15_valid),
    .var15_bits(Line_3_var15_bits),
    .var16_ready(Line_3_var16_ready),
    .var16_valid(Line_3_var16_valid),
    .var16_bits(Line_3_var16_bits)
  );
  PE_line_4 Line_4 ( // @[systolic_array.scala 107:28]
    .clock(Line_4_clock),
    .reset(Line_4_reset),
    .var0_ready(Line_4_var0_ready),
    .var0_valid(Line_4_var0_valid),
    .var0_bits(Line_4_var0_bits),
    .var1_ready(Line_4_var1_ready),
    .var1_valid(Line_4_var1_valid),
    .var1_bits(Line_4_var1_bits),
    .var2_ready(Line_4_var2_ready),
    .var2_valid(Line_4_var2_valid),
    .var2_bits(Line_4_var2_bits),
    .var3_ready(Line_4_var3_ready),
    .var3_valid(Line_4_var3_valid),
    .var3_bits(Line_4_var3_bits),
    .var4_ready(Line_4_var4_ready),
    .var4_valid(Line_4_var4_valid),
    .var4_bits(Line_4_var4_bits),
    .var5_ready(Line_4_var5_ready),
    .var5_valid(Line_4_var5_valid),
    .var5_bits(Line_4_var5_bits),
    .var6_ready(Line_4_var6_ready),
    .var6_valid(Line_4_var6_valid),
    .var6_bits(Line_4_var6_bits),
    .var7_ready(Line_4_var7_ready),
    .var7_valid(Line_4_var7_valid),
    .var7_bits(Line_4_var7_bits),
    .var8_ready(Line_4_var8_ready),
    .var8_valid(Line_4_var8_valid),
    .var8_bits(Line_4_var8_bits),
    .var9_ready(Line_4_var9_ready),
    .var9_valid(Line_4_var9_valid),
    .var9_bits(Line_4_var9_bits),
    .var10_ready(Line_4_var10_ready),
    .var10_valid(Line_4_var10_valid),
    .var10_bits(Line_4_var10_bits),
    .var11_ready(Line_4_var11_ready),
    .var11_valid(Line_4_var11_valid),
    .var11_bits(Line_4_var11_bits),
    .var12_ready(Line_4_var12_ready),
    .var12_valid(Line_4_var12_valid),
    .var12_bits(Line_4_var12_bits),
    .var13_ready(Line_4_var13_ready),
    .var13_valid(Line_4_var13_valid),
    .var13_bits(Line_4_var13_bits),
    .var14_ready(Line_4_var14_ready),
    .var14_valid(Line_4_var14_valid),
    .var14_bits(Line_4_var14_bits),
    .var15_ready(Line_4_var15_ready),
    .var15_valid(Line_4_var15_valid),
    .var15_bits(Line_4_var15_bits),
    .var16_ready(Line_4_var16_ready),
    .var16_valid(Line_4_var16_valid),
    .var16_bits(Line_4_var16_bits)
  );
  PE_line_5 Line_5 ( // @[systolic_array.scala 108:28]
    .clock(Line_5_clock),
    .reset(Line_5_reset),
    .var0_ready(Line_5_var0_ready),
    .var0_valid(Line_5_var0_valid),
    .var0_bits(Line_5_var0_bits),
    .var1_ready(Line_5_var1_ready),
    .var1_valid(Line_5_var1_valid),
    .var1_bits(Line_5_var1_bits),
    .var2_ready(Line_5_var2_ready),
    .var2_valid(Line_5_var2_valid),
    .var2_bits(Line_5_var2_bits),
    .var3_ready(Line_5_var3_ready),
    .var3_valid(Line_5_var3_valid),
    .var3_bits(Line_5_var3_bits),
    .var4_ready(Line_5_var4_ready),
    .var4_valid(Line_5_var4_valid),
    .var4_bits(Line_5_var4_bits),
    .var5_ready(Line_5_var5_ready),
    .var5_valid(Line_5_var5_valid),
    .var5_bits(Line_5_var5_bits),
    .var6_ready(Line_5_var6_ready),
    .var6_valid(Line_5_var6_valid),
    .var6_bits(Line_5_var6_bits),
    .var7_ready(Line_5_var7_ready),
    .var7_valid(Line_5_var7_valid),
    .var7_bits(Line_5_var7_bits),
    .var8_ready(Line_5_var8_ready),
    .var8_valid(Line_5_var8_valid),
    .var8_bits(Line_5_var8_bits),
    .var9_ready(Line_5_var9_ready),
    .var9_valid(Line_5_var9_valid),
    .var9_bits(Line_5_var9_bits),
    .var10_ready(Line_5_var10_ready),
    .var10_valid(Line_5_var10_valid),
    .var10_bits(Line_5_var10_bits),
    .var11_ready(Line_5_var11_ready),
    .var11_valid(Line_5_var11_valid),
    .var11_bits(Line_5_var11_bits),
    .var12_ready(Line_5_var12_ready),
    .var12_valid(Line_5_var12_valid),
    .var12_bits(Line_5_var12_bits),
    .var13_ready(Line_5_var13_ready),
    .var13_valid(Line_5_var13_valid),
    .var13_bits(Line_5_var13_bits),
    .var14_ready(Line_5_var14_ready),
    .var14_valid(Line_5_var14_valid),
    .var14_bits(Line_5_var14_bits),
    .var15_ready(Line_5_var15_ready),
    .var15_valid(Line_5_var15_valid),
    .var15_bits(Line_5_var15_bits),
    .var16_ready(Line_5_var16_ready),
    .var16_valid(Line_5_var16_valid),
    .var16_bits(Line_5_var16_bits)
  );
  PE_line_6 Line_6 ( // @[systolic_array.scala 109:28]
    .clock(Line_6_clock),
    .reset(Line_6_reset),
    .var0_ready(Line_6_var0_ready),
    .var0_valid(Line_6_var0_valid),
    .var0_bits(Line_6_var0_bits),
    .var1_ready(Line_6_var1_ready),
    .var1_valid(Line_6_var1_valid),
    .var1_bits(Line_6_var1_bits),
    .var2_ready(Line_6_var2_ready),
    .var2_valid(Line_6_var2_valid),
    .var2_bits(Line_6_var2_bits),
    .var3_ready(Line_6_var3_ready),
    .var3_valid(Line_6_var3_valid),
    .var3_bits(Line_6_var3_bits),
    .var4_ready(Line_6_var4_ready),
    .var4_valid(Line_6_var4_valid),
    .var4_bits(Line_6_var4_bits),
    .var5_ready(Line_6_var5_ready),
    .var5_valid(Line_6_var5_valid),
    .var5_bits(Line_6_var5_bits),
    .var6_ready(Line_6_var6_ready),
    .var6_valid(Line_6_var6_valid),
    .var6_bits(Line_6_var6_bits),
    .var7_ready(Line_6_var7_ready),
    .var7_valid(Line_6_var7_valid),
    .var7_bits(Line_6_var7_bits),
    .var8_ready(Line_6_var8_ready),
    .var8_valid(Line_6_var8_valid),
    .var8_bits(Line_6_var8_bits),
    .var9_ready(Line_6_var9_ready),
    .var9_valid(Line_6_var9_valid),
    .var9_bits(Line_6_var9_bits),
    .var10_ready(Line_6_var10_ready),
    .var10_valid(Line_6_var10_valid),
    .var10_bits(Line_6_var10_bits),
    .var11_ready(Line_6_var11_ready),
    .var11_valid(Line_6_var11_valid),
    .var11_bits(Line_6_var11_bits),
    .var12_ready(Line_6_var12_ready),
    .var12_valid(Line_6_var12_valid),
    .var12_bits(Line_6_var12_bits),
    .var13_ready(Line_6_var13_ready),
    .var13_valid(Line_6_var13_valid),
    .var13_bits(Line_6_var13_bits),
    .var14_ready(Line_6_var14_ready),
    .var14_valid(Line_6_var14_valid),
    .var14_bits(Line_6_var14_bits),
    .var15_ready(Line_6_var15_ready),
    .var15_valid(Line_6_var15_valid),
    .var15_bits(Line_6_var15_bits),
    .var16_ready(Line_6_var16_ready),
    .var16_valid(Line_6_var16_valid),
    .var16_bits(Line_6_var16_bits)
  );
  PE_line_7 Line_7 ( // @[systolic_array.scala 110:28]
    .clock(Line_7_clock),
    .reset(Line_7_reset),
    .var0_ready(Line_7_var0_ready),
    .var0_valid(Line_7_var0_valid),
    .var0_bits(Line_7_var0_bits),
    .var1_ready(Line_7_var1_ready),
    .var1_valid(Line_7_var1_valid),
    .var1_bits(Line_7_var1_bits),
    .var2_ready(Line_7_var2_ready),
    .var2_valid(Line_7_var2_valid),
    .var2_bits(Line_7_var2_bits),
    .var3_ready(Line_7_var3_ready),
    .var3_valid(Line_7_var3_valid),
    .var3_bits(Line_7_var3_bits),
    .var4_ready(Line_7_var4_ready),
    .var4_valid(Line_7_var4_valid),
    .var4_bits(Line_7_var4_bits),
    .var5_ready(Line_7_var5_ready),
    .var5_valid(Line_7_var5_valid),
    .var5_bits(Line_7_var5_bits),
    .var6_ready(Line_7_var6_ready),
    .var6_valid(Line_7_var6_valid),
    .var6_bits(Line_7_var6_bits),
    .var7_ready(Line_7_var7_ready),
    .var7_valid(Line_7_var7_valid),
    .var7_bits(Line_7_var7_bits),
    .var8_ready(Line_7_var8_ready),
    .var8_valid(Line_7_var8_valid),
    .var8_bits(Line_7_var8_bits),
    .var9_ready(Line_7_var9_ready),
    .var9_valid(Line_7_var9_valid),
    .var9_bits(Line_7_var9_bits),
    .var10_ready(Line_7_var10_ready),
    .var10_valid(Line_7_var10_valid),
    .var10_bits(Line_7_var10_bits),
    .var11_ready(Line_7_var11_ready),
    .var11_valid(Line_7_var11_valid),
    .var11_bits(Line_7_var11_bits),
    .var12_ready(Line_7_var12_ready),
    .var12_valid(Line_7_var12_valid),
    .var12_bits(Line_7_var12_bits),
    .var13_ready(Line_7_var13_ready),
    .var13_valid(Line_7_var13_valid),
    .var13_bits(Line_7_var13_bits),
    .var14_ready(Line_7_var14_ready),
    .var14_valid(Line_7_var14_valid),
    .var14_bits(Line_7_var14_bits),
    .var15_ready(Line_7_var15_ready),
    .var15_valid(Line_7_var15_valid),
    .var15_bits(Line_7_var15_bits),
    .var16_ready(Line_7_var16_ready),
    .var16_valid(Line_7_var16_valid),
    .var16_bits(Line_7_var16_bits)
  );
  assign var17_ready = Line_0_var0_ready; // @[systolic_array.scala 111:21]
  assign var18_ready = Line_1_var0_ready; // @[systolic_array.scala 112:21]
  assign var19_ready = Line_2_var0_ready; // @[systolic_array.scala 113:21]
  assign var20_ready = Line_3_var0_ready; // @[systolic_array.scala 114:21]
  assign var21_ready = Line_4_var0_ready; // @[systolic_array.scala 115:21]
  assign var22_ready = Line_5_var0_ready; // @[systolic_array.scala 116:21]
  assign var23_ready = Line_6_var0_ready; // @[systolic_array.scala 117:21]
  assign var24_ready = Line_7_var0_ready; // @[systolic_array.scala 118:21]
  assign var25_ready = Line_0_var1_ready; // @[systolic_array.scala 119:21]
  assign var26_ready = Line_0_var2_ready; // @[systolic_array.scala 120:21]
  assign var27_ready = Line_0_var3_ready; // @[systolic_array.scala 121:21]
  assign var28_ready = Line_0_var4_ready; // @[systolic_array.scala 122:21]
  assign var29_ready = Line_0_var5_ready; // @[systolic_array.scala 123:21]
  assign var30_ready = Line_0_var6_ready; // @[systolic_array.scala 124:21]
  assign var31_ready = Line_0_var7_ready; // @[systolic_array.scala 125:21]
  assign var32_ready = Line_0_var8_ready; // @[systolic_array.scala 126:21]
  assign var33_valid = Line_7_var9_valid; // @[systolic_array.scala 183:15]
  assign var33_bits = Line_7_var9_bits; // @[systolic_array.scala 183:15]
  assign var34_valid = Line_7_var10_valid; // @[systolic_array.scala 184:15]
  assign var34_bits = Line_7_var10_bits; // @[systolic_array.scala 184:15]
  assign var35_valid = Line_7_var11_valid; // @[systolic_array.scala 185:15]
  assign var35_bits = Line_7_var11_bits; // @[systolic_array.scala 185:15]
  assign var36_valid = Line_7_var12_valid; // @[systolic_array.scala 186:15]
  assign var36_bits = Line_7_var12_bits; // @[systolic_array.scala 186:15]
  assign var37_valid = Line_7_var13_valid; // @[systolic_array.scala 187:15]
  assign var37_bits = Line_7_var13_bits; // @[systolic_array.scala 187:15]
  assign var38_valid = Line_7_var14_valid; // @[systolic_array.scala 188:15]
  assign var38_bits = Line_7_var14_bits; // @[systolic_array.scala 188:15]
  assign var39_valid = Line_7_var15_valid; // @[systolic_array.scala 189:15]
  assign var39_bits = Line_7_var15_bits; // @[systolic_array.scala 189:15]
  assign var40_valid = Line_7_var16_valid; // @[systolic_array.scala 190:15]
  assign var40_bits = Line_7_var16_bits; // @[systolic_array.scala 190:15]
  assign Line_0_clock = clock;
  assign Line_0_reset = reset;
  assign Line_0_var0_valid = var17_valid; // @[systolic_array.scala 111:21]
  assign Line_0_var0_bits = var17_bits; // @[systolic_array.scala 111:21]
  assign Line_0_var1_valid = var25_valid; // @[systolic_array.scala 119:21]
  assign Line_0_var1_bits = var25_bits; // @[systolic_array.scala 119:21]
  assign Line_0_var2_valid = var26_valid; // @[systolic_array.scala 120:21]
  assign Line_0_var2_bits = var26_bits; // @[systolic_array.scala 120:21]
  assign Line_0_var3_valid = var27_valid; // @[systolic_array.scala 121:21]
  assign Line_0_var3_bits = var27_bits; // @[systolic_array.scala 121:21]
  assign Line_0_var4_valid = var28_valid; // @[systolic_array.scala 122:21]
  assign Line_0_var4_bits = var28_bits; // @[systolic_array.scala 122:21]
  assign Line_0_var5_valid = var29_valid; // @[systolic_array.scala 123:21]
  assign Line_0_var5_bits = var29_bits; // @[systolic_array.scala 123:21]
  assign Line_0_var6_valid = var30_valid; // @[systolic_array.scala 124:21]
  assign Line_0_var6_bits = var30_bits; // @[systolic_array.scala 124:21]
  assign Line_0_var7_valid = var31_valid; // @[systolic_array.scala 125:21]
  assign Line_0_var7_bits = var31_bits; // @[systolic_array.scala 125:21]
  assign Line_0_var8_valid = var32_valid; // @[systolic_array.scala 126:21]
  assign Line_0_var8_bits = var32_bits; // @[systolic_array.scala 126:21]
  assign Line_0_var9_ready = Line_1_var1_ready; // @[systolic_array.scala 127:21]
  assign Line_0_var10_ready = Line_1_var2_ready; // @[systolic_array.scala 128:21]
  assign Line_0_var11_ready = Line_1_var3_ready; // @[systolic_array.scala 129:21]
  assign Line_0_var12_ready = Line_1_var4_ready; // @[systolic_array.scala 130:21]
  assign Line_0_var13_ready = Line_1_var5_ready; // @[systolic_array.scala 131:21]
  assign Line_0_var14_ready = Line_1_var6_ready; // @[systolic_array.scala 132:21]
  assign Line_0_var15_ready = Line_1_var7_ready; // @[systolic_array.scala 133:21]
  assign Line_0_var16_ready = Line_1_var8_ready; // @[systolic_array.scala 134:21]
  assign Line_1_clock = clock;
  assign Line_1_reset = reset;
  assign Line_1_var0_valid = var18_valid; // @[systolic_array.scala 112:21]
  assign Line_1_var0_bits = var18_bits; // @[systolic_array.scala 112:21]
  assign Line_1_var1_valid = Line_0_var9_valid; // @[systolic_array.scala 127:21]
  assign Line_1_var1_bits = Line_0_var9_bits; // @[systolic_array.scala 127:21]
  assign Line_1_var2_valid = Line_0_var10_valid; // @[systolic_array.scala 128:21]
  assign Line_1_var2_bits = Line_0_var10_bits; // @[systolic_array.scala 128:21]
  assign Line_1_var3_valid = Line_0_var11_valid; // @[systolic_array.scala 129:21]
  assign Line_1_var3_bits = Line_0_var11_bits; // @[systolic_array.scala 129:21]
  assign Line_1_var4_valid = Line_0_var12_valid; // @[systolic_array.scala 130:21]
  assign Line_1_var4_bits = Line_0_var12_bits; // @[systolic_array.scala 130:21]
  assign Line_1_var5_valid = Line_0_var13_valid; // @[systolic_array.scala 131:21]
  assign Line_1_var5_bits = Line_0_var13_bits; // @[systolic_array.scala 131:21]
  assign Line_1_var6_valid = Line_0_var14_valid; // @[systolic_array.scala 132:21]
  assign Line_1_var6_bits = Line_0_var14_bits; // @[systolic_array.scala 132:21]
  assign Line_1_var7_valid = Line_0_var15_valid; // @[systolic_array.scala 133:21]
  assign Line_1_var7_bits = Line_0_var15_bits; // @[systolic_array.scala 133:21]
  assign Line_1_var8_valid = Line_0_var16_valid; // @[systolic_array.scala 134:21]
  assign Line_1_var8_bits = Line_0_var16_bits; // @[systolic_array.scala 134:21]
  assign Line_1_var9_ready = Line_2_var1_ready; // @[systolic_array.scala 135:21]
  assign Line_1_var10_ready = Line_2_var2_ready; // @[systolic_array.scala 136:21]
  assign Line_1_var11_ready = Line_2_var3_ready; // @[systolic_array.scala 137:21]
  assign Line_1_var12_ready = Line_2_var4_ready; // @[systolic_array.scala 138:21]
  assign Line_1_var13_ready = Line_2_var5_ready; // @[systolic_array.scala 139:21]
  assign Line_1_var14_ready = Line_2_var6_ready; // @[systolic_array.scala 140:21]
  assign Line_1_var15_ready = Line_2_var7_ready; // @[systolic_array.scala 141:21]
  assign Line_1_var16_ready = Line_2_var8_ready; // @[systolic_array.scala 142:21]
  assign Line_2_clock = clock;
  assign Line_2_reset = reset;
  assign Line_2_var0_valid = var19_valid; // @[systolic_array.scala 113:21]
  assign Line_2_var0_bits = var19_bits; // @[systolic_array.scala 113:21]
  assign Line_2_var1_valid = Line_1_var9_valid; // @[systolic_array.scala 135:21]
  assign Line_2_var1_bits = Line_1_var9_bits; // @[systolic_array.scala 135:21]
  assign Line_2_var2_valid = Line_1_var10_valid; // @[systolic_array.scala 136:21]
  assign Line_2_var2_bits = Line_1_var10_bits; // @[systolic_array.scala 136:21]
  assign Line_2_var3_valid = Line_1_var11_valid; // @[systolic_array.scala 137:21]
  assign Line_2_var3_bits = Line_1_var11_bits; // @[systolic_array.scala 137:21]
  assign Line_2_var4_valid = Line_1_var12_valid; // @[systolic_array.scala 138:21]
  assign Line_2_var4_bits = Line_1_var12_bits; // @[systolic_array.scala 138:21]
  assign Line_2_var5_valid = Line_1_var13_valid; // @[systolic_array.scala 139:21]
  assign Line_2_var5_bits = Line_1_var13_bits; // @[systolic_array.scala 139:21]
  assign Line_2_var6_valid = Line_1_var14_valid; // @[systolic_array.scala 140:21]
  assign Line_2_var6_bits = Line_1_var14_bits; // @[systolic_array.scala 140:21]
  assign Line_2_var7_valid = Line_1_var15_valid; // @[systolic_array.scala 141:21]
  assign Line_2_var7_bits = Line_1_var15_bits; // @[systolic_array.scala 141:21]
  assign Line_2_var8_valid = Line_1_var16_valid; // @[systolic_array.scala 142:21]
  assign Line_2_var8_bits = Line_1_var16_bits; // @[systolic_array.scala 142:21]
  assign Line_2_var9_ready = Line_3_var1_ready; // @[systolic_array.scala 143:21]
  assign Line_2_var10_ready = Line_3_var2_ready; // @[systolic_array.scala 144:21]
  assign Line_2_var11_ready = Line_3_var3_ready; // @[systolic_array.scala 145:21]
  assign Line_2_var12_ready = Line_3_var4_ready; // @[systolic_array.scala 146:21]
  assign Line_2_var13_ready = Line_3_var5_ready; // @[systolic_array.scala 147:21]
  assign Line_2_var14_ready = Line_3_var6_ready; // @[systolic_array.scala 148:21]
  assign Line_2_var15_ready = Line_3_var7_ready; // @[systolic_array.scala 149:21]
  assign Line_2_var16_ready = Line_3_var8_ready; // @[systolic_array.scala 150:21]
  assign Line_3_clock = clock;
  assign Line_3_reset = reset;
  assign Line_3_var0_valid = var20_valid; // @[systolic_array.scala 114:21]
  assign Line_3_var0_bits = var20_bits; // @[systolic_array.scala 114:21]
  assign Line_3_var1_valid = Line_2_var9_valid; // @[systolic_array.scala 143:21]
  assign Line_3_var1_bits = Line_2_var9_bits; // @[systolic_array.scala 143:21]
  assign Line_3_var2_valid = Line_2_var10_valid; // @[systolic_array.scala 144:21]
  assign Line_3_var2_bits = Line_2_var10_bits; // @[systolic_array.scala 144:21]
  assign Line_3_var3_valid = Line_2_var11_valid; // @[systolic_array.scala 145:21]
  assign Line_3_var3_bits = Line_2_var11_bits; // @[systolic_array.scala 145:21]
  assign Line_3_var4_valid = Line_2_var12_valid; // @[systolic_array.scala 146:21]
  assign Line_3_var4_bits = Line_2_var12_bits; // @[systolic_array.scala 146:21]
  assign Line_3_var5_valid = Line_2_var13_valid; // @[systolic_array.scala 147:21]
  assign Line_3_var5_bits = Line_2_var13_bits; // @[systolic_array.scala 147:21]
  assign Line_3_var6_valid = Line_2_var14_valid; // @[systolic_array.scala 148:21]
  assign Line_3_var6_bits = Line_2_var14_bits; // @[systolic_array.scala 148:21]
  assign Line_3_var7_valid = Line_2_var15_valid; // @[systolic_array.scala 149:21]
  assign Line_3_var7_bits = Line_2_var15_bits; // @[systolic_array.scala 149:21]
  assign Line_3_var8_valid = Line_2_var16_valid; // @[systolic_array.scala 150:21]
  assign Line_3_var8_bits = Line_2_var16_bits; // @[systolic_array.scala 150:21]
  assign Line_3_var9_ready = Line_4_var1_ready; // @[systolic_array.scala 151:21]
  assign Line_3_var10_ready = Line_4_var2_ready; // @[systolic_array.scala 152:21]
  assign Line_3_var11_ready = Line_4_var3_ready; // @[systolic_array.scala 153:21]
  assign Line_3_var12_ready = Line_4_var4_ready; // @[systolic_array.scala 154:21]
  assign Line_3_var13_ready = Line_4_var5_ready; // @[systolic_array.scala 155:21]
  assign Line_3_var14_ready = Line_4_var6_ready; // @[systolic_array.scala 156:21]
  assign Line_3_var15_ready = Line_4_var7_ready; // @[systolic_array.scala 157:21]
  assign Line_3_var16_ready = Line_4_var8_ready; // @[systolic_array.scala 158:21]
  assign Line_4_clock = clock;
  assign Line_4_reset = reset;
  assign Line_4_var0_valid = var21_valid; // @[systolic_array.scala 115:21]
  assign Line_4_var0_bits = var21_bits; // @[systolic_array.scala 115:21]
  assign Line_4_var1_valid = Line_3_var9_valid; // @[systolic_array.scala 151:21]
  assign Line_4_var1_bits = Line_3_var9_bits; // @[systolic_array.scala 151:21]
  assign Line_4_var2_valid = Line_3_var10_valid; // @[systolic_array.scala 152:21]
  assign Line_4_var2_bits = Line_3_var10_bits; // @[systolic_array.scala 152:21]
  assign Line_4_var3_valid = Line_3_var11_valid; // @[systolic_array.scala 153:21]
  assign Line_4_var3_bits = Line_3_var11_bits; // @[systolic_array.scala 153:21]
  assign Line_4_var4_valid = Line_3_var12_valid; // @[systolic_array.scala 154:21]
  assign Line_4_var4_bits = Line_3_var12_bits; // @[systolic_array.scala 154:21]
  assign Line_4_var5_valid = Line_3_var13_valid; // @[systolic_array.scala 155:21]
  assign Line_4_var5_bits = Line_3_var13_bits; // @[systolic_array.scala 155:21]
  assign Line_4_var6_valid = Line_3_var14_valid; // @[systolic_array.scala 156:21]
  assign Line_4_var6_bits = Line_3_var14_bits; // @[systolic_array.scala 156:21]
  assign Line_4_var7_valid = Line_3_var15_valid; // @[systolic_array.scala 157:21]
  assign Line_4_var7_bits = Line_3_var15_bits; // @[systolic_array.scala 157:21]
  assign Line_4_var8_valid = Line_3_var16_valid; // @[systolic_array.scala 158:21]
  assign Line_4_var8_bits = Line_3_var16_bits; // @[systolic_array.scala 158:21]
  assign Line_4_var9_ready = Line_5_var1_ready; // @[systolic_array.scala 159:21]
  assign Line_4_var10_ready = Line_5_var2_ready; // @[systolic_array.scala 160:21]
  assign Line_4_var11_ready = Line_5_var3_ready; // @[systolic_array.scala 161:21]
  assign Line_4_var12_ready = Line_5_var4_ready; // @[systolic_array.scala 162:21]
  assign Line_4_var13_ready = Line_5_var5_ready; // @[systolic_array.scala 163:21]
  assign Line_4_var14_ready = Line_5_var6_ready; // @[systolic_array.scala 164:21]
  assign Line_4_var15_ready = Line_5_var7_ready; // @[systolic_array.scala 165:21]
  assign Line_4_var16_ready = Line_5_var8_ready; // @[systolic_array.scala 166:21]
  assign Line_5_clock = clock;
  assign Line_5_reset = reset;
  assign Line_5_var0_valid = var22_valid; // @[systolic_array.scala 116:21]
  assign Line_5_var0_bits = var22_bits; // @[systolic_array.scala 116:21]
  assign Line_5_var1_valid = Line_4_var9_valid; // @[systolic_array.scala 159:21]
  assign Line_5_var1_bits = Line_4_var9_bits; // @[systolic_array.scala 159:21]
  assign Line_5_var2_valid = Line_4_var10_valid; // @[systolic_array.scala 160:21]
  assign Line_5_var2_bits = Line_4_var10_bits; // @[systolic_array.scala 160:21]
  assign Line_5_var3_valid = Line_4_var11_valid; // @[systolic_array.scala 161:21]
  assign Line_5_var3_bits = Line_4_var11_bits; // @[systolic_array.scala 161:21]
  assign Line_5_var4_valid = Line_4_var12_valid; // @[systolic_array.scala 162:21]
  assign Line_5_var4_bits = Line_4_var12_bits; // @[systolic_array.scala 162:21]
  assign Line_5_var5_valid = Line_4_var13_valid; // @[systolic_array.scala 163:21]
  assign Line_5_var5_bits = Line_4_var13_bits; // @[systolic_array.scala 163:21]
  assign Line_5_var6_valid = Line_4_var14_valid; // @[systolic_array.scala 164:21]
  assign Line_5_var6_bits = Line_4_var14_bits; // @[systolic_array.scala 164:21]
  assign Line_5_var7_valid = Line_4_var15_valid; // @[systolic_array.scala 165:21]
  assign Line_5_var7_bits = Line_4_var15_bits; // @[systolic_array.scala 165:21]
  assign Line_5_var8_valid = Line_4_var16_valid; // @[systolic_array.scala 166:21]
  assign Line_5_var8_bits = Line_4_var16_bits; // @[systolic_array.scala 166:21]
  assign Line_5_var9_ready = Line_6_var1_ready; // @[systolic_array.scala 167:21]
  assign Line_5_var10_ready = Line_6_var2_ready; // @[systolic_array.scala 168:21]
  assign Line_5_var11_ready = Line_6_var3_ready; // @[systolic_array.scala 169:21]
  assign Line_5_var12_ready = Line_6_var4_ready; // @[systolic_array.scala 170:21]
  assign Line_5_var13_ready = Line_6_var5_ready; // @[systolic_array.scala 171:21]
  assign Line_5_var14_ready = Line_6_var6_ready; // @[systolic_array.scala 172:21]
  assign Line_5_var15_ready = Line_6_var7_ready; // @[systolic_array.scala 173:21]
  assign Line_5_var16_ready = Line_6_var8_ready; // @[systolic_array.scala 174:21]
  assign Line_6_clock = clock;
  assign Line_6_reset = reset;
  assign Line_6_var0_valid = var23_valid; // @[systolic_array.scala 117:21]
  assign Line_6_var0_bits = var23_bits; // @[systolic_array.scala 117:21]
  assign Line_6_var1_valid = Line_5_var9_valid; // @[systolic_array.scala 167:21]
  assign Line_6_var1_bits = Line_5_var9_bits; // @[systolic_array.scala 167:21]
  assign Line_6_var2_valid = Line_5_var10_valid; // @[systolic_array.scala 168:21]
  assign Line_6_var2_bits = Line_5_var10_bits; // @[systolic_array.scala 168:21]
  assign Line_6_var3_valid = Line_5_var11_valid; // @[systolic_array.scala 169:21]
  assign Line_6_var3_bits = Line_5_var11_bits; // @[systolic_array.scala 169:21]
  assign Line_6_var4_valid = Line_5_var12_valid; // @[systolic_array.scala 170:21]
  assign Line_6_var4_bits = Line_5_var12_bits; // @[systolic_array.scala 170:21]
  assign Line_6_var5_valid = Line_5_var13_valid; // @[systolic_array.scala 171:21]
  assign Line_6_var5_bits = Line_5_var13_bits; // @[systolic_array.scala 171:21]
  assign Line_6_var6_valid = Line_5_var14_valid; // @[systolic_array.scala 172:21]
  assign Line_6_var6_bits = Line_5_var14_bits; // @[systolic_array.scala 172:21]
  assign Line_6_var7_valid = Line_5_var15_valid; // @[systolic_array.scala 173:21]
  assign Line_6_var7_bits = Line_5_var15_bits; // @[systolic_array.scala 173:21]
  assign Line_6_var8_valid = Line_5_var16_valid; // @[systolic_array.scala 174:21]
  assign Line_6_var8_bits = Line_5_var16_bits; // @[systolic_array.scala 174:21]
  assign Line_6_var9_ready = Line_7_var1_ready; // @[systolic_array.scala 175:21]
  assign Line_6_var10_ready = Line_7_var2_ready; // @[systolic_array.scala 176:21]
  assign Line_6_var11_ready = Line_7_var3_ready; // @[systolic_array.scala 177:21]
  assign Line_6_var12_ready = Line_7_var4_ready; // @[systolic_array.scala 178:21]
  assign Line_6_var13_ready = Line_7_var5_ready; // @[systolic_array.scala 179:21]
  assign Line_6_var14_ready = Line_7_var6_ready; // @[systolic_array.scala 180:21]
  assign Line_6_var15_ready = Line_7_var7_ready; // @[systolic_array.scala 181:21]
  assign Line_6_var16_ready = Line_7_var8_ready; // @[systolic_array.scala 182:21]
  assign Line_7_clock = clock;
  assign Line_7_reset = reset;
  assign Line_7_var0_valid = var24_valid; // @[systolic_array.scala 118:21]
  assign Line_7_var0_bits = var24_bits; // @[systolic_array.scala 118:21]
  assign Line_7_var1_valid = Line_6_var9_valid; // @[systolic_array.scala 175:21]
  assign Line_7_var1_bits = Line_6_var9_bits; // @[systolic_array.scala 175:21]
  assign Line_7_var2_valid = Line_6_var10_valid; // @[systolic_array.scala 176:21]
  assign Line_7_var2_bits = Line_6_var10_bits; // @[systolic_array.scala 176:21]
  assign Line_7_var3_valid = Line_6_var11_valid; // @[systolic_array.scala 177:21]
  assign Line_7_var3_bits = Line_6_var11_bits; // @[systolic_array.scala 177:21]
  assign Line_7_var4_valid = Line_6_var12_valid; // @[systolic_array.scala 178:21]
  assign Line_7_var4_bits = Line_6_var12_bits; // @[systolic_array.scala 178:21]
  assign Line_7_var5_valid = Line_6_var13_valid; // @[systolic_array.scala 179:21]
  assign Line_7_var5_bits = Line_6_var13_bits; // @[systolic_array.scala 179:21]
  assign Line_7_var6_valid = Line_6_var14_valid; // @[systolic_array.scala 180:21]
  assign Line_7_var6_bits = Line_6_var14_bits; // @[systolic_array.scala 180:21]
  assign Line_7_var7_valid = Line_6_var15_valid; // @[systolic_array.scala 181:21]
  assign Line_7_var7_bits = Line_6_var15_bits; // @[systolic_array.scala 181:21]
  assign Line_7_var8_valid = Line_6_var16_valid; // @[systolic_array.scala 182:21]
  assign Line_7_var8_bits = Line_6_var16_bits; // @[systolic_array.scala 182:21]
  assign Line_7_var9_ready = var33_ready; // @[systolic_array.scala 183:15]
  assign Line_7_var10_ready = var34_ready; // @[systolic_array.scala 184:15]
  assign Line_7_var11_ready = var35_ready; // @[systolic_array.scala 185:15]
  assign Line_7_var12_ready = var36_ready; // @[systolic_array.scala 186:15]
  assign Line_7_var13_ready = var37_ready; // @[systolic_array.scala 187:15]
  assign Line_7_var14_ready = var38_ready; // @[systolic_array.scala 188:15]
  assign Line_7_var15_ready = var39_ready; // @[systolic_array.scala 189:15]
  assign Line_7_var16_ready = var40_ready; // @[systolic_array.scala 190:15]
endmodule
module systolic_array(
  input         clock,
  input         reset,
  output        var17_ready,
  input         var17_valid,
  input  [31:0] var17_bits,
  output        var18_ready,
  input         var18_valid,
  input  [31:0] var18_bits,
  output        var19_ready,
  input         var19_valid,
  input  [31:0] var19_bits,
  output        var20_ready,
  input         var20_valid,
  input  [31:0] var20_bits,
  output        var21_ready,
  input         var21_valid,
  input  [31:0] var21_bits,
  output        var22_ready,
  input         var22_valid,
  input  [31:0] var22_bits,
  output        var23_ready,
  input         var23_valid,
  input  [31:0] var23_bits,
  output        var24_ready,
  input         var24_valid,
  input  [31:0] var24_bits,
  output        var25_ready,
  input         var25_valid,
  input  [31:0] var25_bits,
  output        var26_ready,
  input         var26_valid,
  input  [31:0] var26_bits,
  output        var27_ready,
  input         var27_valid,
  input  [31:0] var27_bits,
  output        var28_ready,
  input         var28_valid,
  input  [31:0] var28_bits,
  output        var29_ready,
  input         var29_valid,
  input  [31:0] var29_bits,
  output        var30_ready,
  input         var30_valid,
  input  [31:0] var30_bits,
  output        var31_ready,
  input         var31_valid,
  input  [31:0] var31_bits,
  output        var32_ready,
  input         var32_valid,
  input  [31:0] var32_bits,
  input         var33_ready,
  output        var33_valid,
  output [31:0] var33_bits,
  input         var34_ready,
  output        var34_valid,
  output [31:0] var34_bits,
  input         var35_ready,
  output        var35_valid,
  output [31:0] var35_bits,
  input         var36_ready,
  output        var36_valid,
  output [31:0] var36_bits,
  input         var37_ready,
  output        var37_valid,
  output [31:0] var37_bits,
  input         var38_ready,
  output        var38_valid,
  output [31:0] var38_bits,
  input         var39_ready,
  output        var39_valid,
  output [31:0] var39_bits,
  input         var40_ready,
  output        var40_valid,
  output [31:0] var40_bits,
  input         finish
);
  wire  main_clock; // @[systolic_array.scala 192:26]
  wire  main_reset; // @[systolic_array.scala 192:26]
  wire  main_var17_ready; // @[systolic_array.scala 192:26]
  wire  main_var17_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var17_bits; // @[systolic_array.scala 192:26]
  wire  main_var18_ready; // @[systolic_array.scala 192:26]
  wire  main_var18_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var18_bits; // @[systolic_array.scala 192:26]
  wire  main_var19_ready; // @[systolic_array.scala 192:26]
  wire  main_var19_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var19_bits; // @[systolic_array.scala 192:26]
  wire  main_var20_ready; // @[systolic_array.scala 192:26]
  wire  main_var20_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var20_bits; // @[systolic_array.scala 192:26]
  wire  main_var21_ready; // @[systolic_array.scala 192:26]
  wire  main_var21_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var21_bits; // @[systolic_array.scala 192:26]
  wire  main_var22_ready; // @[systolic_array.scala 192:26]
  wire  main_var22_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var22_bits; // @[systolic_array.scala 192:26]
  wire  main_var23_ready; // @[systolic_array.scala 192:26]
  wire  main_var23_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var23_bits; // @[systolic_array.scala 192:26]
  wire  main_var24_ready; // @[systolic_array.scala 192:26]
  wire  main_var24_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var24_bits; // @[systolic_array.scala 192:26]
  wire  main_var25_ready; // @[systolic_array.scala 192:26]
  wire  main_var25_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var25_bits; // @[systolic_array.scala 192:26]
  wire  main_var26_ready; // @[systolic_array.scala 192:26]
  wire  main_var26_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var26_bits; // @[systolic_array.scala 192:26]
  wire  main_var27_ready; // @[systolic_array.scala 192:26]
  wire  main_var27_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var27_bits; // @[systolic_array.scala 192:26]
  wire  main_var28_ready; // @[systolic_array.scala 192:26]
  wire  main_var28_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var28_bits; // @[systolic_array.scala 192:26]
  wire  main_var29_ready; // @[systolic_array.scala 192:26]
  wire  main_var29_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var29_bits; // @[systolic_array.scala 192:26]
  wire  main_var30_ready; // @[systolic_array.scala 192:26]
  wire  main_var30_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var30_bits; // @[systolic_array.scala 192:26]
  wire  main_var31_ready; // @[systolic_array.scala 192:26]
  wire  main_var31_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var31_bits; // @[systolic_array.scala 192:26]
  wire  main_var32_ready; // @[systolic_array.scala 192:26]
  wire  main_var32_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var32_bits; // @[systolic_array.scala 192:26]
  wire  main_var33_ready; // @[systolic_array.scala 192:26]
  wire  main_var33_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var33_bits; // @[systolic_array.scala 192:26]
  wire  main_var34_ready; // @[systolic_array.scala 192:26]
  wire  main_var34_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var34_bits; // @[systolic_array.scala 192:26]
  wire  main_var35_ready; // @[systolic_array.scala 192:26]
  wire  main_var35_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var35_bits; // @[systolic_array.scala 192:26]
  wire  main_var36_ready; // @[systolic_array.scala 192:26]
  wire  main_var36_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var36_bits; // @[systolic_array.scala 192:26]
  wire  main_var37_ready; // @[systolic_array.scala 192:26]
  wire  main_var37_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var37_bits; // @[systolic_array.scala 192:26]
  wire  main_var38_ready; // @[systolic_array.scala 192:26]
  wire  main_var38_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var38_bits; // @[systolic_array.scala 192:26]
  wire  main_var39_ready; // @[systolic_array.scala 192:26]
  wire  main_var39_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var39_bits; // @[systolic_array.scala 192:26]
  wire  main_var40_ready; // @[systolic_array.scala 192:26]
  wire  main_var40_valid; // @[systolic_array.scala 192:26]
  wire [31:0] main_var40_bits; // @[systolic_array.scala 192:26]
  main main ( // @[systolic_array.scala 192:26]
    .clock(main_clock),
    .reset(main_reset),
    .var17_ready(main_var17_ready),
    .var17_valid(main_var17_valid),
    .var17_bits(main_var17_bits),
    .var18_ready(main_var18_ready),
    .var18_valid(main_var18_valid),
    .var18_bits(main_var18_bits),
    .var19_ready(main_var19_ready),
    .var19_valid(main_var19_valid),
    .var19_bits(main_var19_bits),
    .var20_ready(main_var20_ready),
    .var20_valid(main_var20_valid),
    .var20_bits(main_var20_bits),
    .var21_ready(main_var21_ready),
    .var21_valid(main_var21_valid),
    .var21_bits(main_var21_bits),
    .var22_ready(main_var22_ready),
    .var22_valid(main_var22_valid),
    .var22_bits(main_var22_bits),
    .var23_ready(main_var23_ready),
    .var23_valid(main_var23_valid),
    .var23_bits(main_var23_bits),
    .var24_ready(main_var24_ready),
    .var24_valid(main_var24_valid),
    .var24_bits(main_var24_bits),
    .var25_ready(main_var25_ready),
    .var25_valid(main_var25_valid),
    .var25_bits(main_var25_bits),
    .var26_ready(main_var26_ready),
    .var26_valid(main_var26_valid),
    .var26_bits(main_var26_bits),
    .var27_ready(main_var27_ready),
    .var27_valid(main_var27_valid),
    .var27_bits(main_var27_bits),
    .var28_ready(main_var28_ready),
    .var28_valid(main_var28_valid),
    .var28_bits(main_var28_bits),
    .var29_ready(main_var29_ready),
    .var29_valid(main_var29_valid),
    .var29_bits(main_var29_bits),
    .var30_ready(main_var30_ready),
    .var30_valid(main_var30_valid),
    .var30_bits(main_var30_bits),
    .var31_ready(main_var31_ready),
    .var31_valid(main_var31_valid),
    .var31_bits(main_var31_bits),
    .var32_ready(main_var32_ready),
    .var32_valid(main_var32_valid),
    .var32_bits(main_var32_bits),
    .var33_ready(main_var33_ready),
    .var33_valid(main_var33_valid),
    .var33_bits(main_var33_bits),
    .var34_ready(main_var34_ready),
    .var34_valid(main_var34_valid),
    .var34_bits(main_var34_bits),
    .var35_ready(main_var35_ready),
    .var35_valid(main_var35_valid),
    .var35_bits(main_var35_bits),
    .var36_ready(main_var36_ready),
    .var36_valid(main_var36_valid),
    .var36_bits(main_var36_bits),
    .var37_ready(main_var37_ready),
    .var37_valid(main_var37_valid),
    .var37_bits(main_var37_bits),
    .var38_ready(main_var38_ready),
    .var38_valid(main_var38_valid),
    .var38_bits(main_var38_bits),
    .var39_ready(main_var39_ready),
    .var39_valid(main_var39_valid),
    .var39_bits(main_var39_bits),
    .var40_ready(main_var40_ready),
    .var40_valid(main_var40_valid),
    .var40_bits(main_var40_bits)
  );
  assign var17_ready = main_var17_ready; // @[systolic_array.scala 194:20]
  assign var18_ready = main_var18_ready; // @[systolic_array.scala 196:20]
  assign var19_ready = main_var19_ready; // @[systolic_array.scala 198:20]
  assign var20_ready = main_var20_ready; // @[systolic_array.scala 200:20]
  assign var21_ready = main_var21_ready; // @[systolic_array.scala 202:20]
  assign var22_ready = main_var22_ready; // @[systolic_array.scala 204:20]
  assign var23_ready = main_var23_ready; // @[systolic_array.scala 206:20]
  assign var24_ready = main_var24_ready; // @[systolic_array.scala 208:20]
  assign var25_ready = main_var25_ready; // @[systolic_array.scala 210:20]
  assign var26_ready = main_var26_ready; // @[systolic_array.scala 212:20]
  assign var27_ready = main_var27_ready; // @[systolic_array.scala 214:20]
  assign var28_ready = main_var28_ready; // @[systolic_array.scala 216:20]
  assign var29_ready = main_var29_ready; // @[systolic_array.scala 218:20]
  assign var30_ready = main_var30_ready; // @[systolic_array.scala 220:20]
  assign var31_ready = main_var31_ready; // @[systolic_array.scala 222:20]
  assign var32_ready = main_var32_ready; // @[systolic_array.scala 224:20]
  assign var33_valid = main_var33_valid; // @[systolic_array.scala 226:15]
  assign var33_bits = main_var33_bits; // @[systolic_array.scala 226:15]
  assign var34_valid = main_var34_valid; // @[systolic_array.scala 228:15]
  assign var34_bits = main_var34_bits; // @[systolic_array.scala 228:15]
  assign var35_valid = main_var35_valid; // @[systolic_array.scala 230:15]
  assign var35_bits = main_var35_bits; // @[systolic_array.scala 230:15]
  assign var36_valid = main_var36_valid; // @[systolic_array.scala 232:15]
  assign var36_bits = main_var36_bits; // @[systolic_array.scala 232:15]
  assign var37_valid = main_var37_valid; // @[systolic_array.scala 234:15]
  assign var37_bits = main_var37_bits; // @[systolic_array.scala 234:15]
  assign var38_valid = main_var38_valid; // @[systolic_array.scala 236:15]
  assign var38_bits = main_var38_bits; // @[systolic_array.scala 236:15]
  assign var39_valid = main_var39_valid; // @[systolic_array.scala 238:15]
  assign var39_bits = main_var39_bits; // @[systolic_array.scala 238:15]
  assign var40_valid = main_var40_valid; // @[systolic_array.scala 240:15]
  assign var40_bits = main_var40_bits; // @[systolic_array.scala 240:15]
  assign main_clock = clock;
  assign main_reset = reset;
  assign main_var17_valid = var17_valid; // @[systolic_array.scala 194:20]
  assign main_var17_bits = var17_bits; // @[systolic_array.scala 194:20]
  assign main_var18_valid = var18_valid; // @[systolic_array.scala 196:20]
  assign main_var18_bits = var18_bits; // @[systolic_array.scala 196:20]
  assign main_var19_valid = var19_valid; // @[systolic_array.scala 198:20]
  assign main_var19_bits = var19_bits; // @[systolic_array.scala 198:20]
  assign main_var20_valid = var20_valid; // @[systolic_array.scala 200:20]
  assign main_var20_bits = var20_bits; // @[systolic_array.scala 200:20]
  assign main_var21_valid = var21_valid; // @[systolic_array.scala 202:20]
  assign main_var21_bits = var21_bits; // @[systolic_array.scala 202:20]
  assign main_var22_valid = var22_valid; // @[systolic_array.scala 204:20]
  assign main_var22_bits = var22_bits; // @[systolic_array.scala 204:20]
  assign main_var23_valid = var23_valid; // @[systolic_array.scala 206:20]
  assign main_var23_bits = var23_bits; // @[systolic_array.scala 206:20]
  assign main_var24_valid = var24_valid; // @[systolic_array.scala 208:20]
  assign main_var24_bits = var24_bits; // @[systolic_array.scala 208:20]
  assign main_var25_valid = var25_valid; // @[systolic_array.scala 210:20]
  assign main_var25_bits = var25_bits; // @[systolic_array.scala 210:20]
  assign main_var26_valid = var26_valid; // @[systolic_array.scala 212:20]
  assign main_var26_bits = var26_bits; // @[systolic_array.scala 212:20]
  assign main_var27_valid = var27_valid; // @[systolic_array.scala 214:20]
  assign main_var27_bits = var27_bits; // @[systolic_array.scala 214:20]
  assign main_var28_valid = var28_valid; // @[systolic_array.scala 216:20]
  assign main_var28_bits = var28_bits; // @[systolic_array.scala 216:20]
  assign main_var29_valid = var29_valid; // @[systolic_array.scala 218:20]
  assign main_var29_bits = var29_bits; // @[systolic_array.scala 218:20]
  assign main_var30_valid = var30_valid; // @[systolic_array.scala 220:20]
  assign main_var30_bits = var30_bits; // @[systolic_array.scala 220:20]
  assign main_var31_valid = var31_valid; // @[systolic_array.scala 222:20]
  assign main_var31_bits = var31_bits; // @[systolic_array.scala 222:20]
  assign main_var32_valid = var32_valid; // @[systolic_array.scala 224:20]
  assign main_var32_bits = var32_bits; // @[systolic_array.scala 224:20]
  assign main_var33_ready = var33_ready; // @[systolic_array.scala 226:15]
  assign main_var34_ready = var34_ready; // @[systolic_array.scala 228:15]
  assign main_var35_ready = var35_ready; // @[systolic_array.scala 230:15]
  assign main_var36_ready = var36_ready; // @[systolic_array.scala 232:15]
  assign main_var37_ready = var37_ready; // @[systolic_array.scala 234:15]
  assign main_var38_ready = var38_ready; // @[systolic_array.scala 236:15]
  assign main_var39_ready = var39_ready; // @[systolic_array.scala 238:15]
  assign main_var40_ready = var40_ready; // @[systolic_array.scala 240:15]
endmodule
