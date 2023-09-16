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
      B <= 32'h40a450cc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h40edd1d6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h414fc8c6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41d19bc1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a87e7b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h424e1737; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b7ea0f; // @[systolic.scala 26:49]
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
      B <= 32'h42c2bc7f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h420219bb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4147c555; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42a233d7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41e8448f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42c4e46a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h417a2f0c; // @[systolic.scala 26:49]
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
      B <= 32'h42c2655a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h422ebed0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h420a7ae9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h404b94cc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h414993c2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a031ce; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h3ffbf9aa; // @[systolic.scala 26:49]
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
      B <= 32'h42c232e7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h421e7cb4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41a8f371; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42a8c51e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h421fb3f4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a0004b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4279e80a; // @[systolic.scala 26:49]
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
      B <= 32'h42c14d92; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a990d4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4289ae84; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b3b73f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b6d361; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h417ecb58; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4293c0eb; // @[systolic.scala 26:49]
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
      B <= 32'h42c1b710; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4284047e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h429dc709; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h423d5c88; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h429f7522; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h422d992a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h429543f2; // @[systolic.scala 26:49]
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
      B <= 32'h42c5836a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h427a1a60; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a91857; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4280453e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b2d8cd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41d8a6e7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b4977e; // @[systolic.scala 26:49]
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
      B <= 32'h42c5d5f9; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h429c8918; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h429ebc39; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41b151e9; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h427b8d65; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h419130cc; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42a46236; // @[systolic.scala 26:49]
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
      B <= 32'h42c53e9e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h428425ee; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h421b74de; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42838de2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42337a71; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h418edea8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h427edd21; // @[systolic.scala 26:49]
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
      B <= 32'h42c527af; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h3f1716e8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41bd1734; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4284a618; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41f02571; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a2e6fa; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h425b6c82; // @[systolic.scala 26:49]
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
      B <= 32'h42c454b4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42188db8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h40629866; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h424d701a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42558bb3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41d4029c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42556067; // @[systolic.scala 26:49]
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
      B <= 32'h42c43002; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h425574e9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h421cb44a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b87865; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4119fd63; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4103fc6e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h429e561a; // @[systolic.scala 26:49]
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
      B <= 32'h42c49e16; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h40f5faa8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h420113fb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h428b375f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4223a467; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h427c05b5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h3fd91926; // @[systolic.scala 26:49]
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
      B <= 32'h42c47965; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41b74d0c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4287cf60; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4127bdb3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42c24c06; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42330381; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41dc292e; // @[systolic.scala 26:49]
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
      B <= 32'h42c3d8de; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42810cfe; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42753ddf; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4165099e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42ba6101; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42b3ccf1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42830020; // @[systolic.scala 26:49]
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
      B <= 32'h42c3b8c2; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42536449; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h429ffba5; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4296297f; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b8cb99; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42c5dbfa; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41518a56; // @[systolic.scala 26:49]
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
      B <= 32'h42c3efcc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41f012fc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42991392; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h415c47eb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4100a6ea; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41d27684; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4294b870; // @[systolic.scala 26:49]
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
      B <= 32'h42c7c0bc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42c73eff; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42827c34; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4249cfd8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4272d29c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h421515d2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h413cb9fd; // @[systolic.scala 26:49]
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
      B <= 32'h42c7a0a1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42afe425; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a7d8e9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h413381c2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h426fa7cd; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h423933e5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h426d90d4; // @[systolic.scala 26:49]
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
      B <= 32'h3d968fc0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h40f811aa; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42b87d65; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b016fc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h40c1a49c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4215dbde; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b58f03; // @[systolic.scala 26:49]
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
      B <= 32'h42c7f7c7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4299919a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4277283f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42b2476a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4298b292; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42814c8f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42921e65; // @[systolic.scala 26:49]
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
      B <= 32'h42c7ee9a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41f4ba00; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42bf6578; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42456efe; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b4d107; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41216248; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41ec1f79; // @[systolic.scala 26:49]
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
      B <= 32'h42c73bba; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h429fa208; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4263af72; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42934128; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41691756; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42386dd9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42a0d0a6; // @[systolic.scala 26:49]
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
      B <= 32'h42c70ddc; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4243650f; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41d3b9ce; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42957195; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a9bb32; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4292958d; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h427ac00f; // @[systolic.scala 26:49]
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
      B <= 32'h42c772c4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4263e947; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4255df4a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4145052f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41f1b0b8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4292f893; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4226af97; // @[systolic.scala 26:49]
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
      B <= 32'h42c6ad8b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h415d0fc0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a50496; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h426414f4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a4fafb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h3ec2a998; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h40af3866; // @[systolic.scala 26:49]
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
      B <= 32'h42c6a45e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42873ede; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h418357bb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4189ea40; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42c11970; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h423744c6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4277ba01; // @[systolic.scala 26:49]
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
      B <= 32'h42c68444; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h425fc806; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h420c654a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h429c02dc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42bf8409; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h425b62d9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41187158; // @[systolic.scala 26:49]
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
      B <= 32'h42c6e92b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42802620; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h427867ad; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41798f61; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42246a0a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h425c28e5; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42b105ef; // @[systolic.scala 26:49]
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
      B <= 32'h42c6dffe; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h418f0c18; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42c0052f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4297a202; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h425ca6f3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h3ef42c98; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4233ded2; // @[systolic.scala 26:49]
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
      B <= 32'h42c6c90f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4251968a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42a1908c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4298ba39; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42213f3b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4280237c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42106e32; // @[systolic.scala 26:49]
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
      B <= 32'h42c60d03; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h425db768; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4297d425; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h427367ef; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h429d0ff6; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42361bb4; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h422dd2b6; // @[systolic.scala 26:49]
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
      B <= 32'h42c668be; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h418aead8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42134d5e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h426aa63a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4217becf; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42b65099; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h429dca98; // @[systolic.scala 26:49]
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
      B <= 32'h42c651cf; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h424f85ea; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41acc831; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h426cd6a8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41b8ae2c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h425affd3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h428c1249; // @[systolic.scala 26:49]
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
      B <= 32'h42c648a3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h40b5fdb2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h425e06ca; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h419b6da6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42149400; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h3e3f45a0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41d3ef0b; // @[systolic.scala 26:49]
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
      B <= 32'h3f88afcc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41abf4d3; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4124d570; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42bfca43; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42977ffc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42836d32; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h40ef1190; // @[systolic.scala 26:49]
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
      B <= 32'h3f82f438; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42600ae8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42be260c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42c0e27a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4273983f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41ea7208; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42c538ca; // @[systolic.scala 26:49]
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
      B <= 32'h3f80a91c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h411d12d1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41e7dd92; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4262a51e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4295ea94; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42957c3b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h425c4486; // @[systolic.scala 26:49]
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
      B <= 32'h3f9b087a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42b61604; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h421c1fd2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41624ca4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h427d18ab; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h400dec9e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h425f4a94; // @[systolic.scala 26:49]
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
      B <= 32'h3f954ce6; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41cc790b; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41be6d1c; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h416b0e57; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4241b0f3; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42839eb5; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h423bd9f6; // @[systolic.scala 26:49]
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
      B <= 32'h3f47fd44; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a4cb97; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42536070; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h426d9740; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h3f33a380; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42b968cc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h412c45b6; // @[systolic.scala 26:49]
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
      B <= 32'h3f3ed0d4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42b40564; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41a54ba6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h429fabcb; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41e690c2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a7283f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41bd6ea7; // @[systolic.scala 26:49]
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
      B <= 32'h3f3359ac; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h41c4368e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h40ade474; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42a0c402; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h415f82a7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h423caf1d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h416d1ad4; // @[systolic.scala 26:49]
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
      B <= 32'h3f310e90; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h424db82c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41b31bce; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4271f819; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h428dff8f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h419f1dae; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42ba1817; // @[systolic.scala 26:49]
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
      B <= 32'h3f7144d8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42c44780; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h423ea836; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h418b6b6e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4294552d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a78b45; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h402a6db0; // @[systolic.scala 26:49]
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
      B <= 32'h3f65cd4c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42029f7f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4201bef1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h418fcc48; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h426d42a1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h423d752a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42bb9b1e; // @[systolic.scala 26:49]
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
      B <= 32'h3f5ca0dc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42211317; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h3e822918; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4219a67c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42aede3a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4218f411; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h40d6e122; // @[systolic.scala 26:49]
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
      B <= 32'h3f53746c; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h423f86b0; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h428824da; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h426b66d3; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4178d91a; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41e8e5ec; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h419d0418; // @[systolic.scala 26:49]
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
      B <= 32'h3ee1b090; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h40970acc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42c239cc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4063a7b0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4287a9f1; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42600724; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42a6dcc1; // @[systolic.scala 26:49]
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
      B <= 32'h3ecf57b0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h414553c6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4281dc7d; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41bff5a6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42bfe6da; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h423b860b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42c0afb5; // @[systolic.scala 26:49]
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
      B <= 32'h3f27e220; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h426c2bc6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42b469a4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42a1dc39; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42c63c79; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h412c36f6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h40beb0b3; // @[systolic.scala 26:49]
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
      B <= 32'h3f1c6a94; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42bb1e22; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4295f502; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42a2f46f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a8889c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4294b62f; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42c232bc; // @[systolic.scala 26:49]
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
      B <= 32'h3f133e88; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h3f95fb82; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h422b2f67; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h3ff52698; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41462c2e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h428275a2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41202d7e; // @[systolic.scala 26:49]
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
      B <= 32'h3f0a1218; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h410c8dd6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4129d326; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41b2d317; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h422204de; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42606a2a; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h41b7628f; // @[systolic.scala 26:49]
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
      B <= 32'h3e5e0d50; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h429a99e9; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h41a7ca7e; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40c964e2; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42bb26a4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4293f022; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h421c8669; // @[systolic.scala 26:49]
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
      B <= 32'h3e395b90; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a9d3b6; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42b19551; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41d5d9e6; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41ad8e36; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4281af96; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42502c51; // @[systolic.scala 26:49]
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
      B <= 32'h3eb3d260; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4293812b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h42855087; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4094dab0; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42188472; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42a66232; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42836c22; // @[systolic.scala 26:49]
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
      B <= 32'h3eb86898; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h423b6570; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4246cfb6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h41c45680; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a232ff; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h412792a8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h42aef766; // @[systolic.scala 26:49]
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
      B <= 32'h3ea61080; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4259d909; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h418c2a31; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4233eb97; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41137f41; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h3fac7218; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h3eca5990; // @[systolic.scala 26:49]
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
      B <= 32'h3e984dd8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h420cafbc; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4288c491; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h42aa9dec; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42a09d97; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h419c057b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h420c5120; // @[systolic.scala 26:49]
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
      B <= 32'h3e85f4f8; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h422b2354; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4210ce85; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h40b7e17c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h4106d404; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h41260690; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h423ff708; // @[systolic.scala 26:49]
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
      B <= 32'h42ba1e5c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h4291f318; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h4287246c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h415c0282; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42715b97; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4298124b; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h422d39b1; // @[systolic.scala 26:49]
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
      B <= 32'h42ba0c03; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42a12ce4; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h420d8e3c; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h4208c0f7; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h42b0eab6; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h4285d1be; // @[systolic.scala 26:49]
    end else if (ce) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h4260df99; // @[systolic.scala 26:49]
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
      B <= 32'h42b9f9ab; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B <= B_reg_1; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_1 <= 32'h42b066b1; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_1 <= B_reg_2; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_2 <= 32'h404d39cb; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_2 <= B_reg_3; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_3 <= 32'h425a814e; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_3 <= B_reg_4; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_4 <= 32'h41849e7d; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_4 <= B_reg_5; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_5 <= 32'h42672263; // @[systolic.scala 26:49]
    end else if (C_out_ready) begin // @[systolic.scala 29:12]
      B_reg_5 <= B_reg_6; // @[systolic.scala 31:20]
    end
    if (reset) begin // @[systolic.scala 26:49]
      B_reg_6 <= 32'h428a42bf; // @[systolic.scala 26:49]
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
