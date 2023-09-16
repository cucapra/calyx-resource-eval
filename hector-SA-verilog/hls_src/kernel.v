module insideMemory(
  input         clock,
  input         r_en,
  input  [9:0]  addr,
  output [63:0] r_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] mem [0:1023]; // @[elastic_component.scala 389:24]
  wire [63:0] mem_rwPort_r_data; // @[elastic_component.scala 389:24]
  wire [9:0] mem_rwPort_r_addr; // @[elastic_component.scala 389:24]
  wire [63:0] mem_rwPort_w_data; // @[elastic_component.scala 389:24]
  wire [9:0] mem_rwPort_w_addr; // @[elastic_component.scala 389:24]
  wire  mem_rwPort_w_mask; // @[elastic_component.scala 389:24]
  wire  mem_rwPort_w_en; // @[elastic_component.scala 389:24]
  reg  mem_rwPort_r_en_pipe_0;
  reg [9:0] mem_rwPort_r_addr_pipe_0;
  assign mem_rwPort_r_addr = mem_rwPort_r_addr_pipe_0;
  assign mem_rwPort_r_data = mem[mem_rwPort_r_addr]; // @[elastic_component.scala 389:24]
  assign mem_rwPort_w_data = 64'h0;
  assign mem_rwPort_w_addr = addr;
  assign mem_rwPort_w_mask = 1'h0;
  assign mem_rwPort_w_en = 1'h0;
  assign r_data = mem_rwPort_r_data; // @[elastic_component.scala 400:16 elastic_component.scala 403:14]
  always @(posedge clock) begin
    if(mem_rwPort_w_en & mem_rwPort_w_mask) begin
      mem[mem_rwPort_w_addr] <= mem_rwPort_w_data; // @[elastic_component.scala 389:24]
    end
    mem_rwPort_r_en_pipe_0 <= r_en;
    if (r_en) begin
      mem_rwPort_r_addr_pipe_0 <= addr;
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
  integer initvar;
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
  mem_rwPort_r_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_rwPort_r_addr_pipe_0 = _RAND_1[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("data_set/aeloss_push/in_0.txt", mem);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TEHB(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  full_reg; // @[elastic_component.scala 39:33]
  reg [63:0] data_reg; // @[elastic_component.scala 42:33]
  wire  _reg_en_T_1 = ~dataOut_ready; // @[elastic_component.scala 46:44]
  wire  reg_en = dataIn_ready & dataIn_valid & ~dataOut_ready; // @[elastic_component.scala 46:41]
  assign dataIn_ready = ~full_reg; // @[elastic_component.scala 45:19]
  assign dataOut_valid = dataIn_valid | full_reg; // @[elastic_component.scala 44:33]
  assign dataOut_bits = full_reg ? data_reg : dataIn_bits; // @[elastic_component.scala 55:17 elastic_component.scala 56:18 elastic_component.scala 58:18]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 39:33]
      full_reg <= 1'h0; // @[elastic_component.scala 39:33]
    end else begin
      full_reg <= dataOut_valid & _reg_en_T_1; // @[elastic_component.scala 49:12]
    end
    if (reset) begin // @[elastic_component.scala 42:33]
      data_reg <= 64'h0; // @[elastic_component.scala 42:33]
    end else if (reg_en) begin // @[elastic_component.scala 51:16]
      data_reg <= dataIn_bits; // @[elastic_component.scala 52:14]
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
  full_reg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  data_reg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Arbiter(
  input   io_in_0_valid,
  output  io_in_1_ready,
  input   io_in_1_valid,
  output  io_out_valid,
  output  io_chosen
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  assign io_in_1_ready = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 135:31]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
endmodule
module DynMem(
  input         clock,
  input         reset,
  output        load_address_0_ready,
  input         load_address_0_valid,
  input  [9:0]  load_address_0_bits,
  output        load_address_1_ready,
  input         load_address_1_valid,
  input  [9:0]  load_address_1_bits,
  input         load_data_0_ready,
  output        load_data_0_valid,
  output [63:0] load_data_0_bits,
  input         load_data_1_ready,
  output        load_data_1_valid,
  output [63:0] load_data_1_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  mem_clock; // @[elastic_component.scala 426:19]
  wire  mem_r_en; // @[elastic_component.scala 426:19]
  wire [9:0] mem_addr; // @[elastic_component.scala 426:19]
  wire [63:0] mem_r_data; // @[elastic_component.scala 426:19]
  wire  buffer_0_clock; // @[elastic_component.scala 456:24]
  wire  buffer_0_reset; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataIn_ready; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataIn_valid; // @[elastic_component.scala 456:24]
  wire [63:0] buffer_0_dataIn_bits; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataOut_ready; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataOut_valid; // @[elastic_component.scala 456:24]
  wire [63:0] buffer_0_dataOut_bits; // @[elastic_component.scala 456:24]
  wire  buffer_1_clock; // @[elastic_component.scala 456:24]
  wire  buffer_1_reset; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataIn_ready; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataIn_valid; // @[elastic_component.scala 456:24]
  wire [63:0] buffer_1_dataIn_bits; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataOut_ready; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataOut_valid; // @[elastic_component.scala 456:24]
  wire [63:0] buffer_1_dataOut_bits; // @[elastic_component.scala 456:24]
  wire  arb_io_in_0_valid; // @[elastic_component.scala 464:21]
  wire  arb_io_in_1_ready; // @[elastic_component.scala 464:21]
  wire  arb_io_in_1_valid; // @[elastic_component.scala 464:21]
  wire  arb_io_out_valid; // @[elastic_component.scala 464:21]
  wire  arb_io_chosen; // @[elastic_component.scala 464:21]
  reg  select; // @[elastic_component.scala 475:21]
  reg  valid; // @[elastic_component.scala 476:24]
  reg [63:0] data; // @[elastic_component.scala 477:23]
  wire [63:0] _GEN_7 = mem_r_data; // @[elastic_component.scala 495:30 elastic_component.scala 496:33]
  insideMemory mem ( // @[elastic_component.scala 426:19]
    .clock(mem_clock),
    .r_en(mem_r_en),
    .addr(mem_addr),
    .r_data(mem_r_data)
  );
  TEHB buffer_0 ( // @[elastic_component.scala 456:24]
    .clock(buffer_0_clock),
    .reset(buffer_0_reset),
    .dataIn_ready(buffer_0_dataIn_ready),
    .dataIn_valid(buffer_0_dataIn_valid),
    .dataIn_bits(buffer_0_dataIn_bits),
    .dataOut_ready(buffer_0_dataOut_ready),
    .dataOut_valid(buffer_0_dataOut_valid),
    .dataOut_bits(buffer_0_dataOut_bits)
  );
  TEHB buffer_1 ( // @[elastic_component.scala 456:24]
    .clock(buffer_1_clock),
    .reset(buffer_1_reset),
    .dataIn_ready(buffer_1_dataIn_ready),
    .dataIn_valid(buffer_1_dataIn_valid),
    .dataIn_bits(buffer_1_dataIn_bits),
    .dataOut_ready(buffer_1_dataOut_ready),
    .dataOut_valid(buffer_1_dataOut_valid),
    .dataOut_bits(buffer_1_dataOut_bits)
  );
  Arbiter arb ( // @[elastic_component.scala 464:21]
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_1_ready(arb_io_in_1_ready),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_out_valid(arb_io_out_valid),
    .io_chosen(arb_io_chosen)
  );
  assign load_address_0_ready = buffer_0_dataIn_ready; // @[elastic_component.scala 470:51]
  assign load_address_1_ready = arb_io_in_1_ready & buffer_1_dataIn_ready; // @[elastic_component.scala 470:51]
  assign load_data_0_valid = buffer_0_dataOut_valid; // @[elastic_component.scala 459:20]
  assign load_data_0_bits = buffer_0_dataOut_bits; // @[elastic_component.scala 459:20]
  assign load_data_1_valid = buffer_1_dataOut_valid; // @[elastic_component.scala 459:20]
  assign load_data_1_bits = buffer_1_dataOut_bits; // @[elastic_component.scala 459:20]
  assign mem_clock = clock;
  assign mem_r_en = arb_io_out_valid; // @[elastic_component.scala 478:28 elastic_component.scala 479:16 elastic_component.scala 452:14]
  assign mem_addr = arb_io_chosen ? load_address_1_bits : load_address_0_bits; // @[elastic_component.scala 480:16 elastic_component.scala 480:16]
  assign buffer_0_clock = clock;
  assign buffer_0_reset = reset;
  assign buffer_0_dataIn_valid = ~select & valid; // @[elastic_component.scala 487:28 elastic_component.scala 488:32 elastic_component.scala 458:25]
  assign buffer_0_dataIn_bits = valid ? _GEN_7 : data; // @[elastic_component.scala 492:17]
  assign buffer_0_dataOut_ready = load_data_0_ready; // @[elastic_component.scala 459:20]
  assign buffer_1_clock = clock;
  assign buffer_1_reset = reset;
  assign buffer_1_dataIn_valid = select & valid; // @[elastic_component.scala 487:28 elastic_component.scala 488:32 elastic_component.scala 458:25]
  assign buffer_1_dataIn_bits = valid ? _GEN_7 : data; // @[elastic_component.scala 492:17]
  assign buffer_1_dataOut_ready = load_data_1_ready; // @[elastic_component.scala 459:20]
  assign arb_io_in_0_valid = load_address_0_valid & buffer_0_dataIn_ready; // @[elastic_component.scala 468:51]
  assign arb_io_in_1_valid = load_address_1_valid & buffer_1_dataIn_ready; // @[elastic_component.scala 468:51]
  always @(posedge clock) begin
    if (arb_io_out_valid) begin // @[elastic_component.scala 478:28]
      select <= arb_io_chosen; // @[elastic_component.scala 481:14]
    end
    if (reset) begin // @[elastic_component.scala 476:24]
      valid <= 1'h0; // @[elastic_component.scala 476:24]
    end else begin
      valid <= arb_io_out_valid; // @[elastic_component.scala 483:11]
    end
    if (reset) begin // @[elastic_component.scala 477:23]
      data <= 64'h0; // @[elastic_component.scala 477:23]
    end else if (valid) begin // @[elastic_component.scala 492:17]
      data <= mem_r_data; // @[elastic_component.scala 499:12]
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
  select = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  data = _RAND_2[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module insideMemory_1(
  input         clock,
  input         r_en,
  input  [9:0]  addr,
  output [31:0] r_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1023]; // @[elastic_component.scala 389:24]
  wire [31:0] mem_rwPort_r_data; // @[elastic_component.scala 389:24]
  wire [9:0] mem_rwPort_r_addr; // @[elastic_component.scala 389:24]
  wire [31:0] mem_rwPort_w_data; // @[elastic_component.scala 389:24]
  wire [9:0] mem_rwPort_w_addr; // @[elastic_component.scala 389:24]
  wire  mem_rwPort_w_mask; // @[elastic_component.scala 389:24]
  wire  mem_rwPort_w_en; // @[elastic_component.scala 389:24]
  reg  mem_rwPort_r_en_pipe_0;
  reg [9:0] mem_rwPort_r_addr_pipe_0;
  assign mem_rwPort_r_addr = mem_rwPort_r_addr_pipe_0;
  assign mem_rwPort_r_data = mem[mem_rwPort_r_addr]; // @[elastic_component.scala 389:24]
  assign mem_rwPort_w_data = 32'h0;
  assign mem_rwPort_w_addr = addr;
  assign mem_rwPort_w_mask = 1'h0;
  assign mem_rwPort_w_en = 1'h0;
  assign r_data = mem_rwPort_r_data; // @[elastic_component.scala 400:16 elastic_component.scala 403:14]
  always @(posedge clock) begin
    if(mem_rwPort_w_en & mem_rwPort_w_mask) begin
      mem[mem_rwPort_w_addr] <= mem_rwPort_w_data; // @[elastic_component.scala 389:24]
    end
    mem_rwPort_r_en_pipe_0 <= r_en;
    if (r_en) begin
      mem_rwPort_r_addr_pipe_0 <= addr;
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
  integer initvar;
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
  mem_rwPort_r_en_pipe_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  mem_rwPort_r_addr_pipe_0 = _RAND_1[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  $readmemh("data_set/aeloss_push/in_1.txt", mem);
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TEHB_2(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [31:0] dataOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  full_reg; // @[elastic_component.scala 39:33]
  reg [31:0] data_reg; // @[elastic_component.scala 42:33]
  wire  _reg_en_T_1 = ~dataOut_ready; // @[elastic_component.scala 46:44]
  wire  reg_en = dataIn_ready & dataIn_valid & ~dataOut_ready; // @[elastic_component.scala 46:41]
  assign dataIn_ready = ~full_reg; // @[elastic_component.scala 45:19]
  assign dataOut_valid = dataIn_valid | full_reg; // @[elastic_component.scala 44:33]
  assign dataOut_bits = full_reg ? data_reg : dataIn_bits; // @[elastic_component.scala 55:17 elastic_component.scala 56:18 elastic_component.scala 58:18]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 39:33]
      full_reg <= 1'h0; // @[elastic_component.scala 39:33]
    end else begin
      full_reg <= dataOut_valid & _reg_en_T_1; // @[elastic_component.scala 49:12]
    end
    if (reset) begin // @[elastic_component.scala 42:33]
      data_reg <= 32'h0; // @[elastic_component.scala 42:33]
    end else if (reg_en) begin // @[elastic_component.scala 51:16]
      data_reg <= dataIn_bits; // @[elastic_component.scala 52:14]
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
  full_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  data_reg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DynMem_1(
  input         clock,
  input         reset,
  output        load_address_0_ready,
  input         load_address_0_valid,
  input  [9:0]  load_address_0_bits,
  output        load_address_1_ready,
  input         load_address_1_valid,
  input  [9:0]  load_address_1_bits,
  input         load_data_0_ready,
  output        load_data_0_valid,
  output [31:0] load_data_0_bits,
  input         load_data_1_ready,
  output        load_data_1_valid,
  output [31:0] load_data_1_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  mem_clock; // @[elastic_component.scala 426:19]
  wire  mem_r_en; // @[elastic_component.scala 426:19]
  wire [9:0] mem_addr; // @[elastic_component.scala 426:19]
  wire [31:0] mem_r_data; // @[elastic_component.scala 426:19]
  wire  buffer_0_clock; // @[elastic_component.scala 456:24]
  wire  buffer_0_reset; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataIn_ready; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataIn_valid; // @[elastic_component.scala 456:24]
  wire [31:0] buffer_0_dataIn_bits; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataOut_ready; // @[elastic_component.scala 456:24]
  wire  buffer_0_dataOut_valid; // @[elastic_component.scala 456:24]
  wire [31:0] buffer_0_dataOut_bits; // @[elastic_component.scala 456:24]
  wire  buffer_1_clock; // @[elastic_component.scala 456:24]
  wire  buffer_1_reset; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataIn_ready; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataIn_valid; // @[elastic_component.scala 456:24]
  wire [31:0] buffer_1_dataIn_bits; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataOut_ready; // @[elastic_component.scala 456:24]
  wire  buffer_1_dataOut_valid; // @[elastic_component.scala 456:24]
  wire [31:0] buffer_1_dataOut_bits; // @[elastic_component.scala 456:24]
  wire  arb_io_in_0_valid; // @[elastic_component.scala 464:21]
  wire  arb_io_in_1_ready; // @[elastic_component.scala 464:21]
  wire  arb_io_in_1_valid; // @[elastic_component.scala 464:21]
  wire  arb_io_out_valid; // @[elastic_component.scala 464:21]
  wire  arb_io_chosen; // @[elastic_component.scala 464:21]
  reg  select; // @[elastic_component.scala 475:21]
  reg  valid; // @[elastic_component.scala 476:24]
  reg [31:0] data; // @[elastic_component.scala 477:23]
  wire [31:0] _GEN_7 = mem_r_data; // @[elastic_component.scala 495:30 elastic_component.scala 496:33]
  insideMemory_1 mem ( // @[elastic_component.scala 426:19]
    .clock(mem_clock),
    .r_en(mem_r_en),
    .addr(mem_addr),
    .r_data(mem_r_data)
  );
  TEHB_2 buffer_0 ( // @[elastic_component.scala 456:24]
    .clock(buffer_0_clock),
    .reset(buffer_0_reset),
    .dataIn_ready(buffer_0_dataIn_ready),
    .dataIn_valid(buffer_0_dataIn_valid),
    .dataIn_bits(buffer_0_dataIn_bits),
    .dataOut_ready(buffer_0_dataOut_ready),
    .dataOut_valid(buffer_0_dataOut_valid),
    .dataOut_bits(buffer_0_dataOut_bits)
  );
  TEHB_2 buffer_1 ( // @[elastic_component.scala 456:24]
    .clock(buffer_1_clock),
    .reset(buffer_1_reset),
    .dataIn_ready(buffer_1_dataIn_ready),
    .dataIn_valid(buffer_1_dataIn_valid),
    .dataIn_bits(buffer_1_dataIn_bits),
    .dataOut_ready(buffer_1_dataOut_ready),
    .dataOut_valid(buffer_1_dataOut_valid),
    .dataOut_bits(buffer_1_dataOut_bits)
  );
  Arbiter arb ( // @[elastic_component.scala 464:21]
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_1_ready(arb_io_in_1_ready),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_out_valid(arb_io_out_valid),
    .io_chosen(arb_io_chosen)
  );
  assign load_address_0_ready = buffer_0_dataIn_ready; // @[elastic_component.scala 470:51]
  assign load_address_1_ready = arb_io_in_1_ready & buffer_1_dataIn_ready; // @[elastic_component.scala 470:51]
  assign load_data_0_valid = buffer_0_dataOut_valid; // @[elastic_component.scala 459:20]
  assign load_data_0_bits = buffer_0_dataOut_bits; // @[elastic_component.scala 459:20]
  assign load_data_1_valid = buffer_1_dataOut_valid; // @[elastic_component.scala 459:20]
  assign load_data_1_bits = buffer_1_dataOut_bits; // @[elastic_component.scala 459:20]
  assign mem_clock = clock;
  assign mem_r_en = arb_io_out_valid; // @[elastic_component.scala 478:28 elastic_component.scala 479:16 elastic_component.scala 452:14]
  assign mem_addr = arb_io_chosen ? load_address_1_bits : load_address_0_bits; // @[elastic_component.scala 480:16 elastic_component.scala 480:16]
  assign buffer_0_clock = clock;
  assign buffer_0_reset = reset;
  assign buffer_0_dataIn_valid = ~select & valid; // @[elastic_component.scala 487:28 elastic_component.scala 488:32 elastic_component.scala 458:25]
  assign buffer_0_dataIn_bits = valid ? _GEN_7 : data; // @[elastic_component.scala 492:17]
  assign buffer_0_dataOut_ready = load_data_0_ready; // @[elastic_component.scala 459:20]
  assign buffer_1_clock = clock;
  assign buffer_1_reset = reset;
  assign buffer_1_dataIn_valid = select & valid; // @[elastic_component.scala 487:28 elastic_component.scala 488:32 elastic_component.scala 458:25]
  assign buffer_1_dataIn_bits = valid ? _GEN_7 : data; // @[elastic_component.scala 492:17]
  assign buffer_1_dataOut_ready = load_data_1_ready; // @[elastic_component.scala 459:20]
  assign arb_io_in_0_valid = load_address_0_valid & buffer_0_dataIn_ready; // @[elastic_component.scala 468:51]
  assign arb_io_in_1_valid = load_address_1_valid & buffer_1_dataIn_ready; // @[elastic_component.scala 468:51]
  always @(posedge clock) begin
    if (arb_io_out_valid) begin // @[elastic_component.scala 478:28]
      select <= arb_io_chosen; // @[elastic_component.scala 481:14]
    end
    if (reset) begin // @[elastic_component.scala 476:24]
      valid <= 1'h0; // @[elastic_component.scala 476:24]
    end else begin
      valid <= arb_io_out_valid; // @[elastic_component.scala 483:11]
    end
    if (reset) begin // @[elastic_component.scala 477:23]
      data <= 32'h0; // @[elastic_component.scala 477:23]
    end else if (valid) begin // @[elastic_component.scala 492:17]
      data <= mem_r_data; // @[elastic_component.scala 499:12]
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
  select = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LessEqualthanIDynamic(
  output        operand0_ready,
  input         operand0_valid,
  input  [31:0] operand0_bits,
  output        operand1_ready,
  input         operand1_valid,
  input  [31:0] operand1_bits,
  input         result_ready,
  output        result_valid,
  output        result_bits
);
  assign operand0_ready = operand1_valid & result_ready; // @[arithmetic_unit.scala 189:36]
  assign operand1_ready = operand0_valid & result_ready; // @[arithmetic_unit.scala 190:36]
  assign result_valid = operand0_valid & operand1_valid; // @[arithmetic_unit.scala 188:34]
  assign result_bits = operand0_bits <= operand1_bits; // @[arithmetic_unit.scala 199:75]
endmodule
module Merge_no_tehb(
  output  dataIn_0_ready,
  input   dataIn_0_valid,
  output  dataIn_1_ready,
  input   dataIn_1_valid,
  input   dataOut_ready,
  output  dataOut_valid
);
  assign dataIn_0_ready = dataOut_ready; // @[elastic_component.scala 133:21]
  assign dataIn_1_ready = dataOut_ready; // @[elastic_component.scala 133:21]
  assign dataOut_valid = dataIn_0_valid | dataIn_1_valid; // @[elastic_component.scala 142:27 elastic_component.scala 144:17]
endmodule
module TEHB_4(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataIn_bits,
  input   dataOut_ready,
  output  dataOut_valid,
  output  dataOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  full_reg; // @[elastic_component.scala 39:33]
  reg  data_reg; // @[elastic_component.scala 42:33]
  wire  _reg_en_T_1 = ~dataOut_ready; // @[elastic_component.scala 46:44]
  wire  reg_en = dataIn_ready & dataIn_valid & ~dataOut_ready; // @[elastic_component.scala 46:41]
  assign dataIn_ready = ~full_reg; // @[elastic_component.scala 45:19]
  assign dataOut_valid = dataIn_valid | full_reg; // @[elastic_component.scala 44:33]
  assign dataOut_bits = full_reg ? data_reg : dataIn_bits; // @[elastic_component.scala 55:17 elastic_component.scala 56:18 elastic_component.scala 58:18]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 39:33]
      full_reg <= 1'h0; // @[elastic_component.scala 39:33]
    end else begin
      full_reg <= dataOut_valid & _reg_en_T_1; // @[elastic_component.scala 49:12]
    end
    if (reset) begin // @[elastic_component.scala 42:33]
      data_reg <= 1'h0; // @[elastic_component.scala 42:33]
    end else if (reg_en) begin // @[elastic_component.scala 51:16]
      data_reg <= dataIn_bits; // @[elastic_component.scala 52:14]
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
  full_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  data_reg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module EagerFork_RegisterBlock(
  input   clock,
  input   reset,
  input   p_valid,
  input   n_stop,
  input   p_valid_and_fork_stop,
  output  valid,
  output  block_stop
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  reg_; // @[elastic_component.scala 181:28]
  wire  block_stop_internal = n_stop & reg_; // @[elastic_component.scala 183:44]
  assign valid = reg_ & p_valid; // @[elastic_component.scala 186:16]
  assign block_stop = n_stop & reg_; // @[elastic_component.scala 183:44]
  always @(posedge clock) begin
    reg_ <= reset | (block_stop_internal | ~p_valid_and_fork_stop); // @[elastic_component.scala 181:28 elastic_component.scala 181:28 elastic_component.scala 185:7]
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
  reg_ = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Fork(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  input   dataOut_1_ready,
  output  dataOut_1_valid
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Control_Merge(
  input   clock,
  input   reset,
  output  dataIn_0_ready,
  input   dataIn_0_valid,
  output  dataIn_1_ready,
  input   dataIn_1_valid,
  input   condition_ready,
  output  condition_valid,
  output  condition_bits,
  input   dataOut_ready,
  output  dataOut_valid
);
  wire  phi_c_dataIn_0_ready; // @[elastic_component.scala 217:29]
  wire  phi_c_dataIn_0_valid; // @[elastic_component.scala 217:29]
  wire  phi_c_dataIn_1_ready; // @[elastic_component.scala 217:29]
  wire  phi_c_dataIn_1_valid; // @[elastic_component.scala 217:29]
  wire  phi_c_dataOut_ready; // @[elastic_component.scala 217:29]
  wire  phi_c_dataOut_valid; // @[elastic_component.scala 217:29]
  wire  tehb_clock; // @[elastic_component.scala 226:28]
  wire  tehb_reset; // @[elastic_component.scala 226:28]
  wire  tehb_dataIn_ready; // @[elastic_component.scala 226:28]
  wire  tehb_dataIn_valid; // @[elastic_component.scala 226:28]
  wire  tehb_dataIn_bits; // @[elastic_component.scala 226:28]
  wire  tehb_dataOut_ready; // @[elastic_component.scala 226:28]
  wire  tehb_dataOut_valid; // @[elastic_component.scala 226:28]
  wire  tehb_dataOut_bits; // @[elastic_component.scala 226:28]
  wire  fork_c_clock; // @[elastic_component.scala 232:30]
  wire  fork_c_reset; // @[elastic_component.scala 232:30]
  wire  fork_c_dataIn_ready; // @[elastic_component.scala 232:30]
  wire  fork_c_dataIn_valid; // @[elastic_component.scala 232:30]
  wire  fork_c_dataOut_0_ready; // @[elastic_component.scala 232:30]
  wire  fork_c_dataOut_0_valid; // @[elastic_component.scala 232:30]
  wire  fork_c_dataOut_1_ready; // @[elastic_component.scala 232:30]
  wire  fork_c_dataOut_1_valid; // @[elastic_component.scala 232:30]
  Merge_no_tehb phi_c ( // @[elastic_component.scala 217:29]
    .dataIn_0_ready(phi_c_dataIn_0_ready),
    .dataIn_0_valid(phi_c_dataIn_0_valid),
    .dataIn_1_ready(phi_c_dataIn_1_ready),
    .dataIn_1_valid(phi_c_dataIn_1_valid),
    .dataOut_ready(phi_c_dataOut_ready),
    .dataOut_valid(phi_c_dataOut_valid)
  );
  TEHB_4 tehb ( // @[elastic_component.scala 226:28]
    .clock(tehb_clock),
    .reset(tehb_reset),
    .dataIn_ready(tehb_dataIn_ready),
    .dataIn_valid(tehb_dataIn_valid),
    .dataIn_bits(tehb_dataIn_bits),
    .dataOut_ready(tehb_dataOut_ready),
    .dataOut_valid(tehb_dataOut_valid),
    .dataOut_bits(tehb_dataOut_bits)
  );
  Fork fork_c ( // @[elastic_component.scala 232:30]
    .clock(fork_c_clock),
    .reset(fork_c_reset),
    .dataIn_ready(fork_c_dataIn_ready),
    .dataIn_valid(fork_c_dataIn_valid),
    .dataOut_0_ready(fork_c_dataOut_0_ready),
    .dataOut_0_valid(fork_c_dataOut_0_valid),
    .dataOut_1_ready(fork_c_dataOut_1_ready),
    .dataOut_1_valid(fork_c_dataOut_1_valid)
  );
  assign dataIn_0_ready = phi_c_dataIn_0_ready; // @[elastic_component.scala 222:19]
  assign dataIn_1_ready = phi_c_dataIn_1_ready; // @[elastic_component.scala 223:19]
  assign condition_valid = fork_c_dataOut_0_valid; // @[elastic_component.scala 240:19]
  assign condition_bits = tehb_dataOut_bits; // @[elastic_component.scala 242:18]
  assign dataOut_valid = fork_c_dataOut_1_valid; // @[elastic_component.scala 241:17]
  assign phi_c_dataIn_0_valid = dataIn_0_valid; // @[elastic_component.scala 220:25]
  assign phi_c_dataIn_1_valid = dataIn_1_valid; // @[elastic_component.scala 221:25]
  assign phi_c_dataOut_ready = tehb_dataIn_ready; // @[elastic_component.scala 227:23]
  assign tehb_clock = clock;
  assign tehb_reset = reset;
  assign tehb_dataIn_valid = phi_c_dataOut_valid; // @[elastic_component.scala 229:21]
  assign tehb_dataIn_bits = ~dataIn_0_valid; // @[elastic_component.scala 228:23]
  assign tehb_dataOut_ready = fork_c_dataIn_ready; // @[elastic_component.scala 233:22]
  assign fork_c_clock = clock;
  assign fork_c_reset = reset;
  assign fork_c_dataIn_valid = tehb_dataOut_valid; // @[elastic_component.scala 234:23]
  assign fork_c_dataOut_0_ready = condition_ready; // @[elastic_component.scala 237:19]
  assign fork_c_dataOut_1_ready = dataOut_ready; // @[elastic_component.scala 238:17]
endmodule
module TEHB_5(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_ready,
  output  dataOut_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  full_reg; // @[elastic_component.scala 39:33]
  wire  _reg_en_T_1 = ~dataOut_ready; // @[elastic_component.scala 46:44]
  assign dataIn_ready = ~full_reg; // @[elastic_component.scala 45:19]
  assign dataOut_valid = dataIn_valid | full_reg; // @[elastic_component.scala 44:33]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 39:33]
      full_reg <= 1'h0; // @[elastic_component.scala 39:33]
    end else begin
      full_reg <= dataOut_valid & _reg_en_T_1; // @[elastic_component.scala 49:12]
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
  full_reg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module OEHB(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_ready,
  output  dataOut_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  full_reg; // @[elastic_component.scala 71:33]
  assign dataIn_ready = ~full_reg | dataOut_ready; // @[elastic_component.scala 76:31]
  assign dataOut_valid = full_reg; // @[elastic_component.scala 75:17]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 71:33]
      full_reg <= 1'h0; // @[elastic_component.scala 71:33]
    end else begin
      full_reg <= dataIn_valid | ~dataIn_ready; // @[elastic_component.scala 79:12]
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
  full_reg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticBuffer(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_ready,
  output  dataOut_valid
);
  wire  tehb_clock; // @[elastic_component.scala 92:28]
  wire  tehb_reset; // @[elastic_component.scala 92:28]
  wire  tehb_dataIn_ready; // @[elastic_component.scala 92:28]
  wire  tehb_dataIn_valid; // @[elastic_component.scala 92:28]
  wire  tehb_dataOut_ready; // @[elastic_component.scala 92:28]
  wire  tehb_dataOut_valid; // @[elastic_component.scala 92:28]
  wire  oehb_clock; // @[elastic_component.scala 93:28]
  wire  oehb_reset; // @[elastic_component.scala 93:28]
  wire  oehb_dataIn_ready; // @[elastic_component.scala 93:28]
  wire  oehb_dataIn_valid; // @[elastic_component.scala 93:28]
  wire  oehb_dataOut_ready; // @[elastic_component.scala 93:28]
  wire  oehb_dataOut_valid; // @[elastic_component.scala 93:28]
  TEHB_5 tehb ( // @[elastic_component.scala 92:28]
    .clock(tehb_clock),
    .reset(tehb_reset),
    .dataIn_ready(tehb_dataIn_ready),
    .dataIn_valid(tehb_dataIn_valid),
    .dataOut_ready(tehb_dataOut_ready),
    .dataOut_valid(tehb_dataOut_valid)
  );
  OEHB oehb ( // @[elastic_component.scala 93:28]
    .clock(oehb_clock),
    .reset(oehb_reset),
    .dataIn_ready(oehb_dataIn_ready),
    .dataIn_valid(oehb_dataIn_valid),
    .dataOut_ready(oehb_dataOut_ready),
    .dataOut_valid(oehb_dataOut_valid)
  );
  assign dataIn_ready = tehb_dataIn_ready; // @[elastic_component.scala 96:15]
  assign dataOut_valid = oehb_dataOut_valid; // @[elastic_component.scala 98:11]
  assign tehb_clock = clock;
  assign tehb_reset = reset;
  assign tehb_dataIn_valid = dataIn_valid; // @[elastic_component.scala 96:15]
  assign tehb_dataOut_ready = oehb_dataIn_ready; // @[elastic_component.scala 97:16]
  assign oehb_clock = clock;
  assign oehb_reset = reset;
  assign oehb_dataIn_valid = tehb_dataOut_valid; // @[elastic_component.scala 97:16]
  assign oehb_dataOut_ready = dataOut_ready; // @[elastic_component.scala 98:11]
endmodule
module Join(
  input   pValid_0,
  input   pValid_1,
  output  ready_0,
  output  ready_1,
  output  valid,
  input   nReady
);
  assign ready_0 = nReady & pValid_1; // @[elastic_component.scala 30:74]
  assign ready_1 = nReady & pValid_0; // @[elastic_component.scala 30:74]
  assign valid = pValid_0 & pValid_1; // @[elastic_component.scala 27:38]
endmodule
module Branch(
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  output  condition_ready,
  input   condition_valid,
  input   condition_bits
);
  wire  join__pValid_0; // @[elastic_component.scala 157:28]
  wire  join__pValid_1; // @[elastic_component.scala 157:28]
  wire  join__ready_0; // @[elastic_component.scala 157:28]
  wire  join__ready_1; // @[elastic_component.scala 157:28]
  wire  join__valid; // @[elastic_component.scala 157:28]
  wire  join__nReady; // @[elastic_component.scala 157:28]
  Join join_ ( // @[elastic_component.scala 157:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  assign dataIn_ready = join__ready_1; // @[elastic_component.scala 168:16]
  assign dataOut_0_valid = condition_bits & join__valid; // @[elastic_component.scala 165:40]
  assign condition_ready = join__ready_0; // @[elastic_component.scala 167:19]
  assign join__pValid_0 = condition_valid; // @[elastic_component.scala 159:18]
  assign join__pValid_1 = dataIn_valid; // @[elastic_component.scala 160:18]
  assign join__nReady = ~condition_bits | dataOut_0_ready & condition_bits; // @[elastic_component.scala 162:55]
endmodule
module MuxDynamic(
  input         clock,
  input         reset,
  output        dataIn_0_ready,
  input         dataIn_0_valid,
  input  [63:0] dataIn_0_bits,
  output        dataIn_1_ready,
  input         dataIn_1_valid,
  input  [63:0] dataIn_1_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits,
  output        condition_ready,
  input         condition_valid,
  input         condition_bits
);
  wire  tehb_clock; // @[elastic_component.scala 289:28]
  wire  tehb_reset; // @[elastic_component.scala 289:28]
  wire  tehb_dataIn_ready; // @[elastic_component.scala 289:28]
  wire  tehb_dataIn_valid; // @[elastic_component.scala 289:28]
  wire [63:0] tehb_dataIn_bits; // @[elastic_component.scala 289:28]
  wire  tehb_dataOut_ready; // @[elastic_component.scala 289:28]
  wire  tehb_dataOut_valid; // @[elastic_component.scala 289:28]
  wire [63:0] tehb_dataOut_bits; // @[elastic_component.scala 289:28]
  wire  _T_2 = condition_bits & condition_valid & dataIn_1_valid; // @[elastic_component.scala 295:52]
  wire [63:0] _GEN_0 = condition_bits & condition_valid & dataIn_1_valid ? dataIn_1_bits : dataIn_0_bits; // @[elastic_component.scala 295:72 elastic_component.scala 296:16 elastic_component.scala 286:12]
  wire  _T_11 = ~condition_bits & condition_valid & dataIn_0_valid; // @[elastic_component.scala 295:52]
  wire  tmp_valid = ~condition_bits & condition_valid & dataIn_0_valid | condition_bits & condition_valid &
    dataIn_1_valid; // @[elastic_component.scala 295:72 elastic_component.scala 297:17]
  TEHB tehb ( // @[elastic_component.scala 289:28]
    .clock(tehb_clock),
    .reset(tehb_reset),
    .dataIn_ready(tehb_dataIn_ready),
    .dataIn_valid(tehb_dataIn_valid),
    .dataIn_bits(tehb_dataIn_bits),
    .dataOut_ready(tehb_dataOut_ready),
    .dataOut_valid(tehb_dataOut_valid),
    .dataOut_bits(tehb_dataOut_bits)
  );
  assign dataIn_0_ready = _T_11 & tehb_dataIn_ready | ~dataIn_0_valid; // @[elastic_component.scala 299:94]
  assign dataIn_1_ready = _T_2 & tehb_dataIn_ready | ~dataIn_1_valid; // @[elastic_component.scala 299:94]
  assign dataOut_valid = tehb_dataOut_valid; // @[elastic_component.scala 292:16]
  assign dataOut_bits = tehb_dataOut_bits; // @[elastic_component.scala 292:16]
  assign condition_ready = ~condition_valid | tmp_valid & tehb_dataIn_ready; // @[elastic_component.scala 306:25]
  assign tehb_clock = clock;
  assign tehb_reset = reset;
  assign tehb_dataIn_valid = ~condition_bits & condition_valid & dataIn_0_valid | condition_bits & condition_valid &
    dataIn_1_valid; // @[elastic_component.scala 295:72 elastic_component.scala 297:17]
  assign tehb_dataIn_bits = ~condition_bits & condition_valid & dataIn_0_valid ? dataIn_0_bits : _GEN_0; // @[elastic_component.scala 295:72 elastic_component.scala 296:16]
  assign tehb_dataOut_ready = dataOut_ready; // @[elastic_component.scala 292:16]
endmodule
module OEHB_1(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  full_reg; // @[elastic_component.scala 71:33]
  reg [63:0] data_reg; // @[elastic_component.scala 73:33]
  wire  reg_en = dataIn_ready & dataIn_valid; // @[elastic_component.scala 77:26]
  assign dataIn_ready = ~full_reg | dataOut_ready; // @[elastic_component.scala 76:31]
  assign dataOut_valid = full_reg; // @[elastic_component.scala 75:17]
  assign dataOut_bits = data_reg; // @[elastic_component.scala 85:16]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 71:33]
      full_reg <= 1'h0; // @[elastic_component.scala 71:33]
    end else begin
      full_reg <= dataIn_valid | ~dataIn_ready; // @[elastic_component.scala 79:12]
    end
    if (reset) begin // @[elastic_component.scala 73:33]
      data_reg <= 64'h0; // @[elastic_component.scala 73:33]
    end else if (reg_en) begin // @[elastic_component.scala 81:16]
      data_reg <= dataIn_bits; // @[elastic_component.scala 82:14]
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
  full_reg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  data_reg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticBuffer_1(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  tehb_clock; // @[elastic_component.scala 92:28]
  wire  tehb_reset; // @[elastic_component.scala 92:28]
  wire  tehb_dataIn_ready; // @[elastic_component.scala 92:28]
  wire  tehb_dataIn_valid; // @[elastic_component.scala 92:28]
  wire [63:0] tehb_dataIn_bits; // @[elastic_component.scala 92:28]
  wire  tehb_dataOut_ready; // @[elastic_component.scala 92:28]
  wire  tehb_dataOut_valid; // @[elastic_component.scala 92:28]
  wire [63:0] tehb_dataOut_bits; // @[elastic_component.scala 92:28]
  wire  oehb_clock; // @[elastic_component.scala 93:28]
  wire  oehb_reset; // @[elastic_component.scala 93:28]
  wire  oehb_dataIn_ready; // @[elastic_component.scala 93:28]
  wire  oehb_dataIn_valid; // @[elastic_component.scala 93:28]
  wire [63:0] oehb_dataIn_bits; // @[elastic_component.scala 93:28]
  wire  oehb_dataOut_ready; // @[elastic_component.scala 93:28]
  wire  oehb_dataOut_valid; // @[elastic_component.scala 93:28]
  wire [63:0] oehb_dataOut_bits; // @[elastic_component.scala 93:28]
  TEHB tehb ( // @[elastic_component.scala 92:28]
    .clock(tehb_clock),
    .reset(tehb_reset),
    .dataIn_ready(tehb_dataIn_ready),
    .dataIn_valid(tehb_dataIn_valid),
    .dataIn_bits(tehb_dataIn_bits),
    .dataOut_ready(tehb_dataOut_ready),
    .dataOut_valid(tehb_dataOut_valid),
    .dataOut_bits(tehb_dataOut_bits)
  );
  OEHB_1 oehb ( // @[elastic_component.scala 93:28]
    .clock(oehb_clock),
    .reset(oehb_reset),
    .dataIn_ready(oehb_dataIn_ready),
    .dataIn_valid(oehb_dataIn_valid),
    .dataIn_bits(oehb_dataIn_bits),
    .dataOut_ready(oehb_dataOut_ready),
    .dataOut_valid(oehb_dataOut_valid),
    .dataOut_bits(oehb_dataOut_bits)
  );
  assign dataIn_ready = tehb_dataIn_ready; // @[elastic_component.scala 96:15]
  assign dataOut_valid = oehb_dataOut_valid; // @[elastic_component.scala 98:11]
  assign dataOut_bits = oehb_dataOut_bits; // @[elastic_component.scala 98:11]
  assign tehb_clock = clock;
  assign tehb_reset = reset;
  assign tehb_dataIn_valid = dataIn_valid; // @[elastic_component.scala 96:15]
  assign tehb_dataIn_bits = dataIn_bits; // @[elastic_component.scala 96:15]
  assign tehb_dataOut_ready = oehb_dataIn_ready; // @[elastic_component.scala 97:16]
  assign oehb_clock = clock;
  assign oehb_reset = reset;
  assign oehb_dataIn_valid = tehb_dataOut_valid; // @[elastic_component.scala 97:16]
  assign oehb_dataIn_bits = tehb_dataOut_bits; // @[elastic_component.scala 97:16]
  assign oehb_dataOut_ready = dataOut_ready; // @[elastic_component.scala 98:11]
endmodule
module Branch_1(
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_0_ready,
  output        dataOut_0_valid,
  output [63:0] dataOut_0_bits,
  input         dataOut_1_ready,
  output        dataOut_1_valid,
  output [63:0] dataOut_1_bits,
  output        condition_ready,
  input         condition_valid,
  input         condition_bits
);
  wire  join__pValid_0; // @[elastic_component.scala 157:28]
  wire  join__pValid_1; // @[elastic_component.scala 157:28]
  wire  join__ready_0; // @[elastic_component.scala 157:28]
  wire  join__ready_1; // @[elastic_component.scala 157:28]
  wire  join__valid; // @[elastic_component.scala 157:28]
  wire  join__nReady; // @[elastic_component.scala 157:28]
  wire  _join_nReady_T = ~condition_bits; // @[elastic_component.scala 162:38]
  Join join_ ( // @[elastic_component.scala 157:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  assign dataIn_ready = join__ready_1; // @[elastic_component.scala 168:16]
  assign dataOut_0_valid = condition_bits & join__valid; // @[elastic_component.scala 165:40]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 170:19]
  assign dataOut_1_valid = _join_nReady_T & join__valid; // @[elastic_component.scala 164:41]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 171:19]
  assign condition_ready = join__ready_0; // @[elastic_component.scala 167:19]
  assign join__pValid_0 = condition_valid; // @[elastic_component.scala 159:18]
  assign join__pValid_1 = dataIn_valid; // @[elastic_component.scala 160:18]
  assign join__nReady = dataOut_1_ready & ~condition_bits | dataOut_0_ready & condition_bits; // @[elastic_component.scala 162:55]
endmodule
module Constant(
  output        control_ready,
  input         control_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  assign control_ready = dataOut_ready; // @[arithmetic_unit.scala 428:11]
  assign dataOut_valid = control_valid; // @[arithmetic_unit.scala 428:11]
  assign dataOut_bits = dataIn_bits; // @[arithmetic_unit.scala 429:16]
endmodule
module Constant_1(
  output        control_ready,
  input         control_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [31:0] dataOut_bits
);
  assign control_ready = dataOut_ready; // @[arithmetic_unit.scala 428:11]
  assign dataOut_valid = control_valid; // @[arithmetic_unit.scala 428:11]
  assign dataOut_bits = dataIn_bits; // @[arithmetic_unit.scala 429:16]
endmodule
module MuxDynamic_1(
  input         clock,
  input         reset,
  output        dataIn_0_ready,
  input         dataIn_0_valid,
  input  [31:0] dataIn_0_bits,
  output        dataIn_1_ready,
  input         dataIn_1_valid,
  input  [31:0] dataIn_1_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [31:0] dataOut_bits,
  output        condition_ready,
  input         condition_valid,
  input         condition_bits
);
  wire  tehb_clock; // @[elastic_component.scala 289:28]
  wire  tehb_reset; // @[elastic_component.scala 289:28]
  wire  tehb_dataIn_ready; // @[elastic_component.scala 289:28]
  wire  tehb_dataIn_valid; // @[elastic_component.scala 289:28]
  wire [31:0] tehb_dataIn_bits; // @[elastic_component.scala 289:28]
  wire  tehb_dataOut_ready; // @[elastic_component.scala 289:28]
  wire  tehb_dataOut_valid; // @[elastic_component.scala 289:28]
  wire [31:0] tehb_dataOut_bits; // @[elastic_component.scala 289:28]
  wire  _T_2 = condition_bits & condition_valid & dataIn_1_valid; // @[elastic_component.scala 295:52]
  wire [31:0] _GEN_0 = condition_bits & condition_valid & dataIn_1_valid ? dataIn_1_bits : dataIn_0_bits; // @[elastic_component.scala 295:72 elastic_component.scala 296:16 elastic_component.scala 286:12]
  wire  _T_11 = ~condition_bits & condition_valid & dataIn_0_valid; // @[elastic_component.scala 295:52]
  wire  tmp_valid = ~condition_bits & condition_valid & dataIn_0_valid | condition_bits & condition_valid &
    dataIn_1_valid; // @[elastic_component.scala 295:72 elastic_component.scala 297:17]
  TEHB_2 tehb ( // @[elastic_component.scala 289:28]
    .clock(tehb_clock),
    .reset(tehb_reset),
    .dataIn_ready(tehb_dataIn_ready),
    .dataIn_valid(tehb_dataIn_valid),
    .dataIn_bits(tehb_dataIn_bits),
    .dataOut_ready(tehb_dataOut_ready),
    .dataOut_valid(tehb_dataOut_valid),
    .dataOut_bits(tehb_dataOut_bits)
  );
  assign dataIn_0_ready = _T_11 & tehb_dataIn_ready | ~dataIn_0_valid; // @[elastic_component.scala 299:94]
  assign dataIn_1_ready = _T_2 & tehb_dataIn_ready | ~dataIn_1_valid; // @[elastic_component.scala 299:94]
  assign dataOut_valid = tehb_dataOut_valid; // @[elastic_component.scala 292:16]
  assign dataOut_bits = tehb_dataOut_bits; // @[elastic_component.scala 292:16]
  assign condition_ready = ~condition_valid | tmp_valid & tehb_dataIn_ready; // @[elastic_component.scala 306:25]
  assign tehb_clock = clock;
  assign tehb_reset = reset;
  assign tehb_dataIn_valid = ~condition_bits & condition_valid & dataIn_0_valid | condition_bits & condition_valid &
    dataIn_1_valid; // @[elastic_component.scala 295:72 elastic_component.scala 297:17]
  assign tehb_dataIn_bits = ~condition_bits & condition_valid & dataIn_0_valid ? dataIn_0_bits : _GEN_0; // @[elastic_component.scala 295:72 elastic_component.scala 296:16]
  assign tehb_dataOut_ready = dataOut_ready; // @[elastic_component.scala 292:16]
endmodule
module OEHB_2(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [31:0] dataOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  full_reg; // @[elastic_component.scala 71:33]
  reg [31:0] data_reg; // @[elastic_component.scala 73:33]
  wire  reg_en = dataIn_ready & dataIn_valid; // @[elastic_component.scala 77:26]
  assign dataIn_ready = ~full_reg | dataOut_ready; // @[elastic_component.scala 76:31]
  assign dataOut_valid = full_reg; // @[elastic_component.scala 75:17]
  assign dataOut_bits = data_reg; // @[elastic_component.scala 85:16]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 71:33]
      full_reg <= 1'h0; // @[elastic_component.scala 71:33]
    end else begin
      full_reg <= dataIn_valid | ~dataIn_ready; // @[elastic_component.scala 79:12]
    end
    if (reset) begin // @[elastic_component.scala 73:33]
      data_reg <= 32'h0; // @[elastic_component.scala 73:33]
    end else if (reg_en) begin // @[elastic_component.scala 81:16]
      data_reg <= dataIn_bits; // @[elastic_component.scala 82:14]
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
  full_reg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  data_reg = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticBuffer_2(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [31:0] dataOut_bits
);
  wire  tehb_clock; // @[elastic_component.scala 92:28]
  wire  tehb_reset; // @[elastic_component.scala 92:28]
  wire  tehb_dataIn_ready; // @[elastic_component.scala 92:28]
  wire  tehb_dataIn_valid; // @[elastic_component.scala 92:28]
  wire [31:0] tehb_dataIn_bits; // @[elastic_component.scala 92:28]
  wire  tehb_dataOut_ready; // @[elastic_component.scala 92:28]
  wire  tehb_dataOut_valid; // @[elastic_component.scala 92:28]
  wire [31:0] tehb_dataOut_bits; // @[elastic_component.scala 92:28]
  wire  oehb_clock; // @[elastic_component.scala 93:28]
  wire  oehb_reset; // @[elastic_component.scala 93:28]
  wire  oehb_dataIn_ready; // @[elastic_component.scala 93:28]
  wire  oehb_dataIn_valid; // @[elastic_component.scala 93:28]
  wire [31:0] oehb_dataIn_bits; // @[elastic_component.scala 93:28]
  wire  oehb_dataOut_ready; // @[elastic_component.scala 93:28]
  wire  oehb_dataOut_valid; // @[elastic_component.scala 93:28]
  wire [31:0] oehb_dataOut_bits; // @[elastic_component.scala 93:28]
  TEHB_2 tehb ( // @[elastic_component.scala 92:28]
    .clock(tehb_clock),
    .reset(tehb_reset),
    .dataIn_ready(tehb_dataIn_ready),
    .dataIn_valid(tehb_dataIn_valid),
    .dataIn_bits(tehb_dataIn_bits),
    .dataOut_ready(tehb_dataOut_ready),
    .dataOut_valid(tehb_dataOut_valid),
    .dataOut_bits(tehb_dataOut_bits)
  );
  OEHB_2 oehb ( // @[elastic_component.scala 93:28]
    .clock(oehb_clock),
    .reset(oehb_reset),
    .dataIn_ready(oehb_dataIn_ready),
    .dataIn_valid(oehb_dataIn_valid),
    .dataIn_bits(oehb_dataIn_bits),
    .dataOut_ready(oehb_dataOut_ready),
    .dataOut_valid(oehb_dataOut_valid),
    .dataOut_bits(oehb_dataOut_bits)
  );
  assign dataIn_ready = tehb_dataIn_ready; // @[elastic_component.scala 96:15]
  assign dataOut_valid = oehb_dataOut_valid; // @[elastic_component.scala 98:11]
  assign dataOut_bits = oehb_dataOut_bits; // @[elastic_component.scala 98:11]
  assign tehb_clock = clock;
  assign tehb_reset = reset;
  assign tehb_dataIn_valid = dataIn_valid; // @[elastic_component.scala 96:15]
  assign tehb_dataIn_bits = dataIn_bits; // @[elastic_component.scala 96:15]
  assign tehb_dataOut_ready = oehb_dataIn_ready; // @[elastic_component.scala 97:16]
  assign oehb_clock = clock;
  assign oehb_reset = reset;
  assign oehb_dataIn_valid = tehb_dataOut_valid; // @[elastic_component.scala 97:16]
  assign oehb_dataIn_bits = tehb_dataOut_bits; // @[elastic_component.scala 97:16]
  assign oehb_dataOut_ready = dataOut_ready; // @[elastic_component.scala 98:11]
endmodule
module Branch_2(
  output        dataIn_ready,
  input         dataIn_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_0_ready,
  output        dataOut_0_valid,
  output [31:0] dataOut_0_bits,
  output        condition_ready,
  input         condition_valid,
  input         condition_bits
);
  wire  join__pValid_0; // @[elastic_component.scala 157:28]
  wire  join__pValid_1; // @[elastic_component.scala 157:28]
  wire  join__ready_0; // @[elastic_component.scala 157:28]
  wire  join__ready_1; // @[elastic_component.scala 157:28]
  wire  join__valid; // @[elastic_component.scala 157:28]
  wire  join__nReady; // @[elastic_component.scala 157:28]
  Join join_ ( // @[elastic_component.scala 157:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  assign dataIn_ready = join__ready_1; // @[elastic_component.scala 168:16]
  assign dataOut_0_valid = condition_bits & join__valid; // @[elastic_component.scala 165:40]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 170:19]
  assign condition_ready = join__ready_0; // @[elastic_component.scala 167:19]
  assign join__pValid_0 = condition_valid; // @[elastic_component.scala 159:18]
  assign join__pValid_1 = dataIn_valid; // @[elastic_component.scala 160:18]
  assign join__nReady = ~condition_bits | dataOut_0_ready & condition_bits; // @[elastic_component.scala 162:55]
endmodule
module AddIDynamic(
  output        operand0_ready,
  input         operand0_valid,
  input  [31:0] operand0_bits,
  output        operand1_ready,
  input         operand1_valid,
  input  [31:0] operand1_bits,
  input         result_ready,
  output        result_valid,
  output [31:0] result_bits
);
  assign operand0_ready = operand1_valid & result_ready; // @[arithmetic_unit.scala 103:36]
  assign operand1_ready = operand0_valid & result_ready; // @[arithmetic_unit.scala 104:36]
  assign result_valid = operand0_valid & operand1_valid; // @[arithmetic_unit.scala 102:34]
  assign result_bits = operand0_bits + operand1_bits; // @[arithmetic_unit.scala 113:71]
endmodule
module Load(
  output        address_in_ready,
  input         address_in_valid,
  input  [9:0]  address_in_bits,
  input         data_out_ready,
  output        data_out_valid,
  output [31:0] data_out_bits,
  input         address_out_ready,
  output        address_out_valid,
  output [9:0]  address_out_bits,
  output        data_in_ready,
  input         data_in_valid,
  input  [31:0] data_in_bits
);
  assign address_in_ready = address_out_ready; // @[elastic_component.scala 325:14]
  assign data_out_valid = data_in_valid; // @[elastic_component.scala 326:11]
  assign data_out_bits = data_in_bits; // @[elastic_component.scala 326:11]
  assign address_out_valid = address_in_valid; // @[elastic_component.scala 325:14]
  assign address_out_bits = address_in_bits; // @[elastic_component.scala 325:14]
  assign data_in_ready = data_out_ready; // @[elastic_component.scala 326:11]
endmodule
module TruncIDynamic(
  output        operand_ready,
  input         operand_valid,
  input  [31:0] operand_bits,
  input         result_ready,
  output        result_valid,
  output        result_bits
);
  assign operand_ready = result_ready; // @[arithmetic_unit.scala 94:17]
  assign result_valid = operand_valid; // @[arithmetic_unit.scala 93:16]
  assign result_bits = operand_bits[0]; // @[arithmetic_unit.scala 92:15]
endmodule
module Load_1(
  output        address_in_ready,
  input         address_in_valid,
  input  [9:0]  address_in_bits,
  input         data_out_ready,
  output        data_out_valid,
  output [63:0] data_out_bits,
  input         address_out_ready,
  output        address_out_valid,
  output [9:0]  address_out_bits,
  output        data_in_ready,
  input         data_in_valid,
  input  [63:0] data_in_bits
);
  assign address_in_ready = address_out_ready; // @[elastic_component.scala 325:14]
  assign data_out_valid = data_in_valid; // @[elastic_component.scala 326:11]
  assign data_out_bits = data_in_bits; // @[elastic_component.scala 326:11]
  assign address_out_valid = address_in_valid; // @[elastic_component.scala 325:14]
  assign address_out_bits = address_in_bits; // @[elastic_component.scala 325:14]
  assign data_in_ready = data_out_ready; // @[elastic_component.scala 326:11]
endmodule
module DelayBuffer(
  input   clock,
  input   reset,
  input   valid_in,
  input   ready_in,
  output  valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg  shift_register_0; // @[elastic_component.scala 564:31]
  reg  shift_register_1; // @[elastic_component.scala 564:31]
  reg  shift_register_2; // @[elastic_component.scala 564:31]
  reg  shift_register_3; // @[elastic_component.scala 564:31]
  reg  shift_register_4; // @[elastic_component.scala 564:31]
  reg  shift_register_5; // @[elastic_component.scala 564:31]
  reg  shift_register_6; // @[elastic_component.scala 564:31]
  reg  shift_register_7; // @[elastic_component.scala 564:31]
  reg  shift_register_8; // @[elastic_component.scala 564:31]
  reg  shift_register_9; // @[elastic_component.scala 564:31]
  reg  shift_register_10; // @[elastic_component.scala 564:31]
  reg  shift_register_11; // @[elastic_component.scala 564:31]
  assign valid_out = shift_register_11; // @[elastic_component.scala 572:13]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_0 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_0 <= valid_in; // @[elastic_component.scala 567:23]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_1 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_1 <= shift_register_0; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_2 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_2 <= shift_register_1; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_3 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_3 <= shift_register_2; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_4 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_4 <= shift_register_3; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_5 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_5 <= shift_register_4; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_6 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_6 <= shift_register_5; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_7 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_7 <= shift_register_6; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_8 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_8 <= shift_register_7; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_9 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_9 <= shift_register_8; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_10 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_10 <= shift_register_9; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_11 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_11 <= shift_register_10; // @[elastic_component.scala 569:25]
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
  shift_register_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  shift_register_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  shift_register_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  shift_register_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  shift_register_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  shift_register_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  shift_register_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  shift_register_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  shift_register_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  shift_register_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  shift_register_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  shift_register_11 = _RAND_11[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddRawFN(
  input         io_subOp,
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [12:0] io_a_sExp,
  input  [53:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [12:0] io_b_sExp,
  input  [53:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [12:0] io_rawOut_sExp,
  output [55:0] io_rawOut_sig
);
  wire  effSignB = io_b_sign ^ io_subOp; // @[AddRecFN.scala 60:30]
  wire  eqSigns = io_a_sign == effSignB; // @[AddRecFN.scala 61:29]
  wire [12:0] sDiffExps = $signed(io_a_sExp) - $signed(io_b_sExp); // @[AddRecFN.scala 63:31]
  wire  _T_2 = $signed(sDiffExps) < 13'sh0; // @[AddRecFN.scala 64:41]
  wire [12:0] _T_5 = $signed(io_b_sExp) - $signed(io_a_sExp); // @[AddRecFN.scala 64:58]
  wire [12:0] _T_6 = $signed(sDiffExps) < 13'sh0 ? $signed(_T_5) : $signed(sDiffExps); // @[AddRecFN.scala 64:30]
  wire [5:0] modNatAlignDist = _T_6[5:0]; // @[AddRecFN.scala 64:81]
  wire [6:0] _T_7 = sDiffExps[12:6]; // @[AddRecFN.scala 66:19]
  wire  _T_13 = $signed(_T_7) != -7'sh1 | sDiffExps[5:0] == 6'h0; // @[AddRecFN.scala 67:51]
  wire  isMaxAlign = $signed(_T_7) != 7'sh0 & _T_13; // @[AddRecFN.scala 66:45]
  wire [5:0] alignDist = isMaxAlign ? 6'h3f : modNatAlignDist; // @[AddRecFN.scala 68:24]
  wire  _T_14 = ~eqSigns; // @[AddRecFN.scala 69:24]
  wire  closeSubMags = ~eqSigns & ~isMaxAlign & modNatAlignDist <= 6'h1; // @[AddRecFN.scala 69:48]
  wire  _T_18 = 13'sh0 <= $signed(sDiffExps); // @[AddRecFN.scala 73:18]
  wire [55:0] _T_21 = {io_a_sig, 2'h0}; // @[AddRecFN.scala 73:58]
  wire [55:0] _T_22 = 13'sh0 <= $signed(sDiffExps) & sDiffExps[0] ? _T_21 : 56'h0; // @[AddRecFN.scala 73:12]
  wire [54:0] _T_27 = {io_a_sig, 1'h0}; // @[AddRecFN.scala 74:58]
  wire [54:0] _T_28 = _T_18 & ~sDiffExps[0] ? _T_27 : 55'h0; // @[AddRecFN.scala 74:12]
  wire [55:0] _GEN_0 = {{1'd0}, _T_28}; // @[AddRecFN.scala 73:68]
  wire [55:0] _T_29 = _T_22 | _GEN_0; // @[AddRecFN.scala 73:68]
  wire [53:0] _T_31 = _T_2 ? io_a_sig : 54'h0; // @[AddRecFN.scala 75:12]
  wire [55:0] _GEN_1 = {{2'd0}, _T_31}; // @[AddRecFN.scala 74:68]
  wire [55:0] _T_32 = _T_29 | _GEN_1; // @[AddRecFN.scala 76:43]
  wire [54:0] _T_34 = {io_b_sig, 1'h0}; // @[AddRecFN.scala 76:66]
  wire [55:0] _GEN_2 = {{1{_T_34[54]}},_T_34}; // @[AddRecFN.scala 76:50]
  wire [55:0] close_sSigSum = $signed(_T_32) - $signed(_GEN_2); // @[AddRecFN.scala 76:50]
  wire  _T_37 = $signed(close_sSigSum) < 56'sh0; // @[AddRecFN.scala 77:42]
  wire [55:0] _T_40 = 56'sh0 - $signed(close_sSigSum); // @[AddRecFN.scala 77:49]
  wire [55:0] _T_41 = $signed(close_sSigSum) < 56'sh0 ? $signed(_T_40) : $signed(close_sSigSum); // @[AddRecFN.scala 77:27]
  wire [54:0] close_sigSum = _T_41[54:0]; // @[AddRecFN.scala 77:79]
  wire [55:0] close_adjustedSigSum = {close_sigSum, 1'h0}; // @[AddRecFN.scala 78:44]
  wire  _T_43 = |close_adjustedSigSum[1:0]; // @[primitives.scala 104:54]
  wire  _T_45 = |close_adjustedSigSum[3:2]; // @[primitives.scala 104:54]
  wire  _T_47 = |close_adjustedSigSum[5:4]; // @[primitives.scala 104:54]
  wire  _T_49 = |close_adjustedSigSum[7:6]; // @[primitives.scala 104:54]
  wire  _T_51 = |close_adjustedSigSum[9:8]; // @[primitives.scala 104:54]
  wire  _T_53 = |close_adjustedSigSum[11:10]; // @[primitives.scala 104:54]
  wire  _T_55 = |close_adjustedSigSum[13:12]; // @[primitives.scala 104:54]
  wire  _T_57 = |close_adjustedSigSum[15:14]; // @[primitives.scala 104:54]
  wire  _T_59 = |close_adjustedSigSum[17:16]; // @[primitives.scala 104:54]
  wire  _T_61 = |close_adjustedSigSum[19:18]; // @[primitives.scala 104:54]
  wire  _T_63 = |close_adjustedSigSum[21:20]; // @[primitives.scala 104:54]
  wire  _T_65 = |close_adjustedSigSum[23:22]; // @[primitives.scala 104:54]
  wire  _T_67 = |close_adjustedSigSum[25:24]; // @[primitives.scala 104:54]
  wire  _T_69 = |close_adjustedSigSum[27:26]; // @[primitives.scala 104:54]
  wire  _T_71 = |close_adjustedSigSum[29:28]; // @[primitives.scala 104:54]
  wire  _T_73 = |close_adjustedSigSum[31:30]; // @[primitives.scala 104:54]
  wire  _T_75 = |close_adjustedSigSum[33:32]; // @[primitives.scala 104:54]
  wire  _T_77 = |close_adjustedSigSum[35:34]; // @[primitives.scala 104:54]
  wire  _T_79 = |close_adjustedSigSum[37:36]; // @[primitives.scala 104:54]
  wire  _T_81 = |close_adjustedSigSum[39:38]; // @[primitives.scala 104:54]
  wire  _T_83 = |close_adjustedSigSum[41:40]; // @[primitives.scala 104:54]
  wire  _T_85 = |close_adjustedSigSum[43:42]; // @[primitives.scala 104:54]
  wire  _T_87 = |close_adjustedSigSum[45:44]; // @[primitives.scala 104:54]
  wire  _T_89 = |close_adjustedSigSum[47:46]; // @[primitives.scala 104:54]
  wire  _T_91 = |close_adjustedSigSum[49:48]; // @[primitives.scala 104:54]
  wire  _T_93 = |close_adjustedSigSum[51:50]; // @[primitives.scala 104:54]
  wire  _T_95 = |close_adjustedSigSum[53:52]; // @[primitives.scala 104:54]
  wire  _T_97 = |close_adjustedSigSum[55:54]; // @[primitives.scala 107:57]
  wire [6:0] lo_lo = {_T_55,_T_53,_T_51,_T_49,_T_47,_T_45,_T_43}; // @[primitives.scala 108:20]
  wire [13:0] lo = {_T_69,_T_67,_T_65,_T_63,_T_61,_T_59,_T_57,lo_lo}; // @[primitives.scala 108:20]
  wire [6:0] hi_lo = {_T_83,_T_81,_T_79,_T_77,_T_75,_T_73,_T_71}; // @[primitives.scala 108:20]
  wire [27:0] close_reduced2SigSum = {_T_97,_T_95,_T_93,_T_91,_T_89,_T_87,_T_85,hi_lo,lo}; // @[primitives.scala 108:20]
  wire [4:0] _T_126 = close_reduced2SigSum[1] ? 5'h1a : 5'h1b; // @[Mux.scala 47:69]
  wire [4:0] _T_127 = close_reduced2SigSum[2] ? 5'h19 : _T_126; // @[Mux.scala 47:69]
  wire [4:0] _T_128 = close_reduced2SigSum[3] ? 5'h18 : _T_127; // @[Mux.scala 47:69]
  wire [4:0] _T_129 = close_reduced2SigSum[4] ? 5'h17 : _T_128; // @[Mux.scala 47:69]
  wire [4:0] _T_130 = close_reduced2SigSum[5] ? 5'h16 : _T_129; // @[Mux.scala 47:69]
  wire [4:0] _T_131 = close_reduced2SigSum[6] ? 5'h15 : _T_130; // @[Mux.scala 47:69]
  wire [4:0] _T_132 = close_reduced2SigSum[7] ? 5'h14 : _T_131; // @[Mux.scala 47:69]
  wire [4:0] _T_133 = close_reduced2SigSum[8] ? 5'h13 : _T_132; // @[Mux.scala 47:69]
  wire [4:0] _T_134 = close_reduced2SigSum[9] ? 5'h12 : _T_133; // @[Mux.scala 47:69]
  wire [4:0] _T_135 = close_reduced2SigSum[10] ? 5'h11 : _T_134; // @[Mux.scala 47:69]
  wire [4:0] _T_136 = close_reduced2SigSum[11] ? 5'h10 : _T_135; // @[Mux.scala 47:69]
  wire [4:0] _T_137 = close_reduced2SigSum[12] ? 5'hf : _T_136; // @[Mux.scala 47:69]
  wire [4:0] _T_138 = close_reduced2SigSum[13] ? 5'he : _T_137; // @[Mux.scala 47:69]
  wire [4:0] _T_139 = close_reduced2SigSum[14] ? 5'hd : _T_138; // @[Mux.scala 47:69]
  wire [4:0] _T_140 = close_reduced2SigSum[15] ? 5'hc : _T_139; // @[Mux.scala 47:69]
  wire [4:0] _T_141 = close_reduced2SigSum[16] ? 5'hb : _T_140; // @[Mux.scala 47:69]
  wire [4:0] _T_142 = close_reduced2SigSum[17] ? 5'ha : _T_141; // @[Mux.scala 47:69]
  wire [4:0] _T_143 = close_reduced2SigSum[18] ? 5'h9 : _T_142; // @[Mux.scala 47:69]
  wire [4:0] _T_144 = close_reduced2SigSum[19] ? 5'h8 : _T_143; // @[Mux.scala 47:69]
  wire [4:0] _T_145 = close_reduced2SigSum[20] ? 5'h7 : _T_144; // @[Mux.scala 47:69]
  wire [4:0] _T_146 = close_reduced2SigSum[21] ? 5'h6 : _T_145; // @[Mux.scala 47:69]
  wire [4:0] _T_147 = close_reduced2SigSum[22] ? 5'h5 : _T_146; // @[Mux.scala 47:69]
  wire [4:0] _T_148 = close_reduced2SigSum[23] ? 5'h4 : _T_147; // @[Mux.scala 47:69]
  wire [4:0] _T_149 = close_reduced2SigSum[24] ? 5'h3 : _T_148; // @[Mux.scala 47:69]
  wire [4:0] _T_150 = close_reduced2SigSum[25] ? 5'h2 : _T_149; // @[Mux.scala 47:69]
  wire [4:0] _T_151 = close_reduced2SigSum[26] ? 5'h1 : _T_150; // @[Mux.scala 47:69]
  wire [4:0] close_normDistReduced2 = close_reduced2SigSum[27] ? 5'h0 : _T_151; // @[Mux.scala 47:69]
  wire [5:0] close_nearNormDist = {close_normDistReduced2, 1'h0}; // @[AddRecFN.scala 81:53]
  wire [117:0] _GEN_3 = {{63'd0}, close_sigSum}; // @[AddRecFN.scala 82:38]
  wire [117:0] _T_153 = _GEN_3 << close_nearNormDist; // @[AddRecFN.scala 82:38]
  wire [118:0] _T_154 = {_T_153, 1'h0}; // @[AddRecFN.scala 82:59]
  wire [55:0] close_sigOut = _T_154[55:0]; // @[AddRecFN.scala 82:63]
  wire  close_totalCancellation = ~(|close_sigOut[55:54]); // @[AddRecFN.scala 83:35]
  wire  close_notTotalCancellation_signOut = io_a_sign ^ _T_37; // @[AddRecFN.scala 84:56]
  wire  far_signOut = _T_2 ? effSignB : io_a_sign; // @[AddRecFN.scala 87:26]
  wire [53:0] _T_160 = _T_2 ? io_b_sig : io_a_sig; // @[AddRecFN.scala 88:29]
  wire [52:0] far_sigLarger = _T_160[52:0]; // @[AddRecFN.scala 88:66]
  wire [53:0] _T_162 = _T_2 ? io_a_sig : io_b_sig; // @[AddRecFN.scala 89:29]
  wire [52:0] far_sigSmaller = _T_162[52:0]; // @[AddRecFN.scala 89:66]
  wire [57:0] _T_163 = {far_sigSmaller, 5'h0}; // @[AddRecFN.scala 90:52]
  wire [57:0] far_mainAlignedSigSmaller = _T_163 >> alignDist; // @[AddRecFN.scala 90:56]
  wire [54:0] _T_164 = {far_sigSmaller, 2'h0}; // @[AddRecFN.scala 91:60]
  wire  _T_166 = |_T_164[3:0]; // @[primitives.scala 121:54]
  wire  _T_168 = |_T_164[7:4]; // @[primitives.scala 121:54]
  wire  _T_170 = |_T_164[11:8]; // @[primitives.scala 121:54]
  wire  _T_172 = |_T_164[15:12]; // @[primitives.scala 121:54]
  wire  _T_174 = |_T_164[19:16]; // @[primitives.scala 121:54]
  wire  _T_176 = |_T_164[23:20]; // @[primitives.scala 121:54]
  wire  _T_178 = |_T_164[27:24]; // @[primitives.scala 121:54]
  wire  _T_180 = |_T_164[31:28]; // @[primitives.scala 121:54]
  wire  _T_182 = |_T_164[35:32]; // @[primitives.scala 121:54]
  wire  _T_184 = |_T_164[39:36]; // @[primitives.scala 121:54]
  wire  _T_186 = |_T_164[43:40]; // @[primitives.scala 121:54]
  wire  _T_188 = |_T_164[47:44]; // @[primitives.scala 121:54]
  wire  _T_190 = |_T_164[51:48]; // @[primitives.scala 121:54]
  wire  _T_192 = |_T_164[54:52]; // @[primitives.scala 124:57]
  wire [6:0] lo_1 = {_T_178,_T_176,_T_174,_T_172,_T_170,_T_168,_T_166}; // @[primitives.scala 125:20]
  wire [13:0] far_reduced4SigSmaller = {_T_192,_T_190,_T_188,_T_186,_T_184,_T_182,_T_180,lo_1}; // @[primitives.scala 125:20]
  wire [16:0] _T_194 = 17'sh10000 >>> alignDist[5:2]; // @[primitives.scala 77:58]
  wire [7:0] _T_200 = {{4'd0}, _T_194[9:6]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_202 = {_T_194[5:2], 4'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_204 = _T_202 & 8'hf0; // @[Bitwise.scala 103:75]
  wire [7:0] _T_205 = _T_200 | _T_204; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_4 = {{2'd0}, _T_205[7:2]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_210 = _GEN_4 & 8'h33; // @[Bitwise.scala 103:31]
  wire [7:0] _T_212 = {_T_205[5:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_214 = _T_212 & 8'hcc; // @[Bitwise.scala 103:75]
  wire [7:0] _T_215 = _T_210 | _T_214; // @[Bitwise.scala 103:39]
  wire [7:0] _GEN_5 = {{1'd0}, _T_215[7:1]}; // @[Bitwise.scala 103:31]
  wire [7:0] _T_220 = _GEN_5 & 8'h55; // @[Bitwise.scala 103:31]
  wire [7:0] _T_222 = {_T_215[6:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [7:0] _T_224 = _T_222 & 8'haa; // @[Bitwise.scala 103:75]
  wire [7:0] hi_2 = _T_220 | _T_224; // @[Bitwise.scala 103:39]
  wire  hi_3 = _T_194[10]; // @[Bitwise.scala 109:18]
  wire  lo_2 = _T_194[11]; // @[Bitwise.scala 109:44]
  wire  hi_5 = _T_194[12]; // @[Bitwise.scala 109:18]
  wire  lo_3 = _T_194[13]; // @[Bitwise.scala 109:44]
  wire  hi_7 = _T_194[14]; // @[Bitwise.scala 109:18]
  wire  lo_5 = _T_194[15]; // @[Bitwise.scala 109:44]
  wire [13:0] far_roundExtraMask = {hi_2,hi_3,lo_2,hi_5,lo_3,hi_7,lo_5}; // @[Cat.scala 30:58]
  wire [54:0] hi_8 = far_mainAlignedSigSmaller[57:3]; // @[AddRecFN.scala 94:38]
  wire [13:0] _T_232 = far_reduced4SigSmaller & far_roundExtraMask; // @[AddRecFN.scala 95:76]
  wire  lo_8 = |far_mainAlignedSigSmaller[2:0] | |_T_232; // @[AddRecFN.scala 95:49]
  wire [55:0] far_alignedSigSmaller = {hi_8,lo_8}; // @[Cat.scala 30:58]
  wire [55:0] lo_9 = ~far_alignedSigSmaller; // @[AddRecFN.scala 97:62]
  wire [56:0] _T_234 = {1'h1,lo_9}; // @[Cat.scala 30:58]
  wire [56:0] far_negAlignedSigSmaller = _T_14 ? _T_234 : {{1'd0}, far_alignedSigSmaller}; // @[AddRecFN.scala 97:39]
  wire [55:0] _T_235 = {far_sigLarger, 3'h0}; // @[AddRecFN.scala 98:36]
  wire [56:0] _GEN_6 = {{1'd0}, _T_235}; // @[AddRecFN.scala 98:41]
  wire [56:0] _T_237 = _GEN_6 + far_negAlignedSigSmaller; // @[AddRecFN.scala 98:41]
  wire [56:0] _GEN_7 = {{56'd0}, _T_14}; // @[AddRecFN.scala 98:68]
  wire [56:0] far_sigSum = _T_237 + _GEN_7; // @[AddRecFN.scala 98:68]
  wire [55:0] _GEN_8 = {{55'd0}, far_sigSum[0]}; // @[AddRecFN.scala 99:67]
  wire [55:0] _T_241 = far_sigSum[56:1] | _GEN_8; // @[AddRecFN.scala 99:67]
  wire [56:0] _T_242 = _T_14 ? far_sigSum : {{1'd0}, _T_241}; // @[AddRecFN.scala 99:25]
  wire [55:0] far_sigOut = _T_242[55:0]; // @[AddRecFN.scala 99:83]
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isInf & _T_14; // @[AddRecFN.scala 102:57]
  wire  notNaN_isInfOut = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  wire  addZeros = io_a_isZero & io_b_isZero; // @[AddRecFN.scala 104:32]
  wire  notNaN_specialCase = notNaN_isInfOut | addZeros; // @[AddRecFN.scala 105:46]
  wire  _T_249 = io_a_isInf & io_a_sign; // @[AddRecFN.scala 109:39]
  wire  _T_250 = eqSigns & io_a_sign | _T_249; // @[AddRecFN.scala 108:63]
  wire  _T_251 = io_b_isInf & effSignB; // @[AddRecFN.scala 110:39]
  wire  _T_252 = _T_250 | _T_251; // @[AddRecFN.scala 109:63]
  wire  _T_257 = ~notNaN_specialCase; // @[AddRecFN.scala 112:10]
  wire  _T_260 = ~notNaN_specialCase & closeSubMags & ~close_totalCancellation; // @[AddRecFN.scala 112:46]
  wire  _T_261 = _T_260 & close_notTotalCancellation_signOut; // @[AddRecFN.scala 113:38]
  wire  _T_262 = _T_252 | _T_261; // @[AddRecFN.scala 111:63]
  wire  _T_266 = _T_257 & ~closeSubMags & far_signOut; // @[AddRecFN.scala 114:47]
  wire [12:0] _T_269 = closeSubMags | _T_2 ? $signed(io_b_sExp) : $signed(io_a_sExp); // @[AddRecFN.scala 116:13]
  wire [5:0] _T_270 = closeSubMags ? close_nearNormDist : {{5'd0}, _T_14}; // @[AddRecFN.scala 117:18]
  wire [6:0] _T_271 = {1'b0,$signed(_T_270)}; // @[AddRecFN.scala 117:66]
  wire [12:0] _GEN_9 = {{6{_T_271[6]}},_T_271}; // @[AddRecFN.scala 117:13]
  wire  _T_276 = io_a_isNaN & ~io_a_sig[51]; // @[common.scala 84:46]
  wire  _T_279 = io_b_isNaN & ~io_b_sig[51]; // @[common.scala 84:46]
  assign io_invalidExc = _T_276 | _T_279 | notSigNaN_invalidExc; // @[AddRecFN.scala 121:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[AddRecFN.scala 125:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  assign io_rawOut_isZero = addZeros | ~notNaN_isInfOut & closeSubMags & close_totalCancellation; // @[AddRecFN.scala 106:37]
  assign io_rawOut_sign = _T_262 | _T_266; // @[AddRecFN.scala 113:77]
  assign io_rawOut_sExp = $signed(_T_269) - $signed(_GEN_9); // @[AddRecFN.scala 117:13]
  assign io_rawOut_sig = closeSubMags ? close_sigOut : far_sigOut; // @[AddRecFN.scala 118:28]
endmodule
module RoundAnyRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [12:0] io_in_sExp,
  input  [55:0] io_in_sig,
  output [64:0] io_out
);
  wire  doShiftSigDown1 = io_in_sig[55]; // @[RoundAnyRawFNToRecFN.scala 118:61]
  wire [11:0] _T_4 = ~io_in_sExp[11:0]; // @[primitives.scala 51:21]
  wire [64:0] _T_17 = 65'sh10000000000000000 >>> _T_4[5:0]; // @[primitives.scala 77:58]
  wire [31:0] _T_23 = {{16'd0}, _T_17[44:29]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_25 = {_T_17[28:13], 16'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_27 = _T_25 & 32'hffff0000; // @[Bitwise.scala 103:75]
  wire [31:0] _T_28 = _T_23 | _T_27; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_0 = {{8'd0}, _T_28[31:8]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_33 = _GEN_0 & 32'hff00ff; // @[Bitwise.scala 103:31]
  wire [31:0] _T_35 = {_T_28[23:0], 8'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_37 = _T_35 & 32'hff00ff00; // @[Bitwise.scala 103:75]
  wire [31:0] _T_38 = _T_33 | _T_37; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_1 = {{4'd0}, _T_38[31:4]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_43 = _GEN_1 & 32'hf0f0f0f; // @[Bitwise.scala 103:31]
  wire [31:0] _T_45 = {_T_38[27:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_47 = _T_45 & 32'hf0f0f0f0; // @[Bitwise.scala 103:75]
  wire [31:0] _T_48 = _T_43 | _T_47; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_2 = {{2'd0}, _T_48[31:2]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_53 = _GEN_2 & 32'h33333333; // @[Bitwise.scala 103:31]
  wire [31:0] _T_55 = {_T_48[29:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_57 = _T_55 & 32'hcccccccc; // @[Bitwise.scala 103:75]
  wire [31:0] _T_58 = _T_53 | _T_57; // @[Bitwise.scala 103:39]
  wire [31:0] _GEN_3 = {{1'd0}, _T_58[31:1]}; // @[Bitwise.scala 103:31]
  wire [31:0] _T_63 = _GEN_3 & 32'h55555555; // @[Bitwise.scala 103:31]
  wire [31:0] _T_65 = {_T_58[30:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [31:0] _T_67 = _T_65 & 32'haaaaaaaa; // @[Bitwise.scala 103:75]
  wire [31:0] hi = _T_63 | _T_67; // @[Bitwise.scala 103:39]
  wire [15:0] _T_73 = {{8'd0}, _T_17[60:53]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_75 = {_T_17[52:45], 8'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_77 = _T_75 & 16'hff00; // @[Bitwise.scala 103:75]
  wire [15:0] _T_78 = _T_73 | _T_77; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_4 = {{4'd0}, _T_78[15:4]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_83 = _GEN_4 & 16'hf0f; // @[Bitwise.scala 103:31]
  wire [15:0] _T_85 = {_T_78[11:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_87 = _T_85 & 16'hf0f0; // @[Bitwise.scala 103:75]
  wire [15:0] _T_88 = _T_83 | _T_87; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_5 = {{2'd0}, _T_88[15:2]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_93 = _GEN_5 & 16'h3333; // @[Bitwise.scala 103:31]
  wire [15:0] _T_95 = {_T_88[13:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_97 = _T_95 & 16'hcccc; // @[Bitwise.scala 103:75]
  wire [15:0] _T_98 = _T_93 | _T_97; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_6 = {{1'd0}, _T_98[15:1]}; // @[Bitwise.scala 103:31]
  wire [15:0] _T_103 = _GEN_6 & 16'h5555; // @[Bitwise.scala 103:31]
  wire [15:0] _T_105 = {_T_98[14:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _T_107 = _T_105 & 16'haaaa; // @[Bitwise.scala 103:75]
  wire [15:0] hi_1 = _T_103 | _T_107; // @[Bitwise.scala 103:39]
  wire  hi_2 = _T_17[61]; // @[Bitwise.scala 109:18]
  wire  lo = _T_17[62]; // @[Bitwise.scala 109:44]
  wire  lo_1 = _T_17[63]; // @[Bitwise.scala 109:44]
  wire [50:0] _T_110 = {hi,hi_1,hi_2,lo,lo_1}; // @[Cat.scala 30:58]
  wire [50:0] _T_111 = ~_T_110; // @[primitives.scala 74:36]
  wire [50:0] _T_112 = _T_4[6] ? 51'h0 : _T_111; // @[primitives.scala 74:21]
  wire [50:0] _T_113 = ~_T_112; // @[primitives.scala 74:17]
  wire [50:0] _T_114 = ~_T_113; // @[primitives.scala 74:36]
  wire [50:0] _T_115 = _T_4[7] ? 51'h0 : _T_114; // @[primitives.scala 74:21]
  wire [50:0] _T_116 = ~_T_115; // @[primitives.scala 74:17]
  wire [50:0] _T_117 = ~_T_116; // @[primitives.scala 74:36]
  wire [50:0] _T_118 = _T_4[8] ? 51'h0 : _T_117; // @[primitives.scala 74:21]
  wire [50:0] _T_119 = ~_T_118; // @[primitives.scala 74:17]
  wire [50:0] _T_120 = ~_T_119; // @[primitives.scala 74:36]
  wire [50:0] _T_121 = _T_4[9] ? 51'h0 : _T_120; // @[primitives.scala 74:21]
  wire [50:0] hi_4 = ~_T_121; // @[primitives.scala 74:17]
  wire [53:0] _T_122 = {hi_4,3'h7}; // @[Cat.scala 30:58]
  wire  hi_5 = _T_17[0]; // @[Bitwise.scala 109:18]
  wire  lo_4 = _T_17[1]; // @[Bitwise.scala 109:44]
  wire  lo_5 = _T_17[2]; // @[Bitwise.scala 109:44]
  wire [2:0] _T_134 = {hi_5,lo_4,lo_5}; // @[Cat.scala 30:58]
  wire [2:0] _T_135 = _T_4[6] ? _T_134 : 3'h0; // @[primitives.scala 61:24]
  wire [2:0] _T_136 = _T_4[7] ? _T_135 : 3'h0; // @[primitives.scala 61:24]
  wire [2:0] _T_137 = _T_4[8] ? _T_136 : 3'h0; // @[primitives.scala 61:24]
  wire [2:0] _T_138 = _T_4[9] ? _T_137 : 3'h0; // @[primitives.scala 61:24]
  wire [53:0] _T_139 = _T_4[10] ? _T_122 : {{51'd0}, _T_138}; // @[primitives.scala 66:24]
  wire [53:0] _T_140 = _T_4[11] ? _T_139 : 54'h0; // @[primitives.scala 61:24]
  wire [53:0] _GEN_7 = {{53'd0}, doShiftSigDown1}; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [53:0] hi_7 = _T_140 | _GEN_7; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [55:0] _T_141 = {hi_7,2'h3}; // @[Cat.scala 30:58]
  wire [54:0] lo_6 = _T_141[55:1]; // @[RoundAnyRawFNToRecFN.scala 160:57]
  wire [55:0] _T_142 = {1'h0,lo_6}; // @[Cat.scala 30:58]
  wire [55:0] _T_143 = ~_T_142; // @[RoundAnyRawFNToRecFN.scala 161:28]
  wire [55:0] _T_144 = _T_143 & _T_141; // @[RoundAnyRawFNToRecFN.scala 161:46]
  wire [55:0] _T_145 = io_in_sig & _T_144; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  _T_146 = |_T_145; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [55:0] _T_147 = io_in_sig & _T_142; // @[RoundAnyRawFNToRecFN.scala 163:42]
  wire  _T_148 = |_T_147; // @[RoundAnyRawFNToRecFN.scala 163:62]
  wire [55:0] _T_154 = io_in_sig | _T_141; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [54:0] _T_156 = _T_154[55:2] + 54'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire  _T_158 = ~_T_148; // @[RoundAnyRawFNToRecFN.scala 174:30]
  wire [54:0] _T_161 = _T_146 & _T_158 ? lo_6 : 55'h0; // @[RoundAnyRawFNToRecFN.scala 173:25]
  wire [54:0] _T_162 = ~_T_161; // @[RoundAnyRawFNToRecFN.scala 173:21]
  wire [54:0] _T_163 = _T_156 & _T_162; // @[RoundAnyRawFNToRecFN.scala 172:61]
  wire [55:0] _T_164 = ~_T_141; // @[RoundAnyRawFNToRecFN.scala 178:32]
  wire [55:0] _T_165 = io_in_sig & _T_164; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [54:0] _T_170 = {{1'd0}, _T_165[55:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [54:0] _T_171 = _T_146 ? _T_163 : _T_170; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _T_173 = {1'b0,$signed(_T_171[54:53])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [12:0] _GEN_8 = {{10{_T_173[2]}},_T_173}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [13:0] _T_174 = $signed(io_in_sExp) + $signed(_GEN_8); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [11:0] common_expOut = _T_174[11:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [51:0] common_fractOut = doShiftSigDown1 ? _T_171[52:1] : _T_171[51:0]; // @[RoundAnyRawFNToRecFN.scala 187:16]
  wire [3:0] _T_179 = _T_174[13:10]; // @[RoundAnyRawFNToRecFN.scala 194:30]
  wire  common_overflow = $signed(_T_179) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 194:50]
  wire  common_totalUnderflow = $signed(_T_174) < 14'sh3ce; // @[RoundAnyRawFNToRecFN.scala 198:31]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 233:34]
  wire  commonCase = ~isNaNOut & ~io_in_isInf & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 235:61]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 236:32]
  wire  notNaN_isInfOut = io_in_isInf | overflow; // @[RoundAnyRawFNToRecFN.scala 246:32]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 248:22]
  wire [11:0] _T_228 = io_in_isZero | common_totalUnderflow ? 12'he00 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [11:0] _T_229 = ~_T_228; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [11:0] _T_230 = common_expOut & _T_229; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [11:0] _T_238 = notNaN_isInfOut ? 12'h200 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [11:0] _T_239 = ~_T_238; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [11:0] _T_240 = _T_230 & _T_239; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [11:0] _T_245 = notNaN_isInfOut ? 12'hc00 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [11:0] _T_246 = _T_240 | _T_245; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [11:0] _T_247 = isNaNOut ? 12'he00 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [11:0] expOut = _T_246 | _T_247; // @[RoundAnyRawFNToRecFN.scala 275:77]
  wire [51:0] _T_250 = isNaNOut ? 52'h8000000000000 : 52'h0; // @[RoundAnyRawFNToRecFN.scala 279:16]
  wire [51:0] fractOut = isNaNOut | io_in_isZero | common_totalUnderflow ? _T_250 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [12:0] hi_8 = {signOut,expOut}; // @[Cat.scala 30:58]
  assign io_out = {hi_8,fractOut}; // @[Cat.scala 30:58]
endmodule
module RoundRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [12:0] io_in_sExp,
  input  [55:0] io_in_sig,
  output [64:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [12:0] roundAnyRawFNToRecFN_io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [55:0] roundAnyRawFNToRecFN_io_in_sig; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [64:0] roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 307:15]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( // @[RoundAnyRawFNToRecFN.scala 307:15]
    .io_invalidExc(roundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 315:23]
  assign roundAnyRawFNToRecFN_io_invalidExc = io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 310:44]
  assign roundAnyRawFNToRecFN_io_in_isNaN = io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_isInf = io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_isZero = io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in_sign; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sExp = io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sig = io_in_sig; // @[RoundAnyRawFNToRecFN.scala 312:44]
endmodule
module AddRecFN(
  input         io_subOp,
  input  [64:0] io_a,
  input  [64:0] io_b,
  output [64:0] io_out
);
  wire  addRawFN_io_subOp; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_a_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_a_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_a_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_a_sign; // @[AddRecFN.scala 147:26]
  wire [12:0] addRawFN_io_a_sExp; // @[AddRecFN.scala 147:26]
  wire [53:0] addRawFN_io_a_sig; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_b_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_b_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_b_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_b_sign; // @[AddRecFN.scala 147:26]
  wire [12:0] addRawFN_io_b_sExp; // @[AddRecFN.scala 147:26]
  wire [53:0] addRawFN_io_b_sig; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_invalidExc; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_rawOut_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_rawOut_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_rawOut_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN_io_rawOut_sign; // @[AddRecFN.scala 147:26]
  wire [12:0] addRawFN_io_rawOut_sExp; // @[AddRecFN.scala 147:26]
  wire [55:0] addRawFN_io_rawOut_sig; // @[AddRecFN.scala 147:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[AddRecFN.scala 157:15]
  wire [12:0] roundRawFNToRecFN_io_in_sExp; // @[AddRecFN.scala 157:15]
  wire [55:0] roundRawFNToRecFN_io_in_sig; // @[AddRecFN.scala 157:15]
  wire [64:0] roundRawFNToRecFN_io_out; // @[AddRecFN.scala 157:15]
  wire  _T_2 = io_a[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _T_4 = io_a[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  hi_lo = ~_T_2; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] lo = io_a[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] hi = {1'h0,hi_lo}; // @[Cat.scala 30:58]
  wire  _T_15 = io_b[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _T_17 = io_b[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  hi_lo_1 = ~_T_15; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] lo_1 = io_b[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] hi_1 = {1'h0,hi_lo_1}; // @[Cat.scala 30:58]
  AddRawFN addRawFN ( // @[AddRecFN.scala 147:26]
    .io_subOp(addRawFN_io_subOp),
    .io_a_isNaN(addRawFN_io_a_isNaN),
    .io_a_isInf(addRawFN_io_a_isInf),
    .io_a_isZero(addRawFN_io_a_isZero),
    .io_a_sign(addRawFN_io_a_sign),
    .io_a_sExp(addRawFN_io_a_sExp),
    .io_a_sig(addRawFN_io_a_sig),
    .io_b_isNaN(addRawFN_io_b_isNaN),
    .io_b_isInf(addRawFN_io_b_isInf),
    .io_b_isZero(addRawFN_io_b_isZero),
    .io_b_sign(addRawFN_io_b_sign),
    .io_b_sExp(addRawFN_io_b_sExp),
    .io_b_sig(addRawFN_io_b_sig),
    .io_invalidExc(addRawFN_io_invalidExc),
    .io_rawOut_isNaN(addRawFN_io_rawOut_isNaN),
    .io_rawOut_isInf(addRawFN_io_rawOut_isInf),
    .io_rawOut_isZero(addRawFN_io_rawOut_isZero),
    .io_rawOut_sign(addRawFN_io_rawOut_sign),
    .io_rawOut_sExp(addRawFN_io_rawOut_sExp),
    .io_rawOut_sig(addRawFN_io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[AddRecFN.scala 157:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[AddRecFN.scala 163:23]
  assign addRawFN_io_subOp = io_subOp; // @[AddRecFN.scala 149:30]
  assign addRawFN_io_a_isNaN = _T_4 & io_a[61]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN_io_a_isInf = _T_4 & ~io_a[61]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN_io_a_isZero = io_a[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN_io_a_sign = io_a[64]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN_io_a_sExp = {1'b0,$signed(io_a[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN_io_a_sig = {hi,lo}; // @[Cat.scala 30:58]
  assign addRawFN_io_b_isNaN = _T_17 & io_b[61]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN_io_b_isInf = _T_17 & ~io_b[61]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN_io_b_isZero = io_b[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN_io_b_sign = io_b[64]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN_io_b_sExp = {1'b0,$signed(io_b[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN_io_b_sig = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign roundRawFNToRecFN_io_invalidExc = addRawFN_io_invalidExc; // @[AddRecFN.scala 158:39]
  assign roundRawFNToRecFN_io_in_isNaN = addRawFN_io_rawOut_isNaN; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isInf = addRawFN_io_rawOut_isInf; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isZero = addRawFN_io_rawOut_isZero; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sign = addRawFN_io_rawOut_sign; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sExp = addRawFN_io_rawOut_sExp; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sig = addRawFN_io_rawOut_sig; // @[AddRecFN.scala 160:39]
endmodule
module AddSubFBase(
  input         clock,
  input  [63:0] operand0,
  input  [63:0] operand1,
  input         ce,
  output [63:0] result
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire  adder_io_subOp; // @[fpunits.scala 75:23]
  wire [64:0] adder_io_a; // @[fpunits.scala 75:23]
  wire [64:0] adder_io_b; // @[fpunits.scala 75:23]
  wire [64:0] adder_io_out; // @[fpunits.scala 75:23]
  wire  new_clock = clock & ce; // @[fpunits.scala 65:51]
  reg [63:0] operand0_reg; // @[fpunits.scala 67:31]
  reg [63:0] operand1_reg; // @[fpunits.scala 68:31]
  wire  _operand0_rec_T_3 = operand0_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand0_rec_T_4 = operand0_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand0_rec_T_57 = operand0_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_58 = operand0_reg[2] ? 6'h31 : _operand0_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_59 = operand0_reg[3] ? 6'h30 : _operand0_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_60 = operand0_reg[4] ? 6'h2f : _operand0_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_61 = operand0_reg[5] ? 6'h2e : _operand0_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_62 = operand0_reg[6] ? 6'h2d : _operand0_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_63 = operand0_reg[7] ? 6'h2c : _operand0_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_64 = operand0_reg[8] ? 6'h2b : _operand0_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_65 = operand0_reg[9] ? 6'h2a : _operand0_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_66 = operand0_reg[10] ? 6'h29 : _operand0_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_67 = operand0_reg[11] ? 6'h28 : _operand0_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_68 = operand0_reg[12] ? 6'h27 : _operand0_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_69 = operand0_reg[13] ? 6'h26 : _operand0_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_70 = operand0_reg[14] ? 6'h25 : _operand0_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_71 = operand0_reg[15] ? 6'h24 : _operand0_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_72 = operand0_reg[16] ? 6'h23 : _operand0_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_73 = operand0_reg[17] ? 6'h22 : _operand0_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_74 = operand0_reg[18] ? 6'h21 : _operand0_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_75 = operand0_reg[19] ? 6'h20 : _operand0_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_76 = operand0_reg[20] ? 6'h1f : _operand0_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_77 = operand0_reg[21] ? 6'h1e : _operand0_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_78 = operand0_reg[22] ? 6'h1d : _operand0_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_79 = operand0_reg[23] ? 6'h1c : _operand0_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_80 = operand0_reg[24] ? 6'h1b : _operand0_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_81 = operand0_reg[25] ? 6'h1a : _operand0_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_82 = operand0_reg[26] ? 6'h19 : _operand0_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_83 = operand0_reg[27] ? 6'h18 : _operand0_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_84 = operand0_reg[28] ? 6'h17 : _operand0_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_85 = operand0_reg[29] ? 6'h16 : _operand0_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_86 = operand0_reg[30] ? 6'h15 : _operand0_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_87 = operand0_reg[31] ? 6'h14 : _operand0_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_88 = operand0_reg[32] ? 6'h13 : _operand0_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_89 = operand0_reg[33] ? 6'h12 : _operand0_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_90 = operand0_reg[34] ? 6'h11 : _operand0_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_91 = operand0_reg[35] ? 6'h10 : _operand0_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_92 = operand0_reg[36] ? 6'hf : _operand0_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_93 = operand0_reg[37] ? 6'he : _operand0_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_94 = operand0_reg[38] ? 6'hd : _operand0_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_95 = operand0_reg[39] ? 6'hc : _operand0_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_96 = operand0_reg[40] ? 6'hb : _operand0_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_97 = operand0_reg[41] ? 6'ha : _operand0_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_98 = operand0_reg[42] ? 6'h9 : _operand0_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_99 = operand0_reg[43] ? 6'h8 : _operand0_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_100 = operand0_reg[44] ? 6'h7 : _operand0_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_101 = operand0_reg[45] ? 6'h6 : _operand0_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_102 = operand0_reg[46] ? 6'h5 : _operand0_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_103 = operand0_reg[47] ? 6'h4 : _operand0_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_104 = operand0_reg[48] ? 6'h3 : _operand0_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_105 = operand0_reg[49] ? 6'h2 : _operand0_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_106 = operand0_reg[50] ? 6'h1 : _operand0_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_107 = operand0_reg[51] ? 6'h0 : _operand0_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_0 = {{63'd0}, operand0_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand0_rec_T_108 = _GEN_0 << _operand0_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand0_rec_T_110 = {_operand0_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_1 = {{6'd0}, _operand0_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_111 = _GEN_1 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_112 = _operand0_rec_T_3 ? _operand0_rec_T_111 : {{1'd0}, operand0_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand0_rec_T_113 = _operand0_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_2 = {{9'd0}, _operand0_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand0_rec_T_114 = 11'h400 | _GEN_2; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_3 = {{1'd0}, _operand0_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand0_rec_T_116 = _operand0_rec_T_112 + _GEN_3; // @[rawFloatFromFN.scala 59:15]
  wire  _operand0_rec_T_117 = _operand0_rec_T_3 & _operand0_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand0_rec_T_119 = _operand0_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand0_rec_T_121 = _operand0_rec_T_119 & ~_operand0_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand0_rec_T_124 = {1'b0,$signed(_operand0_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand0_rec_hi_lo = ~_operand0_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand0_rec_lo = _operand0_rec_T_3 ? _operand0_rec_T_110 : operand0_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand0_rec_T_125 = {1'h0,operand0_rec_hi_lo,operand0_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand0_rec_T_127 = _operand0_rec_T_117 ? 3'h0 : _operand0_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_4 = {{2'd0}, _operand0_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand0_rec_hi_lo_1 = _operand0_rec_T_127 | _GEN_4; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand0_rec_lo_hi = _operand0_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand0_rec_lo_lo = _operand0_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand0_rec_lo_1 = {operand0_rec_lo_hi,operand0_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand0_rec_hi_1 = {operand0_reg[63],operand0_rec_hi_lo_1}; // @[Cat.scala 30:58]
  wire  _operand1_rec_T_3 = operand1_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand1_rec_T_4 = operand1_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand1_rec_T_57 = operand1_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_58 = operand1_reg[2] ? 6'h31 : _operand1_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_59 = operand1_reg[3] ? 6'h30 : _operand1_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_60 = operand1_reg[4] ? 6'h2f : _operand1_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_61 = operand1_reg[5] ? 6'h2e : _operand1_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_62 = operand1_reg[6] ? 6'h2d : _operand1_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_63 = operand1_reg[7] ? 6'h2c : _operand1_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_64 = operand1_reg[8] ? 6'h2b : _operand1_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_65 = operand1_reg[9] ? 6'h2a : _operand1_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_66 = operand1_reg[10] ? 6'h29 : _operand1_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_67 = operand1_reg[11] ? 6'h28 : _operand1_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_68 = operand1_reg[12] ? 6'h27 : _operand1_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_69 = operand1_reg[13] ? 6'h26 : _operand1_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_70 = operand1_reg[14] ? 6'h25 : _operand1_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_71 = operand1_reg[15] ? 6'h24 : _operand1_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_72 = operand1_reg[16] ? 6'h23 : _operand1_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_73 = operand1_reg[17] ? 6'h22 : _operand1_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_74 = operand1_reg[18] ? 6'h21 : _operand1_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_75 = operand1_reg[19] ? 6'h20 : _operand1_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_76 = operand1_reg[20] ? 6'h1f : _operand1_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_77 = operand1_reg[21] ? 6'h1e : _operand1_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_78 = operand1_reg[22] ? 6'h1d : _operand1_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_79 = operand1_reg[23] ? 6'h1c : _operand1_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_80 = operand1_reg[24] ? 6'h1b : _operand1_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_81 = operand1_reg[25] ? 6'h1a : _operand1_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_82 = operand1_reg[26] ? 6'h19 : _operand1_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_83 = operand1_reg[27] ? 6'h18 : _operand1_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_84 = operand1_reg[28] ? 6'h17 : _operand1_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_85 = operand1_reg[29] ? 6'h16 : _operand1_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_86 = operand1_reg[30] ? 6'h15 : _operand1_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_87 = operand1_reg[31] ? 6'h14 : _operand1_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_88 = operand1_reg[32] ? 6'h13 : _operand1_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_89 = operand1_reg[33] ? 6'h12 : _operand1_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_90 = operand1_reg[34] ? 6'h11 : _operand1_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_91 = operand1_reg[35] ? 6'h10 : _operand1_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_92 = operand1_reg[36] ? 6'hf : _operand1_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_93 = operand1_reg[37] ? 6'he : _operand1_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_94 = operand1_reg[38] ? 6'hd : _operand1_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_95 = operand1_reg[39] ? 6'hc : _operand1_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_96 = operand1_reg[40] ? 6'hb : _operand1_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_97 = operand1_reg[41] ? 6'ha : _operand1_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_98 = operand1_reg[42] ? 6'h9 : _operand1_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_99 = operand1_reg[43] ? 6'h8 : _operand1_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_100 = operand1_reg[44] ? 6'h7 : _operand1_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_101 = operand1_reg[45] ? 6'h6 : _operand1_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_102 = operand1_reg[46] ? 6'h5 : _operand1_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_103 = operand1_reg[47] ? 6'h4 : _operand1_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_104 = operand1_reg[48] ? 6'h3 : _operand1_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_105 = operand1_reg[49] ? 6'h2 : _operand1_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_106 = operand1_reg[50] ? 6'h1 : _operand1_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_107 = operand1_reg[51] ? 6'h0 : _operand1_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_5 = {{63'd0}, operand1_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand1_rec_T_108 = _GEN_5 << _operand1_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand1_rec_T_110 = {_operand1_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_6 = {{6'd0}, _operand1_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_111 = _GEN_6 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_112 = _operand1_rec_T_3 ? _operand1_rec_T_111 : {{1'd0}, operand1_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand1_rec_T_113 = _operand1_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_7 = {{9'd0}, _operand1_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand1_rec_T_114 = 11'h400 | _GEN_7; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_8 = {{1'd0}, _operand1_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand1_rec_T_116 = _operand1_rec_T_112 + _GEN_8; // @[rawFloatFromFN.scala 59:15]
  wire  _operand1_rec_T_117 = _operand1_rec_T_3 & _operand1_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand1_rec_T_119 = _operand1_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand1_rec_T_121 = _operand1_rec_T_119 & ~_operand1_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand1_rec_T_124 = {1'b0,$signed(_operand1_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand1_rec_hi_lo = ~_operand1_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand1_rec_lo = _operand1_rec_T_3 ? _operand1_rec_T_110 : operand1_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand1_rec_T_125 = {1'h0,operand1_rec_hi_lo,operand1_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand1_rec_T_127 = _operand1_rec_T_117 ? 3'h0 : _operand1_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_9 = {{2'd0}, _operand1_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand1_rec_hi_lo_1 = _operand1_rec_T_127 | _GEN_9; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand1_rec_lo_hi = _operand1_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand1_rec_lo_lo = _operand1_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand1_rec_lo_1 = {operand1_rec_lo_hi,operand1_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand1_rec_hi_1 = {operand1_reg[63],operand1_rec_hi_lo_1}; // @[Cat.scala 30:58]
  wire  _output_T_2 = adder_io_out[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _output_T_4 = adder_io_out[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _output_T_6 = _output_T_4 & adder_io_out[61]; // @[rawFloatFromRecFN.scala 55:33]
  wire  _output_T_9 = _output_T_4 & ~adder_io_out[61]; // @[rawFloatFromRecFN.scala 56:33]
  wire [12:0] _output_T_11 = {1'b0,$signed(adder_io_out[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  wire  output_hi_lo = ~_output_T_2; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] output_lo = adder_io_out[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] _output_T_12 = {1'h0,output_hi_lo,output_lo}; // @[Cat.scala 30:58]
  wire  _output_T_13 = $signed(_output_T_11) < 13'sh402; // @[fNFromRecFN.scala 50:39]
  wire [5:0] _output_T_16 = 6'h1 - _output_T_11[5:0]; // @[fNFromRecFN.scala 51:39]
  wire [52:0] _output_T_18 = _output_T_12[53:1] >> _output_T_16; // @[fNFromRecFN.scala 52:42]
  wire [10:0] _output_T_22 = _output_T_11[10:0] - 11'h401; // @[fNFromRecFN.scala 57:45]
  wire [10:0] _output_T_23 = _output_T_13 ? 11'h0 : _output_T_22; // @[fNFromRecFN.scala 55:16]
  wire  _output_T_24 = _output_T_6 | _output_T_9; // @[fNFromRecFN.scala 59:44]
  wire [10:0] _output_T_26 = _output_T_24 ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] output_hi_lo_1 = _output_T_23 | _output_T_26; // @[fNFromRecFN.scala 59:15]
  wire [51:0] _output_T_28 = _output_T_9 ? 52'h0 : _output_T_12[51:0]; // @[fNFromRecFN.scala 63:20]
  wire [51:0] output_lo_1 = _output_T_13 ? _output_T_18[51:0] : _output_T_28; // @[fNFromRecFN.scala 61:16]
  wire [11:0] output_hi_1 = {adder_io_out[64],output_hi_lo_1}; // @[Cat.scala 30:58]
  reg [63:0] shiftRegs_0; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_1; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_2; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_3; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_4; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_5; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_6; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_7; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_8; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_9; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_10; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_11; // @[fpunits.scala 94:26]
  AddRecFN adder ( // @[fpunits.scala 75:23]
    .io_subOp(adder_io_subOp),
    .io_a(adder_io_a),
    .io_b(adder_io_b),
    .io_out(adder_io_out)
  );
  assign result = shiftRegs_11; // @[fpunits.scala 100:14]
  assign adder_io_subOp = 1'h1; // @[fpunits.scala 80:22]
  assign adder_io_a = {operand0_rec_hi_1,operand0_rec_lo_1}; // @[Cat.scala 30:58]
  assign adder_io_b = {operand1_rec_hi_1,operand1_rec_lo_1}; // @[Cat.scala 30:58]
  always @(posedge new_clock) begin
    operand0_reg <= operand0; // @[fpunits.scala 67:31]
    operand1_reg <= operand1; // @[fpunits.scala 68:31]
    shiftRegs_0 <= {output_hi_1,output_lo_1}; // @[Cat.scala 30:58]
    shiftRegs_1 <= shiftRegs_0; // @[fpunits.scala 97:26]
    shiftRegs_2 <= shiftRegs_1; // @[fpunits.scala 97:26]
    shiftRegs_3 <= shiftRegs_2; // @[fpunits.scala 97:26]
    shiftRegs_4 <= shiftRegs_3; // @[fpunits.scala 97:26]
    shiftRegs_5 <= shiftRegs_4; // @[fpunits.scala 97:26]
    shiftRegs_6 <= shiftRegs_5; // @[fpunits.scala 97:26]
    shiftRegs_7 <= shiftRegs_6; // @[fpunits.scala 97:26]
    shiftRegs_8 <= shiftRegs_7; // @[fpunits.scala 97:26]
    shiftRegs_9 <= shiftRegs_8; // @[fpunits.scala 97:26]
    shiftRegs_10 <= shiftRegs_9; // @[fpunits.scala 97:26]
    shiftRegs_11 <= shiftRegs_10; // @[fpunits.scala 97:26]
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
  operand0_reg = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  operand1_reg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  shiftRegs_0 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  shiftRegs_1 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  shiftRegs_2 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  shiftRegs_3 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  shiftRegs_4 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  shiftRegs_5 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  shiftRegs_6 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  shiftRegs_7 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  shiftRegs_8 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  shiftRegs_9 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  shiftRegs_10 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  shiftRegs_11 = _RAND_13[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SubFDynamic(
  input         clock,
  input         reset,
  output        operand0_ready,
  input         operand0_valid,
  input  [63:0] operand0_bits,
  output        operand1_ready,
  input         operand1_valid,
  input  [63:0] operand1_bits,
  input         result_ready,
  output        result_valid,
  output [63:0] result_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  join__pValid_0; // @[arithmetic_unit.scala 278:28]
  wire  join__pValid_1; // @[arithmetic_unit.scala 278:28]
  wire  join__ready_0; // @[arithmetic_unit.scala 278:28]
  wire  join__ready_1; // @[arithmetic_unit.scala 278:28]
  wire  join__valid; // @[arithmetic_unit.scala 278:28]
  wire  join__nReady; // @[arithmetic_unit.scala 278:28]
  wire  buff_clock; // @[arithmetic_unit.scala 279:28]
  wire  buff_reset; // @[arithmetic_unit.scala 279:28]
  wire  buff_valid_in; // @[arithmetic_unit.scala 279:28]
  wire  buff_ready_in; // @[arithmetic_unit.scala 279:28]
  wire  buff_valid_out; // @[arithmetic_unit.scala 279:28]
  wire  oehb_clock; // @[arithmetic_unit.scala 280:28]
  wire  oehb_reset; // @[arithmetic_unit.scala 280:28]
  wire  oehb_dataIn_ready; // @[arithmetic_unit.scala 280:28]
  wire  oehb_dataIn_valid; // @[arithmetic_unit.scala 280:28]
  wire  oehb_dataOut_ready; // @[arithmetic_unit.scala 280:28]
  wire  oehb_dataOut_valid; // @[arithmetic_unit.scala 280:28]
  wire  subf_clock; // @[arithmetic_unit.scala 296:20]
  wire [63:0] subf_operand0; // @[arithmetic_unit.scala 296:20]
  wire [63:0] subf_operand1; // @[arithmetic_unit.scala 296:20]
  wire  subf_ce; // @[arithmetic_unit.scala 296:20]
  wire [63:0] subf_result; // @[arithmetic_unit.scala 296:20]
  reg  ce; // @[arithmetic_unit.scala 297:19]
  Join join_ ( // @[arithmetic_unit.scala 278:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  DelayBuffer buff ( // @[arithmetic_unit.scala 279:28]
    .clock(buff_clock),
    .reset(buff_reset),
    .valid_in(buff_valid_in),
    .ready_in(buff_ready_in),
    .valid_out(buff_valid_out)
  );
  OEHB oehb ( // @[arithmetic_unit.scala 280:28]
    .clock(oehb_clock),
    .reset(oehb_reset),
    .dataIn_ready(oehb_dataIn_ready),
    .dataIn_valid(oehb_dataIn_valid),
    .dataOut_ready(oehb_dataOut_ready),
    .dataOut_valid(oehb_dataOut_valid)
  );
  AddSubFBase subf ( // @[arithmetic_unit.scala 296:20]
    .clock(subf_clock),
    .operand0(subf_operand0),
    .operand1(subf_operand1),
    .ce(subf_ce),
    .result(subf_result)
  );
  assign operand0_ready = join__ready_0; // @[arithmetic_unit.scala 284:18]
  assign operand1_ready = join__ready_1; // @[arithmetic_unit.scala 285:18]
  assign result_valid = oehb_dataOut_valid; // @[arithmetic_unit.scala 294:16]
  assign result_bits = subf_result; // @[arithmetic_unit.scala 301:15]
  assign join__pValid_0 = operand0_valid; // @[arithmetic_unit.scala 282:18]
  assign join__pValid_1 = operand1_valid; // @[arithmetic_unit.scala 283:18]
  assign join__nReady = oehb_dataIn_ready; // @[arithmetic_unit.scala 286:15]
  assign buff_clock = clock;
  assign buff_reset = reset;
  assign buff_valid_in = join__valid; // @[arithmetic_unit.scala 288:17]
  assign buff_ready_in = oehb_dataIn_ready; // @[arithmetic_unit.scala 289:17]
  assign oehb_clock = clock;
  assign oehb_reset = reset;
  assign oehb_dataIn_valid = buff_valid_out; // @[arithmetic_unit.scala 293:21]
  assign oehb_dataOut_ready = result_ready; // @[arithmetic_unit.scala 292:22]
  assign subf_clock = clock;
  assign subf_operand0 = operand0_bits; // @[arithmetic_unit.scala 299:17]
  assign subf_operand1 = operand1_bits; // @[arithmetic_unit.scala 300:17]
  assign subf_ce = ce; // @[arithmetic_unit.scala 298:11]
  always @(posedge clock) begin
    ce <= oehb_dataIn_ready; // @[arithmetic_unit.scala 297:19]
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
  ce = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DelayBuffer_1(
  input   clock,
  input   reset,
  input   valid_in,
  input   ready_in,
  output  valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  shift_register_0; // @[elastic_component.scala 564:31]
  assign valid_out = shift_register_0; // @[elastic_component.scala 572:13]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_0 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_0 <= valid_in; // @[elastic_component.scala 567:23]
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
  shift_register_0 = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CompareRecFN(
  input  [64:0] io_a,
  input  [64:0] io_b,
  output        io_gt
);
  wire  rawA_isZero = io_a[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _T_4 = io_a[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawA_isNaN = _T_4 & io_a[61]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawA_isInf = _T_4 & ~io_a[61]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawA_sign = io_a[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] rawA_sExp = {1'b0,$signed(io_a[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  wire  hi_lo = ~rawA_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] lo = io_a[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] rawA_sig = {1'h0,hi_lo,lo}; // @[Cat.scala 30:58]
  wire  rawB_isZero = io_b[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _T_17 = io_b[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawB_isNaN = _T_17 & io_b[61]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawB_isInf = _T_17 & ~io_b[61]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawB_sign = io_b[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] rawB_sExp = {1'b0,$signed(io_b[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  wire  hi_lo_1 = ~rawB_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] lo_1 = io_b[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] rawB_sig = {1'h0,hi_lo_1,lo_1}; // @[Cat.scala 30:58]
  wire  ordered = ~rawA_isNaN & ~rawB_isNaN; // @[CompareRecFN.scala 57:32]
  wire  bothInfs = rawA_isInf & rawB_isInf; // @[CompareRecFN.scala 58:33]
  wire  bothZeros = rawA_isZero & rawB_isZero; // @[CompareRecFN.scala 59:33]
  wire  eqExps = $signed(rawA_sExp) == $signed(rawB_sExp); // @[CompareRecFN.scala 60:29]
  wire  common_ltMags = $signed(rawA_sExp) < $signed(rawB_sExp) | eqExps & rawA_sig < rawB_sig; // @[CompareRecFN.scala 62:33]
  wire  common_eqMags = eqExps & rawA_sig == rawB_sig; // @[CompareRecFN.scala 63:32]
  wire  _T_33 = ~rawB_sign; // @[CompareRecFN.scala 67:28]
  wire  _T_41 = _T_33 & common_ltMags; // @[CompareRecFN.scala 70:41]
  wire  _T_42 = rawA_sign & ~common_ltMags & ~common_eqMags | _T_41; // @[CompareRecFN.scala 69:74]
  wire  _T_43 = ~bothInfs & _T_42; // @[CompareRecFN.scala 68:30]
  wire  _T_44 = rawA_sign & ~rawB_sign | _T_43; // @[CompareRecFN.scala 67:41]
  wire  ordered_lt = ~bothZeros & _T_44; // @[CompareRecFN.scala 66:21]
  wire  ordered_eq = bothZeros | rawA_sign == rawB_sign & (bothInfs | common_eqMags); // @[CompareRecFN.scala 72:19]
  assign io_gt = ordered & ~ordered_lt & ~ordered_eq; // @[CompareRecFN.scala 80:38]
endmodule
module CmpFBase(
  input         clock,
  input  [63:0] operand0,
  input  [63:0] operand1,
  input         ce,
  output        result
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [64:0] comparator_io_a; // @[fpunits.scala 127:28]
  wire [64:0] comparator_io_b; // @[fpunits.scala 127:28]
  wire  comparator_io_gt; // @[fpunits.scala 127:28]
  wire  new_clock = clock & ce; // @[fpunits.scala 116:51]
  reg [63:0] operand0_reg; // @[fpunits.scala 119:31]
  reg [63:0] operand1_reg; // @[fpunits.scala 120:31]
  wire  _operand0_rec_T_3 = operand0_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand0_rec_T_4 = operand0_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand0_rec_T_57 = operand0_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_58 = operand0_reg[2] ? 6'h31 : _operand0_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_59 = operand0_reg[3] ? 6'h30 : _operand0_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_60 = operand0_reg[4] ? 6'h2f : _operand0_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_61 = operand0_reg[5] ? 6'h2e : _operand0_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_62 = operand0_reg[6] ? 6'h2d : _operand0_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_63 = operand0_reg[7] ? 6'h2c : _operand0_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_64 = operand0_reg[8] ? 6'h2b : _operand0_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_65 = operand0_reg[9] ? 6'h2a : _operand0_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_66 = operand0_reg[10] ? 6'h29 : _operand0_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_67 = operand0_reg[11] ? 6'h28 : _operand0_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_68 = operand0_reg[12] ? 6'h27 : _operand0_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_69 = operand0_reg[13] ? 6'h26 : _operand0_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_70 = operand0_reg[14] ? 6'h25 : _operand0_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_71 = operand0_reg[15] ? 6'h24 : _operand0_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_72 = operand0_reg[16] ? 6'h23 : _operand0_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_73 = operand0_reg[17] ? 6'h22 : _operand0_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_74 = operand0_reg[18] ? 6'h21 : _operand0_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_75 = operand0_reg[19] ? 6'h20 : _operand0_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_76 = operand0_reg[20] ? 6'h1f : _operand0_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_77 = operand0_reg[21] ? 6'h1e : _operand0_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_78 = operand0_reg[22] ? 6'h1d : _operand0_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_79 = operand0_reg[23] ? 6'h1c : _operand0_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_80 = operand0_reg[24] ? 6'h1b : _operand0_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_81 = operand0_reg[25] ? 6'h1a : _operand0_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_82 = operand0_reg[26] ? 6'h19 : _operand0_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_83 = operand0_reg[27] ? 6'h18 : _operand0_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_84 = operand0_reg[28] ? 6'h17 : _operand0_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_85 = operand0_reg[29] ? 6'h16 : _operand0_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_86 = operand0_reg[30] ? 6'h15 : _operand0_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_87 = operand0_reg[31] ? 6'h14 : _operand0_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_88 = operand0_reg[32] ? 6'h13 : _operand0_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_89 = operand0_reg[33] ? 6'h12 : _operand0_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_90 = operand0_reg[34] ? 6'h11 : _operand0_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_91 = operand0_reg[35] ? 6'h10 : _operand0_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_92 = operand0_reg[36] ? 6'hf : _operand0_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_93 = operand0_reg[37] ? 6'he : _operand0_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_94 = operand0_reg[38] ? 6'hd : _operand0_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_95 = operand0_reg[39] ? 6'hc : _operand0_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_96 = operand0_reg[40] ? 6'hb : _operand0_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_97 = operand0_reg[41] ? 6'ha : _operand0_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_98 = operand0_reg[42] ? 6'h9 : _operand0_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_99 = operand0_reg[43] ? 6'h8 : _operand0_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_100 = operand0_reg[44] ? 6'h7 : _operand0_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_101 = operand0_reg[45] ? 6'h6 : _operand0_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_102 = operand0_reg[46] ? 6'h5 : _operand0_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_103 = operand0_reg[47] ? 6'h4 : _operand0_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_104 = operand0_reg[48] ? 6'h3 : _operand0_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_105 = operand0_reg[49] ? 6'h2 : _operand0_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_106 = operand0_reg[50] ? 6'h1 : _operand0_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_107 = operand0_reg[51] ? 6'h0 : _operand0_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_6 = {{63'd0}, operand0_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand0_rec_T_108 = _GEN_6 << _operand0_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand0_rec_T_110 = {_operand0_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_7 = {{6'd0}, _operand0_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_111 = _GEN_7 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_112 = _operand0_rec_T_3 ? _operand0_rec_T_111 : {{1'd0}, operand0_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand0_rec_T_113 = _operand0_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_8 = {{9'd0}, _operand0_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand0_rec_T_114 = 11'h400 | _GEN_8; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_9 = {{1'd0}, _operand0_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand0_rec_T_116 = _operand0_rec_T_112 + _GEN_9; // @[rawFloatFromFN.scala 59:15]
  wire  _operand0_rec_T_117 = _operand0_rec_T_3 & _operand0_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand0_rec_T_119 = _operand0_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand0_rec_T_121 = _operand0_rec_T_119 & ~_operand0_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand0_rec_T_124 = {1'b0,$signed(_operand0_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand0_rec_hi_lo = ~_operand0_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand0_rec_lo = _operand0_rec_T_3 ? _operand0_rec_T_110 : operand0_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand0_rec_T_125 = {1'h0,operand0_rec_hi_lo,operand0_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand0_rec_T_127 = _operand0_rec_T_117 ? 3'h0 : _operand0_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_10 = {{2'd0}, _operand0_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand0_rec_hi_lo_1 = _operand0_rec_T_127 | _GEN_10; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand0_rec_lo_hi = _operand0_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand0_rec_lo_lo = _operand0_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand0_rec_lo_1 = {operand0_rec_lo_hi,operand0_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand0_rec_hi_1 = {operand0_reg[63],operand0_rec_hi_lo_1}; // @[Cat.scala 30:58]
  wire  _operand1_rec_T_3 = operand1_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand1_rec_T_4 = operand1_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand1_rec_T_57 = operand1_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_58 = operand1_reg[2] ? 6'h31 : _operand1_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_59 = operand1_reg[3] ? 6'h30 : _operand1_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_60 = operand1_reg[4] ? 6'h2f : _operand1_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_61 = operand1_reg[5] ? 6'h2e : _operand1_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_62 = operand1_reg[6] ? 6'h2d : _operand1_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_63 = operand1_reg[7] ? 6'h2c : _operand1_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_64 = operand1_reg[8] ? 6'h2b : _operand1_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_65 = operand1_reg[9] ? 6'h2a : _operand1_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_66 = operand1_reg[10] ? 6'h29 : _operand1_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_67 = operand1_reg[11] ? 6'h28 : _operand1_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_68 = operand1_reg[12] ? 6'h27 : _operand1_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_69 = operand1_reg[13] ? 6'h26 : _operand1_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_70 = operand1_reg[14] ? 6'h25 : _operand1_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_71 = operand1_reg[15] ? 6'h24 : _operand1_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_72 = operand1_reg[16] ? 6'h23 : _operand1_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_73 = operand1_reg[17] ? 6'h22 : _operand1_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_74 = operand1_reg[18] ? 6'h21 : _operand1_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_75 = operand1_reg[19] ? 6'h20 : _operand1_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_76 = operand1_reg[20] ? 6'h1f : _operand1_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_77 = operand1_reg[21] ? 6'h1e : _operand1_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_78 = operand1_reg[22] ? 6'h1d : _operand1_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_79 = operand1_reg[23] ? 6'h1c : _operand1_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_80 = operand1_reg[24] ? 6'h1b : _operand1_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_81 = operand1_reg[25] ? 6'h1a : _operand1_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_82 = operand1_reg[26] ? 6'h19 : _operand1_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_83 = operand1_reg[27] ? 6'h18 : _operand1_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_84 = operand1_reg[28] ? 6'h17 : _operand1_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_85 = operand1_reg[29] ? 6'h16 : _operand1_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_86 = operand1_reg[30] ? 6'h15 : _operand1_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_87 = operand1_reg[31] ? 6'h14 : _operand1_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_88 = operand1_reg[32] ? 6'h13 : _operand1_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_89 = operand1_reg[33] ? 6'h12 : _operand1_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_90 = operand1_reg[34] ? 6'h11 : _operand1_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_91 = operand1_reg[35] ? 6'h10 : _operand1_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_92 = operand1_reg[36] ? 6'hf : _operand1_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_93 = operand1_reg[37] ? 6'he : _operand1_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_94 = operand1_reg[38] ? 6'hd : _operand1_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_95 = operand1_reg[39] ? 6'hc : _operand1_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_96 = operand1_reg[40] ? 6'hb : _operand1_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_97 = operand1_reg[41] ? 6'ha : _operand1_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_98 = operand1_reg[42] ? 6'h9 : _operand1_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_99 = operand1_reg[43] ? 6'h8 : _operand1_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_100 = operand1_reg[44] ? 6'h7 : _operand1_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_101 = operand1_reg[45] ? 6'h6 : _operand1_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_102 = operand1_reg[46] ? 6'h5 : _operand1_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_103 = operand1_reg[47] ? 6'h4 : _operand1_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_104 = operand1_reg[48] ? 6'h3 : _operand1_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_105 = operand1_reg[49] ? 6'h2 : _operand1_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_106 = operand1_reg[50] ? 6'h1 : _operand1_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_107 = operand1_reg[51] ? 6'h0 : _operand1_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_11 = {{63'd0}, operand1_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand1_rec_T_108 = _GEN_11 << _operand1_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand1_rec_T_110 = {_operand1_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_12 = {{6'd0}, _operand1_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_111 = _GEN_12 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_112 = _operand1_rec_T_3 ? _operand1_rec_T_111 : {{1'd0}, operand1_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand1_rec_T_113 = _operand1_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_13 = {{9'd0}, _operand1_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand1_rec_T_114 = 11'h400 | _GEN_13; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_14 = {{1'd0}, _operand1_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand1_rec_T_116 = _operand1_rec_T_112 + _GEN_14; // @[rawFloatFromFN.scala 59:15]
  wire  _operand1_rec_T_117 = _operand1_rec_T_3 & _operand1_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand1_rec_T_119 = _operand1_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand1_rec_T_121 = _operand1_rec_T_119 & ~_operand1_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand1_rec_T_124 = {1'b0,$signed(_operand1_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand1_rec_hi_lo = ~_operand1_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand1_rec_lo = _operand1_rec_T_3 ? _operand1_rec_T_110 : operand1_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand1_rec_T_125 = {1'h0,operand1_rec_hi_lo,operand1_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand1_rec_T_127 = _operand1_rec_T_117 ? 3'h0 : _operand1_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_15 = {{2'd0}, _operand1_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand1_rec_hi_lo_1 = _operand1_rec_T_127 | _GEN_15; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand1_rec_lo_hi = _operand1_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand1_rec_lo_lo = _operand1_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand1_rec_lo_1 = {operand1_rec_lo_hi,operand1_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand1_rec_hi_1 = {operand1_reg[63],operand1_rec_hi_lo_1}; // @[Cat.scala 30:58]
  reg  shiftRegs_0; // @[fpunits.scala 159:26]
  CompareRecFN comparator ( // @[fpunits.scala 127:28]
    .io_a(comparator_io_a),
    .io_b(comparator_io_b),
    .io_gt(comparator_io_gt)
  );
  assign result = shiftRegs_0; // @[fpunits.scala 165:14]
  assign comparator_io_a = {operand0_rec_hi_1,operand0_rec_lo_1}; // @[Cat.scala 30:58]
  assign comparator_io_b = {operand1_rec_hi_1,operand1_rec_lo_1}; // @[Cat.scala 30:58]
  always @(posedge new_clock) begin
    operand0_reg <= operand0; // @[fpunits.scala 119:31]
    operand1_reg <= operand1; // @[fpunits.scala 120:31]
    shiftRegs_0 <= comparator_io_gt; // @[fpunits.scala 137:39 fpunits.scala 139:14]
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
  operand0_reg = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  operand1_reg = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  shiftRegs_0 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module CmpFDynamic(
  input         clock,
  input         reset,
  output        operand0_ready,
  input         operand0_valid,
  input  [63:0] operand0_bits,
  output        operand1_ready,
  input         operand1_valid,
  input  [63:0] operand1_bits,
  input         result_ready,
  output        result_valid,
  output [63:0] result_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  join__pValid_0; // @[arithmetic_unit.scala 311:28]
  wire  join__pValid_1; // @[arithmetic_unit.scala 311:28]
  wire  join__ready_0; // @[arithmetic_unit.scala 311:28]
  wire  join__ready_1; // @[arithmetic_unit.scala 311:28]
  wire  join__valid; // @[arithmetic_unit.scala 311:28]
  wire  join__nReady; // @[arithmetic_unit.scala 311:28]
  wire  buff_clock; // @[arithmetic_unit.scala 312:28]
  wire  buff_reset; // @[arithmetic_unit.scala 312:28]
  wire  buff_valid_in; // @[arithmetic_unit.scala 312:28]
  wire  buff_ready_in; // @[arithmetic_unit.scala 312:28]
  wire  buff_valid_out; // @[arithmetic_unit.scala 312:28]
  wire  oehb_clock; // @[arithmetic_unit.scala 313:28]
  wire  oehb_reset; // @[arithmetic_unit.scala 313:28]
  wire  oehb_dataIn_ready; // @[arithmetic_unit.scala 313:28]
  wire  oehb_dataIn_valid; // @[arithmetic_unit.scala 313:28]
  wire  oehb_dataOut_ready; // @[arithmetic_unit.scala 313:28]
  wire  oehb_dataOut_valid; // @[arithmetic_unit.scala 313:28]
  wire  subf_clock; // @[arithmetic_unit.scala 329:20]
  wire [63:0] subf_operand0; // @[arithmetic_unit.scala 329:20]
  wire [63:0] subf_operand1; // @[arithmetic_unit.scala 329:20]
  wire  subf_ce; // @[arithmetic_unit.scala 329:20]
  wire  subf_result; // @[arithmetic_unit.scala 329:20]
  reg  ce; // @[arithmetic_unit.scala 331:19]
  Join join_ ( // @[arithmetic_unit.scala 311:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  DelayBuffer_1 buff ( // @[arithmetic_unit.scala 312:28]
    .clock(buff_clock),
    .reset(buff_reset),
    .valid_in(buff_valid_in),
    .ready_in(buff_ready_in),
    .valid_out(buff_valid_out)
  );
  OEHB oehb ( // @[arithmetic_unit.scala 313:28]
    .clock(oehb_clock),
    .reset(oehb_reset),
    .dataIn_ready(oehb_dataIn_ready),
    .dataIn_valid(oehb_dataIn_valid),
    .dataOut_ready(oehb_dataOut_ready),
    .dataOut_valid(oehb_dataOut_valid)
  );
  CmpFBase subf ( // @[arithmetic_unit.scala 329:20]
    .clock(subf_clock),
    .operand0(subf_operand0),
    .operand1(subf_operand1),
    .ce(subf_ce),
    .result(subf_result)
  );
  assign operand0_ready = join__ready_0; // @[arithmetic_unit.scala 317:18]
  assign operand1_ready = join__ready_1; // @[arithmetic_unit.scala 318:18]
  assign result_valid = oehb_dataOut_valid; // @[arithmetic_unit.scala 327:16]
  assign result_bits = {{63'd0}, subf_result}; // @[arithmetic_unit.scala 335:15]
  assign join__pValid_0 = operand0_valid; // @[arithmetic_unit.scala 315:18]
  assign join__pValid_1 = operand1_valid; // @[arithmetic_unit.scala 316:18]
  assign join__nReady = oehb_dataIn_ready; // @[arithmetic_unit.scala 319:15]
  assign buff_clock = clock;
  assign buff_reset = reset;
  assign buff_valid_in = join__valid; // @[arithmetic_unit.scala 321:17]
  assign buff_ready_in = oehb_dataIn_ready; // @[arithmetic_unit.scala 322:17]
  assign oehb_clock = clock;
  assign oehb_reset = reset;
  assign oehb_dataIn_valid = buff_valid_out; // @[arithmetic_unit.scala 326:21]
  assign oehb_dataOut_ready = result_ready; // @[arithmetic_unit.scala 325:22]
  assign subf_clock = clock;
  assign subf_operand0 = operand0_bits; // @[arithmetic_unit.scala 333:17]
  assign subf_operand1 = operand1_bits; // @[arithmetic_unit.scala 334:17]
  assign subf_ce = ce; // @[arithmetic_unit.scala 332:11]
  always @(posedge clock) begin
    ce <= oehb_dataIn_ready; // @[arithmetic_unit.scala 331:19]
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
  ce = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddSubFBase_2(
  input         clock,
  input  [63:0] operand0,
  input  [63:0] operand1,
  input         ce,
  output [63:0] result
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
`endif // RANDOMIZE_REG_INIT
  wire  adder_io_subOp; // @[fpunits.scala 75:23]
  wire [64:0] adder_io_a; // @[fpunits.scala 75:23]
  wire [64:0] adder_io_b; // @[fpunits.scala 75:23]
  wire [64:0] adder_io_out; // @[fpunits.scala 75:23]
  wire  new_clock = clock & ce; // @[fpunits.scala 65:51]
  reg [63:0] operand0_reg; // @[fpunits.scala 67:31]
  reg [63:0] operand1_reg; // @[fpunits.scala 68:31]
  wire  _operand0_rec_T_3 = operand0_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand0_rec_T_4 = operand0_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand0_rec_T_57 = operand0_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_58 = operand0_reg[2] ? 6'h31 : _operand0_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_59 = operand0_reg[3] ? 6'h30 : _operand0_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_60 = operand0_reg[4] ? 6'h2f : _operand0_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_61 = operand0_reg[5] ? 6'h2e : _operand0_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_62 = operand0_reg[6] ? 6'h2d : _operand0_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_63 = operand0_reg[7] ? 6'h2c : _operand0_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_64 = operand0_reg[8] ? 6'h2b : _operand0_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_65 = operand0_reg[9] ? 6'h2a : _operand0_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_66 = operand0_reg[10] ? 6'h29 : _operand0_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_67 = operand0_reg[11] ? 6'h28 : _operand0_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_68 = operand0_reg[12] ? 6'h27 : _operand0_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_69 = operand0_reg[13] ? 6'h26 : _operand0_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_70 = operand0_reg[14] ? 6'h25 : _operand0_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_71 = operand0_reg[15] ? 6'h24 : _operand0_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_72 = operand0_reg[16] ? 6'h23 : _operand0_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_73 = operand0_reg[17] ? 6'h22 : _operand0_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_74 = operand0_reg[18] ? 6'h21 : _operand0_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_75 = operand0_reg[19] ? 6'h20 : _operand0_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_76 = operand0_reg[20] ? 6'h1f : _operand0_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_77 = operand0_reg[21] ? 6'h1e : _operand0_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_78 = operand0_reg[22] ? 6'h1d : _operand0_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_79 = operand0_reg[23] ? 6'h1c : _operand0_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_80 = operand0_reg[24] ? 6'h1b : _operand0_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_81 = operand0_reg[25] ? 6'h1a : _operand0_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_82 = operand0_reg[26] ? 6'h19 : _operand0_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_83 = operand0_reg[27] ? 6'h18 : _operand0_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_84 = operand0_reg[28] ? 6'h17 : _operand0_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_85 = operand0_reg[29] ? 6'h16 : _operand0_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_86 = operand0_reg[30] ? 6'h15 : _operand0_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_87 = operand0_reg[31] ? 6'h14 : _operand0_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_88 = operand0_reg[32] ? 6'h13 : _operand0_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_89 = operand0_reg[33] ? 6'h12 : _operand0_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_90 = operand0_reg[34] ? 6'h11 : _operand0_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_91 = operand0_reg[35] ? 6'h10 : _operand0_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_92 = operand0_reg[36] ? 6'hf : _operand0_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_93 = operand0_reg[37] ? 6'he : _operand0_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_94 = operand0_reg[38] ? 6'hd : _operand0_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_95 = operand0_reg[39] ? 6'hc : _operand0_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_96 = operand0_reg[40] ? 6'hb : _operand0_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_97 = operand0_reg[41] ? 6'ha : _operand0_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_98 = operand0_reg[42] ? 6'h9 : _operand0_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_99 = operand0_reg[43] ? 6'h8 : _operand0_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_100 = operand0_reg[44] ? 6'h7 : _operand0_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_101 = operand0_reg[45] ? 6'h6 : _operand0_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_102 = operand0_reg[46] ? 6'h5 : _operand0_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_103 = operand0_reg[47] ? 6'h4 : _operand0_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_104 = operand0_reg[48] ? 6'h3 : _operand0_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_105 = operand0_reg[49] ? 6'h2 : _operand0_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_106 = operand0_reg[50] ? 6'h1 : _operand0_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_107 = operand0_reg[51] ? 6'h0 : _operand0_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_0 = {{63'd0}, operand0_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand0_rec_T_108 = _GEN_0 << _operand0_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand0_rec_T_110 = {_operand0_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_1 = {{6'd0}, _operand0_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_111 = _GEN_1 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_112 = _operand0_rec_T_3 ? _operand0_rec_T_111 : {{1'd0}, operand0_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand0_rec_T_113 = _operand0_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_2 = {{9'd0}, _operand0_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand0_rec_T_114 = 11'h400 | _GEN_2; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_3 = {{1'd0}, _operand0_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand0_rec_T_116 = _operand0_rec_T_112 + _GEN_3; // @[rawFloatFromFN.scala 59:15]
  wire  _operand0_rec_T_117 = _operand0_rec_T_3 & _operand0_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand0_rec_T_119 = _operand0_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand0_rec_T_121 = _operand0_rec_T_119 & ~_operand0_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand0_rec_T_124 = {1'b0,$signed(_operand0_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand0_rec_hi_lo = ~_operand0_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand0_rec_lo = _operand0_rec_T_3 ? _operand0_rec_T_110 : operand0_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand0_rec_T_125 = {1'h0,operand0_rec_hi_lo,operand0_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand0_rec_T_127 = _operand0_rec_T_117 ? 3'h0 : _operand0_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_4 = {{2'd0}, _operand0_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand0_rec_hi_lo_1 = _operand0_rec_T_127 | _GEN_4; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand0_rec_lo_hi = _operand0_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand0_rec_lo_lo = _operand0_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand0_rec_lo_1 = {operand0_rec_lo_hi,operand0_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand0_rec_hi_1 = {operand0_reg[63],operand0_rec_hi_lo_1}; // @[Cat.scala 30:58]
  wire  _operand1_rec_T_3 = operand1_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand1_rec_T_4 = operand1_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand1_rec_T_57 = operand1_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_58 = operand1_reg[2] ? 6'h31 : _operand1_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_59 = operand1_reg[3] ? 6'h30 : _operand1_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_60 = operand1_reg[4] ? 6'h2f : _operand1_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_61 = operand1_reg[5] ? 6'h2e : _operand1_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_62 = operand1_reg[6] ? 6'h2d : _operand1_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_63 = operand1_reg[7] ? 6'h2c : _operand1_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_64 = operand1_reg[8] ? 6'h2b : _operand1_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_65 = operand1_reg[9] ? 6'h2a : _operand1_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_66 = operand1_reg[10] ? 6'h29 : _operand1_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_67 = operand1_reg[11] ? 6'h28 : _operand1_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_68 = operand1_reg[12] ? 6'h27 : _operand1_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_69 = operand1_reg[13] ? 6'h26 : _operand1_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_70 = operand1_reg[14] ? 6'h25 : _operand1_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_71 = operand1_reg[15] ? 6'h24 : _operand1_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_72 = operand1_reg[16] ? 6'h23 : _operand1_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_73 = operand1_reg[17] ? 6'h22 : _operand1_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_74 = operand1_reg[18] ? 6'h21 : _operand1_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_75 = operand1_reg[19] ? 6'h20 : _operand1_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_76 = operand1_reg[20] ? 6'h1f : _operand1_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_77 = operand1_reg[21] ? 6'h1e : _operand1_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_78 = operand1_reg[22] ? 6'h1d : _operand1_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_79 = operand1_reg[23] ? 6'h1c : _operand1_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_80 = operand1_reg[24] ? 6'h1b : _operand1_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_81 = operand1_reg[25] ? 6'h1a : _operand1_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_82 = operand1_reg[26] ? 6'h19 : _operand1_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_83 = operand1_reg[27] ? 6'h18 : _operand1_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_84 = operand1_reg[28] ? 6'h17 : _operand1_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_85 = operand1_reg[29] ? 6'h16 : _operand1_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_86 = operand1_reg[30] ? 6'h15 : _operand1_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_87 = operand1_reg[31] ? 6'h14 : _operand1_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_88 = operand1_reg[32] ? 6'h13 : _operand1_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_89 = operand1_reg[33] ? 6'h12 : _operand1_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_90 = operand1_reg[34] ? 6'h11 : _operand1_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_91 = operand1_reg[35] ? 6'h10 : _operand1_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_92 = operand1_reg[36] ? 6'hf : _operand1_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_93 = operand1_reg[37] ? 6'he : _operand1_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_94 = operand1_reg[38] ? 6'hd : _operand1_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_95 = operand1_reg[39] ? 6'hc : _operand1_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_96 = operand1_reg[40] ? 6'hb : _operand1_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_97 = operand1_reg[41] ? 6'ha : _operand1_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_98 = operand1_reg[42] ? 6'h9 : _operand1_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_99 = operand1_reg[43] ? 6'h8 : _operand1_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_100 = operand1_reg[44] ? 6'h7 : _operand1_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_101 = operand1_reg[45] ? 6'h6 : _operand1_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_102 = operand1_reg[46] ? 6'h5 : _operand1_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_103 = operand1_reg[47] ? 6'h4 : _operand1_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_104 = operand1_reg[48] ? 6'h3 : _operand1_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_105 = operand1_reg[49] ? 6'h2 : _operand1_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_106 = operand1_reg[50] ? 6'h1 : _operand1_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_107 = operand1_reg[51] ? 6'h0 : _operand1_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_5 = {{63'd0}, operand1_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand1_rec_T_108 = _GEN_5 << _operand1_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand1_rec_T_110 = {_operand1_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_6 = {{6'd0}, _operand1_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_111 = _GEN_6 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_112 = _operand1_rec_T_3 ? _operand1_rec_T_111 : {{1'd0}, operand1_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand1_rec_T_113 = _operand1_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_7 = {{9'd0}, _operand1_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand1_rec_T_114 = 11'h400 | _GEN_7; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_8 = {{1'd0}, _operand1_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand1_rec_T_116 = _operand1_rec_T_112 + _GEN_8; // @[rawFloatFromFN.scala 59:15]
  wire  _operand1_rec_T_117 = _operand1_rec_T_3 & _operand1_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand1_rec_T_119 = _operand1_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand1_rec_T_121 = _operand1_rec_T_119 & ~_operand1_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand1_rec_T_124 = {1'b0,$signed(_operand1_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand1_rec_hi_lo = ~_operand1_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand1_rec_lo = _operand1_rec_T_3 ? _operand1_rec_T_110 : operand1_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand1_rec_T_125 = {1'h0,operand1_rec_hi_lo,operand1_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand1_rec_T_127 = _operand1_rec_T_117 ? 3'h0 : _operand1_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_9 = {{2'd0}, _operand1_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand1_rec_hi_lo_1 = _operand1_rec_T_127 | _GEN_9; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand1_rec_lo_hi = _operand1_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand1_rec_lo_lo = _operand1_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand1_rec_lo_1 = {operand1_rec_lo_hi,operand1_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand1_rec_hi_1 = {operand1_reg[63],operand1_rec_hi_lo_1}; // @[Cat.scala 30:58]
  wire  _output_T_2 = adder_io_out[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _output_T_4 = adder_io_out[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _output_T_6 = _output_T_4 & adder_io_out[61]; // @[rawFloatFromRecFN.scala 55:33]
  wire  _output_T_9 = _output_T_4 & ~adder_io_out[61]; // @[rawFloatFromRecFN.scala 56:33]
  wire [12:0] _output_T_11 = {1'b0,$signed(adder_io_out[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  wire  output_hi_lo = ~_output_T_2; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] output_lo = adder_io_out[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] _output_T_12 = {1'h0,output_hi_lo,output_lo}; // @[Cat.scala 30:58]
  wire  _output_T_13 = $signed(_output_T_11) < 13'sh402; // @[fNFromRecFN.scala 50:39]
  wire [5:0] _output_T_16 = 6'h1 - _output_T_11[5:0]; // @[fNFromRecFN.scala 51:39]
  wire [52:0] _output_T_18 = _output_T_12[53:1] >> _output_T_16; // @[fNFromRecFN.scala 52:42]
  wire [10:0] _output_T_22 = _output_T_11[10:0] - 11'h401; // @[fNFromRecFN.scala 57:45]
  wire [10:0] _output_T_23 = _output_T_13 ? 11'h0 : _output_T_22; // @[fNFromRecFN.scala 55:16]
  wire  _output_T_24 = _output_T_6 | _output_T_9; // @[fNFromRecFN.scala 59:44]
  wire [10:0] _output_T_26 = _output_T_24 ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] output_hi_lo_1 = _output_T_23 | _output_T_26; // @[fNFromRecFN.scala 59:15]
  wire [51:0] _output_T_28 = _output_T_9 ? 52'h0 : _output_T_12[51:0]; // @[fNFromRecFN.scala 63:20]
  wire [51:0] output_lo_1 = _output_T_13 ? _output_T_18[51:0] : _output_T_28; // @[fNFromRecFN.scala 61:16]
  wire [11:0] output_hi_1 = {adder_io_out[64],output_hi_lo_1}; // @[Cat.scala 30:58]
  reg [63:0] shiftRegs_0; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_1; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_2; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_3; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_4; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_5; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_6; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_7; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_8; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_9; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_10; // @[fpunits.scala 94:26]
  reg [63:0] shiftRegs_11; // @[fpunits.scala 94:26]
  AddRecFN adder ( // @[fpunits.scala 75:23]
    .io_subOp(adder_io_subOp),
    .io_a(adder_io_a),
    .io_b(adder_io_b),
    .io_out(adder_io_out)
  );
  assign result = shiftRegs_11; // @[fpunits.scala 100:14]
  assign adder_io_subOp = 1'h0; // @[fpunits.scala 78:22]
  assign adder_io_a = {operand0_rec_hi_1,operand0_rec_lo_1}; // @[Cat.scala 30:58]
  assign adder_io_b = {operand1_rec_hi_1,operand1_rec_lo_1}; // @[Cat.scala 30:58]
  always @(posedge new_clock) begin
    operand0_reg <= operand0; // @[fpunits.scala 67:31]
    operand1_reg <= operand1; // @[fpunits.scala 68:31]
    shiftRegs_0 <= {output_hi_1,output_lo_1}; // @[Cat.scala 30:58]
    shiftRegs_1 <= shiftRegs_0; // @[fpunits.scala 97:26]
    shiftRegs_2 <= shiftRegs_1; // @[fpunits.scala 97:26]
    shiftRegs_3 <= shiftRegs_2; // @[fpunits.scala 97:26]
    shiftRegs_4 <= shiftRegs_3; // @[fpunits.scala 97:26]
    shiftRegs_5 <= shiftRegs_4; // @[fpunits.scala 97:26]
    shiftRegs_6 <= shiftRegs_5; // @[fpunits.scala 97:26]
    shiftRegs_7 <= shiftRegs_6; // @[fpunits.scala 97:26]
    shiftRegs_8 <= shiftRegs_7; // @[fpunits.scala 97:26]
    shiftRegs_9 <= shiftRegs_8; // @[fpunits.scala 97:26]
    shiftRegs_10 <= shiftRegs_9; // @[fpunits.scala 97:26]
    shiftRegs_11 <= shiftRegs_10; // @[fpunits.scala 97:26]
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
  operand0_reg = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  operand1_reg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  shiftRegs_0 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  shiftRegs_1 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  shiftRegs_2 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  shiftRegs_3 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  shiftRegs_4 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  shiftRegs_5 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  shiftRegs_6 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  shiftRegs_7 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  shiftRegs_8 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  shiftRegs_9 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  shiftRegs_10 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  shiftRegs_11 = _RAND_13[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddFDynamic(
  input         clock,
  input         reset,
  output        operand0_ready,
  input         operand0_valid,
  input  [63:0] operand0_bits,
  output        operand1_ready,
  input         operand1_valid,
  input  [63:0] operand1_bits,
  input         result_ready,
  output        result_valid,
  output [63:0] result_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  join__pValid_0; // @[arithmetic_unit.scala 245:28]
  wire  join__pValid_1; // @[arithmetic_unit.scala 245:28]
  wire  join__ready_0; // @[arithmetic_unit.scala 245:28]
  wire  join__ready_1; // @[arithmetic_unit.scala 245:28]
  wire  join__valid; // @[arithmetic_unit.scala 245:28]
  wire  join__nReady; // @[arithmetic_unit.scala 245:28]
  wire  buff_clock; // @[arithmetic_unit.scala 246:28]
  wire  buff_reset; // @[arithmetic_unit.scala 246:28]
  wire  buff_valid_in; // @[arithmetic_unit.scala 246:28]
  wire  buff_ready_in; // @[arithmetic_unit.scala 246:28]
  wire  buff_valid_out; // @[arithmetic_unit.scala 246:28]
  wire  oehb_clock; // @[arithmetic_unit.scala 247:28]
  wire  oehb_reset; // @[arithmetic_unit.scala 247:28]
  wire  oehb_dataIn_ready; // @[arithmetic_unit.scala 247:28]
  wire  oehb_dataIn_valid; // @[arithmetic_unit.scala 247:28]
  wire  oehb_dataOut_ready; // @[arithmetic_unit.scala 247:28]
  wire  oehb_dataOut_valid; // @[arithmetic_unit.scala 247:28]
  wire  addf_clock; // @[arithmetic_unit.scala 263:20]
  wire [63:0] addf_operand0; // @[arithmetic_unit.scala 263:20]
  wire [63:0] addf_operand1; // @[arithmetic_unit.scala 263:20]
  wire  addf_ce; // @[arithmetic_unit.scala 263:20]
  wire [63:0] addf_result; // @[arithmetic_unit.scala 263:20]
  reg  ce; // @[arithmetic_unit.scala 264:19]
  Join join_ ( // @[arithmetic_unit.scala 245:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  DelayBuffer buff ( // @[arithmetic_unit.scala 246:28]
    .clock(buff_clock),
    .reset(buff_reset),
    .valid_in(buff_valid_in),
    .ready_in(buff_ready_in),
    .valid_out(buff_valid_out)
  );
  OEHB oehb ( // @[arithmetic_unit.scala 247:28]
    .clock(oehb_clock),
    .reset(oehb_reset),
    .dataIn_ready(oehb_dataIn_ready),
    .dataIn_valid(oehb_dataIn_valid),
    .dataOut_ready(oehb_dataOut_ready),
    .dataOut_valid(oehb_dataOut_valid)
  );
  AddSubFBase_2 addf ( // @[arithmetic_unit.scala 263:20]
    .clock(addf_clock),
    .operand0(addf_operand0),
    .operand1(addf_operand1),
    .ce(addf_ce),
    .result(addf_result)
  );
  assign operand0_ready = join__ready_0; // @[arithmetic_unit.scala 251:18]
  assign operand1_ready = join__ready_1; // @[arithmetic_unit.scala 252:18]
  assign result_valid = oehb_dataOut_valid; // @[arithmetic_unit.scala 261:16]
  assign result_bits = addf_result; // @[arithmetic_unit.scala 268:15]
  assign join__pValid_0 = operand0_valid; // @[arithmetic_unit.scala 249:18]
  assign join__pValid_1 = operand1_valid; // @[arithmetic_unit.scala 250:18]
  assign join__nReady = oehb_dataIn_ready; // @[arithmetic_unit.scala 253:15]
  assign buff_clock = clock;
  assign buff_reset = reset;
  assign buff_valid_in = join__valid; // @[arithmetic_unit.scala 255:17]
  assign buff_ready_in = oehb_dataIn_ready; // @[arithmetic_unit.scala 256:17]
  assign oehb_clock = clock;
  assign oehb_reset = reset;
  assign oehb_dataIn_valid = buff_valid_out; // @[arithmetic_unit.scala 260:21]
  assign oehb_dataOut_ready = result_ready; // @[arithmetic_unit.scala 259:22]
  assign addf_clock = clock;
  assign addf_operand0 = operand0_bits; // @[arithmetic_unit.scala 266:17]
  assign addf_operand1 = operand1_bits; // @[arithmetic_unit.scala 267:17]
  assign addf_ce = ce; // @[arithmetic_unit.scala 265:11]
  always @(posedge clock) begin
    ce <= oehb_dataIn_ready; // @[arithmetic_unit.scala 264:19]
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
  ce = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Join_18(
  input   pValid_0,
  input   pValid_1,
  input   pValid_2,
  output  ready_0,
  output  ready_1,
  output  ready_2,
  output  valid,
  input   nReady
);
  assign ready_0 = nReady & pValid_1 & pValid_2; // @[elastic_component.scala 30:74]
  assign ready_1 = nReady & pValid_0 & pValid_2; // @[elastic_component.scala 30:74]
  assign ready_2 = nReady & pValid_0 & pValid_1; // @[elastic_component.scala 30:74]
  assign valid = pValid_0 & pValid_1 & pValid_2; // @[elastic_component.scala 27:38]
endmodule
module Select(
  output        dataIn_0_ready,
  input         dataIn_0_valid,
  input  [63:0] dataIn_0_bits,
  output        dataIn_1_ready,
  input         dataIn_1_valid,
  input  [63:0] dataIn_1_bits,
  output        condition_ready,
  input         condition_valid,
  input         condition_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  join__pValid_0; // @[elastic_component.scala 340:28]
  wire  join__pValid_1; // @[elastic_component.scala 340:28]
  wire  join__pValid_2; // @[elastic_component.scala 340:28]
  wire  join__ready_0; // @[elastic_component.scala 340:28]
  wire  join__ready_1; // @[elastic_component.scala 340:28]
  wire  join__ready_2; // @[elastic_component.scala 340:28]
  wire  join__valid; // @[elastic_component.scala 340:28]
  wire  join__nReady; // @[elastic_component.scala 340:28]
  Join_18 join_ ( // @[elastic_component.scala 340:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .pValid_2(join__pValid_2),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .ready_2(join__ready_2),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  assign dataIn_0_ready = join__ready_0; // @[elastic_component.scala 347:19]
  assign dataIn_1_ready = join__ready_1; // @[elastic_component.scala 348:19]
  assign condition_ready = join__ready_2; // @[elastic_component.scala 349:19]
  assign dataOut_valid = join__valid; // @[elastic_component.scala 351:17]
  assign dataOut_bits = ~condition_bits ? dataIn_1_bits : dataIn_0_bits; // @[elastic_component.scala 352:16 elastic_component.scala 352:16]
  assign join__pValid_0 = dataIn_0_valid; // @[elastic_component.scala 341:18]
  assign join__pValid_1 = dataIn_1_valid; // @[elastic_component.scala 342:18]
  assign join__pValid_2 = condition_valid; // @[elastic_component.scala 343:18]
  assign join__nReady = dataOut_ready; // @[elastic_component.scala 345:15]
endmodule
module NotEqualIDynamic(
  output        operand0_ready,
  input         operand0_valid,
  input  [31:0] operand0_bits,
  output        operand1_ready,
  input         operand1_valid,
  input  [31:0] operand1_bits,
  input         result_ready,
  output        result_valid,
  output        result_bits
);
  assign operand0_ready = operand1_valid & result_ready; // @[arithmetic_unit.scala 189:36]
  assign operand1_ready = operand0_valid & result_ready; // @[arithmetic_unit.scala 190:36]
  assign result_valid = operand0_valid & operand1_valid; // @[arithmetic_unit.scala 188:34]
  assign result_bits = operand0_bits != operand1_bits; // @[arithmetic_unit.scala 201:70]
endmodule
module AndDynamic(
  output  operand0_ready,
  input   operand0_valid,
  input   operand0_bits,
  output  operand1_ready,
  input   operand1_valid,
  input   operand1_bits,
  input   result_ready,
  output  result_valid,
  output  result_bits
);
  assign operand0_ready = operand1_valid & result_ready; // @[arithmetic_unit.scala 103:36]
  assign operand1_ready = operand0_valid & result_ready; // @[arithmetic_unit.scala 104:36]
  assign result_valid = operand0_valid & operand1_valid; // @[arithmetic_unit.scala 102:34]
  assign result_bits = operand0_bits & operand1_bits; // @[arithmetic_unit.scala 107:70]
endmodule
module DelayBuffer_6(
  input   clock,
  input   reset,
  input   valid_in,
  input   ready_in,
  output  valid_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  shift_register_0; // @[elastic_component.scala 564:31]
  reg  shift_register_1; // @[elastic_component.scala 564:31]
  reg  shift_register_2; // @[elastic_component.scala 564:31]
  reg  shift_register_3; // @[elastic_component.scala 564:31]
  reg  shift_register_4; // @[elastic_component.scala 564:31]
  reg  shift_register_5; // @[elastic_component.scala 564:31]
  reg  shift_register_6; // @[elastic_component.scala 564:31]
  reg  shift_register_7; // @[elastic_component.scala 564:31]
  assign valid_out = shift_register_7; // @[elastic_component.scala 572:13]
  always @(posedge clock) begin
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_0 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_0 <= valid_in; // @[elastic_component.scala 567:23]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_1 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_1 <= shift_register_0; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_2 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_2 <= shift_register_1; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_3 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_3 <= shift_register_2; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_4 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_4 <= shift_register_3; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_5 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_5 <= shift_register_4; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_6 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_6 <= shift_register_5; // @[elastic_component.scala 569:25]
    end
    if (reset) begin // @[elastic_component.scala 564:31]
      shift_register_7 <= 1'h0; // @[elastic_component.scala 564:31]
    end else if (ready_in) begin // @[elastic_component.scala 566:18]
      shift_register_7 <= shift_register_6; // @[elastic_component.scala 569:25]
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
  shift_register_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  shift_register_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  shift_register_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  shift_register_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  shift_register_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  shift_register_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  shift_register_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  shift_register_7 = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MulFullRawFN(
  input          io_a_isNaN,
  input          io_a_isInf,
  input          io_a_isZero,
  input          io_a_sign,
  input  [12:0]  io_a_sExp,
  input  [53:0]  io_a_sig,
  input          io_b_isNaN,
  input          io_b_isInf,
  input          io_b_isZero,
  input          io_b_sign,
  input  [12:0]  io_b_sExp,
  input  [53:0]  io_b_sig,
  output         io_invalidExc,
  output         io_rawOut_isNaN,
  output         io_rawOut_isInf,
  output         io_rawOut_isZero,
  output         io_rawOut_sign,
  output [12:0]  io_rawOut_sExp,
  output [105:0] io_rawOut_sig
);
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isZero | io_a_isZero & io_b_isInf; // @[MulRecFN.scala 58:60]
  wire [12:0] _T_4 = $signed(io_a_sExp) + $signed(io_b_sExp); // @[MulRecFN.scala 62:36]
  wire [107:0] _T_7 = io_a_sig * io_b_sig; // @[MulRecFN.scala 63:35]
  wire  _T_10 = io_a_isNaN & ~io_a_sig[51]; // @[common.scala 84:46]
  wire  _T_13 = io_b_isNaN & ~io_b_sig[51]; // @[common.scala 84:46]
  assign io_invalidExc = _T_10 | _T_13 | notSigNaN_invalidExc; // @[MulRecFN.scala 66:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[MulRecFN.scala 70:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[MulRecFN.scala 59:38]
  assign io_rawOut_isZero = io_a_isZero | io_b_isZero; // @[MulRecFN.scala 60:40]
  assign io_rawOut_sign = io_a_sign ^ io_b_sign; // @[MulRecFN.scala 61:36]
  assign io_rawOut_sExp = $signed(_T_4) - 13'sh800; // @[MulRecFN.scala 62:48]
  assign io_rawOut_sig = _T_7[105:0]; // @[MulRecFN.scala 63:46]
endmodule
module MulRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [12:0] io_a_sExp,
  input  [53:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [12:0] io_b_sExp,
  input  [53:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [12:0] io_rawOut_sExp,
  output [55:0] io_rawOut_sig
);
  wire  mulFullRaw_io_a_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_sign; // @[MulRecFN.scala 84:28]
  wire [12:0] mulFullRaw_io_a_sExp; // @[MulRecFN.scala 84:28]
  wire [53:0] mulFullRaw_io_a_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_sign; // @[MulRecFN.scala 84:28]
  wire [12:0] mulFullRaw_io_b_sExp; // @[MulRecFN.scala 84:28]
  wire [53:0] mulFullRaw_io_b_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_invalidExc; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 84:28]
  wire [12:0] mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 84:28]
  wire [105:0] mulFullRaw_io_rawOut_sig; // @[MulRecFN.scala 84:28]
  wire [54:0] hi = mulFullRaw_io_rawOut_sig[105:51]; // @[MulRecFN.scala 93:15]
  wire  lo = |mulFullRaw_io_rawOut_sig[50:0]; // @[MulRecFN.scala 93:55]
  MulFullRawFN mulFullRaw ( // @[MulRecFN.scala 84:28]
    .io_a_isNaN(mulFullRaw_io_a_isNaN),
    .io_a_isInf(mulFullRaw_io_a_isInf),
    .io_a_isZero(mulFullRaw_io_a_isZero),
    .io_a_sign(mulFullRaw_io_a_sign),
    .io_a_sExp(mulFullRaw_io_a_sExp),
    .io_a_sig(mulFullRaw_io_a_sig),
    .io_b_isNaN(mulFullRaw_io_b_isNaN),
    .io_b_isInf(mulFullRaw_io_b_isInf),
    .io_b_isZero(mulFullRaw_io_b_isZero),
    .io_b_sign(mulFullRaw_io_b_sign),
    .io_b_sExp(mulFullRaw_io_b_sExp),
    .io_b_sig(mulFullRaw_io_b_sig),
    .io_invalidExc(mulFullRaw_io_invalidExc),
    .io_rawOut_isNaN(mulFullRaw_io_rawOut_isNaN),
    .io_rawOut_isInf(mulFullRaw_io_rawOut_isInf),
    .io_rawOut_isZero(mulFullRaw_io_rawOut_isZero),
    .io_rawOut_sign(mulFullRaw_io_rawOut_sign),
    .io_rawOut_sExp(mulFullRaw_io_rawOut_sExp),
    .io_rawOut_sig(mulFullRaw_io_rawOut_sig)
  );
  assign io_invalidExc = mulFullRaw_io_invalidExc; // @[MulRecFN.scala 89:19]
  assign io_rawOut_isNaN = mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isInf = mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isZero = mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sign = mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sExp = mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sig = {hi,lo}; // @[Cat.scala 30:58]
  assign mulFullRaw_io_a_isNaN = io_a_isNaN; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isInf = io_a_isInf; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isZero = io_a_isZero; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sign = io_a_sign; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sExp = io_a_sExp; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sig = io_a_sig; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_b_isNaN = io_b_isNaN; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isInf = io_b_isInf; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isZero = io_b_isZero; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sign = io_b_sign; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sExp = io_b_sExp; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sig = io_b_sig; // @[MulRecFN.scala 87:21]
endmodule
module MulRecFN(
  input  [64:0] io_a,
  input  [64:0] io_b,
  output [64:0] io_out
);
  wire  mulRawFN_io_a_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_a_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_a_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_a_sign; // @[MulRecFN.scala 113:26]
  wire [12:0] mulRawFN_io_a_sExp; // @[MulRecFN.scala 113:26]
  wire [53:0] mulRawFN_io_a_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_b_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_b_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_b_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_b_sign; // @[MulRecFN.scala 113:26]
  wire [12:0] mulRawFN_io_b_sExp; // @[MulRecFN.scala 113:26]
  wire [53:0] mulRawFN_io_b_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_invalidExc; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_rawOut_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_rawOut_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_rawOut_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN_io_rawOut_sign; // @[MulRecFN.scala 113:26]
  wire [12:0] mulRawFN_io_rawOut_sExp; // @[MulRecFN.scala 113:26]
  wire [55:0] mulRawFN_io_rawOut_sig; // @[MulRecFN.scala 113:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[MulRecFN.scala 121:15]
  wire [12:0] roundRawFNToRecFN_io_in_sExp; // @[MulRecFN.scala 121:15]
  wire [55:0] roundRawFNToRecFN_io_in_sig; // @[MulRecFN.scala 121:15]
  wire [64:0] roundRawFNToRecFN_io_out; // @[MulRecFN.scala 121:15]
  wire  _T_2 = io_a[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _T_4 = io_a[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  hi_lo = ~_T_2; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] lo = io_a[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] hi = {1'h0,hi_lo}; // @[Cat.scala 30:58]
  wire  _T_15 = io_b[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _T_17 = io_b[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  hi_lo_1 = ~_T_15; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] lo_1 = io_b[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [1:0] hi_1 = {1'h0,hi_lo_1}; // @[Cat.scala 30:58]
  MulRawFN mulRawFN ( // @[MulRecFN.scala 113:26]
    .io_a_isNaN(mulRawFN_io_a_isNaN),
    .io_a_isInf(mulRawFN_io_a_isInf),
    .io_a_isZero(mulRawFN_io_a_isZero),
    .io_a_sign(mulRawFN_io_a_sign),
    .io_a_sExp(mulRawFN_io_a_sExp),
    .io_a_sig(mulRawFN_io_a_sig),
    .io_b_isNaN(mulRawFN_io_b_isNaN),
    .io_b_isInf(mulRawFN_io_b_isInf),
    .io_b_isZero(mulRawFN_io_b_isZero),
    .io_b_sign(mulRawFN_io_b_sign),
    .io_b_sExp(mulRawFN_io_b_sExp),
    .io_b_sig(mulRawFN_io_b_sig),
    .io_invalidExc(mulRawFN_io_invalidExc),
    .io_rawOut_isNaN(mulRawFN_io_rawOut_isNaN),
    .io_rawOut_isInf(mulRawFN_io_rawOut_isInf),
    .io_rawOut_isZero(mulRawFN_io_rawOut_isZero),
    .io_rawOut_sign(mulRawFN_io_rawOut_sign),
    .io_rawOut_sExp(mulRawFN_io_rawOut_sExp),
    .io_rawOut_sig(mulRawFN_io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[MulRecFN.scala 121:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[MulRecFN.scala 127:23]
  assign mulRawFN_io_a_isNaN = _T_4 & io_a[61]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN_io_a_isInf = _T_4 & ~io_a[61]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN_io_a_isZero = io_a[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN_io_a_sign = io_a[64]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN_io_a_sExp = {1'b0,$signed(io_a[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN_io_a_sig = {hi,lo}; // @[Cat.scala 30:58]
  assign mulRawFN_io_b_isNaN = _T_17 & io_b[61]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN_io_b_isInf = _T_17 & ~io_b[61]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN_io_b_isZero = io_b[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN_io_b_sign = io_b[64]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN_io_b_sExp = {1'b0,$signed(io_b[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN_io_b_sig = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign roundRawFNToRecFN_io_invalidExc = mulRawFN_io_invalidExc; // @[MulRecFN.scala 122:39]
  assign roundRawFNToRecFN_io_in_isNaN = mulRawFN_io_rawOut_isNaN; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isInf = mulRawFN_io_rawOut_isInf; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isZero = mulRawFN_io_rawOut_isZero; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sign = mulRawFN_io_rawOut_sign; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sExp = mulRawFN_io_rawOut_sExp; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sig = mulRawFN_io_rawOut_sig; // @[MulRecFN.scala 124:39]
endmodule
module MulFBase(
  input         clock,
  input  [63:0] operand0,
  input  [63:0] operand1,
  input         ce,
  output [63:0] result
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire [64:0] multiplier_io_a; // @[fpunits.scala 33:28]
  wire [64:0] multiplier_io_b; // @[fpunits.scala 33:28]
  wire [64:0] multiplier_io_out; // @[fpunits.scala 33:28]
  wire  new_clock = clock & ce; // @[fpunits.scala 21:51]
  reg [63:0] operand0_reg; // @[fpunits.scala 25:31]
  reg [63:0] operand1_reg; // @[fpunits.scala 26:31]
  wire  _operand0_rec_T_3 = operand0_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand0_rec_T_4 = operand0_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand0_rec_T_57 = operand0_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_58 = operand0_reg[2] ? 6'h31 : _operand0_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_59 = operand0_reg[3] ? 6'h30 : _operand0_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_60 = operand0_reg[4] ? 6'h2f : _operand0_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_61 = operand0_reg[5] ? 6'h2e : _operand0_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_62 = operand0_reg[6] ? 6'h2d : _operand0_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_63 = operand0_reg[7] ? 6'h2c : _operand0_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_64 = operand0_reg[8] ? 6'h2b : _operand0_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_65 = operand0_reg[9] ? 6'h2a : _operand0_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_66 = operand0_reg[10] ? 6'h29 : _operand0_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_67 = operand0_reg[11] ? 6'h28 : _operand0_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_68 = operand0_reg[12] ? 6'h27 : _operand0_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_69 = operand0_reg[13] ? 6'h26 : _operand0_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_70 = operand0_reg[14] ? 6'h25 : _operand0_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_71 = operand0_reg[15] ? 6'h24 : _operand0_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_72 = operand0_reg[16] ? 6'h23 : _operand0_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_73 = operand0_reg[17] ? 6'h22 : _operand0_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_74 = operand0_reg[18] ? 6'h21 : _operand0_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_75 = operand0_reg[19] ? 6'h20 : _operand0_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_76 = operand0_reg[20] ? 6'h1f : _operand0_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_77 = operand0_reg[21] ? 6'h1e : _operand0_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_78 = operand0_reg[22] ? 6'h1d : _operand0_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_79 = operand0_reg[23] ? 6'h1c : _operand0_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_80 = operand0_reg[24] ? 6'h1b : _operand0_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_81 = operand0_reg[25] ? 6'h1a : _operand0_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_82 = operand0_reg[26] ? 6'h19 : _operand0_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_83 = operand0_reg[27] ? 6'h18 : _operand0_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_84 = operand0_reg[28] ? 6'h17 : _operand0_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_85 = operand0_reg[29] ? 6'h16 : _operand0_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_86 = operand0_reg[30] ? 6'h15 : _operand0_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_87 = operand0_reg[31] ? 6'h14 : _operand0_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_88 = operand0_reg[32] ? 6'h13 : _operand0_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_89 = operand0_reg[33] ? 6'h12 : _operand0_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_90 = operand0_reg[34] ? 6'h11 : _operand0_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_91 = operand0_reg[35] ? 6'h10 : _operand0_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_92 = operand0_reg[36] ? 6'hf : _operand0_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_93 = operand0_reg[37] ? 6'he : _operand0_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_94 = operand0_reg[38] ? 6'hd : _operand0_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_95 = operand0_reg[39] ? 6'hc : _operand0_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_96 = operand0_reg[40] ? 6'hb : _operand0_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_97 = operand0_reg[41] ? 6'ha : _operand0_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_98 = operand0_reg[42] ? 6'h9 : _operand0_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_99 = operand0_reg[43] ? 6'h8 : _operand0_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_100 = operand0_reg[44] ? 6'h7 : _operand0_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_101 = operand0_reg[45] ? 6'h6 : _operand0_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_102 = operand0_reg[46] ? 6'h5 : _operand0_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_103 = operand0_reg[47] ? 6'h4 : _operand0_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_104 = operand0_reg[48] ? 6'h3 : _operand0_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_105 = operand0_reg[49] ? 6'h2 : _operand0_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_106 = operand0_reg[50] ? 6'h1 : _operand0_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand0_rec_T_107 = operand0_reg[51] ? 6'h0 : _operand0_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_0 = {{63'd0}, operand0_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand0_rec_T_108 = _GEN_0 << _operand0_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand0_rec_T_110 = {_operand0_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_1 = {{6'd0}, _operand0_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_111 = _GEN_1 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand0_rec_T_112 = _operand0_rec_T_3 ? _operand0_rec_T_111 : {{1'd0}, operand0_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand0_rec_T_113 = _operand0_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_2 = {{9'd0}, _operand0_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand0_rec_T_114 = 11'h400 | _GEN_2; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_3 = {{1'd0}, _operand0_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand0_rec_T_116 = _operand0_rec_T_112 + _GEN_3; // @[rawFloatFromFN.scala 59:15]
  wire  _operand0_rec_T_117 = _operand0_rec_T_3 & _operand0_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand0_rec_T_119 = _operand0_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand0_rec_T_121 = _operand0_rec_T_119 & ~_operand0_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand0_rec_T_124 = {1'b0,$signed(_operand0_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand0_rec_hi_lo = ~_operand0_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand0_rec_lo = _operand0_rec_T_3 ? _operand0_rec_T_110 : operand0_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand0_rec_T_125 = {1'h0,operand0_rec_hi_lo,operand0_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand0_rec_T_127 = _operand0_rec_T_117 ? 3'h0 : _operand0_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_4 = {{2'd0}, _operand0_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand0_rec_hi_lo_1 = _operand0_rec_T_127 | _GEN_4; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand0_rec_lo_hi = _operand0_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand0_rec_lo_lo = _operand0_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand0_rec_lo_1 = {operand0_rec_lo_hi,operand0_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand0_rec_hi_1 = {operand0_reg[63],operand0_rec_hi_lo_1}; // @[Cat.scala 30:58]
  wire  _operand1_rec_T_3 = operand1_reg[62:52] == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  _operand1_rec_T_4 = operand1_reg[51:0] == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _operand1_rec_T_57 = operand1_reg[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_58 = operand1_reg[2] ? 6'h31 : _operand1_rec_T_57; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_59 = operand1_reg[3] ? 6'h30 : _operand1_rec_T_58; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_60 = operand1_reg[4] ? 6'h2f : _operand1_rec_T_59; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_61 = operand1_reg[5] ? 6'h2e : _operand1_rec_T_60; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_62 = operand1_reg[6] ? 6'h2d : _operand1_rec_T_61; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_63 = operand1_reg[7] ? 6'h2c : _operand1_rec_T_62; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_64 = operand1_reg[8] ? 6'h2b : _operand1_rec_T_63; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_65 = operand1_reg[9] ? 6'h2a : _operand1_rec_T_64; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_66 = operand1_reg[10] ? 6'h29 : _operand1_rec_T_65; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_67 = operand1_reg[11] ? 6'h28 : _operand1_rec_T_66; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_68 = operand1_reg[12] ? 6'h27 : _operand1_rec_T_67; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_69 = operand1_reg[13] ? 6'h26 : _operand1_rec_T_68; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_70 = operand1_reg[14] ? 6'h25 : _operand1_rec_T_69; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_71 = operand1_reg[15] ? 6'h24 : _operand1_rec_T_70; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_72 = operand1_reg[16] ? 6'h23 : _operand1_rec_T_71; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_73 = operand1_reg[17] ? 6'h22 : _operand1_rec_T_72; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_74 = operand1_reg[18] ? 6'h21 : _operand1_rec_T_73; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_75 = operand1_reg[19] ? 6'h20 : _operand1_rec_T_74; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_76 = operand1_reg[20] ? 6'h1f : _operand1_rec_T_75; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_77 = operand1_reg[21] ? 6'h1e : _operand1_rec_T_76; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_78 = operand1_reg[22] ? 6'h1d : _operand1_rec_T_77; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_79 = operand1_reg[23] ? 6'h1c : _operand1_rec_T_78; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_80 = operand1_reg[24] ? 6'h1b : _operand1_rec_T_79; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_81 = operand1_reg[25] ? 6'h1a : _operand1_rec_T_80; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_82 = operand1_reg[26] ? 6'h19 : _operand1_rec_T_81; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_83 = operand1_reg[27] ? 6'h18 : _operand1_rec_T_82; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_84 = operand1_reg[28] ? 6'h17 : _operand1_rec_T_83; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_85 = operand1_reg[29] ? 6'h16 : _operand1_rec_T_84; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_86 = operand1_reg[30] ? 6'h15 : _operand1_rec_T_85; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_87 = operand1_reg[31] ? 6'h14 : _operand1_rec_T_86; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_88 = operand1_reg[32] ? 6'h13 : _operand1_rec_T_87; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_89 = operand1_reg[33] ? 6'h12 : _operand1_rec_T_88; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_90 = operand1_reg[34] ? 6'h11 : _operand1_rec_T_89; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_91 = operand1_reg[35] ? 6'h10 : _operand1_rec_T_90; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_92 = operand1_reg[36] ? 6'hf : _operand1_rec_T_91; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_93 = operand1_reg[37] ? 6'he : _operand1_rec_T_92; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_94 = operand1_reg[38] ? 6'hd : _operand1_rec_T_93; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_95 = operand1_reg[39] ? 6'hc : _operand1_rec_T_94; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_96 = operand1_reg[40] ? 6'hb : _operand1_rec_T_95; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_97 = operand1_reg[41] ? 6'ha : _operand1_rec_T_96; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_98 = operand1_reg[42] ? 6'h9 : _operand1_rec_T_97; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_99 = operand1_reg[43] ? 6'h8 : _operand1_rec_T_98; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_100 = operand1_reg[44] ? 6'h7 : _operand1_rec_T_99; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_101 = operand1_reg[45] ? 6'h6 : _operand1_rec_T_100; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_102 = operand1_reg[46] ? 6'h5 : _operand1_rec_T_101; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_103 = operand1_reg[47] ? 6'h4 : _operand1_rec_T_102; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_104 = operand1_reg[48] ? 6'h3 : _operand1_rec_T_103; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_105 = operand1_reg[49] ? 6'h2 : _operand1_rec_T_104; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_106 = operand1_reg[50] ? 6'h1 : _operand1_rec_T_105; // @[Mux.scala 47:69]
  wire [5:0] _operand1_rec_T_107 = operand1_reg[51] ? 6'h0 : _operand1_rec_T_106; // @[Mux.scala 47:69]
  wire [114:0] _GEN_5 = {{63'd0}, operand1_reg[51:0]}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _operand1_rec_T_108 = _GEN_5 << _operand1_rec_T_107; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] _operand1_rec_T_110 = {_operand1_rec_T_108[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_6 = {{6'd0}, _operand1_rec_T_107}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_111 = _GEN_6 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _operand1_rec_T_112 = _operand1_rec_T_3 ? _operand1_rec_T_111 : {{1'd0}, operand1_reg[62:52]}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _operand1_rec_T_113 = _operand1_rec_T_3 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_7 = {{9'd0}, _operand1_rec_T_113}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _operand1_rec_T_114 = 11'h400 | _GEN_7; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_8 = {{1'd0}, _operand1_rec_T_114}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] _operand1_rec_T_116 = _operand1_rec_T_112 + _GEN_8; // @[rawFloatFromFN.scala 59:15]
  wire  _operand1_rec_T_117 = _operand1_rec_T_3 & _operand1_rec_T_4; // @[rawFloatFromFN.scala 62:34]
  wire  _operand1_rec_T_119 = _operand1_rec_T_116[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  _operand1_rec_T_121 = _operand1_rec_T_119 & ~_operand1_rec_T_4; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] _operand1_rec_T_124 = {1'b0,$signed(_operand1_rec_T_116)}; // @[rawFloatFromFN.scala 70:48]
  wire  operand1_rec_hi_lo = ~_operand1_rec_T_117; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] operand1_rec_lo = _operand1_rec_T_3 ? _operand1_rec_T_110 : operand1_reg[51:0]; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] _operand1_rec_T_125 = {1'h0,operand1_rec_hi_lo,operand1_rec_lo}; // @[Cat.scala 30:58]
  wire [2:0] _operand1_rec_T_127 = _operand1_rec_T_117 ? 3'h0 : _operand1_rec_T_124[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_9 = {{2'd0}, _operand1_rec_T_121}; // @[recFNFromFN.scala 48:79]
  wire [2:0] operand1_rec_hi_lo_1 = _operand1_rec_T_127 | _GEN_9; // @[recFNFromFN.scala 48:79]
  wire [8:0] operand1_rec_lo_hi = _operand1_rec_T_124[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] operand1_rec_lo_lo = _operand1_rec_T_125[51:0]; // @[recFNFromFN.scala 51:22]
  wire [60:0] operand1_rec_lo_1 = {operand1_rec_lo_hi,operand1_rec_lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] operand1_rec_hi_1 = {operand1_reg[63],operand1_rec_hi_lo_1}; // @[Cat.scala 30:58]
  wire  _output_T_2 = multiplier_io_out[63:61] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  _output_T_4 = multiplier_io_out[63:62] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _output_T_6 = _output_T_4 & multiplier_io_out[61]; // @[rawFloatFromRecFN.scala 55:33]
  wire  _output_T_9 = _output_T_4 & ~multiplier_io_out[61]; // @[rawFloatFromRecFN.scala 56:33]
  wire [12:0] _output_T_11 = {1'b0,$signed(multiplier_io_out[63:52])}; // @[rawFloatFromRecFN.scala 59:27]
  wire  output_hi_lo = ~_output_T_2; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] output_lo = multiplier_io_out[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] _output_T_12 = {1'h0,output_hi_lo,output_lo}; // @[Cat.scala 30:58]
  wire  _output_T_13 = $signed(_output_T_11) < 13'sh402; // @[fNFromRecFN.scala 50:39]
  wire [5:0] _output_T_16 = 6'h1 - _output_T_11[5:0]; // @[fNFromRecFN.scala 51:39]
  wire [52:0] _output_T_18 = _output_T_12[53:1] >> _output_T_16; // @[fNFromRecFN.scala 52:42]
  wire [10:0] _output_T_22 = _output_T_11[10:0] - 11'h401; // @[fNFromRecFN.scala 57:45]
  wire [10:0] _output_T_23 = _output_T_13 ? 11'h0 : _output_T_22; // @[fNFromRecFN.scala 55:16]
  wire  _output_T_24 = _output_T_6 | _output_T_9; // @[fNFromRecFN.scala 59:44]
  wire [10:0] _output_T_26 = _output_T_24 ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] output_hi_lo_1 = _output_T_23 | _output_T_26; // @[fNFromRecFN.scala 59:15]
  wire [51:0] _output_T_28 = _output_T_9 ? 52'h0 : _output_T_12[51:0]; // @[fNFromRecFN.scala 63:20]
  wire [51:0] output_lo_1 = _output_T_13 ? _output_T_18[51:0] : _output_T_28; // @[fNFromRecFN.scala 61:16]
  wire [11:0] output_hi_1 = {multiplier_io_out[64],output_hi_lo_1}; // @[Cat.scala 30:58]
  reg [63:0] shiftRegs_0; // @[fpunits.scala 46:26]
  reg [63:0] shiftRegs_1; // @[fpunits.scala 46:26]
  reg [63:0] shiftRegs_2; // @[fpunits.scala 46:26]
  reg [63:0] shiftRegs_3; // @[fpunits.scala 46:26]
  reg [63:0] shiftRegs_4; // @[fpunits.scala 46:26]
  reg [63:0] shiftRegs_5; // @[fpunits.scala 46:26]
  reg [63:0] shiftRegs_6; // @[fpunits.scala 46:26]
  reg [63:0] shiftRegs_7; // @[fpunits.scala 46:26]
  MulRecFN multiplier ( // @[fpunits.scala 33:28]
    .io_a(multiplier_io_a),
    .io_b(multiplier_io_b),
    .io_out(multiplier_io_out)
  );
  assign result = shiftRegs_7; // @[fpunits.scala 52:14]
  assign multiplier_io_a = {operand0_rec_hi_1,operand0_rec_lo_1}; // @[Cat.scala 30:58]
  assign multiplier_io_b = {operand1_rec_hi_1,operand1_rec_lo_1}; // @[Cat.scala 30:58]
  always @(posedge new_clock) begin
    operand0_reg <= operand0; // @[fpunits.scala 25:31]
    operand1_reg <= operand1; // @[fpunits.scala 26:31]
    shiftRegs_0 <= {output_hi_1,output_lo_1}; // @[Cat.scala 30:58]
    shiftRegs_1 <= shiftRegs_0; // @[fpunits.scala 49:26]
    shiftRegs_2 <= shiftRegs_1; // @[fpunits.scala 49:26]
    shiftRegs_3 <= shiftRegs_2; // @[fpunits.scala 49:26]
    shiftRegs_4 <= shiftRegs_3; // @[fpunits.scala 49:26]
    shiftRegs_5 <= shiftRegs_4; // @[fpunits.scala 49:26]
    shiftRegs_6 <= shiftRegs_5; // @[fpunits.scala 49:26]
    shiftRegs_7 <= shiftRegs_6; // @[fpunits.scala 49:26]
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
  operand0_reg = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  operand1_reg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  shiftRegs_0 = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  shiftRegs_1 = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  shiftRegs_2 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  shiftRegs_3 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  shiftRegs_4 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  shiftRegs_5 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  shiftRegs_6 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  shiftRegs_7 = _RAND_9[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DivFBase(
  input         clock,
  input  [63:0] operand0,
  input  [63:0] operand1,
  input         ce,
  output [63:0] result
);
  wire  fakeModule_clock; // @[fpunits.scala 220:26]
  wire [63:0] fakeModule_operand0; // @[fpunits.scala 220:26]
  wire [63:0] fakeModule_operand1; // @[fpunits.scala 220:26]
  wire  fakeModule_ce; // @[fpunits.scala 220:26]
  wire [63:0] fakeModule_result; // @[fpunits.scala 220:26]
  MulFBase fakeModule ( // @[fpunits.scala 220:26]
    .clock(fakeModule_clock),
    .operand0(fakeModule_operand0),
    .operand1(fakeModule_operand1),
    .ce(fakeModule_ce),
    .result(fakeModule_result)
  );
  assign result = fakeModule_result; // @[fpunits.scala 224:10]
  assign fakeModule_clock = clock;
  assign fakeModule_operand0 = operand0; // @[fpunits.scala 221:23]
  assign fakeModule_operand1 = operand1; // @[fpunits.scala 222:23]
  assign fakeModule_ce = ce; // @[fpunits.scala 223:17]
endmodule
module DivFDynamic(
  input         clock,
  input         reset,
  output        operand0_ready,
  input         operand0_valid,
  input  [63:0] operand0_bits,
  output        operand1_ready,
  input         operand1_valid,
  input  [63:0] operand1_bits,
  input         result_ready,
  output        result_valid,
  output [63:0] result_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  join__pValid_0; // @[arithmetic_unit.scala 397:28]
  wire  join__pValid_1; // @[arithmetic_unit.scala 397:28]
  wire  join__ready_0; // @[arithmetic_unit.scala 397:28]
  wire  join__ready_1; // @[arithmetic_unit.scala 397:28]
  wire  join__valid; // @[arithmetic_unit.scala 397:28]
  wire  join__nReady; // @[arithmetic_unit.scala 397:28]
  wire  buff_clock; // @[arithmetic_unit.scala 398:28]
  wire  buff_reset; // @[arithmetic_unit.scala 398:28]
  wire  buff_valid_in; // @[arithmetic_unit.scala 398:28]
  wire  buff_ready_in; // @[arithmetic_unit.scala 398:28]
  wire  buff_valid_out; // @[arithmetic_unit.scala 398:28]
  wire  oehb_clock; // @[arithmetic_unit.scala 399:28]
  wire  oehb_reset; // @[arithmetic_unit.scala 399:28]
  wire  oehb_dataIn_ready; // @[arithmetic_unit.scala 399:28]
  wire  oehb_dataIn_valid; // @[arithmetic_unit.scala 399:28]
  wire  oehb_dataOut_ready; // @[arithmetic_unit.scala 399:28]
  wire  oehb_dataOut_valid; // @[arithmetic_unit.scala 399:28]
  wire  divf_clock; // @[arithmetic_unit.scala 415:20]
  wire [63:0] divf_operand0; // @[arithmetic_unit.scala 415:20]
  wire [63:0] divf_operand1; // @[arithmetic_unit.scala 415:20]
  wire  divf_ce; // @[arithmetic_unit.scala 415:20]
  wire [63:0] divf_result; // @[arithmetic_unit.scala 415:20]
  reg  ce; // @[arithmetic_unit.scala 416:19]
  Join join_ ( // @[arithmetic_unit.scala 397:28]
    .pValid_0(join__pValid_0),
    .pValid_1(join__pValid_1),
    .ready_0(join__ready_0),
    .ready_1(join__ready_1),
    .valid(join__valid),
    .nReady(join__nReady)
  );
  DelayBuffer_6 buff ( // @[arithmetic_unit.scala 398:28]
    .clock(buff_clock),
    .reset(buff_reset),
    .valid_in(buff_valid_in),
    .ready_in(buff_ready_in),
    .valid_out(buff_valid_out)
  );
  OEHB oehb ( // @[arithmetic_unit.scala 399:28]
    .clock(oehb_clock),
    .reset(oehb_reset),
    .dataIn_ready(oehb_dataIn_ready),
    .dataIn_valid(oehb_dataIn_valid),
    .dataOut_ready(oehb_dataOut_ready),
    .dataOut_valid(oehb_dataOut_valid)
  );
  DivFBase divf ( // @[arithmetic_unit.scala 415:20]
    .clock(divf_clock),
    .operand0(divf_operand0),
    .operand1(divf_operand1),
    .ce(divf_ce),
    .result(divf_result)
  );
  assign operand0_ready = join__ready_0; // @[arithmetic_unit.scala 403:18]
  assign operand1_ready = join__ready_1; // @[arithmetic_unit.scala 404:18]
  assign result_valid = oehb_dataOut_valid; // @[arithmetic_unit.scala 413:16]
  assign result_bits = divf_result; // @[arithmetic_unit.scala 420:15]
  assign join__pValid_0 = operand0_valid; // @[arithmetic_unit.scala 401:18]
  assign join__pValid_1 = operand1_valid; // @[arithmetic_unit.scala 402:18]
  assign join__nReady = oehb_dataIn_ready; // @[arithmetic_unit.scala 405:15]
  assign buff_clock = clock;
  assign buff_reset = reset;
  assign buff_valid_in = join__valid; // @[arithmetic_unit.scala 407:17]
  assign buff_ready_in = oehb_dataIn_ready; // @[arithmetic_unit.scala 408:17]
  assign oehb_clock = clock;
  assign oehb_reset = reset;
  assign oehb_dataIn_valid = buff_valid_out; // @[arithmetic_unit.scala 412:21]
  assign oehb_dataOut_ready = result_ready; // @[arithmetic_unit.scala 411:22]
  assign divf_clock = clock;
  assign divf_operand0 = operand0_bits; // @[arithmetic_unit.scala 418:17]
  assign divf_operand1 = operand1_bits; // @[arithmetic_unit.scala 419:17]
  assign divf_ce = ce; // @[arithmetic_unit.scala 417:11]
  always @(posedge clock) begin
    ce <= oehb_dataIn_ready; // @[arithmetic_unit.scala 416:19]
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
  ce = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Fork_2(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataIn_bits,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  output  dataOut_0_bits,
  input   dataOut_1_ready,
  output  dataOut_1_valid,
  output  dataOut_1_bits,
  input   dataOut_2_ready,
  output  dataOut_2_valid,
  output  dataOut_2_bits,
  input   dataOut_3_ready,
  output  dataOut_3_valid,
  output  dataOut_3_bits,
  input   dataOut_4_ready,
  output  dataOut_4_valid,
  output  dataOut_4_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_clock; // @[elastic_component.scala 198:64]
  wire  regblock_3_reset; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_clock; // @[elastic_component.scala 198:64]
  wire  regblock_4_reset; // @[elastic_component.scala 198:64]
  wire  regblock_4_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_4_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_valid; // @[elastic_component.scala 198:64]
  wire  regblock_4_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop | regblock_3_block_stop |
    regblock_4_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  EagerFork_RegisterBlock regblock_3 ( // @[elastic_component.scala 198:64]
    .clock(regblock_3_clock),
    .reset(regblock_3_reset),
    .p_valid(regblock_3_p_valid),
    .n_stop(regblock_3_n_stop),
    .p_valid_and_fork_stop(regblock_3_p_valid_and_fork_stop),
    .valid(regblock_3_valid),
    .block_stop(regblock_3_block_stop)
  );
  EagerFork_RegisterBlock regblock_4 ( // @[elastic_component.scala 198:64]
    .clock(regblock_4_clock),
    .reset(regblock_4_reset),
    .p_valid(regblock_4_p_valid),
    .n_stop(regblock_4_n_stop),
    .p_valid_and_fork_stop(regblock_4_p_valid_and_fork_stop),
    .valid(regblock_4_valid),
    .block_stop(regblock_4_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_2_valid = regblock_2_valid; // @[elastic_component.scala 207:22]
  assign dataOut_2_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_3_valid = regblock_3_valid; // @[elastic_component.scala 207:22]
  assign dataOut_3_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_4_valid = regblock_4_valid; // @[elastic_component.scala 207:22]
  assign dataOut_4_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = ~dataOut_2_ready; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_3_clock = clock;
  assign regblock_3_reset = reset;
  assign regblock_3_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_3_n_stop = ~dataOut_3_ready; // @[elastic_component.scala 205:27]
  assign regblock_3_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_4_clock = clock;
  assign regblock_4_reset = reset;
  assign regblock_4_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_4_n_stop = ~dataOut_4_ready; // @[elastic_component.scala 205:27]
  assign regblock_4_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_3(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataIn_bits,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  output  dataOut_0_bits,
  input   dataOut_1_ready,
  output  dataOut_1_valid,
  output  dataOut_1_bits,
  input   dataOut_2_ready,
  output  dataOut_2_valid,
  output  dataOut_2_bits,
  input   dataOut_3_ready,
  output  dataOut_3_valid,
  output  dataOut_3_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_clock; // @[elastic_component.scala 198:64]
  wire  regblock_3_reset; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop | regblock_3_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  EagerFork_RegisterBlock regblock_3 ( // @[elastic_component.scala 198:64]
    .clock(regblock_3_clock),
    .reset(regblock_3_reset),
    .p_valid(regblock_3_p_valid),
    .n_stop(regblock_3_n_stop),
    .p_valid_and_fork_stop(regblock_3_p_valid_and_fork_stop),
    .valid(regblock_3_valid),
    .block_stop(regblock_3_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_2_valid = regblock_2_valid; // @[elastic_component.scala 207:22]
  assign dataOut_2_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_3_valid = regblock_3_valid; // @[elastic_component.scala 207:22]
  assign dataOut_3_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = ~dataOut_2_ready; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_3_clock = clock;
  assign regblock_3_reset = reset;
  assign regblock_3_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_3_n_stop = ~dataOut_3_ready; // @[elastic_component.scala 205:27]
  assign regblock_3_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_4(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  input   dataOut_1_ready,
  output  dataOut_1_valid
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = 1'h0; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_5(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_0_ready,
  output        dataOut_0_valid,
  output [31:0] dataOut_0_bits,
  input         dataOut_1_ready,
  output        dataOut_1_valid,
  output [31:0] dataOut_1_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_8(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_0_ready,
  output        dataOut_0_valid,
  output [31:0] dataOut_0_bits,
  input         dataOut_1_ready,
  output        dataOut_1_valid,
  output [31:0] dataOut_1_bits,
  input         dataOut_2_ready,
  output        dataOut_2_valid,
  output [31:0] dataOut_2_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_2_valid = regblock_2_valid; // @[elastic_component.scala 207:22]
  assign dataOut_2_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = ~dataOut_2_ready; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_10(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  input   dataOut_1_ready,
  output  dataOut_1_valid,
  input   dataOut_2_ready,
  output  dataOut_2_valid,
  input   dataOut_3_ready,
  output  dataOut_3_valid
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_clock; // @[elastic_component.scala 198:64]
  wire  regblock_3_reset; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop | regblock_3_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  EagerFork_RegisterBlock regblock_3 ( // @[elastic_component.scala 198:64]
    .clock(regblock_3_clock),
    .reset(regblock_3_reset),
    .p_valid(regblock_3_p_valid),
    .n_stop(regblock_3_n_stop),
    .p_valid_and_fork_stop(regblock_3_p_valid_and_fork_stop),
    .valid(regblock_3_valid),
    .block_stop(regblock_3_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_2_valid = regblock_2_valid; // @[elastic_component.scala 207:22]
  assign dataOut_3_valid = regblock_3_valid; // @[elastic_component.scala 207:22]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = ~dataOut_2_ready; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_3_clock = clock;
  assign regblock_3_reset = reset;
  assign regblock_3_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_3_n_stop = ~dataOut_3_ready; // @[elastic_component.scala 205:27]
  assign regblock_3_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_11(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataIn_bits,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  output  dataOut_0_bits,
  input   dataOut_1_ready,
  output  dataOut_1_valid,
  output  dataOut_1_bits,
  input   dataOut_2_ready,
  output  dataOut_2_valid,
  output  dataOut_2_bits,
  input   dataOut_3_ready,
  output  dataOut_3_valid,
  output  dataOut_3_bits,
  input   dataOut_4_ready,
  output  dataOut_4_valid,
  output  dataOut_4_bits,
  input   dataOut_5_ready,
  output  dataOut_5_valid,
  output  dataOut_5_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_clock; // @[elastic_component.scala 198:64]
  wire  regblock_3_reset; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_clock; // @[elastic_component.scala 198:64]
  wire  regblock_4_reset; // @[elastic_component.scala 198:64]
  wire  regblock_4_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_4_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_valid; // @[elastic_component.scala 198:64]
  wire  regblock_4_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_5_clock; // @[elastic_component.scala 198:64]
  wire  regblock_5_reset; // @[elastic_component.scala 198:64]
  wire  regblock_5_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_5_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_5_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_5_valid; // @[elastic_component.scala 198:64]
  wire  regblock_5_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop | regblock_3_block_stop |
    regblock_4_block_stop | regblock_5_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  EagerFork_RegisterBlock regblock_3 ( // @[elastic_component.scala 198:64]
    .clock(regblock_3_clock),
    .reset(regblock_3_reset),
    .p_valid(regblock_3_p_valid),
    .n_stop(regblock_3_n_stop),
    .p_valid_and_fork_stop(regblock_3_p_valid_and_fork_stop),
    .valid(regblock_3_valid),
    .block_stop(regblock_3_block_stop)
  );
  EagerFork_RegisterBlock regblock_4 ( // @[elastic_component.scala 198:64]
    .clock(regblock_4_clock),
    .reset(regblock_4_reset),
    .p_valid(regblock_4_p_valid),
    .n_stop(regblock_4_n_stop),
    .p_valid_and_fork_stop(regblock_4_p_valid_and_fork_stop),
    .valid(regblock_4_valid),
    .block_stop(regblock_4_block_stop)
  );
  EagerFork_RegisterBlock regblock_5 ( // @[elastic_component.scala 198:64]
    .clock(regblock_5_clock),
    .reset(regblock_5_reset),
    .p_valid(regblock_5_p_valid),
    .n_stop(regblock_5_n_stop),
    .p_valid_and_fork_stop(regblock_5_p_valid_and_fork_stop),
    .valid(regblock_5_valid),
    .block_stop(regblock_5_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_2_valid = regblock_2_valid; // @[elastic_component.scala 207:22]
  assign dataOut_2_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_3_valid = regblock_3_valid; // @[elastic_component.scala 207:22]
  assign dataOut_3_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_4_valid = regblock_4_valid; // @[elastic_component.scala 207:22]
  assign dataOut_4_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_5_valid = regblock_5_valid; // @[elastic_component.scala 207:22]
  assign dataOut_5_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = ~dataOut_2_ready; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_3_clock = clock;
  assign regblock_3_reset = reset;
  assign regblock_3_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_3_n_stop = ~dataOut_3_ready; // @[elastic_component.scala 205:27]
  assign regblock_3_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_4_clock = clock;
  assign regblock_4_reset = reset;
  assign regblock_4_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_4_n_stop = ~dataOut_4_ready; // @[elastic_component.scala 205:27]
  assign regblock_4_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_5_clock = clock;
  assign regblock_5_reset = reset;
  assign regblock_5_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_5_n_stop = ~dataOut_5_ready; // @[elastic_component.scala 205:27]
  assign regblock_5_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_13(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  input   dataOut_1_ready,
  output  dataOut_1_valid,
  input   dataOut_3_ready,
  output  dataOut_3_valid,
  input   dataOut_4_ready,
  output  dataOut_4_valid,
  input   dataOut_5_ready,
  output  dataOut_5_valid,
  input   dataOut_6_ready,
  output  dataOut_6_valid,
  input   dataOut_7_ready,
  output  dataOut_7_valid
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_clock; // @[elastic_component.scala 198:64]
  wire  regblock_3_reset; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_clock; // @[elastic_component.scala 198:64]
  wire  regblock_4_reset; // @[elastic_component.scala 198:64]
  wire  regblock_4_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_4_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_4_valid; // @[elastic_component.scala 198:64]
  wire  regblock_4_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_5_clock; // @[elastic_component.scala 198:64]
  wire  regblock_5_reset; // @[elastic_component.scala 198:64]
  wire  regblock_5_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_5_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_5_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_5_valid; // @[elastic_component.scala 198:64]
  wire  regblock_5_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_6_clock; // @[elastic_component.scala 198:64]
  wire  regblock_6_reset; // @[elastic_component.scala 198:64]
  wire  regblock_6_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_6_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_6_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_6_valid; // @[elastic_component.scala 198:64]
  wire  regblock_6_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_7_clock; // @[elastic_component.scala 198:64]
  wire  regblock_7_reset; // @[elastic_component.scala 198:64]
  wire  regblock_7_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_7_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_7_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_7_valid; // @[elastic_component.scala 198:64]
  wire  regblock_7_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_8_clock; // @[elastic_component.scala 198:64]
  wire  regblock_8_reset; // @[elastic_component.scala 198:64]
  wire  regblock_8_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_8_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_8_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_8_valid; // @[elastic_component.scala 198:64]
  wire  regblock_8_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_9_clock; // @[elastic_component.scala 198:64]
  wire  regblock_9_reset; // @[elastic_component.scala 198:64]
  wire  regblock_9_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_9_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_9_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_9_valid; // @[elastic_component.scala 198:64]
  wire  regblock_9_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop | regblock_3_block_stop |
    regblock_4_block_stop | regblock_5_block_stop | regblock_6_block_stop | regblock_7_block_stop |
    regblock_8_block_stop | regblock_9_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  EagerFork_RegisterBlock regblock_3 ( // @[elastic_component.scala 198:64]
    .clock(regblock_3_clock),
    .reset(regblock_3_reset),
    .p_valid(regblock_3_p_valid),
    .n_stop(regblock_3_n_stop),
    .p_valid_and_fork_stop(regblock_3_p_valid_and_fork_stop),
    .valid(regblock_3_valid),
    .block_stop(regblock_3_block_stop)
  );
  EagerFork_RegisterBlock regblock_4 ( // @[elastic_component.scala 198:64]
    .clock(regblock_4_clock),
    .reset(regblock_4_reset),
    .p_valid(regblock_4_p_valid),
    .n_stop(regblock_4_n_stop),
    .p_valid_and_fork_stop(regblock_4_p_valid_and_fork_stop),
    .valid(regblock_4_valid),
    .block_stop(regblock_4_block_stop)
  );
  EagerFork_RegisterBlock regblock_5 ( // @[elastic_component.scala 198:64]
    .clock(regblock_5_clock),
    .reset(regblock_5_reset),
    .p_valid(regblock_5_p_valid),
    .n_stop(regblock_5_n_stop),
    .p_valid_and_fork_stop(regblock_5_p_valid_and_fork_stop),
    .valid(regblock_5_valid),
    .block_stop(regblock_5_block_stop)
  );
  EagerFork_RegisterBlock regblock_6 ( // @[elastic_component.scala 198:64]
    .clock(regblock_6_clock),
    .reset(regblock_6_reset),
    .p_valid(regblock_6_p_valid),
    .n_stop(regblock_6_n_stop),
    .p_valid_and_fork_stop(regblock_6_p_valid_and_fork_stop),
    .valid(regblock_6_valid),
    .block_stop(regblock_6_block_stop)
  );
  EagerFork_RegisterBlock regblock_7 ( // @[elastic_component.scala 198:64]
    .clock(regblock_7_clock),
    .reset(regblock_7_reset),
    .p_valid(regblock_7_p_valid),
    .n_stop(regblock_7_n_stop),
    .p_valid_and_fork_stop(regblock_7_p_valid_and_fork_stop),
    .valid(regblock_7_valid),
    .block_stop(regblock_7_block_stop)
  );
  EagerFork_RegisterBlock regblock_8 ( // @[elastic_component.scala 198:64]
    .clock(regblock_8_clock),
    .reset(regblock_8_reset),
    .p_valid(regblock_8_p_valid),
    .n_stop(regblock_8_n_stop),
    .p_valid_and_fork_stop(regblock_8_p_valid_and_fork_stop),
    .valid(regblock_8_valid),
    .block_stop(regblock_8_block_stop)
  );
  EagerFork_RegisterBlock regblock_9 ( // @[elastic_component.scala 198:64]
    .clock(regblock_9_clock),
    .reset(regblock_9_reset),
    .p_valid(regblock_9_p_valid),
    .n_stop(regblock_9_n_stop),
    .p_valid_and_fork_stop(regblock_9_p_valid_and_fork_stop),
    .valid(regblock_9_valid),
    .block_stop(regblock_9_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_3_valid = regblock_3_valid; // @[elastic_component.scala 207:22]
  assign dataOut_4_valid = regblock_4_valid; // @[elastic_component.scala 207:22]
  assign dataOut_5_valid = regblock_5_valid; // @[elastic_component.scala 207:22]
  assign dataOut_6_valid = regblock_6_valid; // @[elastic_component.scala 207:22]
  assign dataOut_7_valid = regblock_7_valid; // @[elastic_component.scala 207:22]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = 1'h0; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_3_clock = clock;
  assign regblock_3_reset = reset;
  assign regblock_3_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_3_n_stop = ~dataOut_3_ready; // @[elastic_component.scala 205:27]
  assign regblock_3_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_4_clock = clock;
  assign regblock_4_reset = reset;
  assign regblock_4_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_4_n_stop = ~dataOut_4_ready; // @[elastic_component.scala 205:27]
  assign regblock_4_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_5_clock = clock;
  assign regblock_5_reset = reset;
  assign regblock_5_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_5_n_stop = ~dataOut_5_ready; // @[elastic_component.scala 205:27]
  assign regblock_5_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_6_clock = clock;
  assign regblock_6_reset = reset;
  assign regblock_6_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_6_n_stop = ~dataOut_6_ready; // @[elastic_component.scala 205:27]
  assign regblock_6_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_7_clock = clock;
  assign regblock_7_reset = reset;
  assign regblock_7_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_7_n_stop = ~dataOut_7_ready; // @[elastic_component.scala 205:27]
  assign regblock_7_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_8_clock = clock;
  assign regblock_8_reset = reset;
  assign regblock_8_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_8_n_stop = 1'h0; // @[elastic_component.scala 205:27]
  assign regblock_8_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_9_clock = clock;
  assign regblock_9_reset = reset;
  assign regblock_9_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_9_n_stop = 1'h0; // @[elastic_component.scala 205:27]
  assign regblock_9_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_18(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [31:0] dataIn_bits,
  input         dataOut_0_ready,
  output        dataOut_0_valid,
  output [31:0] dataOut_0_bits,
  input         dataOut_1_ready,
  output        dataOut_1_valid,
  output [31:0] dataOut_1_bits,
  input         dataOut_2_ready,
  output        dataOut_2_valid,
  output [31:0] dataOut_2_bits,
  input         dataOut_3_ready,
  output        dataOut_3_valid,
  output [31:0] dataOut_3_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_clock; // @[elastic_component.scala 198:64]
  wire  regblock_3_reset; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_3_valid; // @[elastic_component.scala 198:64]
  wire  regblock_3_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop | regblock_3_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  EagerFork_RegisterBlock regblock_3 ( // @[elastic_component.scala 198:64]
    .clock(regblock_3_clock),
    .reset(regblock_3_reset),
    .p_valid(regblock_3_p_valid),
    .n_stop(regblock_3_n_stop),
    .p_valid_and_fork_stop(regblock_3_p_valid_and_fork_stop),
    .valid(regblock_3_valid),
    .block_stop(regblock_3_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_2_valid = regblock_2_valid; // @[elastic_component.scala 207:22]
  assign dataOut_2_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_3_valid = regblock_3_valid; // @[elastic_component.scala 207:22]
  assign dataOut_3_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = ~dataOut_2_ready; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_3_clock = clock;
  assign regblock_3_reset = reset;
  assign regblock_3_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_3_n_stop = ~dataOut_3_ready; // @[elastic_component.scala 205:27]
  assign regblock_3_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_19(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_0_ready,
  output        dataOut_0_valid,
  output [63:0] dataOut_0_bits,
  input         dataOut_1_ready,
  output        dataOut_1_valid,
  output [63:0] dataOut_1_bits,
  input         dataOut_2_ready,
  output        dataOut_2_valid,
  output [63:0] dataOut_2_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_clock; // @[elastic_component.scala 198:64]
  wire  regblock_2_reset; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_2_valid; // @[elastic_component.scala 198:64]
  wire  regblock_2_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop | regblock_2_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  EagerFork_RegisterBlock regblock_2 ( // @[elastic_component.scala 198:64]
    .clock(regblock_2_clock),
    .reset(regblock_2_reset),
    .p_valid(regblock_2_p_valid),
    .n_stop(regblock_2_n_stop),
    .p_valid_and_fork_stop(regblock_2_p_valid_and_fork_stop),
    .valid(regblock_2_valid),
    .block_stop(regblock_2_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_2_valid = regblock_2_valid; // @[elastic_component.scala 207:22]
  assign dataOut_2_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_2_clock = clock;
  assign regblock_2_reset = reset;
  assign regblock_2_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_2_n_stop = ~dataOut_2_ready; // @[elastic_component.scala 205:27]
  assign regblock_2_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_20(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_0_ready,
  output        dataOut_0_valid,
  output [63:0] dataOut_0_bits,
  input         dataOut_1_ready,
  output        dataOut_1_valid,
  output [63:0] dataOut_1_bits
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_0_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_bits = dataIn_bits; // @[elastic_component.scala 203:21]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Fork_22(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataOut_0_ready,
  output  dataOut_0_valid,
  input   dataOut_1_ready,
  output  dataOut_1_valid
);
  wire  regblock_0_clock; // @[elastic_component.scala 198:64]
  wire  regblock_0_reset; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_0_valid; // @[elastic_component.scala 198:64]
  wire  regblock_0_block_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_clock; // @[elastic_component.scala 198:64]
  wire  regblock_1_reset; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_n_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_p_valid_and_fork_stop; // @[elastic_component.scala 198:64]
  wire  regblock_1_valid; // @[elastic_component.scala 198:64]
  wire  regblock_1_block_stop; // @[elastic_component.scala 198:64]
  wire  anyBlockStop = regblock_0_block_stop | regblock_1_block_stop; // @[elastic_component.scala 200:60]
  EagerFork_RegisterBlock regblock_0 ( // @[elastic_component.scala 198:64]
    .clock(regblock_0_clock),
    .reset(regblock_0_reset),
    .p_valid(regblock_0_p_valid),
    .n_stop(regblock_0_n_stop),
    .p_valid_and_fork_stop(regblock_0_p_valid_and_fork_stop),
    .valid(regblock_0_valid),
    .block_stop(regblock_0_block_stop)
  );
  EagerFork_RegisterBlock regblock_1 ( // @[elastic_component.scala 198:64]
    .clock(regblock_1_clock),
    .reset(regblock_1_reset),
    .p_valid(regblock_1_p_valid),
    .n_stop(regblock_1_n_stop),
    .p_valid_and_fork_stop(regblock_1_p_valid_and_fork_stop),
    .valid(regblock_1_valid),
    .block_stop(regblock_1_block_stop)
  );
  assign dataIn_ready = ~anyBlockStop; // @[elastic_component.scala 209:19]
  assign dataOut_0_valid = regblock_0_valid; // @[elastic_component.scala 207:22]
  assign dataOut_1_valid = regblock_1_valid; // @[elastic_component.scala 207:22]
  assign regblock_0_clock = clock;
  assign regblock_0_reset = reset;
  assign regblock_0_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_0_n_stop = ~dataOut_0_ready; // @[elastic_component.scala 205:27]
  assign regblock_0_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
  assign regblock_1_clock = clock;
  assign regblock_1_reset = reset;
  assign regblock_1_p_valid = dataIn_valid; // @[elastic_component.scala 204:25]
  assign regblock_1_n_stop = ~dataOut_1_ready; // @[elastic_component.scala 205:27]
  assign regblock_1_p_valid_and_fork_stop = dataIn_valid & anyBlockStop; // @[elastic_component.scala 206:55]
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:12]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 4'hc; // @[Counter.scala 72:24]
  wire [3:0] _value_T_1 = value + 4'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 4'hc; // @[Counter.scala 72:24]
  wire [3:0] _value_T_3 = value_1 + 4'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 4'hd ? _RAND_1[63:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 13; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module Queue_3(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:25]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [4:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [4:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [4:0] value; // @[Counter.scala 60:40]
  reg [4:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 5'h19; // @[Counter.scala 72:24]
  wire [4:0] _value_T_1 = value + 5'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 5'h19; // @[Counter.scala 72:24]
  wire [4:0] _value_T_3 = value_1 + 5'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 5'h1a ? _RAND_1[63:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 5'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 5'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 26; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO_3(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue_3 fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module Queue_9(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  ram [0:12]; // @[Decoupled.scala 218:16]
  wire  ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 4'hc; // @[Counter.scala 72:24]
  wire [3:0] _value_T_1 = value + 4'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 4'hc; // @[Counter.scala 72:24]
  wire [3:0] _value_T_3 = value_1 + 4'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 4'hd ? _RAND_1[0:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 4'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 13; initvar = initvar+1)
    ram[initvar] = _RAND_0[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO_9(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataIn_bits,
  input   dataOut_ready,
  output  dataOut_valid,
  output  dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue_9 fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module Queue_10(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:81]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [6:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [6:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [6:0] value; // @[Counter.scala 60:40]
  reg [6:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 7'h51; // @[Counter.scala 72:24]
  wire [6:0] _value_T_1 = value + 7'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 7'h51; // @[Counter.scala 72:24]
  wire [6:0] _value_T_3 = value_1 + 7'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 7'h52 ? _RAND_1[63:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 7'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 7'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 7'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 7'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 82; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO_10(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue_10 fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module Queue_13(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:38]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [5:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [5:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [5:0] value; // @[Counter.scala 60:40]
  reg [5:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 6'h26; // @[Counter.scala 72:24]
  wire [5:0] _value_T_1 = value + 6'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 6'h26; // @[Counter.scala 72:24]
  wire [5:0] _value_T_3 = value_1 + 6'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 6'h27 ? _RAND_1[63:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 6'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 6'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 6'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 6'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 39; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO_13(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue_13 fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module Queue_14(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:29]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [4:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [4:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [4:0] value; // @[Counter.scala 60:40]
  reg [4:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 5'h1d; // @[Counter.scala 72:24]
  wire [4:0] _value_T_1 = value + 5'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 5'h1d; // @[Counter.scala 72:24]
  wire [4:0] _value_T_3 = value_1 + 5'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 5'h1e ? _RAND_1[63:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 5'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 5'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 30; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO_14(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue_14 fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module Queue_15(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:68]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [6:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [6:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [6:0] value; // @[Counter.scala 60:40]
  reg [6:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 7'h44; // @[Counter.scala 72:24]
  wire [6:0] _value_T_1 = value + 7'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 7'h44; // @[Counter.scala 72:24]
  wire [6:0] _value_T_3 = value_1 + 7'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 7'h45 ? _RAND_1[63:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 7'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 7'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 7'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 7'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 69; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO_15(
  input         clock,
  input         reset,
  output        dataIn_ready,
  input         dataIn_valid,
  input  [63:0] dataIn_bits,
  input         dataOut_ready,
  output        dataOut_valid,
  output [63:0] dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire [63:0] fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue_15 fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module Queue_16(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  ram [0:25]; // @[Decoupled.scala 218:16]
  wire  ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire [4:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_data; // @[Decoupled.scala 218:16]
  wire [4:0] ram_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_MPORT_en; // @[Decoupled.scala 218:16]
  reg [4:0] value; // @[Counter.scala 60:40]
  reg [4:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  ptr_match = value == value_1; // @[Decoupled.scala 223:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 224:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 225:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  wire  wrap = value == 5'h19; // @[Counter.scala 72:24]
  wire [4:0] _value_T_1 = value + 5'h1; // @[Counter.scala 76:24]
  wire  wrap_1 = value_1 == 5'h19; // @[Counter.scala 72:24]
  wire [4:0] _value_T_3 = value_1 + 5'h1; // @[Counter.scala 76:24]
  assign ram_io_deq_bits_MPORT_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 5'h1a ? _RAND_1[0:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 241:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  always @(posedge clock) begin
    if(ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 5'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[Decoupled.scala 229:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 5'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[Decoupled.scala 233:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 5'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 26; initvar = initvar+1)
    ram[initvar] = _RAND_0[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  value_1 = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ElasticFIFO_16(
  input   clock,
  input   reset,
  output  dataIn_ready,
  input   dataIn_valid,
  input   dataIn_bits,
  input   dataOut_ready,
  output  dataOut_valid,
  output  dataOut_bits
);
  wire  fifo_clock; // @[Decoupled.scala 296:21]
  wire  fifo_reset; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 296:21]
  wire  fifo_io_enq_bits; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 296:21]
  wire  fifo_io_deq_bits; // @[Decoupled.scala 296:21]
  Queue_16 fifo ( // @[Decoupled.scala 296:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign dataIn_ready = fifo_io_enq_ready; // @[Decoupled.scala 299:17]
  assign dataOut_valid = fifo_io_deq_valid; // @[elastic_component.scala 580:11]
  assign dataOut_bits = fifo_io_deq_bits; // @[elastic_component.scala 580:11]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = dataIn_valid; // @[Decoupled.scala 297:22]
  assign fifo_io_enq_bits = dataIn_bits; // @[Decoupled.scala 298:21]
  assign fifo_io_deq_ready = dataOut_ready; // @[elastic_component.scala 580:11]
endmodule
module aeloss_push(
  input         clock,
  input         reset,
  output        var0_ready,
  input         var0_valid,
  input         var1_ready,
  output        var1_valid,
  output [63:0] var1_bits,
  input         var2_ready,
  output        var2_valid,
  input         finish
);
  wire  mem_0_clock; // @[aeloss_push.scala 15:21]
  wire  mem_0_reset; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_address_0_ready; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_address_0_valid; // @[aeloss_push.scala 15:21]
  wire [9:0] mem_0_load_address_0_bits; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_address_1_ready; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_address_1_valid; // @[aeloss_push.scala 15:21]
  wire [9:0] mem_0_load_address_1_bits; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_data_0_ready; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_data_0_valid; // @[aeloss_push.scala 15:21]
  wire [63:0] mem_0_load_data_0_bits; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_data_1_ready; // @[aeloss_push.scala 15:21]
  wire  mem_0_load_data_1_valid; // @[aeloss_push.scala 15:21]
  wire [63:0] mem_0_load_data_1_bits; // @[aeloss_push.scala 15:21]
  wire  mem_1_clock; // @[aeloss_push.scala 24:21]
  wire  mem_1_reset; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_address_0_ready; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_address_0_valid; // @[aeloss_push.scala 24:21]
  wire [9:0] mem_1_load_address_0_bits; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_address_1_ready; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_address_1_valid; // @[aeloss_push.scala 24:21]
  wire [9:0] mem_1_load_address_1_bits; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_data_0_ready; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_data_0_valid; // @[aeloss_push.scala 24:21]
  wire [31:0] mem_1_load_data_0_bits; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_data_1_ready; // @[aeloss_push.scala 24:21]
  wire  mem_1_load_data_1_valid; // @[aeloss_push.scala 24:21]
  wire [31:0] mem_1_load_data_1_bits; // @[aeloss_push.scala 24:21]
  wire  cmpi_sle_2_operand0_ready; // @[aeloss_push.scala 33:26]
  wire  cmpi_sle_2_operand0_valid; // @[aeloss_push.scala 33:26]
  wire [31:0] cmpi_sle_2_operand0_bits; // @[aeloss_push.scala 33:26]
  wire  cmpi_sle_2_operand1_ready; // @[aeloss_push.scala 33:26]
  wire  cmpi_sle_2_operand1_valid; // @[aeloss_push.scala 33:26]
  wire [31:0] cmpi_sle_2_operand1_bits; // @[aeloss_push.scala 33:26]
  wire  cmpi_sle_2_result_ready; // @[aeloss_push.scala 33:26]
  wire  cmpi_sle_2_result_valid; // @[aeloss_push.scala 33:26]
  wire  cmpi_sle_2_result_bits; // @[aeloss_push.scala 33:26]
  wire  m_3_clock; // @[aeloss_push.scala 40:19]
  wire  m_3_reset; // @[aeloss_push.scala 40:19]
  wire  m_3_dataIn_0_ready; // @[aeloss_push.scala 40:19]
  wire  m_3_dataIn_0_valid; // @[aeloss_push.scala 40:19]
  wire  m_3_dataIn_1_ready; // @[aeloss_push.scala 40:19]
  wire  m_3_dataIn_1_valid; // @[aeloss_push.scala 40:19]
  wire  m_3_condition_ready; // @[aeloss_push.scala 40:19]
  wire  m_3_condition_valid; // @[aeloss_push.scala 40:19]
  wire  m_3_condition_bits; // @[aeloss_push.scala 40:19]
  wire  m_3_dataOut_ready; // @[aeloss_push.scala 40:19]
  wire  m_3_dataOut_valid; // @[aeloss_push.scala 40:19]
  wire  buf_4_clock; // @[aeloss_push.scala 49:21]
  wire  buf_4_reset; // @[aeloss_push.scala 49:21]
  wire  buf_4_dataIn_ready; // @[aeloss_push.scala 49:21]
  wire  buf_4_dataIn_valid; // @[aeloss_push.scala 49:21]
  wire  buf_4_dataOut_ready; // @[aeloss_push.scala 49:21]
  wire  buf_4_dataOut_valid; // @[aeloss_push.scala 49:21]
  wire  b_5_dataIn_ready; // @[aeloss_push.scala 54:19]
  wire  b_5_dataIn_valid; // @[aeloss_push.scala 54:19]
  wire  b_5_dataOut_0_ready; // @[aeloss_push.scala 54:19]
  wire  b_5_dataOut_0_valid; // @[aeloss_push.scala 54:19]
  wire  b_5_condition_ready; // @[aeloss_push.scala 54:19]
  wire  b_5_condition_valid; // @[aeloss_push.scala 54:19]
  wire  b_5_condition_bits; // @[aeloss_push.scala 54:19]
  wire  m_6_clock; // @[aeloss_push.scala 63:19]
  wire  m_6_reset; // @[aeloss_push.scala 63:19]
  wire  m_6_dataIn_0_ready; // @[aeloss_push.scala 63:19]
  wire  m_6_dataIn_0_valid; // @[aeloss_push.scala 63:19]
  wire [63:0] m_6_dataIn_0_bits; // @[aeloss_push.scala 63:19]
  wire  m_6_dataIn_1_ready; // @[aeloss_push.scala 63:19]
  wire  m_6_dataIn_1_valid; // @[aeloss_push.scala 63:19]
  wire [63:0] m_6_dataIn_1_bits; // @[aeloss_push.scala 63:19]
  wire  m_6_dataOut_ready; // @[aeloss_push.scala 63:19]
  wire  m_6_dataOut_valid; // @[aeloss_push.scala 63:19]
  wire [63:0] m_6_dataOut_bits; // @[aeloss_push.scala 63:19]
  wire  m_6_condition_ready; // @[aeloss_push.scala 63:19]
  wire  m_6_condition_valid; // @[aeloss_push.scala 63:19]
  wire  m_6_condition_bits; // @[aeloss_push.scala 63:19]
  wire  buf_7_clock; // @[aeloss_push.scala 72:21]
  wire  buf_7_reset; // @[aeloss_push.scala 72:21]
  wire  buf_7_dataIn_ready; // @[aeloss_push.scala 72:21]
  wire  buf_7_dataIn_valid; // @[aeloss_push.scala 72:21]
  wire [63:0] buf_7_dataIn_bits; // @[aeloss_push.scala 72:21]
  wire  buf_7_dataOut_ready; // @[aeloss_push.scala 72:21]
  wire  buf_7_dataOut_valid; // @[aeloss_push.scala 72:21]
  wire [63:0] buf_7_dataOut_bits; // @[aeloss_push.scala 72:21]
  wire  b_8_dataIn_ready; // @[aeloss_push.scala 77:19]
  wire  b_8_dataIn_valid; // @[aeloss_push.scala 77:19]
  wire [63:0] b_8_dataIn_bits; // @[aeloss_push.scala 77:19]
  wire  b_8_dataOut_0_ready; // @[aeloss_push.scala 77:19]
  wire  b_8_dataOut_0_valid; // @[aeloss_push.scala 77:19]
  wire [63:0] b_8_dataOut_0_bits; // @[aeloss_push.scala 77:19]
  wire  b_8_dataOut_1_ready; // @[aeloss_push.scala 77:19]
  wire  b_8_dataOut_1_valid; // @[aeloss_push.scala 77:19]
  wire [63:0] b_8_dataOut_1_bits; // @[aeloss_push.scala 77:19]
  wire  b_8_condition_ready; // @[aeloss_push.scala 77:19]
  wire  b_8_condition_valid; // @[aeloss_push.scala 77:19]
  wire  b_8_condition_bits; // @[aeloss_push.scala 77:19]
  wire  const_9_control_ready; // @[aeloss_push.scala 86:23]
  wire  const_9_control_valid; // @[aeloss_push.scala 86:23]
  wire [63:0] const_9_dataIn_bits; // @[aeloss_push.scala 86:23]
  wire  const_9_dataOut_ready; // @[aeloss_push.scala 86:23]
  wire  const_9_dataOut_valid; // @[aeloss_push.scala 86:23]
  wire [63:0] const_9_dataOut_bits; // @[aeloss_push.scala 86:23]
  wire  const_10_control_ready; // @[aeloss_push.scala 93:24]
  wire  const_10_control_valid; // @[aeloss_push.scala 93:24]
  wire [31:0] const_10_dataIn_bits; // @[aeloss_push.scala 93:24]
  wire  const_10_dataOut_ready; // @[aeloss_push.scala 93:24]
  wire  const_10_dataOut_valid; // @[aeloss_push.scala 93:24]
  wire [31:0] const_10_dataOut_bits; // @[aeloss_push.scala 93:24]
  wire  m_11_clock; // @[aeloss_push.scala 100:20]
  wire  m_11_reset; // @[aeloss_push.scala 100:20]
  wire  m_11_dataIn_0_ready; // @[aeloss_push.scala 100:20]
  wire  m_11_dataIn_0_valid; // @[aeloss_push.scala 100:20]
  wire [31:0] m_11_dataIn_0_bits; // @[aeloss_push.scala 100:20]
  wire  m_11_dataIn_1_ready; // @[aeloss_push.scala 100:20]
  wire  m_11_dataIn_1_valid; // @[aeloss_push.scala 100:20]
  wire [31:0] m_11_dataIn_1_bits; // @[aeloss_push.scala 100:20]
  wire  m_11_dataOut_ready; // @[aeloss_push.scala 100:20]
  wire  m_11_dataOut_valid; // @[aeloss_push.scala 100:20]
  wire [31:0] m_11_dataOut_bits; // @[aeloss_push.scala 100:20]
  wire  m_11_condition_ready; // @[aeloss_push.scala 100:20]
  wire  m_11_condition_valid; // @[aeloss_push.scala 100:20]
  wire  m_11_condition_bits; // @[aeloss_push.scala 100:20]
  wire  buf_12_clock; // @[aeloss_push.scala 109:22]
  wire  buf_12_reset; // @[aeloss_push.scala 109:22]
  wire  buf_12_dataIn_ready; // @[aeloss_push.scala 109:22]
  wire  buf_12_dataIn_valid; // @[aeloss_push.scala 109:22]
  wire [31:0] buf_12_dataIn_bits; // @[aeloss_push.scala 109:22]
  wire  buf_12_dataOut_ready; // @[aeloss_push.scala 109:22]
  wire  buf_12_dataOut_valid; // @[aeloss_push.scala 109:22]
  wire [31:0] buf_12_dataOut_bits; // @[aeloss_push.scala 109:22]
  wire  b_13_dataIn_ready; // @[aeloss_push.scala 114:20]
  wire  b_13_dataIn_valid; // @[aeloss_push.scala 114:20]
  wire [31:0] b_13_dataIn_bits; // @[aeloss_push.scala 114:20]
  wire  b_13_dataOut_0_ready; // @[aeloss_push.scala 114:20]
  wire  b_13_dataOut_0_valid; // @[aeloss_push.scala 114:20]
  wire [31:0] b_13_dataOut_0_bits; // @[aeloss_push.scala 114:20]
  wire  b_13_condition_ready; // @[aeloss_push.scala 114:20]
  wire  b_13_condition_valid; // @[aeloss_push.scala 114:20]
  wire  b_13_condition_bits; // @[aeloss_push.scala 114:20]
  wire  const_14_control_ready; // @[aeloss_push.scala 123:24]
  wire  const_14_control_valid; // @[aeloss_push.scala 123:24]
  wire [31:0] const_14_dataIn_bits; // @[aeloss_push.scala 123:24]
  wire  const_14_dataOut_ready; // @[aeloss_push.scala 123:24]
  wire  const_14_dataOut_valid; // @[aeloss_push.scala 123:24]
  wire [31:0] const_14_dataOut_bits; // @[aeloss_push.scala 123:24]
  wire  m_15_clock; // @[aeloss_push.scala 130:20]
  wire  m_15_reset; // @[aeloss_push.scala 130:20]
  wire  m_15_dataIn_0_ready; // @[aeloss_push.scala 130:20]
  wire  m_15_dataIn_0_valid; // @[aeloss_push.scala 130:20]
  wire [31:0] m_15_dataIn_0_bits; // @[aeloss_push.scala 130:20]
  wire  m_15_dataIn_1_ready; // @[aeloss_push.scala 130:20]
  wire  m_15_dataIn_1_valid; // @[aeloss_push.scala 130:20]
  wire [31:0] m_15_dataIn_1_bits; // @[aeloss_push.scala 130:20]
  wire  m_15_dataOut_ready; // @[aeloss_push.scala 130:20]
  wire  m_15_dataOut_valid; // @[aeloss_push.scala 130:20]
  wire [31:0] m_15_dataOut_bits; // @[aeloss_push.scala 130:20]
  wire  m_15_condition_ready; // @[aeloss_push.scala 130:20]
  wire  m_15_condition_valid; // @[aeloss_push.scala 130:20]
  wire  m_15_condition_bits; // @[aeloss_push.scala 130:20]
  wire  buf_16_clock; // @[aeloss_push.scala 139:22]
  wire  buf_16_reset; // @[aeloss_push.scala 139:22]
  wire  buf_16_dataIn_ready; // @[aeloss_push.scala 139:22]
  wire  buf_16_dataIn_valid; // @[aeloss_push.scala 139:22]
  wire [31:0] buf_16_dataIn_bits; // @[aeloss_push.scala 139:22]
  wire  buf_16_dataOut_ready; // @[aeloss_push.scala 139:22]
  wire  buf_16_dataOut_valid; // @[aeloss_push.scala 139:22]
  wire [31:0] buf_16_dataOut_bits; // @[aeloss_push.scala 139:22]
  wire  b_17_dataIn_ready; // @[aeloss_push.scala 144:20]
  wire  b_17_dataIn_valid; // @[aeloss_push.scala 144:20]
  wire [31:0] b_17_dataIn_bits; // @[aeloss_push.scala 144:20]
  wire  b_17_dataOut_0_ready; // @[aeloss_push.scala 144:20]
  wire  b_17_dataOut_0_valid; // @[aeloss_push.scala 144:20]
  wire [31:0] b_17_dataOut_0_bits; // @[aeloss_push.scala 144:20]
  wire  b_17_condition_ready; // @[aeloss_push.scala 144:20]
  wire  b_17_condition_valid; // @[aeloss_push.scala 144:20]
  wire  b_17_condition_bits; // @[aeloss_push.scala 144:20]
  wire  const_18_control_ready; // @[aeloss_push.scala 153:24]
  wire  const_18_control_valid; // @[aeloss_push.scala 153:24]
  wire [31:0] const_18_dataIn_bits; // @[aeloss_push.scala 153:24]
  wire  const_18_dataOut_ready; // @[aeloss_push.scala 153:24]
  wire  const_18_dataOut_valid; // @[aeloss_push.scala 153:24]
  wire [31:0] const_18_dataOut_bits; // @[aeloss_push.scala 153:24]
  wire  m_19_clock; // @[aeloss_push.scala 160:20]
  wire  m_19_reset; // @[aeloss_push.scala 160:20]
  wire  m_19_dataIn_0_ready; // @[aeloss_push.scala 160:20]
  wire  m_19_dataIn_0_valid; // @[aeloss_push.scala 160:20]
  wire [31:0] m_19_dataIn_0_bits; // @[aeloss_push.scala 160:20]
  wire  m_19_dataIn_1_ready; // @[aeloss_push.scala 160:20]
  wire  m_19_dataIn_1_valid; // @[aeloss_push.scala 160:20]
  wire [31:0] m_19_dataIn_1_bits; // @[aeloss_push.scala 160:20]
  wire  m_19_dataOut_ready; // @[aeloss_push.scala 160:20]
  wire  m_19_dataOut_valid; // @[aeloss_push.scala 160:20]
  wire [31:0] m_19_dataOut_bits; // @[aeloss_push.scala 160:20]
  wire  m_19_condition_ready; // @[aeloss_push.scala 160:20]
  wire  m_19_condition_valid; // @[aeloss_push.scala 160:20]
  wire  m_19_condition_bits; // @[aeloss_push.scala 160:20]
  wire  buf_20_clock; // @[aeloss_push.scala 169:22]
  wire  buf_20_reset; // @[aeloss_push.scala 169:22]
  wire  buf_20_dataIn_ready; // @[aeloss_push.scala 169:22]
  wire  buf_20_dataIn_valid; // @[aeloss_push.scala 169:22]
  wire [31:0] buf_20_dataIn_bits; // @[aeloss_push.scala 169:22]
  wire  buf_20_dataOut_ready; // @[aeloss_push.scala 169:22]
  wire  buf_20_dataOut_valid; // @[aeloss_push.scala 169:22]
  wire [31:0] buf_20_dataOut_bits; // @[aeloss_push.scala 169:22]
  wire  b_21_dataIn_ready; // @[aeloss_push.scala 174:20]
  wire  b_21_dataIn_valid; // @[aeloss_push.scala 174:20]
  wire [31:0] b_21_dataIn_bits; // @[aeloss_push.scala 174:20]
  wire  b_21_dataOut_0_ready; // @[aeloss_push.scala 174:20]
  wire  b_21_dataOut_0_valid; // @[aeloss_push.scala 174:20]
  wire [31:0] b_21_dataOut_0_bits; // @[aeloss_push.scala 174:20]
  wire  b_21_condition_ready; // @[aeloss_push.scala 174:20]
  wire  b_21_condition_valid; // @[aeloss_push.scala 174:20]
  wire  b_21_condition_bits; // @[aeloss_push.scala 174:20]
  wire  addi_22_operand0_ready; // @[aeloss_push.scala 183:23]
  wire  addi_22_operand0_valid; // @[aeloss_push.scala 183:23]
  wire [31:0] addi_22_operand0_bits; // @[aeloss_push.scala 183:23]
  wire  addi_22_operand1_ready; // @[aeloss_push.scala 183:23]
  wire  addi_22_operand1_valid; // @[aeloss_push.scala 183:23]
  wire [31:0] addi_22_operand1_bits; // @[aeloss_push.scala 183:23]
  wire  addi_22_result_ready; // @[aeloss_push.scala 183:23]
  wire  addi_22_result_valid; // @[aeloss_push.scala 183:23]
  wire [31:0] addi_22_result_bits; // @[aeloss_push.scala 183:23]
  wire  load_23_address_in_ready; // @[aeloss_push.scala 190:23]
  wire  load_23_address_in_valid; // @[aeloss_push.scala 190:23]
  wire [9:0] load_23_address_in_bits; // @[aeloss_push.scala 190:23]
  wire  load_23_data_out_ready; // @[aeloss_push.scala 190:23]
  wire  load_23_data_out_valid; // @[aeloss_push.scala 190:23]
  wire [31:0] load_23_data_out_bits; // @[aeloss_push.scala 190:23]
  wire  load_23_address_out_ready; // @[aeloss_push.scala 190:23]
  wire  load_23_address_out_valid; // @[aeloss_push.scala 190:23]
  wire [9:0] load_23_address_out_bits; // @[aeloss_push.scala 190:23]
  wire  load_23_data_in_ready; // @[aeloss_push.scala 190:23]
  wire  load_23_data_in_valid; // @[aeloss_push.scala 190:23]
  wire [31:0] load_23_data_in_bits; // @[aeloss_push.scala 190:23]
  wire  trunci_24_operand_ready; // @[aeloss_push.scala 201:25]
  wire  trunci_24_operand_valid; // @[aeloss_push.scala 201:25]
  wire [31:0] trunci_24_operand_bits; // @[aeloss_push.scala 201:25]
  wire  trunci_24_result_ready; // @[aeloss_push.scala 201:25]
  wire  trunci_24_result_valid; // @[aeloss_push.scala 201:25]
  wire  trunci_24_result_bits; // @[aeloss_push.scala 201:25]
  wire  b_25_dataIn_ready; // @[aeloss_push.scala 206:20]
  wire  b_25_dataIn_valid; // @[aeloss_push.scala 206:20]
  wire  b_25_dataOut_0_ready; // @[aeloss_push.scala 206:20]
  wire  b_25_dataOut_0_valid; // @[aeloss_push.scala 206:20]
  wire  b_25_condition_ready; // @[aeloss_push.scala 206:20]
  wire  b_25_condition_valid; // @[aeloss_push.scala 206:20]
  wire  b_25_condition_bits; // @[aeloss_push.scala 206:20]
  wire  b_26_dataIn_ready; // @[aeloss_push.scala 215:20]
  wire  b_26_dataIn_valid; // @[aeloss_push.scala 215:20]
  wire [31:0] b_26_dataIn_bits; // @[aeloss_push.scala 215:20]
  wire  b_26_dataOut_0_ready; // @[aeloss_push.scala 215:20]
  wire  b_26_dataOut_0_valid; // @[aeloss_push.scala 215:20]
  wire [31:0] b_26_dataOut_0_bits; // @[aeloss_push.scala 215:20]
  wire  b_26_condition_ready; // @[aeloss_push.scala 215:20]
  wire  b_26_condition_valid; // @[aeloss_push.scala 215:20]
  wire  b_26_condition_bits; // @[aeloss_push.scala 215:20]
  wire  b_27_dataIn_ready; // @[aeloss_push.scala 224:20]
  wire  b_27_dataIn_valid; // @[aeloss_push.scala 224:20]
  wire [63:0] b_27_dataIn_bits; // @[aeloss_push.scala 224:20]
  wire  b_27_dataOut_0_ready; // @[aeloss_push.scala 224:20]
  wire  b_27_dataOut_0_valid; // @[aeloss_push.scala 224:20]
  wire [63:0] b_27_dataOut_0_bits; // @[aeloss_push.scala 224:20]
  wire  b_27_dataOut_1_ready; // @[aeloss_push.scala 224:20]
  wire  b_27_dataOut_1_valid; // @[aeloss_push.scala 224:20]
  wire [63:0] b_27_dataOut_1_bits; // @[aeloss_push.scala 224:20]
  wire  b_27_condition_ready; // @[aeloss_push.scala 224:20]
  wire  b_27_condition_valid; // @[aeloss_push.scala 224:20]
  wire  b_27_condition_bits; // @[aeloss_push.scala 224:20]
  wire  m_28_clock; // @[aeloss_push.scala 233:20]
  wire  m_28_reset; // @[aeloss_push.scala 233:20]
  wire  m_28_dataIn_0_ready; // @[aeloss_push.scala 233:20]
  wire  m_28_dataIn_0_valid; // @[aeloss_push.scala 233:20]
  wire [63:0] m_28_dataIn_0_bits; // @[aeloss_push.scala 233:20]
  wire  m_28_dataIn_1_ready; // @[aeloss_push.scala 233:20]
  wire  m_28_dataIn_1_valid; // @[aeloss_push.scala 233:20]
  wire [63:0] m_28_dataIn_1_bits; // @[aeloss_push.scala 233:20]
  wire  m_28_dataOut_ready; // @[aeloss_push.scala 233:20]
  wire  m_28_dataOut_valid; // @[aeloss_push.scala 233:20]
  wire [63:0] m_28_dataOut_bits; // @[aeloss_push.scala 233:20]
  wire  m_28_condition_ready; // @[aeloss_push.scala 233:20]
  wire  m_28_condition_valid; // @[aeloss_push.scala 233:20]
  wire  m_28_condition_bits; // @[aeloss_push.scala 233:20]
  wire  cmpi_sle_29_operand0_ready; // @[aeloss_push.scala 242:27]
  wire  cmpi_sle_29_operand0_valid; // @[aeloss_push.scala 242:27]
  wire [31:0] cmpi_sle_29_operand0_bits; // @[aeloss_push.scala 242:27]
  wire  cmpi_sle_29_operand1_ready; // @[aeloss_push.scala 242:27]
  wire  cmpi_sle_29_operand1_valid; // @[aeloss_push.scala 242:27]
  wire [31:0] cmpi_sle_29_operand1_bits; // @[aeloss_push.scala 242:27]
  wire  cmpi_sle_29_result_ready; // @[aeloss_push.scala 242:27]
  wire  cmpi_sle_29_result_valid; // @[aeloss_push.scala 242:27]
  wire  cmpi_sle_29_result_bits; // @[aeloss_push.scala 242:27]
  wire  m_30_clock; // @[aeloss_push.scala 249:20]
  wire  m_30_reset; // @[aeloss_push.scala 249:20]
  wire  m_30_dataIn_0_ready; // @[aeloss_push.scala 249:20]
  wire  m_30_dataIn_0_valid; // @[aeloss_push.scala 249:20]
  wire  m_30_dataIn_1_ready; // @[aeloss_push.scala 249:20]
  wire  m_30_dataIn_1_valid; // @[aeloss_push.scala 249:20]
  wire  m_30_condition_ready; // @[aeloss_push.scala 249:20]
  wire  m_30_condition_valid; // @[aeloss_push.scala 249:20]
  wire  m_30_condition_bits; // @[aeloss_push.scala 249:20]
  wire  m_30_dataOut_ready; // @[aeloss_push.scala 249:20]
  wire  m_30_dataOut_valid; // @[aeloss_push.scala 249:20]
  wire  buf_31_clock; // @[aeloss_push.scala 258:22]
  wire  buf_31_reset; // @[aeloss_push.scala 258:22]
  wire  buf_31_dataIn_ready; // @[aeloss_push.scala 258:22]
  wire  buf_31_dataIn_valid; // @[aeloss_push.scala 258:22]
  wire  buf_31_dataOut_ready; // @[aeloss_push.scala 258:22]
  wire  buf_31_dataOut_valid; // @[aeloss_push.scala 258:22]
  wire  b_32_dataIn_ready; // @[aeloss_push.scala 263:20]
  wire  b_32_dataIn_valid; // @[aeloss_push.scala 263:20]
  wire  b_32_dataOut_0_ready; // @[aeloss_push.scala 263:20]
  wire  b_32_dataOut_0_valid; // @[aeloss_push.scala 263:20]
  wire  b_32_condition_ready; // @[aeloss_push.scala 263:20]
  wire  b_32_condition_valid; // @[aeloss_push.scala 263:20]
  wire  b_32_condition_bits; // @[aeloss_push.scala 263:20]
  wire  m_33_clock; // @[aeloss_push.scala 272:20]
  wire  m_33_reset; // @[aeloss_push.scala 272:20]
  wire  m_33_dataIn_0_ready; // @[aeloss_push.scala 272:20]
  wire  m_33_dataIn_0_valid; // @[aeloss_push.scala 272:20]
  wire [63:0] m_33_dataIn_0_bits; // @[aeloss_push.scala 272:20]
  wire  m_33_dataIn_1_ready; // @[aeloss_push.scala 272:20]
  wire  m_33_dataIn_1_valid; // @[aeloss_push.scala 272:20]
  wire [63:0] m_33_dataIn_1_bits; // @[aeloss_push.scala 272:20]
  wire  m_33_dataOut_ready; // @[aeloss_push.scala 272:20]
  wire  m_33_dataOut_valid; // @[aeloss_push.scala 272:20]
  wire [63:0] m_33_dataOut_bits; // @[aeloss_push.scala 272:20]
  wire  m_33_condition_ready; // @[aeloss_push.scala 272:20]
  wire  m_33_condition_valid; // @[aeloss_push.scala 272:20]
  wire  m_33_condition_bits; // @[aeloss_push.scala 272:20]
  wire  buf_34_clock; // @[aeloss_push.scala 281:22]
  wire  buf_34_reset; // @[aeloss_push.scala 281:22]
  wire  buf_34_dataIn_ready; // @[aeloss_push.scala 281:22]
  wire  buf_34_dataIn_valid; // @[aeloss_push.scala 281:22]
  wire [63:0] buf_34_dataIn_bits; // @[aeloss_push.scala 281:22]
  wire  buf_34_dataOut_ready; // @[aeloss_push.scala 281:22]
  wire  buf_34_dataOut_valid; // @[aeloss_push.scala 281:22]
  wire [63:0] buf_34_dataOut_bits; // @[aeloss_push.scala 281:22]
  wire  b_35_dataIn_ready; // @[aeloss_push.scala 286:20]
  wire  b_35_dataIn_valid; // @[aeloss_push.scala 286:20]
  wire [63:0] b_35_dataIn_bits; // @[aeloss_push.scala 286:20]
  wire  b_35_dataOut_0_ready; // @[aeloss_push.scala 286:20]
  wire  b_35_dataOut_0_valid; // @[aeloss_push.scala 286:20]
  wire [63:0] b_35_dataOut_0_bits; // @[aeloss_push.scala 286:20]
  wire  b_35_dataOut_1_ready; // @[aeloss_push.scala 286:20]
  wire  b_35_dataOut_1_valid; // @[aeloss_push.scala 286:20]
  wire [63:0] b_35_dataOut_1_bits; // @[aeloss_push.scala 286:20]
  wire  b_35_condition_ready; // @[aeloss_push.scala 286:20]
  wire  b_35_condition_valid; // @[aeloss_push.scala 286:20]
  wire  b_35_condition_bits; // @[aeloss_push.scala 286:20]
  wire  const_36_control_ready; // @[aeloss_push.scala 295:24]
  wire  const_36_control_valid; // @[aeloss_push.scala 295:24]
  wire [31:0] const_36_dataIn_bits; // @[aeloss_push.scala 295:24]
  wire  const_36_dataOut_ready; // @[aeloss_push.scala 295:24]
  wire  const_36_dataOut_valid; // @[aeloss_push.scala 295:24]
  wire [31:0] const_36_dataOut_bits; // @[aeloss_push.scala 295:24]
  wire  m_37_clock; // @[aeloss_push.scala 302:20]
  wire  m_37_reset; // @[aeloss_push.scala 302:20]
  wire  m_37_dataIn_0_ready; // @[aeloss_push.scala 302:20]
  wire  m_37_dataIn_0_valid; // @[aeloss_push.scala 302:20]
  wire [31:0] m_37_dataIn_0_bits; // @[aeloss_push.scala 302:20]
  wire  m_37_dataIn_1_ready; // @[aeloss_push.scala 302:20]
  wire  m_37_dataIn_1_valid; // @[aeloss_push.scala 302:20]
  wire [31:0] m_37_dataIn_1_bits; // @[aeloss_push.scala 302:20]
  wire  m_37_dataOut_ready; // @[aeloss_push.scala 302:20]
  wire  m_37_dataOut_valid; // @[aeloss_push.scala 302:20]
  wire [31:0] m_37_dataOut_bits; // @[aeloss_push.scala 302:20]
  wire  m_37_condition_ready; // @[aeloss_push.scala 302:20]
  wire  m_37_condition_valid; // @[aeloss_push.scala 302:20]
  wire  m_37_condition_bits; // @[aeloss_push.scala 302:20]
  wire  buf_38_clock; // @[aeloss_push.scala 311:22]
  wire  buf_38_reset; // @[aeloss_push.scala 311:22]
  wire  buf_38_dataIn_ready; // @[aeloss_push.scala 311:22]
  wire  buf_38_dataIn_valid; // @[aeloss_push.scala 311:22]
  wire [31:0] buf_38_dataIn_bits; // @[aeloss_push.scala 311:22]
  wire  buf_38_dataOut_ready; // @[aeloss_push.scala 311:22]
  wire  buf_38_dataOut_valid; // @[aeloss_push.scala 311:22]
  wire [31:0] buf_38_dataOut_bits; // @[aeloss_push.scala 311:22]
  wire  b_39_dataIn_ready; // @[aeloss_push.scala 316:20]
  wire  b_39_dataIn_valid; // @[aeloss_push.scala 316:20]
  wire [31:0] b_39_dataIn_bits; // @[aeloss_push.scala 316:20]
  wire  b_39_dataOut_0_ready; // @[aeloss_push.scala 316:20]
  wire  b_39_dataOut_0_valid; // @[aeloss_push.scala 316:20]
  wire [31:0] b_39_dataOut_0_bits; // @[aeloss_push.scala 316:20]
  wire  b_39_condition_ready; // @[aeloss_push.scala 316:20]
  wire  b_39_condition_valid; // @[aeloss_push.scala 316:20]
  wire  b_39_condition_bits; // @[aeloss_push.scala 316:20]
  wire  const_40_control_ready; // @[aeloss_push.scala 325:24]
  wire  const_40_control_valid; // @[aeloss_push.scala 325:24]
  wire [31:0] const_40_dataIn_bits; // @[aeloss_push.scala 325:24]
  wire  const_40_dataOut_ready; // @[aeloss_push.scala 325:24]
  wire  const_40_dataOut_valid; // @[aeloss_push.scala 325:24]
  wire [31:0] const_40_dataOut_bits; // @[aeloss_push.scala 325:24]
  wire  m_41_clock; // @[aeloss_push.scala 332:20]
  wire  m_41_reset; // @[aeloss_push.scala 332:20]
  wire  m_41_dataIn_0_ready; // @[aeloss_push.scala 332:20]
  wire  m_41_dataIn_0_valid; // @[aeloss_push.scala 332:20]
  wire [31:0] m_41_dataIn_0_bits; // @[aeloss_push.scala 332:20]
  wire  m_41_dataIn_1_ready; // @[aeloss_push.scala 332:20]
  wire  m_41_dataIn_1_valid; // @[aeloss_push.scala 332:20]
  wire [31:0] m_41_dataIn_1_bits; // @[aeloss_push.scala 332:20]
  wire  m_41_dataOut_ready; // @[aeloss_push.scala 332:20]
  wire  m_41_dataOut_valid; // @[aeloss_push.scala 332:20]
  wire [31:0] m_41_dataOut_bits; // @[aeloss_push.scala 332:20]
  wire  m_41_condition_ready; // @[aeloss_push.scala 332:20]
  wire  m_41_condition_valid; // @[aeloss_push.scala 332:20]
  wire  m_41_condition_bits; // @[aeloss_push.scala 332:20]
  wire  buf_42_clock; // @[aeloss_push.scala 341:22]
  wire  buf_42_reset; // @[aeloss_push.scala 341:22]
  wire  buf_42_dataIn_ready; // @[aeloss_push.scala 341:22]
  wire  buf_42_dataIn_valid; // @[aeloss_push.scala 341:22]
  wire [31:0] buf_42_dataIn_bits; // @[aeloss_push.scala 341:22]
  wire  buf_42_dataOut_ready; // @[aeloss_push.scala 341:22]
  wire  buf_42_dataOut_valid; // @[aeloss_push.scala 341:22]
  wire [31:0] buf_42_dataOut_bits; // @[aeloss_push.scala 341:22]
  wire  b_43_dataIn_ready; // @[aeloss_push.scala 346:20]
  wire  b_43_dataIn_valid; // @[aeloss_push.scala 346:20]
  wire [31:0] b_43_dataIn_bits; // @[aeloss_push.scala 346:20]
  wire  b_43_dataOut_0_ready; // @[aeloss_push.scala 346:20]
  wire  b_43_dataOut_0_valid; // @[aeloss_push.scala 346:20]
  wire [31:0] b_43_dataOut_0_bits; // @[aeloss_push.scala 346:20]
  wire  b_43_condition_ready; // @[aeloss_push.scala 346:20]
  wire  b_43_condition_valid; // @[aeloss_push.scala 346:20]
  wire  b_43_condition_bits; // @[aeloss_push.scala 346:20]
  wire  const_44_control_ready; // @[aeloss_push.scala 355:24]
  wire  const_44_control_valid; // @[aeloss_push.scala 355:24]
  wire [31:0] const_44_dataIn_bits; // @[aeloss_push.scala 355:24]
  wire  const_44_dataOut_ready; // @[aeloss_push.scala 355:24]
  wire  const_44_dataOut_valid; // @[aeloss_push.scala 355:24]
  wire [31:0] const_44_dataOut_bits; // @[aeloss_push.scala 355:24]
  wire  m_45_clock; // @[aeloss_push.scala 362:20]
  wire  m_45_reset; // @[aeloss_push.scala 362:20]
  wire  m_45_dataIn_0_ready; // @[aeloss_push.scala 362:20]
  wire  m_45_dataIn_0_valid; // @[aeloss_push.scala 362:20]
  wire [31:0] m_45_dataIn_0_bits; // @[aeloss_push.scala 362:20]
  wire  m_45_dataIn_1_ready; // @[aeloss_push.scala 362:20]
  wire  m_45_dataIn_1_valid; // @[aeloss_push.scala 362:20]
  wire [31:0] m_45_dataIn_1_bits; // @[aeloss_push.scala 362:20]
  wire  m_45_dataOut_ready; // @[aeloss_push.scala 362:20]
  wire  m_45_dataOut_valid; // @[aeloss_push.scala 362:20]
  wire [31:0] m_45_dataOut_bits; // @[aeloss_push.scala 362:20]
  wire  m_45_condition_ready; // @[aeloss_push.scala 362:20]
  wire  m_45_condition_valid; // @[aeloss_push.scala 362:20]
  wire  m_45_condition_bits; // @[aeloss_push.scala 362:20]
  wire  buf_46_clock; // @[aeloss_push.scala 371:22]
  wire  buf_46_reset; // @[aeloss_push.scala 371:22]
  wire  buf_46_dataIn_ready; // @[aeloss_push.scala 371:22]
  wire  buf_46_dataIn_valid; // @[aeloss_push.scala 371:22]
  wire [31:0] buf_46_dataIn_bits; // @[aeloss_push.scala 371:22]
  wire  buf_46_dataOut_ready; // @[aeloss_push.scala 371:22]
  wire  buf_46_dataOut_valid; // @[aeloss_push.scala 371:22]
  wire [31:0] buf_46_dataOut_bits; // @[aeloss_push.scala 371:22]
  wire  b_47_dataIn_ready; // @[aeloss_push.scala 376:20]
  wire  b_47_dataIn_valid; // @[aeloss_push.scala 376:20]
  wire [31:0] b_47_dataIn_bits; // @[aeloss_push.scala 376:20]
  wire  b_47_dataOut_0_ready; // @[aeloss_push.scala 376:20]
  wire  b_47_dataOut_0_valid; // @[aeloss_push.scala 376:20]
  wire [31:0] b_47_dataOut_0_bits; // @[aeloss_push.scala 376:20]
  wire  b_47_condition_ready; // @[aeloss_push.scala 376:20]
  wire  b_47_condition_valid; // @[aeloss_push.scala 376:20]
  wire  b_47_condition_bits; // @[aeloss_push.scala 376:20]
  wire  m_48_clock; // @[aeloss_push.scala 385:20]
  wire  m_48_reset; // @[aeloss_push.scala 385:20]
  wire  m_48_dataIn_0_ready; // @[aeloss_push.scala 385:20]
  wire  m_48_dataIn_0_valid; // @[aeloss_push.scala 385:20]
  wire [31:0] m_48_dataIn_0_bits; // @[aeloss_push.scala 385:20]
  wire  m_48_dataIn_1_ready; // @[aeloss_push.scala 385:20]
  wire  m_48_dataIn_1_valid; // @[aeloss_push.scala 385:20]
  wire [31:0] m_48_dataIn_1_bits; // @[aeloss_push.scala 385:20]
  wire  m_48_dataOut_ready; // @[aeloss_push.scala 385:20]
  wire  m_48_dataOut_valid; // @[aeloss_push.scala 385:20]
  wire [31:0] m_48_dataOut_bits; // @[aeloss_push.scala 385:20]
  wire  m_48_condition_ready; // @[aeloss_push.scala 385:20]
  wire  m_48_condition_valid; // @[aeloss_push.scala 385:20]
  wire  m_48_condition_bits; // @[aeloss_push.scala 385:20]
  wire  buf_49_clock; // @[aeloss_push.scala 394:22]
  wire  buf_49_reset; // @[aeloss_push.scala 394:22]
  wire  buf_49_dataIn_ready; // @[aeloss_push.scala 394:22]
  wire  buf_49_dataIn_valid; // @[aeloss_push.scala 394:22]
  wire [31:0] buf_49_dataIn_bits; // @[aeloss_push.scala 394:22]
  wire  buf_49_dataOut_ready; // @[aeloss_push.scala 394:22]
  wire  buf_49_dataOut_valid; // @[aeloss_push.scala 394:22]
  wire [31:0] buf_49_dataOut_bits; // @[aeloss_push.scala 394:22]
  wire  b_50_dataIn_ready; // @[aeloss_push.scala 399:20]
  wire  b_50_dataIn_valid; // @[aeloss_push.scala 399:20]
  wire [31:0] b_50_dataIn_bits; // @[aeloss_push.scala 399:20]
  wire  b_50_dataOut_0_ready; // @[aeloss_push.scala 399:20]
  wire  b_50_dataOut_0_valid; // @[aeloss_push.scala 399:20]
  wire [31:0] b_50_dataOut_0_bits; // @[aeloss_push.scala 399:20]
  wire  b_50_condition_ready; // @[aeloss_push.scala 399:20]
  wire  b_50_condition_valid; // @[aeloss_push.scala 399:20]
  wire  b_50_condition_bits; // @[aeloss_push.scala 399:20]
  wire  addi_51_operand0_ready; // @[aeloss_push.scala 408:23]
  wire  addi_51_operand0_valid; // @[aeloss_push.scala 408:23]
  wire [31:0] addi_51_operand0_bits; // @[aeloss_push.scala 408:23]
  wire  addi_51_operand1_ready; // @[aeloss_push.scala 408:23]
  wire  addi_51_operand1_valid; // @[aeloss_push.scala 408:23]
  wire [31:0] addi_51_operand1_bits; // @[aeloss_push.scala 408:23]
  wire  addi_51_result_ready; // @[aeloss_push.scala 408:23]
  wire  addi_51_result_valid; // @[aeloss_push.scala 408:23]
  wire [31:0] addi_51_result_bits; // @[aeloss_push.scala 408:23]
  wire  load_52_address_in_ready; // @[aeloss_push.scala 415:23]
  wire  load_52_address_in_valid; // @[aeloss_push.scala 415:23]
  wire [9:0] load_52_address_in_bits; // @[aeloss_push.scala 415:23]
  wire  load_52_data_out_ready; // @[aeloss_push.scala 415:23]
  wire  load_52_data_out_valid; // @[aeloss_push.scala 415:23]
  wire [63:0] load_52_data_out_bits; // @[aeloss_push.scala 415:23]
  wire  load_52_address_out_ready; // @[aeloss_push.scala 415:23]
  wire  load_52_address_out_valid; // @[aeloss_push.scala 415:23]
  wire [9:0] load_52_address_out_bits; // @[aeloss_push.scala 415:23]
  wire  load_52_data_in_ready; // @[aeloss_push.scala 415:23]
  wire  load_52_data_in_valid; // @[aeloss_push.scala 415:23]
  wire [63:0] load_52_data_in_bits; // @[aeloss_push.scala 415:23]
  wire  load_53_address_in_ready; // @[aeloss_push.scala 426:23]
  wire  load_53_address_in_valid; // @[aeloss_push.scala 426:23]
  wire [9:0] load_53_address_in_bits; // @[aeloss_push.scala 426:23]
  wire  load_53_data_out_ready; // @[aeloss_push.scala 426:23]
  wire  load_53_data_out_valid; // @[aeloss_push.scala 426:23]
  wire [63:0] load_53_data_out_bits; // @[aeloss_push.scala 426:23]
  wire  load_53_address_out_ready; // @[aeloss_push.scala 426:23]
  wire  load_53_address_out_valid; // @[aeloss_push.scala 426:23]
  wire [9:0] load_53_address_out_bits; // @[aeloss_push.scala 426:23]
  wire  load_53_data_in_ready; // @[aeloss_push.scala 426:23]
  wire  load_53_data_in_valid; // @[aeloss_push.scala 426:23]
  wire [63:0] load_53_data_in_bits; // @[aeloss_push.scala 426:23]
  wire  subf_54_clock; // @[aeloss_push.scala 437:23]
  wire  subf_54_reset; // @[aeloss_push.scala 437:23]
  wire  subf_54_operand0_ready; // @[aeloss_push.scala 437:23]
  wire  subf_54_operand0_valid; // @[aeloss_push.scala 437:23]
  wire [63:0] subf_54_operand0_bits; // @[aeloss_push.scala 437:23]
  wire  subf_54_operand1_ready; // @[aeloss_push.scala 437:23]
  wire  subf_54_operand1_valid; // @[aeloss_push.scala 437:23]
  wire [63:0] subf_54_operand1_bits; // @[aeloss_push.scala 437:23]
  wire  subf_54_result_ready; // @[aeloss_push.scala 437:23]
  wire  subf_54_result_valid; // @[aeloss_push.scala 437:23]
  wire [63:0] subf_54_result_bits; // @[aeloss_push.scala 437:23]
  wire  cmpf_55_clock; // @[aeloss_push.scala 444:23]
  wire  cmpf_55_reset; // @[aeloss_push.scala 444:23]
  wire  cmpf_55_operand0_ready; // @[aeloss_push.scala 444:23]
  wire  cmpf_55_operand0_valid; // @[aeloss_push.scala 444:23]
  wire [63:0] cmpf_55_operand0_bits; // @[aeloss_push.scala 444:23]
  wire  cmpf_55_operand1_ready; // @[aeloss_push.scala 444:23]
  wire  cmpf_55_operand1_valid; // @[aeloss_push.scala 444:23]
  wire [63:0] cmpf_55_operand1_bits; // @[aeloss_push.scala 444:23]
  wire  cmpf_55_result_ready; // @[aeloss_push.scala 444:23]
  wire  cmpf_55_result_valid; // @[aeloss_push.scala 444:23]
  wire [63:0] cmpf_55_result_bits; // @[aeloss_push.scala 444:23]
  wire  const_56_control_ready; // @[aeloss_push.scala 451:24]
  wire  const_56_control_valid; // @[aeloss_push.scala 451:24]
  wire [63:0] const_56_dataIn_bits; // @[aeloss_push.scala 451:24]
  wire  const_56_dataOut_ready; // @[aeloss_push.scala 451:24]
  wire  const_56_dataOut_valid; // @[aeloss_push.scala 451:24]
  wire [63:0] const_56_dataOut_bits; // @[aeloss_push.scala 451:24]
  wire  subf_57_clock; // @[aeloss_push.scala 458:23]
  wire  subf_57_reset; // @[aeloss_push.scala 458:23]
  wire  subf_57_operand0_ready; // @[aeloss_push.scala 458:23]
  wire  subf_57_operand0_valid; // @[aeloss_push.scala 458:23]
  wire [63:0] subf_57_operand0_bits; // @[aeloss_push.scala 458:23]
  wire  subf_57_operand1_ready; // @[aeloss_push.scala 458:23]
  wire  subf_57_operand1_valid; // @[aeloss_push.scala 458:23]
  wire [63:0] subf_57_operand1_bits; // @[aeloss_push.scala 458:23]
  wire  subf_57_result_ready; // @[aeloss_push.scala 458:23]
  wire  subf_57_result_valid; // @[aeloss_push.scala 458:23]
  wire [63:0] subf_57_result_bits; // @[aeloss_push.scala 458:23]
  wire  const_58_control_ready; // @[aeloss_push.scala 465:24]
  wire  const_58_control_valid; // @[aeloss_push.scala 465:24]
  wire [63:0] const_58_dataIn_bits; // @[aeloss_push.scala 465:24]
  wire  const_58_dataOut_ready; // @[aeloss_push.scala 465:24]
  wire  const_58_dataOut_valid; // @[aeloss_push.scala 465:24]
  wire [63:0] const_58_dataOut_bits; // @[aeloss_push.scala 465:24]
  wire  addf_59_clock; // @[aeloss_push.scala 472:23]
  wire  addf_59_reset; // @[aeloss_push.scala 472:23]
  wire  addf_59_operand0_ready; // @[aeloss_push.scala 472:23]
  wire  addf_59_operand0_valid; // @[aeloss_push.scala 472:23]
  wire [63:0] addf_59_operand0_bits; // @[aeloss_push.scala 472:23]
  wire  addf_59_operand1_ready; // @[aeloss_push.scala 472:23]
  wire  addf_59_operand1_valid; // @[aeloss_push.scala 472:23]
  wire [63:0] addf_59_operand1_bits; // @[aeloss_push.scala 472:23]
  wire  addf_59_result_ready; // @[aeloss_push.scala 472:23]
  wire  addf_59_result_valid; // @[aeloss_push.scala 472:23]
  wire [63:0] addf_59_result_bits; // @[aeloss_push.scala 472:23]
  wire  const_60_control_ready; // @[aeloss_push.scala 479:24]
  wire  const_60_control_valid; // @[aeloss_push.scala 479:24]
  wire [63:0] const_60_dataIn_bits; // @[aeloss_push.scala 479:24]
  wire  const_60_dataOut_ready; // @[aeloss_push.scala 479:24]
  wire  const_60_dataOut_valid; // @[aeloss_push.scala 479:24]
  wire [63:0] const_60_dataOut_bits; // @[aeloss_push.scala 479:24]
  wire  select_61_dataIn_0_ready; // @[aeloss_push.scala 486:25]
  wire  select_61_dataIn_0_valid; // @[aeloss_push.scala 486:25]
  wire [63:0] select_61_dataIn_0_bits; // @[aeloss_push.scala 486:25]
  wire  select_61_dataIn_1_ready; // @[aeloss_push.scala 486:25]
  wire  select_61_dataIn_1_valid; // @[aeloss_push.scala 486:25]
  wire [63:0] select_61_dataIn_1_bits; // @[aeloss_push.scala 486:25]
  wire  select_61_condition_ready; // @[aeloss_push.scala 486:25]
  wire  select_61_condition_valid; // @[aeloss_push.scala 486:25]
  wire  select_61_condition_bits; // @[aeloss_push.scala 486:25]
  wire  select_61_dataOut_ready; // @[aeloss_push.scala 486:25]
  wire  select_61_dataOut_valid; // @[aeloss_push.scala 486:25]
  wire [63:0] select_61_dataOut_bits; // @[aeloss_push.scala 486:25]
  wire  cmpf_62_clock; // @[aeloss_push.scala 495:23]
  wire  cmpf_62_reset; // @[aeloss_push.scala 495:23]
  wire  cmpf_62_operand0_ready; // @[aeloss_push.scala 495:23]
  wire  cmpf_62_operand0_valid; // @[aeloss_push.scala 495:23]
  wire [63:0] cmpf_62_operand0_bits; // @[aeloss_push.scala 495:23]
  wire  cmpf_62_operand1_ready; // @[aeloss_push.scala 495:23]
  wire  cmpf_62_operand1_valid; // @[aeloss_push.scala 495:23]
  wire [63:0] cmpf_62_operand1_bits; // @[aeloss_push.scala 495:23]
  wire  cmpf_62_result_ready; // @[aeloss_push.scala 495:23]
  wire  cmpf_62_result_valid; // @[aeloss_push.scala 495:23]
  wire [63:0] cmpf_62_result_bits; // @[aeloss_push.scala 495:23]
  wire  const_63_control_ready; // @[aeloss_push.scala 502:24]
  wire  const_63_control_valid; // @[aeloss_push.scala 502:24]
  wire [63:0] const_63_dataIn_bits; // @[aeloss_push.scala 502:24]
  wire  const_63_dataOut_ready; // @[aeloss_push.scala 502:24]
  wire  const_63_dataOut_valid; // @[aeloss_push.scala 502:24]
  wire [63:0] const_63_dataOut_bits; // @[aeloss_push.scala 502:24]
  wire  select_64_dataIn_0_ready; // @[aeloss_push.scala 509:25]
  wire  select_64_dataIn_0_valid; // @[aeloss_push.scala 509:25]
  wire [63:0] select_64_dataIn_0_bits; // @[aeloss_push.scala 509:25]
  wire  select_64_dataIn_1_ready; // @[aeloss_push.scala 509:25]
  wire  select_64_dataIn_1_valid; // @[aeloss_push.scala 509:25]
  wire [63:0] select_64_dataIn_1_bits; // @[aeloss_push.scala 509:25]
  wire  select_64_condition_ready; // @[aeloss_push.scala 509:25]
  wire  select_64_condition_valid; // @[aeloss_push.scala 509:25]
  wire  select_64_condition_bits; // @[aeloss_push.scala 509:25]
  wire  select_64_dataOut_ready; // @[aeloss_push.scala 509:25]
  wire  select_64_dataOut_valid; // @[aeloss_push.scala 509:25]
  wire [63:0] select_64_dataOut_bits; // @[aeloss_push.scala 509:25]
  wire  const_65_control_ready; // @[aeloss_push.scala 518:24]
  wire  const_65_control_valid; // @[aeloss_push.scala 518:24]
  wire [63:0] const_65_dataIn_bits; // @[aeloss_push.scala 518:24]
  wire  const_65_dataOut_ready; // @[aeloss_push.scala 518:24]
  wire  const_65_dataOut_valid; // @[aeloss_push.scala 518:24]
  wire [63:0] const_65_dataOut_bits; // @[aeloss_push.scala 518:24]
  wire  load_66_address_in_ready; // @[aeloss_push.scala 525:23]
  wire  load_66_address_in_valid; // @[aeloss_push.scala 525:23]
  wire [9:0] load_66_address_in_bits; // @[aeloss_push.scala 525:23]
  wire  load_66_data_out_ready; // @[aeloss_push.scala 525:23]
  wire  load_66_data_out_valid; // @[aeloss_push.scala 525:23]
  wire [31:0] load_66_data_out_bits; // @[aeloss_push.scala 525:23]
  wire  load_66_address_out_ready; // @[aeloss_push.scala 525:23]
  wire  load_66_address_out_valid; // @[aeloss_push.scala 525:23]
  wire [9:0] load_66_address_out_bits; // @[aeloss_push.scala 525:23]
  wire  load_66_data_in_ready; // @[aeloss_push.scala 525:23]
  wire  load_66_data_in_valid; // @[aeloss_push.scala 525:23]
  wire [31:0] load_66_data_in_bits; // @[aeloss_push.scala 525:23]
  wire  cmpi_67_operand0_ready; // @[aeloss_push.scala 536:23]
  wire  cmpi_67_operand0_valid; // @[aeloss_push.scala 536:23]
  wire [31:0] cmpi_67_operand0_bits; // @[aeloss_push.scala 536:23]
  wire  cmpi_67_operand1_ready; // @[aeloss_push.scala 536:23]
  wire  cmpi_67_operand1_valid; // @[aeloss_push.scala 536:23]
  wire [31:0] cmpi_67_operand1_bits; // @[aeloss_push.scala 536:23]
  wire  cmpi_67_result_ready; // @[aeloss_push.scala 536:23]
  wire  cmpi_67_result_valid; // @[aeloss_push.scala 536:23]
  wire  cmpi_67_result_bits; // @[aeloss_push.scala 536:23]
  wire  trunci_68_operand_ready; // @[aeloss_push.scala 543:25]
  wire  trunci_68_operand_valid; // @[aeloss_push.scala 543:25]
  wire [31:0] trunci_68_operand_bits; // @[aeloss_push.scala 543:25]
  wire  trunci_68_result_ready; // @[aeloss_push.scala 543:25]
  wire  trunci_68_result_valid; // @[aeloss_push.scala 543:25]
  wire  trunci_68_result_bits; // @[aeloss_push.scala 543:25]
  wire  and_69_operand0_ready; // @[aeloss_push.scala 548:22]
  wire  and_69_operand0_valid; // @[aeloss_push.scala 548:22]
  wire  and_69_operand0_bits; // @[aeloss_push.scala 548:22]
  wire  and_69_operand1_ready; // @[aeloss_push.scala 548:22]
  wire  and_69_operand1_valid; // @[aeloss_push.scala 548:22]
  wire  and_69_operand1_bits; // @[aeloss_push.scala 548:22]
  wire  and_69_result_ready; // @[aeloss_push.scala 548:22]
  wire  and_69_result_valid; // @[aeloss_push.scala 548:22]
  wire  and_69_result_bits; // @[aeloss_push.scala 548:22]
  wire  b_70_dataIn_ready; // @[aeloss_push.scala 555:20]
  wire  b_70_dataIn_valid; // @[aeloss_push.scala 555:20]
  wire  b_70_dataOut_0_ready; // @[aeloss_push.scala 555:20]
  wire  b_70_dataOut_0_valid; // @[aeloss_push.scala 555:20]
  wire  b_70_condition_ready; // @[aeloss_push.scala 555:20]
  wire  b_70_condition_valid; // @[aeloss_push.scala 555:20]
  wire  b_70_condition_bits; // @[aeloss_push.scala 555:20]
  wire  b_71_dataIn_ready; // @[aeloss_push.scala 564:20]
  wire  b_71_dataIn_valid; // @[aeloss_push.scala 564:20]
  wire [63:0] b_71_dataIn_bits; // @[aeloss_push.scala 564:20]
  wire  b_71_dataOut_0_ready; // @[aeloss_push.scala 564:20]
  wire  b_71_dataOut_0_valid; // @[aeloss_push.scala 564:20]
  wire [63:0] b_71_dataOut_0_bits; // @[aeloss_push.scala 564:20]
  wire  b_71_dataOut_1_ready; // @[aeloss_push.scala 564:20]
  wire  b_71_dataOut_1_valid; // @[aeloss_push.scala 564:20]
  wire [63:0] b_71_dataOut_1_bits; // @[aeloss_push.scala 564:20]
  wire  b_71_condition_ready; // @[aeloss_push.scala 564:20]
  wire  b_71_condition_valid; // @[aeloss_push.scala 564:20]
  wire  b_71_condition_bits; // @[aeloss_push.scala 564:20]
  wire  b_72_dataIn_ready; // @[aeloss_push.scala 573:20]
  wire  b_72_dataIn_valid; // @[aeloss_push.scala 573:20]
  wire [63:0] b_72_dataIn_bits; // @[aeloss_push.scala 573:20]
  wire  b_72_dataOut_0_ready; // @[aeloss_push.scala 573:20]
  wire  b_72_dataOut_0_valid; // @[aeloss_push.scala 573:20]
  wire [63:0] b_72_dataOut_0_bits; // @[aeloss_push.scala 573:20]
  wire  b_72_dataOut_1_ready; // @[aeloss_push.scala 573:20]
  wire  b_72_dataOut_1_valid; // @[aeloss_push.scala 573:20]
  wire [63:0] b_72_dataOut_1_bits; // @[aeloss_push.scala 573:20]
  wire  b_72_condition_ready; // @[aeloss_push.scala 573:20]
  wire  b_72_condition_valid; // @[aeloss_push.scala 573:20]
  wire  b_72_condition_bits; // @[aeloss_push.scala 573:20]
  wire  m_73_clock; // @[aeloss_push.scala 582:20]
  wire  m_73_reset; // @[aeloss_push.scala 582:20]
  wire  m_73_dataIn_0_ready; // @[aeloss_push.scala 582:20]
  wire  m_73_dataIn_0_valid; // @[aeloss_push.scala 582:20]
  wire [63:0] m_73_dataIn_0_bits; // @[aeloss_push.scala 582:20]
  wire  m_73_dataIn_1_ready; // @[aeloss_push.scala 582:20]
  wire  m_73_dataIn_1_valid; // @[aeloss_push.scala 582:20]
  wire [63:0] m_73_dataIn_1_bits; // @[aeloss_push.scala 582:20]
  wire  m_73_dataOut_ready; // @[aeloss_push.scala 582:20]
  wire  m_73_dataOut_valid; // @[aeloss_push.scala 582:20]
  wire [63:0] m_73_dataOut_bits; // @[aeloss_push.scala 582:20]
  wire  m_73_condition_ready; // @[aeloss_push.scala 582:20]
  wire  m_73_condition_valid; // @[aeloss_push.scala 582:20]
  wire  m_73_condition_bits; // @[aeloss_push.scala 582:20]
  wire  subf_74_clock; // @[aeloss_push.scala 591:23]
  wire  subf_74_reset; // @[aeloss_push.scala 591:23]
  wire  subf_74_operand0_ready; // @[aeloss_push.scala 591:23]
  wire  subf_74_operand0_valid; // @[aeloss_push.scala 591:23]
  wire [63:0] subf_74_operand0_bits; // @[aeloss_push.scala 591:23]
  wire  subf_74_operand1_ready; // @[aeloss_push.scala 591:23]
  wire  subf_74_operand1_valid; // @[aeloss_push.scala 591:23]
  wire [63:0] subf_74_operand1_bits; // @[aeloss_push.scala 591:23]
  wire  subf_74_result_ready; // @[aeloss_push.scala 591:23]
  wire  subf_74_result_valid; // @[aeloss_push.scala 591:23]
  wire [63:0] subf_74_result_bits; // @[aeloss_push.scala 591:23]
  wire  const_75_control_ready; // @[aeloss_push.scala 598:24]
  wire  const_75_control_valid; // @[aeloss_push.scala 598:24]
  wire [63:0] const_75_dataIn_bits; // @[aeloss_push.scala 598:24]
  wire  const_75_dataOut_ready; // @[aeloss_push.scala 598:24]
  wire  const_75_dataOut_valid; // @[aeloss_push.scala 598:24]
  wire [63:0] const_75_dataOut_bits; // @[aeloss_push.scala 598:24]
  wire  divf_76_clock; // @[aeloss_push.scala 605:23]
  wire  divf_76_reset; // @[aeloss_push.scala 605:23]
  wire  divf_76_operand0_ready; // @[aeloss_push.scala 605:23]
  wire  divf_76_operand0_valid; // @[aeloss_push.scala 605:23]
  wire [63:0] divf_76_operand0_bits; // @[aeloss_push.scala 605:23]
  wire  divf_76_operand1_ready; // @[aeloss_push.scala 605:23]
  wire  divf_76_operand1_valid; // @[aeloss_push.scala 605:23]
  wire [63:0] divf_76_operand1_bits; // @[aeloss_push.scala 605:23]
  wire  divf_76_result_ready; // @[aeloss_push.scala 605:23]
  wire  divf_76_result_valid; // @[aeloss_push.scala 605:23]
  wire [63:0] divf_76_result_bits; // @[aeloss_push.scala 605:23]
  wire  const_77_control_ready; // @[aeloss_push.scala 612:24]
  wire  const_77_control_valid; // @[aeloss_push.scala 612:24]
  wire [63:0] const_77_dataIn_bits; // @[aeloss_push.scala 612:24]
  wire  const_77_dataOut_ready; // @[aeloss_push.scala 612:24]
  wire  const_77_dataOut_valid; // @[aeloss_push.scala 612:24]
  wire [63:0] const_77_dataOut_bits; // @[aeloss_push.scala 612:24]
  wire  addf_78_clock; // @[aeloss_push.scala 619:23]
  wire  addf_78_reset; // @[aeloss_push.scala 619:23]
  wire  addf_78_operand0_ready; // @[aeloss_push.scala 619:23]
  wire  addf_78_operand0_valid; // @[aeloss_push.scala 619:23]
  wire [63:0] addf_78_operand0_bits; // @[aeloss_push.scala 619:23]
  wire  addf_78_operand1_ready; // @[aeloss_push.scala 619:23]
  wire  addf_78_operand1_valid; // @[aeloss_push.scala 619:23]
  wire [63:0] addf_78_operand1_bits; // @[aeloss_push.scala 619:23]
  wire  addf_78_result_ready; // @[aeloss_push.scala 619:23]
  wire  addf_78_result_valid; // @[aeloss_push.scala 619:23]
  wire [63:0] addf_78_result_bits; // @[aeloss_push.scala 619:23]
  wire  f_79_clock; // @[aeloss_push.scala 626:20]
  wire  f_79_reset; // @[aeloss_push.scala 626:20]
  wire  f_79_dataIn_ready; // @[aeloss_push.scala 626:20]
  wire  f_79_dataIn_valid; // @[aeloss_push.scala 626:20]
  wire  f_79_dataIn_bits; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_0_ready; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_0_valid; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_0_bits; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_1_ready; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_1_valid; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_1_bits; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_2_ready; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_2_valid; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_2_bits; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_3_ready; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_3_valid; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_3_bits; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_4_ready; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_4_valid; // @[aeloss_push.scala 626:20]
  wire  f_79_dataOut_4_bits; // @[aeloss_push.scala 626:20]
  wire  f_80_clock; // @[aeloss_push.scala 639:20]
  wire  f_80_reset; // @[aeloss_push.scala 639:20]
  wire  f_80_dataIn_ready; // @[aeloss_push.scala 639:20]
  wire  f_80_dataIn_valid; // @[aeloss_push.scala 639:20]
  wire  f_80_dataIn_bits; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_0_ready; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_0_valid; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_0_bits; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_1_ready; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_1_valid; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_1_bits; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_2_ready; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_2_valid; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_2_bits; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_3_ready; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_3_valid; // @[aeloss_push.scala 639:20]
  wire  f_80_dataOut_3_bits; // @[aeloss_push.scala 639:20]
  wire  f_81_clock; // @[aeloss_push.scala 650:20]
  wire  f_81_reset; // @[aeloss_push.scala 650:20]
  wire  f_81_dataIn_ready; // @[aeloss_push.scala 650:20]
  wire  f_81_dataIn_valid; // @[aeloss_push.scala 650:20]
  wire  f_81_dataOut_0_ready; // @[aeloss_push.scala 650:20]
  wire  f_81_dataOut_0_valid; // @[aeloss_push.scala 650:20]
  wire  f_81_dataOut_1_ready; // @[aeloss_push.scala 650:20]
  wire  f_81_dataOut_1_valid; // @[aeloss_push.scala 650:20]
  wire  f_82_clock; // @[aeloss_push.scala 659:20]
  wire  f_82_reset; // @[aeloss_push.scala 659:20]
  wire  f_82_dataIn_ready; // @[aeloss_push.scala 659:20]
  wire  f_82_dataIn_valid; // @[aeloss_push.scala 659:20]
  wire [31:0] f_82_dataIn_bits; // @[aeloss_push.scala 659:20]
  wire  f_82_dataOut_0_ready; // @[aeloss_push.scala 659:20]
  wire  f_82_dataOut_0_valid; // @[aeloss_push.scala 659:20]
  wire [31:0] f_82_dataOut_0_bits; // @[aeloss_push.scala 659:20]
  wire  f_82_dataOut_1_ready; // @[aeloss_push.scala 659:20]
  wire  f_82_dataOut_1_valid; // @[aeloss_push.scala 659:20]
  wire [31:0] f_82_dataOut_1_bits; // @[aeloss_push.scala 659:20]
  wire  f_83_clock; // @[aeloss_push.scala 666:20]
  wire  f_83_reset; // @[aeloss_push.scala 666:20]
  wire  f_83_dataIn_ready; // @[aeloss_push.scala 666:20]
  wire  f_83_dataIn_valid; // @[aeloss_push.scala 666:20]
  wire [31:0] f_83_dataIn_bits; // @[aeloss_push.scala 666:20]
  wire  f_83_dataOut_0_ready; // @[aeloss_push.scala 666:20]
  wire  f_83_dataOut_0_valid; // @[aeloss_push.scala 666:20]
  wire [31:0] f_83_dataOut_0_bits; // @[aeloss_push.scala 666:20]
  wire  f_83_dataOut_1_ready; // @[aeloss_push.scala 666:20]
  wire  f_83_dataOut_1_valid; // @[aeloss_push.scala 666:20]
  wire [31:0] f_83_dataOut_1_bits; // @[aeloss_push.scala 666:20]
  wire  f_84_clock; // @[aeloss_push.scala 673:20]
  wire  f_84_reset; // @[aeloss_push.scala 673:20]
  wire  f_84_dataIn_ready; // @[aeloss_push.scala 673:20]
  wire  f_84_dataIn_valid; // @[aeloss_push.scala 673:20]
  wire [31:0] f_84_dataIn_bits; // @[aeloss_push.scala 673:20]
  wire  f_84_dataOut_0_ready; // @[aeloss_push.scala 673:20]
  wire  f_84_dataOut_0_valid; // @[aeloss_push.scala 673:20]
  wire [31:0] f_84_dataOut_0_bits; // @[aeloss_push.scala 673:20]
  wire  f_84_dataOut_1_ready; // @[aeloss_push.scala 673:20]
  wire  f_84_dataOut_1_valid; // @[aeloss_push.scala 673:20]
  wire [31:0] f_84_dataOut_1_bits; // @[aeloss_push.scala 673:20]
  wire  f_85_clock; // @[aeloss_push.scala 680:20]
  wire  f_85_reset; // @[aeloss_push.scala 680:20]
  wire  f_85_dataIn_ready; // @[aeloss_push.scala 680:20]
  wire  f_85_dataIn_valid; // @[aeloss_push.scala 680:20]
  wire [31:0] f_85_dataIn_bits; // @[aeloss_push.scala 680:20]
  wire  f_85_dataOut_0_ready; // @[aeloss_push.scala 680:20]
  wire  f_85_dataOut_0_valid; // @[aeloss_push.scala 680:20]
  wire [31:0] f_85_dataOut_0_bits; // @[aeloss_push.scala 680:20]
  wire  f_85_dataOut_1_ready; // @[aeloss_push.scala 680:20]
  wire  f_85_dataOut_1_valid; // @[aeloss_push.scala 680:20]
  wire [31:0] f_85_dataOut_1_bits; // @[aeloss_push.scala 680:20]
  wire  f_85_dataOut_2_ready; // @[aeloss_push.scala 680:20]
  wire  f_85_dataOut_2_valid; // @[aeloss_push.scala 680:20]
  wire [31:0] f_85_dataOut_2_bits; // @[aeloss_push.scala 680:20]
  wire  f_86_clock; // @[aeloss_push.scala 689:20]
  wire  f_86_reset; // @[aeloss_push.scala 689:20]
  wire  f_86_dataIn_ready; // @[aeloss_push.scala 689:20]
  wire  f_86_dataIn_valid; // @[aeloss_push.scala 689:20]
  wire  f_86_dataIn_bits; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_0_ready; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_0_valid; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_0_bits; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_1_ready; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_1_valid; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_1_bits; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_2_ready; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_2_valid; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_2_bits; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_3_ready; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_3_valid; // @[aeloss_push.scala 689:20]
  wire  f_86_dataOut_3_bits; // @[aeloss_push.scala 689:20]
  wire  f_87_clock; // @[aeloss_push.scala 700:20]
  wire  f_87_reset; // @[aeloss_push.scala 700:20]
  wire  f_87_dataIn_ready; // @[aeloss_push.scala 700:20]
  wire  f_87_dataIn_valid; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_0_ready; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_0_valid; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_1_ready; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_1_valid; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_2_ready; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_2_valid; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_3_ready; // @[aeloss_push.scala 700:20]
  wire  f_87_dataOut_3_valid; // @[aeloss_push.scala 700:20]
  wire  f_88_clock; // @[aeloss_push.scala 711:20]
  wire  f_88_reset; // @[aeloss_push.scala 711:20]
  wire  f_88_dataIn_ready; // @[aeloss_push.scala 711:20]
  wire  f_88_dataIn_valid; // @[aeloss_push.scala 711:20]
  wire  f_88_dataIn_bits; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_0_ready; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_0_valid; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_0_bits; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_1_ready; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_1_valid; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_1_bits; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_2_ready; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_2_valid; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_2_bits; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_3_ready; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_3_valid; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_3_bits; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_4_ready; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_4_valid; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_4_bits; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_5_ready; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_5_valid; // @[aeloss_push.scala 711:20]
  wire  f_88_dataOut_5_bits; // @[aeloss_push.scala 711:20]
  wire  f_89_clock; // @[aeloss_push.scala 726:20]
  wire  f_89_reset; // @[aeloss_push.scala 726:20]
  wire  f_89_dataIn_ready; // @[aeloss_push.scala 726:20]
  wire  f_89_dataIn_valid; // @[aeloss_push.scala 726:20]
  wire  f_89_dataIn_bits; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_0_ready; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_0_valid; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_0_bits; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_1_ready; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_1_valid; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_1_bits; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_2_ready; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_2_valid; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_2_bits; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_3_ready; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_3_valid; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_3_bits; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_4_ready; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_4_valid; // @[aeloss_push.scala 726:20]
  wire  f_89_dataOut_4_bits; // @[aeloss_push.scala 726:20]
  wire  f_90_clock; // @[aeloss_push.scala 739:20]
  wire  f_90_reset; // @[aeloss_push.scala 739:20]
  wire  f_90_dataIn_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataIn_valid; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_0_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_0_valid; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_1_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_1_valid; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_3_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_3_valid; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_4_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_4_valid; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_5_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_5_valid; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_6_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_6_valid; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_7_ready; // @[aeloss_push.scala 739:20]
  wire  f_90_dataOut_7_valid; // @[aeloss_push.scala 739:20]
  wire  f_91_clock; // @[aeloss_push.scala 762:20]
  wire  f_91_reset; // @[aeloss_push.scala 762:20]
  wire  f_91_dataIn_ready; // @[aeloss_push.scala 762:20]
  wire  f_91_dataIn_valid; // @[aeloss_push.scala 762:20]
  wire [31:0] f_91_dataIn_bits; // @[aeloss_push.scala 762:20]
  wire  f_91_dataOut_0_ready; // @[aeloss_push.scala 762:20]
  wire  f_91_dataOut_0_valid; // @[aeloss_push.scala 762:20]
  wire [31:0] f_91_dataOut_0_bits; // @[aeloss_push.scala 762:20]
  wire  f_91_dataOut_1_ready; // @[aeloss_push.scala 762:20]
  wire  f_91_dataOut_1_valid; // @[aeloss_push.scala 762:20]
  wire [31:0] f_91_dataOut_1_bits; // @[aeloss_push.scala 762:20]
  wire  f_92_clock; // @[aeloss_push.scala 769:20]
  wire  f_92_reset; // @[aeloss_push.scala 769:20]
  wire  f_92_dataIn_ready; // @[aeloss_push.scala 769:20]
  wire  f_92_dataIn_valid; // @[aeloss_push.scala 769:20]
  wire [31:0] f_92_dataIn_bits; // @[aeloss_push.scala 769:20]
  wire  f_92_dataOut_0_ready; // @[aeloss_push.scala 769:20]
  wire  f_92_dataOut_0_valid; // @[aeloss_push.scala 769:20]
  wire [31:0] f_92_dataOut_0_bits; // @[aeloss_push.scala 769:20]
  wire  f_92_dataOut_1_ready; // @[aeloss_push.scala 769:20]
  wire  f_92_dataOut_1_valid; // @[aeloss_push.scala 769:20]
  wire [31:0] f_92_dataOut_1_bits; // @[aeloss_push.scala 769:20]
  wire  f_93_clock; // @[aeloss_push.scala 776:20]
  wire  f_93_reset; // @[aeloss_push.scala 776:20]
  wire  f_93_dataIn_ready; // @[aeloss_push.scala 776:20]
  wire  f_93_dataIn_valid; // @[aeloss_push.scala 776:20]
  wire [31:0] f_93_dataIn_bits; // @[aeloss_push.scala 776:20]
  wire  f_93_dataOut_0_ready; // @[aeloss_push.scala 776:20]
  wire  f_93_dataOut_0_valid; // @[aeloss_push.scala 776:20]
  wire [31:0] f_93_dataOut_0_bits; // @[aeloss_push.scala 776:20]
  wire  f_93_dataOut_1_ready; // @[aeloss_push.scala 776:20]
  wire  f_93_dataOut_1_valid; // @[aeloss_push.scala 776:20]
  wire [31:0] f_93_dataOut_1_bits; // @[aeloss_push.scala 776:20]
  wire  f_93_dataOut_2_ready; // @[aeloss_push.scala 776:20]
  wire  f_93_dataOut_2_valid; // @[aeloss_push.scala 776:20]
  wire [31:0] f_93_dataOut_2_bits; // @[aeloss_push.scala 776:20]
  wire  f_94_clock; // @[aeloss_push.scala 785:20]
  wire  f_94_reset; // @[aeloss_push.scala 785:20]
  wire  f_94_dataIn_ready; // @[aeloss_push.scala 785:20]
  wire  f_94_dataIn_valid; // @[aeloss_push.scala 785:20]
  wire [31:0] f_94_dataIn_bits; // @[aeloss_push.scala 785:20]
  wire  f_94_dataOut_0_ready; // @[aeloss_push.scala 785:20]
  wire  f_94_dataOut_0_valid; // @[aeloss_push.scala 785:20]
  wire [31:0] f_94_dataOut_0_bits; // @[aeloss_push.scala 785:20]
  wire  f_94_dataOut_1_ready; // @[aeloss_push.scala 785:20]
  wire  f_94_dataOut_1_valid; // @[aeloss_push.scala 785:20]
  wire [31:0] f_94_dataOut_1_bits; // @[aeloss_push.scala 785:20]
  wire  f_95_clock; // @[aeloss_push.scala 792:20]
  wire  f_95_reset; // @[aeloss_push.scala 792:20]
  wire  f_95_dataIn_ready; // @[aeloss_push.scala 792:20]
  wire  f_95_dataIn_valid; // @[aeloss_push.scala 792:20]
  wire [31:0] f_95_dataIn_bits; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_0_ready; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_0_valid; // @[aeloss_push.scala 792:20]
  wire [31:0] f_95_dataOut_0_bits; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_1_ready; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_1_valid; // @[aeloss_push.scala 792:20]
  wire [31:0] f_95_dataOut_1_bits; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_2_ready; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_2_valid; // @[aeloss_push.scala 792:20]
  wire [31:0] f_95_dataOut_2_bits; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_3_ready; // @[aeloss_push.scala 792:20]
  wire  f_95_dataOut_3_valid; // @[aeloss_push.scala 792:20]
  wire [31:0] f_95_dataOut_3_bits; // @[aeloss_push.scala 792:20]
  wire  f_96_clock; // @[aeloss_push.scala 803:20]
  wire  f_96_reset; // @[aeloss_push.scala 803:20]
  wire  f_96_dataIn_ready; // @[aeloss_push.scala 803:20]
  wire  f_96_dataIn_valid; // @[aeloss_push.scala 803:20]
  wire [63:0] f_96_dataIn_bits; // @[aeloss_push.scala 803:20]
  wire  f_96_dataOut_0_ready; // @[aeloss_push.scala 803:20]
  wire  f_96_dataOut_0_valid; // @[aeloss_push.scala 803:20]
  wire [63:0] f_96_dataOut_0_bits; // @[aeloss_push.scala 803:20]
  wire  f_96_dataOut_1_ready; // @[aeloss_push.scala 803:20]
  wire  f_96_dataOut_1_valid; // @[aeloss_push.scala 803:20]
  wire [63:0] f_96_dataOut_1_bits; // @[aeloss_push.scala 803:20]
  wire  f_96_dataOut_2_ready; // @[aeloss_push.scala 803:20]
  wire  f_96_dataOut_2_valid; // @[aeloss_push.scala 803:20]
  wire [63:0] f_96_dataOut_2_bits; // @[aeloss_push.scala 803:20]
  wire  f_97_clock; // @[aeloss_push.scala 812:20]
  wire  f_97_reset; // @[aeloss_push.scala 812:20]
  wire  f_97_dataIn_ready; // @[aeloss_push.scala 812:20]
  wire  f_97_dataIn_valid; // @[aeloss_push.scala 812:20]
  wire [63:0] f_97_dataIn_bits; // @[aeloss_push.scala 812:20]
  wire  f_97_dataOut_0_ready; // @[aeloss_push.scala 812:20]
  wire  f_97_dataOut_0_valid; // @[aeloss_push.scala 812:20]
  wire [63:0] f_97_dataOut_0_bits; // @[aeloss_push.scala 812:20]
  wire  f_97_dataOut_1_ready; // @[aeloss_push.scala 812:20]
  wire  f_97_dataOut_1_valid; // @[aeloss_push.scala 812:20]
  wire [63:0] f_97_dataOut_1_bits; // @[aeloss_push.scala 812:20]
  wire  f_98_clock; // @[aeloss_push.scala 819:20]
  wire  f_98_reset; // @[aeloss_push.scala 819:20]
  wire  f_98_dataIn_ready; // @[aeloss_push.scala 819:20]
  wire  f_98_dataIn_valid; // @[aeloss_push.scala 819:20]
  wire  f_98_dataIn_bits; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_0_ready; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_0_valid; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_0_bits; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_1_ready; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_1_valid; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_1_bits; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_2_ready; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_2_valid; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_2_bits; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_3_ready; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_3_valid; // @[aeloss_push.scala 819:20]
  wire  f_98_dataOut_3_bits; // @[aeloss_push.scala 819:20]
  wire  f_99_clock; // @[aeloss_push.scala 830:20]
  wire  f_99_reset; // @[aeloss_push.scala 830:20]
  wire  f_99_dataIn_ready; // @[aeloss_push.scala 830:20]
  wire  f_99_dataIn_valid; // @[aeloss_push.scala 830:20]
  wire  f_99_dataOut_0_ready; // @[aeloss_push.scala 830:20]
  wire  f_99_dataOut_0_valid; // @[aeloss_push.scala 830:20]
  wire  f_99_dataOut_1_ready; // @[aeloss_push.scala 830:20]
  wire  f_99_dataOut_1_valid; // @[aeloss_push.scala 830:20]
  wire  fifo_100_clock; // @[aeloss_push.scala 837:24]
  wire  fifo_100_reset; // @[aeloss_push.scala 837:24]
  wire  fifo_100_dataIn_ready; // @[aeloss_push.scala 837:24]
  wire  fifo_100_dataIn_valid; // @[aeloss_push.scala 837:24]
  wire [63:0] fifo_100_dataIn_bits; // @[aeloss_push.scala 837:24]
  wire  fifo_100_dataOut_ready; // @[aeloss_push.scala 837:24]
  wire  fifo_100_dataOut_valid; // @[aeloss_push.scala 837:24]
  wire [63:0] fifo_100_dataOut_bits; // @[aeloss_push.scala 837:24]
  wire  fifo_101_clock; // @[aeloss_push.scala 842:24]
  wire  fifo_101_reset; // @[aeloss_push.scala 842:24]
  wire  fifo_101_dataIn_ready; // @[aeloss_push.scala 842:24]
  wire  fifo_101_dataIn_valid; // @[aeloss_push.scala 842:24]
  wire [63:0] fifo_101_dataIn_bits; // @[aeloss_push.scala 842:24]
  wire  fifo_101_dataOut_ready; // @[aeloss_push.scala 842:24]
  wire  fifo_101_dataOut_valid; // @[aeloss_push.scala 842:24]
  wire [63:0] fifo_101_dataOut_bits; // @[aeloss_push.scala 842:24]
  wire  fifo_102_clock; // @[aeloss_push.scala 847:24]
  wire  fifo_102_reset; // @[aeloss_push.scala 847:24]
  wire  fifo_102_dataIn_ready; // @[aeloss_push.scala 847:24]
  wire  fifo_102_dataIn_valid; // @[aeloss_push.scala 847:24]
  wire [63:0] fifo_102_dataIn_bits; // @[aeloss_push.scala 847:24]
  wire  fifo_102_dataOut_ready; // @[aeloss_push.scala 847:24]
  wire  fifo_102_dataOut_valid; // @[aeloss_push.scala 847:24]
  wire [63:0] fifo_102_dataOut_bits; // @[aeloss_push.scala 847:24]
  wire  fifo_103_clock; // @[aeloss_push.scala 852:24]
  wire  fifo_103_reset; // @[aeloss_push.scala 852:24]
  wire  fifo_103_dataIn_ready; // @[aeloss_push.scala 852:24]
  wire  fifo_103_dataIn_valid; // @[aeloss_push.scala 852:24]
  wire [63:0] fifo_103_dataIn_bits; // @[aeloss_push.scala 852:24]
  wire  fifo_103_dataOut_ready; // @[aeloss_push.scala 852:24]
  wire  fifo_103_dataOut_valid; // @[aeloss_push.scala 852:24]
  wire [63:0] fifo_103_dataOut_bits; // @[aeloss_push.scala 852:24]
  wire  fifo_104_clock; // @[aeloss_push.scala 857:24]
  wire  fifo_104_reset; // @[aeloss_push.scala 857:24]
  wire  fifo_104_dataIn_ready; // @[aeloss_push.scala 857:24]
  wire  fifo_104_dataIn_valid; // @[aeloss_push.scala 857:24]
  wire [63:0] fifo_104_dataIn_bits; // @[aeloss_push.scala 857:24]
  wire  fifo_104_dataOut_ready; // @[aeloss_push.scala 857:24]
  wire  fifo_104_dataOut_valid; // @[aeloss_push.scala 857:24]
  wire [63:0] fifo_104_dataOut_bits; // @[aeloss_push.scala 857:24]
  wire  fifo_105_clock; // @[aeloss_push.scala 862:24]
  wire  fifo_105_reset; // @[aeloss_push.scala 862:24]
  wire  fifo_105_dataIn_ready; // @[aeloss_push.scala 862:24]
  wire  fifo_105_dataIn_valid; // @[aeloss_push.scala 862:24]
  wire [63:0] fifo_105_dataIn_bits; // @[aeloss_push.scala 862:24]
  wire  fifo_105_dataOut_ready; // @[aeloss_push.scala 862:24]
  wire  fifo_105_dataOut_valid; // @[aeloss_push.scala 862:24]
  wire [63:0] fifo_105_dataOut_bits; // @[aeloss_push.scala 862:24]
  wire  fifo_106_clock; // @[aeloss_push.scala 867:24]
  wire  fifo_106_reset; // @[aeloss_push.scala 867:24]
  wire  fifo_106_dataIn_ready; // @[aeloss_push.scala 867:24]
  wire  fifo_106_dataIn_valid; // @[aeloss_push.scala 867:24]
  wire [63:0] fifo_106_dataIn_bits; // @[aeloss_push.scala 867:24]
  wire  fifo_106_dataOut_ready; // @[aeloss_push.scala 867:24]
  wire  fifo_106_dataOut_valid; // @[aeloss_push.scala 867:24]
  wire [63:0] fifo_106_dataOut_bits; // @[aeloss_push.scala 867:24]
  wire  fifo_107_clock; // @[aeloss_push.scala 872:24]
  wire  fifo_107_reset; // @[aeloss_push.scala 872:24]
  wire  fifo_107_dataIn_ready; // @[aeloss_push.scala 872:24]
  wire  fifo_107_dataIn_valid; // @[aeloss_push.scala 872:24]
  wire [63:0] fifo_107_dataIn_bits; // @[aeloss_push.scala 872:24]
  wire  fifo_107_dataOut_ready; // @[aeloss_push.scala 872:24]
  wire  fifo_107_dataOut_valid; // @[aeloss_push.scala 872:24]
  wire [63:0] fifo_107_dataOut_bits; // @[aeloss_push.scala 872:24]
  wire  fifo_108_clock; // @[aeloss_push.scala 877:24]
  wire  fifo_108_reset; // @[aeloss_push.scala 877:24]
  wire  fifo_108_dataIn_ready; // @[aeloss_push.scala 877:24]
  wire  fifo_108_dataIn_valid; // @[aeloss_push.scala 877:24]
  wire [63:0] fifo_108_dataIn_bits; // @[aeloss_push.scala 877:24]
  wire  fifo_108_dataOut_ready; // @[aeloss_push.scala 877:24]
  wire  fifo_108_dataOut_valid; // @[aeloss_push.scala 877:24]
  wire [63:0] fifo_108_dataOut_bits; // @[aeloss_push.scala 877:24]
  wire  fifo_109_clock; // @[aeloss_push.scala 882:24]
  wire  fifo_109_reset; // @[aeloss_push.scala 882:24]
  wire  fifo_109_dataIn_ready; // @[aeloss_push.scala 882:24]
  wire  fifo_109_dataIn_valid; // @[aeloss_push.scala 882:24]
  wire  fifo_109_dataIn_bits; // @[aeloss_push.scala 882:24]
  wire  fifo_109_dataOut_ready; // @[aeloss_push.scala 882:24]
  wire  fifo_109_dataOut_valid; // @[aeloss_push.scala 882:24]
  wire  fifo_109_dataOut_bits; // @[aeloss_push.scala 882:24]
  wire  fifo_110_clock; // @[aeloss_push.scala 887:24]
  wire  fifo_110_reset; // @[aeloss_push.scala 887:24]
  wire  fifo_110_dataIn_ready; // @[aeloss_push.scala 887:24]
  wire  fifo_110_dataIn_valid; // @[aeloss_push.scala 887:24]
  wire [63:0] fifo_110_dataIn_bits; // @[aeloss_push.scala 887:24]
  wire  fifo_110_dataOut_ready; // @[aeloss_push.scala 887:24]
  wire  fifo_110_dataOut_valid; // @[aeloss_push.scala 887:24]
  wire [63:0] fifo_110_dataOut_bits; // @[aeloss_push.scala 887:24]
  wire  fifo_111_clock; // @[aeloss_push.scala 892:24]
  wire  fifo_111_reset; // @[aeloss_push.scala 892:24]
  wire  fifo_111_dataIn_ready; // @[aeloss_push.scala 892:24]
  wire  fifo_111_dataIn_valid; // @[aeloss_push.scala 892:24]
  wire [63:0] fifo_111_dataIn_bits; // @[aeloss_push.scala 892:24]
  wire  fifo_111_dataOut_ready; // @[aeloss_push.scala 892:24]
  wire  fifo_111_dataOut_valid; // @[aeloss_push.scala 892:24]
  wire [63:0] fifo_111_dataOut_bits; // @[aeloss_push.scala 892:24]
  wire  fifo_112_clock; // @[aeloss_push.scala 897:24]
  wire  fifo_112_reset; // @[aeloss_push.scala 897:24]
  wire  fifo_112_dataIn_ready; // @[aeloss_push.scala 897:24]
  wire  fifo_112_dataIn_valid; // @[aeloss_push.scala 897:24]
  wire [63:0] fifo_112_dataIn_bits; // @[aeloss_push.scala 897:24]
  wire  fifo_112_dataOut_ready; // @[aeloss_push.scala 897:24]
  wire  fifo_112_dataOut_valid; // @[aeloss_push.scala 897:24]
  wire [63:0] fifo_112_dataOut_bits; // @[aeloss_push.scala 897:24]
  wire  fifo_113_clock; // @[aeloss_push.scala 902:24]
  wire  fifo_113_reset; // @[aeloss_push.scala 902:24]
  wire  fifo_113_dataIn_ready; // @[aeloss_push.scala 902:24]
  wire  fifo_113_dataIn_valid; // @[aeloss_push.scala 902:24]
  wire [63:0] fifo_113_dataIn_bits; // @[aeloss_push.scala 902:24]
  wire  fifo_113_dataOut_ready; // @[aeloss_push.scala 902:24]
  wire  fifo_113_dataOut_valid; // @[aeloss_push.scala 902:24]
  wire [63:0] fifo_113_dataOut_bits; // @[aeloss_push.scala 902:24]
  wire  fifo_114_clock; // @[aeloss_push.scala 907:24]
  wire  fifo_114_reset; // @[aeloss_push.scala 907:24]
  wire  fifo_114_dataIn_ready; // @[aeloss_push.scala 907:24]
  wire  fifo_114_dataIn_valid; // @[aeloss_push.scala 907:24]
  wire [63:0] fifo_114_dataIn_bits; // @[aeloss_push.scala 907:24]
  wire  fifo_114_dataOut_ready; // @[aeloss_push.scala 907:24]
  wire  fifo_114_dataOut_valid; // @[aeloss_push.scala 907:24]
  wire [63:0] fifo_114_dataOut_bits; // @[aeloss_push.scala 907:24]
  wire  fifo_115_clock; // @[aeloss_push.scala 912:24]
  wire  fifo_115_reset; // @[aeloss_push.scala 912:24]
  wire  fifo_115_dataIn_ready; // @[aeloss_push.scala 912:24]
  wire  fifo_115_dataIn_valid; // @[aeloss_push.scala 912:24]
  wire [63:0] fifo_115_dataIn_bits; // @[aeloss_push.scala 912:24]
  wire  fifo_115_dataOut_ready; // @[aeloss_push.scala 912:24]
  wire  fifo_115_dataOut_valid; // @[aeloss_push.scala 912:24]
  wire [63:0] fifo_115_dataOut_bits; // @[aeloss_push.scala 912:24]
  wire  fifo_116_clock; // @[aeloss_push.scala 917:24]
  wire  fifo_116_reset; // @[aeloss_push.scala 917:24]
  wire  fifo_116_dataIn_ready; // @[aeloss_push.scala 917:24]
  wire  fifo_116_dataIn_valid; // @[aeloss_push.scala 917:24]
  wire  fifo_116_dataIn_bits; // @[aeloss_push.scala 917:24]
  wire  fifo_116_dataOut_ready; // @[aeloss_push.scala 917:24]
  wire  fifo_116_dataOut_valid; // @[aeloss_push.scala 917:24]
  wire  fifo_116_dataOut_bits; // @[aeloss_push.scala 917:24]
  DynMem mem_0 ( // @[aeloss_push.scala 15:21]
    .clock(mem_0_clock),
    .reset(mem_0_reset),
    .load_address_0_ready(mem_0_load_address_0_ready),
    .load_address_0_valid(mem_0_load_address_0_valid),
    .load_address_0_bits(mem_0_load_address_0_bits),
    .load_address_1_ready(mem_0_load_address_1_ready),
    .load_address_1_valid(mem_0_load_address_1_valid),
    .load_address_1_bits(mem_0_load_address_1_bits),
    .load_data_0_ready(mem_0_load_data_0_ready),
    .load_data_0_valid(mem_0_load_data_0_valid),
    .load_data_0_bits(mem_0_load_data_0_bits),
    .load_data_1_ready(mem_0_load_data_1_ready),
    .load_data_1_valid(mem_0_load_data_1_valid),
    .load_data_1_bits(mem_0_load_data_1_bits)
  );
  DynMem_1 mem_1 ( // @[aeloss_push.scala 24:21]
    .clock(mem_1_clock),
    .reset(mem_1_reset),
    .load_address_0_ready(mem_1_load_address_0_ready),
    .load_address_0_valid(mem_1_load_address_0_valid),
    .load_address_0_bits(mem_1_load_address_0_bits),
    .load_address_1_ready(mem_1_load_address_1_ready),
    .load_address_1_valid(mem_1_load_address_1_valid),
    .load_address_1_bits(mem_1_load_address_1_bits),
    .load_data_0_ready(mem_1_load_data_0_ready),
    .load_data_0_valid(mem_1_load_data_0_valid),
    .load_data_0_bits(mem_1_load_data_0_bits),
    .load_data_1_ready(mem_1_load_data_1_ready),
    .load_data_1_valid(mem_1_load_data_1_valid),
    .load_data_1_bits(mem_1_load_data_1_bits)
  );
  LessEqualthanIDynamic cmpi_sle_2 ( // @[aeloss_push.scala 33:26]
    .operand0_ready(cmpi_sle_2_operand0_ready),
    .operand0_valid(cmpi_sle_2_operand0_valid),
    .operand0_bits(cmpi_sle_2_operand0_bits),
    .operand1_ready(cmpi_sle_2_operand1_ready),
    .operand1_valid(cmpi_sle_2_operand1_valid),
    .operand1_bits(cmpi_sle_2_operand1_bits),
    .result_ready(cmpi_sle_2_result_ready),
    .result_valid(cmpi_sle_2_result_valid),
    .result_bits(cmpi_sle_2_result_bits)
  );
  Control_Merge m_3 ( // @[aeloss_push.scala 40:19]
    .clock(m_3_clock),
    .reset(m_3_reset),
    .dataIn_0_ready(m_3_dataIn_0_ready),
    .dataIn_0_valid(m_3_dataIn_0_valid),
    .dataIn_1_ready(m_3_dataIn_1_ready),
    .dataIn_1_valid(m_3_dataIn_1_valid),
    .condition_ready(m_3_condition_ready),
    .condition_valid(m_3_condition_valid),
    .condition_bits(m_3_condition_bits),
    .dataOut_ready(m_3_dataOut_ready),
    .dataOut_valid(m_3_dataOut_valid)
  );
  ElasticBuffer buf_4 ( // @[aeloss_push.scala 49:21]
    .clock(buf_4_clock),
    .reset(buf_4_reset),
    .dataIn_ready(buf_4_dataIn_ready),
    .dataIn_valid(buf_4_dataIn_valid),
    .dataOut_ready(buf_4_dataOut_ready),
    .dataOut_valid(buf_4_dataOut_valid)
  );
  Branch b_5 ( // @[aeloss_push.scala 54:19]
    .dataIn_ready(b_5_dataIn_ready),
    .dataIn_valid(b_5_dataIn_valid),
    .dataOut_0_ready(b_5_dataOut_0_ready),
    .dataOut_0_valid(b_5_dataOut_0_valid),
    .condition_ready(b_5_condition_ready),
    .condition_valid(b_5_condition_valid),
    .condition_bits(b_5_condition_bits)
  );
  MuxDynamic m_6 ( // @[aeloss_push.scala 63:19]
    .clock(m_6_clock),
    .reset(m_6_reset),
    .dataIn_0_ready(m_6_dataIn_0_ready),
    .dataIn_0_valid(m_6_dataIn_0_valid),
    .dataIn_0_bits(m_6_dataIn_0_bits),
    .dataIn_1_ready(m_6_dataIn_1_ready),
    .dataIn_1_valid(m_6_dataIn_1_valid),
    .dataIn_1_bits(m_6_dataIn_1_bits),
    .dataOut_ready(m_6_dataOut_ready),
    .dataOut_valid(m_6_dataOut_valid),
    .dataOut_bits(m_6_dataOut_bits),
    .condition_ready(m_6_condition_ready),
    .condition_valid(m_6_condition_valid),
    .condition_bits(m_6_condition_bits)
  );
  ElasticBuffer_1 buf_7 ( // @[aeloss_push.scala 72:21]
    .clock(buf_7_clock),
    .reset(buf_7_reset),
    .dataIn_ready(buf_7_dataIn_ready),
    .dataIn_valid(buf_7_dataIn_valid),
    .dataIn_bits(buf_7_dataIn_bits),
    .dataOut_ready(buf_7_dataOut_ready),
    .dataOut_valid(buf_7_dataOut_valid),
    .dataOut_bits(buf_7_dataOut_bits)
  );
  Branch_1 b_8 ( // @[aeloss_push.scala 77:19]
    .dataIn_ready(b_8_dataIn_ready),
    .dataIn_valid(b_8_dataIn_valid),
    .dataIn_bits(b_8_dataIn_bits),
    .dataOut_0_ready(b_8_dataOut_0_ready),
    .dataOut_0_valid(b_8_dataOut_0_valid),
    .dataOut_0_bits(b_8_dataOut_0_bits),
    .dataOut_1_ready(b_8_dataOut_1_ready),
    .dataOut_1_valid(b_8_dataOut_1_valid),
    .dataOut_1_bits(b_8_dataOut_1_bits),
    .condition_ready(b_8_condition_ready),
    .condition_valid(b_8_condition_valid),
    .condition_bits(b_8_condition_bits)
  );
  Constant const_9 ( // @[aeloss_push.scala 86:23]
    .control_ready(const_9_control_ready),
    .control_valid(const_9_control_valid),
    .dataIn_bits(const_9_dataIn_bits),
    .dataOut_ready(const_9_dataOut_ready),
    .dataOut_valid(const_9_dataOut_valid),
    .dataOut_bits(const_9_dataOut_bits)
  );
  Constant_1 const_10 ( // @[aeloss_push.scala 93:24]
    .control_ready(const_10_control_ready),
    .control_valid(const_10_control_valid),
    .dataIn_bits(const_10_dataIn_bits),
    .dataOut_ready(const_10_dataOut_ready),
    .dataOut_valid(const_10_dataOut_valid),
    .dataOut_bits(const_10_dataOut_bits)
  );
  MuxDynamic_1 m_11 ( // @[aeloss_push.scala 100:20]
    .clock(m_11_clock),
    .reset(m_11_reset),
    .dataIn_0_ready(m_11_dataIn_0_ready),
    .dataIn_0_valid(m_11_dataIn_0_valid),
    .dataIn_0_bits(m_11_dataIn_0_bits),
    .dataIn_1_ready(m_11_dataIn_1_ready),
    .dataIn_1_valid(m_11_dataIn_1_valid),
    .dataIn_1_bits(m_11_dataIn_1_bits),
    .dataOut_ready(m_11_dataOut_ready),
    .dataOut_valid(m_11_dataOut_valid),
    .dataOut_bits(m_11_dataOut_bits),
    .condition_ready(m_11_condition_ready),
    .condition_valid(m_11_condition_valid),
    .condition_bits(m_11_condition_bits)
  );
  ElasticBuffer_2 buf_12 ( // @[aeloss_push.scala 109:22]
    .clock(buf_12_clock),
    .reset(buf_12_reset),
    .dataIn_ready(buf_12_dataIn_ready),
    .dataIn_valid(buf_12_dataIn_valid),
    .dataIn_bits(buf_12_dataIn_bits),
    .dataOut_ready(buf_12_dataOut_ready),
    .dataOut_valid(buf_12_dataOut_valid),
    .dataOut_bits(buf_12_dataOut_bits)
  );
  Branch_2 b_13 ( // @[aeloss_push.scala 114:20]
    .dataIn_ready(b_13_dataIn_ready),
    .dataIn_valid(b_13_dataIn_valid),
    .dataIn_bits(b_13_dataIn_bits),
    .dataOut_0_ready(b_13_dataOut_0_ready),
    .dataOut_0_valid(b_13_dataOut_0_valid),
    .dataOut_0_bits(b_13_dataOut_0_bits),
    .condition_ready(b_13_condition_ready),
    .condition_valid(b_13_condition_valid),
    .condition_bits(b_13_condition_bits)
  );
  Constant_1 const_14 ( // @[aeloss_push.scala 123:24]
    .control_ready(const_14_control_ready),
    .control_valid(const_14_control_valid),
    .dataIn_bits(const_14_dataIn_bits),
    .dataOut_ready(const_14_dataOut_ready),
    .dataOut_valid(const_14_dataOut_valid),
    .dataOut_bits(const_14_dataOut_bits)
  );
  MuxDynamic_1 m_15 ( // @[aeloss_push.scala 130:20]
    .clock(m_15_clock),
    .reset(m_15_reset),
    .dataIn_0_ready(m_15_dataIn_0_ready),
    .dataIn_0_valid(m_15_dataIn_0_valid),
    .dataIn_0_bits(m_15_dataIn_0_bits),
    .dataIn_1_ready(m_15_dataIn_1_ready),
    .dataIn_1_valid(m_15_dataIn_1_valid),
    .dataIn_1_bits(m_15_dataIn_1_bits),
    .dataOut_ready(m_15_dataOut_ready),
    .dataOut_valid(m_15_dataOut_valid),
    .dataOut_bits(m_15_dataOut_bits),
    .condition_ready(m_15_condition_ready),
    .condition_valid(m_15_condition_valid),
    .condition_bits(m_15_condition_bits)
  );
  ElasticBuffer_2 buf_16 ( // @[aeloss_push.scala 139:22]
    .clock(buf_16_clock),
    .reset(buf_16_reset),
    .dataIn_ready(buf_16_dataIn_ready),
    .dataIn_valid(buf_16_dataIn_valid),
    .dataIn_bits(buf_16_dataIn_bits),
    .dataOut_ready(buf_16_dataOut_ready),
    .dataOut_valid(buf_16_dataOut_valid),
    .dataOut_bits(buf_16_dataOut_bits)
  );
  Branch_2 b_17 ( // @[aeloss_push.scala 144:20]
    .dataIn_ready(b_17_dataIn_ready),
    .dataIn_valid(b_17_dataIn_valid),
    .dataIn_bits(b_17_dataIn_bits),
    .dataOut_0_ready(b_17_dataOut_0_ready),
    .dataOut_0_valid(b_17_dataOut_0_valid),
    .dataOut_0_bits(b_17_dataOut_0_bits),
    .condition_ready(b_17_condition_ready),
    .condition_valid(b_17_condition_valid),
    .condition_bits(b_17_condition_bits)
  );
  Constant_1 const_18 ( // @[aeloss_push.scala 153:24]
    .control_ready(const_18_control_ready),
    .control_valid(const_18_control_valid),
    .dataIn_bits(const_18_dataIn_bits),
    .dataOut_ready(const_18_dataOut_ready),
    .dataOut_valid(const_18_dataOut_valid),
    .dataOut_bits(const_18_dataOut_bits)
  );
  MuxDynamic_1 m_19 ( // @[aeloss_push.scala 160:20]
    .clock(m_19_clock),
    .reset(m_19_reset),
    .dataIn_0_ready(m_19_dataIn_0_ready),
    .dataIn_0_valid(m_19_dataIn_0_valid),
    .dataIn_0_bits(m_19_dataIn_0_bits),
    .dataIn_1_ready(m_19_dataIn_1_ready),
    .dataIn_1_valid(m_19_dataIn_1_valid),
    .dataIn_1_bits(m_19_dataIn_1_bits),
    .dataOut_ready(m_19_dataOut_ready),
    .dataOut_valid(m_19_dataOut_valid),
    .dataOut_bits(m_19_dataOut_bits),
    .condition_ready(m_19_condition_ready),
    .condition_valid(m_19_condition_valid),
    .condition_bits(m_19_condition_bits)
  );
  ElasticBuffer_2 buf_20 ( // @[aeloss_push.scala 169:22]
    .clock(buf_20_clock),
    .reset(buf_20_reset),
    .dataIn_ready(buf_20_dataIn_ready),
    .dataIn_valid(buf_20_dataIn_valid),
    .dataIn_bits(buf_20_dataIn_bits),
    .dataOut_ready(buf_20_dataOut_ready),
    .dataOut_valid(buf_20_dataOut_valid),
    .dataOut_bits(buf_20_dataOut_bits)
  );
  Branch_2 b_21 ( // @[aeloss_push.scala 174:20]
    .dataIn_ready(b_21_dataIn_ready),
    .dataIn_valid(b_21_dataIn_valid),
    .dataIn_bits(b_21_dataIn_bits),
    .dataOut_0_ready(b_21_dataOut_0_ready),
    .dataOut_0_valid(b_21_dataOut_0_valid),
    .dataOut_0_bits(b_21_dataOut_0_bits),
    .condition_ready(b_21_condition_ready),
    .condition_valid(b_21_condition_valid),
    .condition_bits(b_21_condition_bits)
  );
  AddIDynamic addi_22 ( // @[aeloss_push.scala 183:23]
    .operand0_ready(addi_22_operand0_ready),
    .operand0_valid(addi_22_operand0_valid),
    .operand0_bits(addi_22_operand0_bits),
    .operand1_ready(addi_22_operand1_ready),
    .operand1_valid(addi_22_operand1_valid),
    .operand1_bits(addi_22_operand1_bits),
    .result_ready(addi_22_result_ready),
    .result_valid(addi_22_result_valid),
    .result_bits(addi_22_result_bits)
  );
  Load load_23 ( // @[aeloss_push.scala 190:23]
    .address_in_ready(load_23_address_in_ready),
    .address_in_valid(load_23_address_in_valid),
    .address_in_bits(load_23_address_in_bits),
    .data_out_ready(load_23_data_out_ready),
    .data_out_valid(load_23_data_out_valid),
    .data_out_bits(load_23_data_out_bits),
    .address_out_ready(load_23_address_out_ready),
    .address_out_valid(load_23_address_out_valid),
    .address_out_bits(load_23_address_out_bits),
    .data_in_ready(load_23_data_in_ready),
    .data_in_valid(load_23_data_in_valid),
    .data_in_bits(load_23_data_in_bits)
  );
  TruncIDynamic trunci_24 ( // @[aeloss_push.scala 201:25]
    .operand_ready(trunci_24_operand_ready),
    .operand_valid(trunci_24_operand_valid),
    .operand_bits(trunci_24_operand_bits),
    .result_ready(trunci_24_result_ready),
    .result_valid(trunci_24_result_valid),
    .result_bits(trunci_24_result_bits)
  );
  Branch b_25 ( // @[aeloss_push.scala 206:20]
    .dataIn_ready(b_25_dataIn_ready),
    .dataIn_valid(b_25_dataIn_valid),
    .dataOut_0_ready(b_25_dataOut_0_ready),
    .dataOut_0_valid(b_25_dataOut_0_valid),
    .condition_ready(b_25_condition_ready),
    .condition_valid(b_25_condition_valid),
    .condition_bits(b_25_condition_bits)
  );
  Branch_2 b_26 ( // @[aeloss_push.scala 215:20]
    .dataIn_ready(b_26_dataIn_ready),
    .dataIn_valid(b_26_dataIn_valid),
    .dataIn_bits(b_26_dataIn_bits),
    .dataOut_0_ready(b_26_dataOut_0_ready),
    .dataOut_0_valid(b_26_dataOut_0_valid),
    .dataOut_0_bits(b_26_dataOut_0_bits),
    .condition_ready(b_26_condition_ready),
    .condition_valid(b_26_condition_valid),
    .condition_bits(b_26_condition_bits)
  );
  Branch_1 b_27 ( // @[aeloss_push.scala 224:20]
    .dataIn_ready(b_27_dataIn_ready),
    .dataIn_valid(b_27_dataIn_valid),
    .dataIn_bits(b_27_dataIn_bits),
    .dataOut_0_ready(b_27_dataOut_0_ready),
    .dataOut_0_valid(b_27_dataOut_0_valid),
    .dataOut_0_bits(b_27_dataOut_0_bits),
    .dataOut_1_ready(b_27_dataOut_1_ready),
    .dataOut_1_valid(b_27_dataOut_1_valid),
    .dataOut_1_bits(b_27_dataOut_1_bits),
    .condition_ready(b_27_condition_ready),
    .condition_valid(b_27_condition_valid),
    .condition_bits(b_27_condition_bits)
  );
  MuxDynamic m_28 ( // @[aeloss_push.scala 233:20]
    .clock(m_28_clock),
    .reset(m_28_reset),
    .dataIn_0_ready(m_28_dataIn_0_ready),
    .dataIn_0_valid(m_28_dataIn_0_valid),
    .dataIn_0_bits(m_28_dataIn_0_bits),
    .dataIn_1_ready(m_28_dataIn_1_ready),
    .dataIn_1_valid(m_28_dataIn_1_valid),
    .dataIn_1_bits(m_28_dataIn_1_bits),
    .dataOut_ready(m_28_dataOut_ready),
    .dataOut_valid(m_28_dataOut_valid),
    .dataOut_bits(m_28_dataOut_bits),
    .condition_ready(m_28_condition_ready),
    .condition_valid(m_28_condition_valid),
    .condition_bits(m_28_condition_bits)
  );
  LessEqualthanIDynamic cmpi_sle_29 ( // @[aeloss_push.scala 242:27]
    .operand0_ready(cmpi_sle_29_operand0_ready),
    .operand0_valid(cmpi_sle_29_operand0_valid),
    .operand0_bits(cmpi_sle_29_operand0_bits),
    .operand1_ready(cmpi_sle_29_operand1_ready),
    .operand1_valid(cmpi_sle_29_operand1_valid),
    .operand1_bits(cmpi_sle_29_operand1_bits),
    .result_ready(cmpi_sle_29_result_ready),
    .result_valid(cmpi_sle_29_result_valid),
    .result_bits(cmpi_sle_29_result_bits)
  );
  Control_Merge m_30 ( // @[aeloss_push.scala 249:20]
    .clock(m_30_clock),
    .reset(m_30_reset),
    .dataIn_0_ready(m_30_dataIn_0_ready),
    .dataIn_0_valid(m_30_dataIn_0_valid),
    .dataIn_1_ready(m_30_dataIn_1_ready),
    .dataIn_1_valid(m_30_dataIn_1_valid),
    .condition_ready(m_30_condition_ready),
    .condition_valid(m_30_condition_valid),
    .condition_bits(m_30_condition_bits),
    .dataOut_ready(m_30_dataOut_ready),
    .dataOut_valid(m_30_dataOut_valid)
  );
  ElasticBuffer buf_31 ( // @[aeloss_push.scala 258:22]
    .clock(buf_31_clock),
    .reset(buf_31_reset),
    .dataIn_ready(buf_31_dataIn_ready),
    .dataIn_valid(buf_31_dataIn_valid),
    .dataOut_ready(buf_31_dataOut_ready),
    .dataOut_valid(buf_31_dataOut_valid)
  );
  Branch b_32 ( // @[aeloss_push.scala 263:20]
    .dataIn_ready(b_32_dataIn_ready),
    .dataIn_valid(b_32_dataIn_valid),
    .dataOut_0_ready(b_32_dataOut_0_ready),
    .dataOut_0_valid(b_32_dataOut_0_valid),
    .condition_ready(b_32_condition_ready),
    .condition_valid(b_32_condition_valid),
    .condition_bits(b_32_condition_bits)
  );
  MuxDynamic m_33 ( // @[aeloss_push.scala 272:20]
    .clock(m_33_clock),
    .reset(m_33_reset),
    .dataIn_0_ready(m_33_dataIn_0_ready),
    .dataIn_0_valid(m_33_dataIn_0_valid),
    .dataIn_0_bits(m_33_dataIn_0_bits),
    .dataIn_1_ready(m_33_dataIn_1_ready),
    .dataIn_1_valid(m_33_dataIn_1_valid),
    .dataIn_1_bits(m_33_dataIn_1_bits),
    .dataOut_ready(m_33_dataOut_ready),
    .dataOut_valid(m_33_dataOut_valid),
    .dataOut_bits(m_33_dataOut_bits),
    .condition_ready(m_33_condition_ready),
    .condition_valid(m_33_condition_valid),
    .condition_bits(m_33_condition_bits)
  );
  ElasticBuffer_1 buf_34 ( // @[aeloss_push.scala 281:22]
    .clock(buf_34_clock),
    .reset(buf_34_reset),
    .dataIn_ready(buf_34_dataIn_ready),
    .dataIn_valid(buf_34_dataIn_valid),
    .dataIn_bits(buf_34_dataIn_bits),
    .dataOut_ready(buf_34_dataOut_ready),
    .dataOut_valid(buf_34_dataOut_valid),
    .dataOut_bits(buf_34_dataOut_bits)
  );
  Branch_1 b_35 ( // @[aeloss_push.scala 286:20]
    .dataIn_ready(b_35_dataIn_ready),
    .dataIn_valid(b_35_dataIn_valid),
    .dataIn_bits(b_35_dataIn_bits),
    .dataOut_0_ready(b_35_dataOut_0_ready),
    .dataOut_0_valid(b_35_dataOut_0_valid),
    .dataOut_0_bits(b_35_dataOut_0_bits),
    .dataOut_1_ready(b_35_dataOut_1_ready),
    .dataOut_1_valid(b_35_dataOut_1_valid),
    .dataOut_1_bits(b_35_dataOut_1_bits),
    .condition_ready(b_35_condition_ready),
    .condition_valid(b_35_condition_valid),
    .condition_bits(b_35_condition_bits)
  );
  Constant_1 const_36 ( // @[aeloss_push.scala 295:24]
    .control_ready(const_36_control_ready),
    .control_valid(const_36_control_valid),
    .dataIn_bits(const_36_dataIn_bits),
    .dataOut_ready(const_36_dataOut_ready),
    .dataOut_valid(const_36_dataOut_valid),
    .dataOut_bits(const_36_dataOut_bits)
  );
  MuxDynamic_1 m_37 ( // @[aeloss_push.scala 302:20]
    .clock(m_37_clock),
    .reset(m_37_reset),
    .dataIn_0_ready(m_37_dataIn_0_ready),
    .dataIn_0_valid(m_37_dataIn_0_valid),
    .dataIn_0_bits(m_37_dataIn_0_bits),
    .dataIn_1_ready(m_37_dataIn_1_ready),
    .dataIn_1_valid(m_37_dataIn_1_valid),
    .dataIn_1_bits(m_37_dataIn_1_bits),
    .dataOut_ready(m_37_dataOut_ready),
    .dataOut_valid(m_37_dataOut_valid),
    .dataOut_bits(m_37_dataOut_bits),
    .condition_ready(m_37_condition_ready),
    .condition_valid(m_37_condition_valid),
    .condition_bits(m_37_condition_bits)
  );
  ElasticBuffer_2 buf_38 ( // @[aeloss_push.scala 311:22]
    .clock(buf_38_clock),
    .reset(buf_38_reset),
    .dataIn_ready(buf_38_dataIn_ready),
    .dataIn_valid(buf_38_dataIn_valid),
    .dataIn_bits(buf_38_dataIn_bits),
    .dataOut_ready(buf_38_dataOut_ready),
    .dataOut_valid(buf_38_dataOut_valid),
    .dataOut_bits(buf_38_dataOut_bits)
  );
  Branch_2 b_39 ( // @[aeloss_push.scala 316:20]
    .dataIn_ready(b_39_dataIn_ready),
    .dataIn_valid(b_39_dataIn_valid),
    .dataIn_bits(b_39_dataIn_bits),
    .dataOut_0_ready(b_39_dataOut_0_ready),
    .dataOut_0_valid(b_39_dataOut_0_valid),
    .dataOut_0_bits(b_39_dataOut_0_bits),
    .condition_ready(b_39_condition_ready),
    .condition_valid(b_39_condition_valid),
    .condition_bits(b_39_condition_bits)
  );
  Constant_1 const_40 ( // @[aeloss_push.scala 325:24]
    .control_ready(const_40_control_ready),
    .control_valid(const_40_control_valid),
    .dataIn_bits(const_40_dataIn_bits),
    .dataOut_ready(const_40_dataOut_ready),
    .dataOut_valid(const_40_dataOut_valid),
    .dataOut_bits(const_40_dataOut_bits)
  );
  MuxDynamic_1 m_41 ( // @[aeloss_push.scala 332:20]
    .clock(m_41_clock),
    .reset(m_41_reset),
    .dataIn_0_ready(m_41_dataIn_0_ready),
    .dataIn_0_valid(m_41_dataIn_0_valid),
    .dataIn_0_bits(m_41_dataIn_0_bits),
    .dataIn_1_ready(m_41_dataIn_1_ready),
    .dataIn_1_valid(m_41_dataIn_1_valid),
    .dataIn_1_bits(m_41_dataIn_1_bits),
    .dataOut_ready(m_41_dataOut_ready),
    .dataOut_valid(m_41_dataOut_valid),
    .dataOut_bits(m_41_dataOut_bits),
    .condition_ready(m_41_condition_ready),
    .condition_valid(m_41_condition_valid),
    .condition_bits(m_41_condition_bits)
  );
  ElasticBuffer_2 buf_42 ( // @[aeloss_push.scala 341:22]
    .clock(buf_42_clock),
    .reset(buf_42_reset),
    .dataIn_ready(buf_42_dataIn_ready),
    .dataIn_valid(buf_42_dataIn_valid),
    .dataIn_bits(buf_42_dataIn_bits),
    .dataOut_ready(buf_42_dataOut_ready),
    .dataOut_valid(buf_42_dataOut_valid),
    .dataOut_bits(buf_42_dataOut_bits)
  );
  Branch_2 b_43 ( // @[aeloss_push.scala 346:20]
    .dataIn_ready(b_43_dataIn_ready),
    .dataIn_valid(b_43_dataIn_valid),
    .dataIn_bits(b_43_dataIn_bits),
    .dataOut_0_ready(b_43_dataOut_0_ready),
    .dataOut_0_valid(b_43_dataOut_0_valid),
    .dataOut_0_bits(b_43_dataOut_0_bits),
    .condition_ready(b_43_condition_ready),
    .condition_valid(b_43_condition_valid),
    .condition_bits(b_43_condition_bits)
  );
  Constant_1 const_44 ( // @[aeloss_push.scala 355:24]
    .control_ready(const_44_control_ready),
    .control_valid(const_44_control_valid),
    .dataIn_bits(const_44_dataIn_bits),
    .dataOut_ready(const_44_dataOut_ready),
    .dataOut_valid(const_44_dataOut_valid),
    .dataOut_bits(const_44_dataOut_bits)
  );
  MuxDynamic_1 m_45 ( // @[aeloss_push.scala 362:20]
    .clock(m_45_clock),
    .reset(m_45_reset),
    .dataIn_0_ready(m_45_dataIn_0_ready),
    .dataIn_0_valid(m_45_dataIn_0_valid),
    .dataIn_0_bits(m_45_dataIn_0_bits),
    .dataIn_1_ready(m_45_dataIn_1_ready),
    .dataIn_1_valid(m_45_dataIn_1_valid),
    .dataIn_1_bits(m_45_dataIn_1_bits),
    .dataOut_ready(m_45_dataOut_ready),
    .dataOut_valid(m_45_dataOut_valid),
    .dataOut_bits(m_45_dataOut_bits),
    .condition_ready(m_45_condition_ready),
    .condition_valid(m_45_condition_valid),
    .condition_bits(m_45_condition_bits)
  );
  ElasticBuffer_2 buf_46 ( // @[aeloss_push.scala 371:22]
    .clock(buf_46_clock),
    .reset(buf_46_reset),
    .dataIn_ready(buf_46_dataIn_ready),
    .dataIn_valid(buf_46_dataIn_valid),
    .dataIn_bits(buf_46_dataIn_bits),
    .dataOut_ready(buf_46_dataOut_ready),
    .dataOut_valid(buf_46_dataOut_valid),
    .dataOut_bits(buf_46_dataOut_bits)
  );
  Branch_2 b_47 ( // @[aeloss_push.scala 376:20]
    .dataIn_ready(b_47_dataIn_ready),
    .dataIn_valid(b_47_dataIn_valid),
    .dataIn_bits(b_47_dataIn_bits),
    .dataOut_0_ready(b_47_dataOut_0_ready),
    .dataOut_0_valid(b_47_dataOut_0_valid),
    .dataOut_0_bits(b_47_dataOut_0_bits),
    .condition_ready(b_47_condition_ready),
    .condition_valid(b_47_condition_valid),
    .condition_bits(b_47_condition_bits)
  );
  MuxDynamic_1 m_48 ( // @[aeloss_push.scala 385:20]
    .clock(m_48_clock),
    .reset(m_48_reset),
    .dataIn_0_ready(m_48_dataIn_0_ready),
    .dataIn_0_valid(m_48_dataIn_0_valid),
    .dataIn_0_bits(m_48_dataIn_0_bits),
    .dataIn_1_ready(m_48_dataIn_1_ready),
    .dataIn_1_valid(m_48_dataIn_1_valid),
    .dataIn_1_bits(m_48_dataIn_1_bits),
    .dataOut_ready(m_48_dataOut_ready),
    .dataOut_valid(m_48_dataOut_valid),
    .dataOut_bits(m_48_dataOut_bits),
    .condition_ready(m_48_condition_ready),
    .condition_valid(m_48_condition_valid),
    .condition_bits(m_48_condition_bits)
  );
  ElasticBuffer_2 buf_49 ( // @[aeloss_push.scala 394:22]
    .clock(buf_49_clock),
    .reset(buf_49_reset),
    .dataIn_ready(buf_49_dataIn_ready),
    .dataIn_valid(buf_49_dataIn_valid),
    .dataIn_bits(buf_49_dataIn_bits),
    .dataOut_ready(buf_49_dataOut_ready),
    .dataOut_valid(buf_49_dataOut_valid),
    .dataOut_bits(buf_49_dataOut_bits)
  );
  Branch_2 b_50 ( // @[aeloss_push.scala 399:20]
    .dataIn_ready(b_50_dataIn_ready),
    .dataIn_valid(b_50_dataIn_valid),
    .dataIn_bits(b_50_dataIn_bits),
    .dataOut_0_ready(b_50_dataOut_0_ready),
    .dataOut_0_valid(b_50_dataOut_0_valid),
    .dataOut_0_bits(b_50_dataOut_0_bits),
    .condition_ready(b_50_condition_ready),
    .condition_valid(b_50_condition_valid),
    .condition_bits(b_50_condition_bits)
  );
  AddIDynamic addi_51 ( // @[aeloss_push.scala 408:23]
    .operand0_ready(addi_51_operand0_ready),
    .operand0_valid(addi_51_operand0_valid),
    .operand0_bits(addi_51_operand0_bits),
    .operand1_ready(addi_51_operand1_ready),
    .operand1_valid(addi_51_operand1_valid),
    .operand1_bits(addi_51_operand1_bits),
    .result_ready(addi_51_result_ready),
    .result_valid(addi_51_result_valid),
    .result_bits(addi_51_result_bits)
  );
  Load_1 load_52 ( // @[aeloss_push.scala 415:23]
    .address_in_ready(load_52_address_in_ready),
    .address_in_valid(load_52_address_in_valid),
    .address_in_bits(load_52_address_in_bits),
    .data_out_ready(load_52_data_out_ready),
    .data_out_valid(load_52_data_out_valid),
    .data_out_bits(load_52_data_out_bits),
    .address_out_ready(load_52_address_out_ready),
    .address_out_valid(load_52_address_out_valid),
    .address_out_bits(load_52_address_out_bits),
    .data_in_ready(load_52_data_in_ready),
    .data_in_valid(load_52_data_in_valid),
    .data_in_bits(load_52_data_in_bits)
  );
  Load_1 load_53 ( // @[aeloss_push.scala 426:23]
    .address_in_ready(load_53_address_in_ready),
    .address_in_valid(load_53_address_in_valid),
    .address_in_bits(load_53_address_in_bits),
    .data_out_ready(load_53_data_out_ready),
    .data_out_valid(load_53_data_out_valid),
    .data_out_bits(load_53_data_out_bits),
    .address_out_ready(load_53_address_out_ready),
    .address_out_valid(load_53_address_out_valid),
    .address_out_bits(load_53_address_out_bits),
    .data_in_ready(load_53_data_in_ready),
    .data_in_valid(load_53_data_in_valid),
    .data_in_bits(load_53_data_in_bits)
  );
  SubFDynamic subf_54 ( // @[aeloss_push.scala 437:23]
    .clock(subf_54_clock),
    .reset(subf_54_reset),
    .operand0_ready(subf_54_operand0_ready),
    .operand0_valid(subf_54_operand0_valid),
    .operand0_bits(subf_54_operand0_bits),
    .operand1_ready(subf_54_operand1_ready),
    .operand1_valid(subf_54_operand1_valid),
    .operand1_bits(subf_54_operand1_bits),
    .result_ready(subf_54_result_ready),
    .result_valid(subf_54_result_valid),
    .result_bits(subf_54_result_bits)
  );
  CmpFDynamic cmpf_55 ( // @[aeloss_push.scala 444:23]
    .clock(cmpf_55_clock),
    .reset(cmpf_55_reset),
    .operand0_ready(cmpf_55_operand0_ready),
    .operand0_valid(cmpf_55_operand0_valid),
    .operand0_bits(cmpf_55_operand0_bits),
    .operand1_ready(cmpf_55_operand1_ready),
    .operand1_valid(cmpf_55_operand1_valid),
    .operand1_bits(cmpf_55_operand1_bits),
    .result_ready(cmpf_55_result_ready),
    .result_valid(cmpf_55_result_valid),
    .result_bits(cmpf_55_result_bits)
  );
  Constant const_56 ( // @[aeloss_push.scala 451:24]
    .control_ready(const_56_control_ready),
    .control_valid(const_56_control_valid),
    .dataIn_bits(const_56_dataIn_bits),
    .dataOut_ready(const_56_dataOut_ready),
    .dataOut_valid(const_56_dataOut_valid),
    .dataOut_bits(const_56_dataOut_bits)
  );
  SubFDynamic subf_57 ( // @[aeloss_push.scala 458:23]
    .clock(subf_57_clock),
    .reset(subf_57_reset),
    .operand0_ready(subf_57_operand0_ready),
    .operand0_valid(subf_57_operand0_valid),
    .operand0_bits(subf_57_operand0_bits),
    .operand1_ready(subf_57_operand1_ready),
    .operand1_valid(subf_57_operand1_valid),
    .operand1_bits(subf_57_operand1_bits),
    .result_ready(subf_57_result_ready),
    .result_valid(subf_57_result_valid),
    .result_bits(subf_57_result_bits)
  );
  Constant const_58 ( // @[aeloss_push.scala 465:24]
    .control_ready(const_58_control_ready),
    .control_valid(const_58_control_valid),
    .dataIn_bits(const_58_dataIn_bits),
    .dataOut_ready(const_58_dataOut_ready),
    .dataOut_valid(const_58_dataOut_valid),
    .dataOut_bits(const_58_dataOut_bits)
  );
  AddFDynamic addf_59 ( // @[aeloss_push.scala 472:23]
    .clock(addf_59_clock),
    .reset(addf_59_reset),
    .operand0_ready(addf_59_operand0_ready),
    .operand0_valid(addf_59_operand0_valid),
    .operand0_bits(addf_59_operand0_bits),
    .operand1_ready(addf_59_operand1_ready),
    .operand1_valid(addf_59_operand1_valid),
    .operand1_bits(addf_59_operand1_bits),
    .result_ready(addf_59_result_ready),
    .result_valid(addf_59_result_valid),
    .result_bits(addf_59_result_bits)
  );
  Constant const_60 ( // @[aeloss_push.scala 479:24]
    .control_ready(const_60_control_ready),
    .control_valid(const_60_control_valid),
    .dataIn_bits(const_60_dataIn_bits),
    .dataOut_ready(const_60_dataOut_ready),
    .dataOut_valid(const_60_dataOut_valid),
    .dataOut_bits(const_60_dataOut_bits)
  );
  Select select_61 ( // @[aeloss_push.scala 486:25]
    .dataIn_0_ready(select_61_dataIn_0_ready),
    .dataIn_0_valid(select_61_dataIn_0_valid),
    .dataIn_0_bits(select_61_dataIn_0_bits),
    .dataIn_1_ready(select_61_dataIn_1_ready),
    .dataIn_1_valid(select_61_dataIn_1_valid),
    .dataIn_1_bits(select_61_dataIn_1_bits),
    .condition_ready(select_61_condition_ready),
    .condition_valid(select_61_condition_valid),
    .condition_bits(select_61_condition_bits),
    .dataOut_ready(select_61_dataOut_ready),
    .dataOut_valid(select_61_dataOut_valid),
    .dataOut_bits(select_61_dataOut_bits)
  );
  CmpFDynamic cmpf_62 ( // @[aeloss_push.scala 495:23]
    .clock(cmpf_62_clock),
    .reset(cmpf_62_reset),
    .operand0_ready(cmpf_62_operand0_ready),
    .operand0_valid(cmpf_62_operand0_valid),
    .operand0_bits(cmpf_62_operand0_bits),
    .operand1_ready(cmpf_62_operand1_ready),
    .operand1_valid(cmpf_62_operand1_valid),
    .operand1_bits(cmpf_62_operand1_bits),
    .result_ready(cmpf_62_result_ready),
    .result_valid(cmpf_62_result_valid),
    .result_bits(cmpf_62_result_bits)
  );
  Constant const_63 ( // @[aeloss_push.scala 502:24]
    .control_ready(const_63_control_ready),
    .control_valid(const_63_control_valid),
    .dataIn_bits(const_63_dataIn_bits),
    .dataOut_ready(const_63_dataOut_ready),
    .dataOut_valid(const_63_dataOut_valid),
    .dataOut_bits(const_63_dataOut_bits)
  );
  Select select_64 ( // @[aeloss_push.scala 509:25]
    .dataIn_0_ready(select_64_dataIn_0_ready),
    .dataIn_0_valid(select_64_dataIn_0_valid),
    .dataIn_0_bits(select_64_dataIn_0_bits),
    .dataIn_1_ready(select_64_dataIn_1_ready),
    .dataIn_1_valid(select_64_dataIn_1_valid),
    .dataIn_1_bits(select_64_dataIn_1_bits),
    .condition_ready(select_64_condition_ready),
    .condition_valid(select_64_condition_valid),
    .condition_bits(select_64_condition_bits),
    .dataOut_ready(select_64_dataOut_ready),
    .dataOut_valid(select_64_dataOut_valid),
    .dataOut_bits(select_64_dataOut_bits)
  );
  Constant const_65 ( // @[aeloss_push.scala 518:24]
    .control_ready(const_65_control_ready),
    .control_valid(const_65_control_valid),
    .dataIn_bits(const_65_dataIn_bits),
    .dataOut_ready(const_65_dataOut_ready),
    .dataOut_valid(const_65_dataOut_valid),
    .dataOut_bits(const_65_dataOut_bits)
  );
  Load load_66 ( // @[aeloss_push.scala 525:23]
    .address_in_ready(load_66_address_in_ready),
    .address_in_valid(load_66_address_in_valid),
    .address_in_bits(load_66_address_in_bits),
    .data_out_ready(load_66_data_out_ready),
    .data_out_valid(load_66_data_out_valid),
    .data_out_bits(load_66_data_out_bits),
    .address_out_ready(load_66_address_out_ready),
    .address_out_valid(load_66_address_out_valid),
    .address_out_bits(load_66_address_out_bits),
    .data_in_ready(load_66_data_in_ready),
    .data_in_valid(load_66_data_in_valid),
    .data_in_bits(load_66_data_in_bits)
  );
  NotEqualIDynamic cmpi_67 ( // @[aeloss_push.scala 536:23]
    .operand0_ready(cmpi_67_operand0_ready),
    .operand0_valid(cmpi_67_operand0_valid),
    .operand0_bits(cmpi_67_operand0_bits),
    .operand1_ready(cmpi_67_operand1_ready),
    .operand1_valid(cmpi_67_operand1_valid),
    .operand1_bits(cmpi_67_operand1_bits),
    .result_ready(cmpi_67_result_ready),
    .result_valid(cmpi_67_result_valid),
    .result_bits(cmpi_67_result_bits)
  );
  TruncIDynamic trunci_68 ( // @[aeloss_push.scala 543:25]
    .operand_ready(trunci_68_operand_ready),
    .operand_valid(trunci_68_operand_valid),
    .operand_bits(trunci_68_operand_bits),
    .result_ready(trunci_68_result_ready),
    .result_valid(trunci_68_result_valid),
    .result_bits(trunci_68_result_bits)
  );
  AndDynamic and_69 ( // @[aeloss_push.scala 548:22]
    .operand0_ready(and_69_operand0_ready),
    .operand0_valid(and_69_operand0_valid),
    .operand0_bits(and_69_operand0_bits),
    .operand1_ready(and_69_operand1_ready),
    .operand1_valid(and_69_operand1_valid),
    .operand1_bits(and_69_operand1_bits),
    .result_ready(and_69_result_ready),
    .result_valid(and_69_result_valid),
    .result_bits(and_69_result_bits)
  );
  Branch b_70 ( // @[aeloss_push.scala 555:20]
    .dataIn_ready(b_70_dataIn_ready),
    .dataIn_valid(b_70_dataIn_valid),
    .dataOut_0_ready(b_70_dataOut_0_ready),
    .dataOut_0_valid(b_70_dataOut_0_valid),
    .condition_ready(b_70_condition_ready),
    .condition_valid(b_70_condition_valid),
    .condition_bits(b_70_condition_bits)
  );
  Branch_1 b_71 ( // @[aeloss_push.scala 564:20]
    .dataIn_ready(b_71_dataIn_ready),
    .dataIn_valid(b_71_dataIn_valid),
    .dataIn_bits(b_71_dataIn_bits),
    .dataOut_0_ready(b_71_dataOut_0_ready),
    .dataOut_0_valid(b_71_dataOut_0_valid),
    .dataOut_0_bits(b_71_dataOut_0_bits),
    .dataOut_1_ready(b_71_dataOut_1_ready),
    .dataOut_1_valid(b_71_dataOut_1_valid),
    .dataOut_1_bits(b_71_dataOut_1_bits),
    .condition_ready(b_71_condition_ready),
    .condition_valid(b_71_condition_valid),
    .condition_bits(b_71_condition_bits)
  );
  Branch_1 b_72 ( // @[aeloss_push.scala 573:20]
    .dataIn_ready(b_72_dataIn_ready),
    .dataIn_valid(b_72_dataIn_valid),
    .dataIn_bits(b_72_dataIn_bits),
    .dataOut_0_ready(b_72_dataOut_0_ready),
    .dataOut_0_valid(b_72_dataOut_0_valid),
    .dataOut_0_bits(b_72_dataOut_0_bits),
    .dataOut_1_ready(b_72_dataOut_1_ready),
    .dataOut_1_valid(b_72_dataOut_1_valid),
    .dataOut_1_bits(b_72_dataOut_1_bits),
    .condition_ready(b_72_condition_ready),
    .condition_valid(b_72_condition_valid),
    .condition_bits(b_72_condition_bits)
  );
  MuxDynamic m_73 ( // @[aeloss_push.scala 582:20]
    .clock(m_73_clock),
    .reset(m_73_reset),
    .dataIn_0_ready(m_73_dataIn_0_ready),
    .dataIn_0_valid(m_73_dataIn_0_valid),
    .dataIn_0_bits(m_73_dataIn_0_bits),
    .dataIn_1_ready(m_73_dataIn_1_ready),
    .dataIn_1_valid(m_73_dataIn_1_valid),
    .dataIn_1_bits(m_73_dataIn_1_bits),
    .dataOut_ready(m_73_dataOut_ready),
    .dataOut_valid(m_73_dataOut_valid),
    .dataOut_bits(m_73_dataOut_bits),
    .condition_ready(m_73_condition_ready),
    .condition_valid(m_73_condition_valid),
    .condition_bits(m_73_condition_bits)
  );
  SubFDynamic subf_74 ( // @[aeloss_push.scala 591:23]
    .clock(subf_74_clock),
    .reset(subf_74_reset),
    .operand0_ready(subf_74_operand0_ready),
    .operand0_valid(subf_74_operand0_valid),
    .operand0_bits(subf_74_operand0_bits),
    .operand1_ready(subf_74_operand1_ready),
    .operand1_valid(subf_74_operand1_valid),
    .operand1_bits(subf_74_operand1_bits),
    .result_ready(subf_74_result_ready),
    .result_valid(subf_74_result_valid),
    .result_bits(subf_74_result_bits)
  );
  Constant const_75 ( // @[aeloss_push.scala 598:24]
    .control_ready(const_75_control_ready),
    .control_valid(const_75_control_valid),
    .dataIn_bits(const_75_dataIn_bits),
    .dataOut_ready(const_75_dataOut_ready),
    .dataOut_valid(const_75_dataOut_valid),
    .dataOut_bits(const_75_dataOut_bits)
  );
  DivFDynamic divf_76 ( // @[aeloss_push.scala 605:23]
    .clock(divf_76_clock),
    .reset(divf_76_reset),
    .operand0_ready(divf_76_operand0_ready),
    .operand0_valid(divf_76_operand0_valid),
    .operand0_bits(divf_76_operand0_bits),
    .operand1_ready(divf_76_operand1_ready),
    .operand1_valid(divf_76_operand1_valid),
    .operand1_bits(divf_76_operand1_bits),
    .result_ready(divf_76_result_ready),
    .result_valid(divf_76_result_valid),
    .result_bits(divf_76_result_bits)
  );
  Constant const_77 ( // @[aeloss_push.scala 612:24]
    .control_ready(const_77_control_ready),
    .control_valid(const_77_control_valid),
    .dataIn_bits(const_77_dataIn_bits),
    .dataOut_ready(const_77_dataOut_ready),
    .dataOut_valid(const_77_dataOut_valid),
    .dataOut_bits(const_77_dataOut_bits)
  );
  AddFDynamic addf_78 ( // @[aeloss_push.scala 619:23]
    .clock(addf_78_clock),
    .reset(addf_78_reset),
    .operand0_ready(addf_78_operand0_ready),
    .operand0_valid(addf_78_operand0_valid),
    .operand0_bits(addf_78_operand0_bits),
    .operand1_ready(addf_78_operand1_ready),
    .operand1_valid(addf_78_operand1_valid),
    .operand1_bits(addf_78_operand1_bits),
    .result_ready(addf_78_result_ready),
    .result_valid(addf_78_result_valid),
    .result_bits(addf_78_result_bits)
  );
  Fork_2 f_79 ( // @[aeloss_push.scala 626:20]
    .clock(f_79_clock),
    .reset(f_79_reset),
    .dataIn_ready(f_79_dataIn_ready),
    .dataIn_valid(f_79_dataIn_valid),
    .dataIn_bits(f_79_dataIn_bits),
    .dataOut_0_ready(f_79_dataOut_0_ready),
    .dataOut_0_valid(f_79_dataOut_0_valid),
    .dataOut_0_bits(f_79_dataOut_0_bits),
    .dataOut_1_ready(f_79_dataOut_1_ready),
    .dataOut_1_valid(f_79_dataOut_1_valid),
    .dataOut_1_bits(f_79_dataOut_1_bits),
    .dataOut_2_ready(f_79_dataOut_2_ready),
    .dataOut_2_valid(f_79_dataOut_2_valid),
    .dataOut_2_bits(f_79_dataOut_2_bits),
    .dataOut_3_ready(f_79_dataOut_3_ready),
    .dataOut_3_valid(f_79_dataOut_3_valid),
    .dataOut_3_bits(f_79_dataOut_3_bits),
    .dataOut_4_ready(f_79_dataOut_4_ready),
    .dataOut_4_valid(f_79_dataOut_4_valid),
    .dataOut_4_bits(f_79_dataOut_4_bits)
  );
  Fork_3 f_80 ( // @[aeloss_push.scala 639:20]
    .clock(f_80_clock),
    .reset(f_80_reset),
    .dataIn_ready(f_80_dataIn_ready),
    .dataIn_valid(f_80_dataIn_valid),
    .dataIn_bits(f_80_dataIn_bits),
    .dataOut_0_ready(f_80_dataOut_0_ready),
    .dataOut_0_valid(f_80_dataOut_0_valid),
    .dataOut_0_bits(f_80_dataOut_0_bits),
    .dataOut_1_ready(f_80_dataOut_1_ready),
    .dataOut_1_valid(f_80_dataOut_1_valid),
    .dataOut_1_bits(f_80_dataOut_1_bits),
    .dataOut_2_ready(f_80_dataOut_2_ready),
    .dataOut_2_valid(f_80_dataOut_2_valid),
    .dataOut_2_bits(f_80_dataOut_2_bits),
    .dataOut_3_ready(f_80_dataOut_3_ready),
    .dataOut_3_valid(f_80_dataOut_3_valid),
    .dataOut_3_bits(f_80_dataOut_3_bits)
  );
  Fork_4 f_81 ( // @[aeloss_push.scala 650:20]
    .clock(f_81_clock),
    .reset(f_81_reset),
    .dataIn_ready(f_81_dataIn_ready),
    .dataIn_valid(f_81_dataIn_valid),
    .dataOut_0_ready(f_81_dataOut_0_ready),
    .dataOut_0_valid(f_81_dataOut_0_valid),
    .dataOut_1_ready(f_81_dataOut_1_ready),
    .dataOut_1_valid(f_81_dataOut_1_valid)
  );
  Fork_5 f_82 ( // @[aeloss_push.scala 659:20]
    .clock(f_82_clock),
    .reset(f_82_reset),
    .dataIn_ready(f_82_dataIn_ready),
    .dataIn_valid(f_82_dataIn_valid),
    .dataIn_bits(f_82_dataIn_bits),
    .dataOut_0_ready(f_82_dataOut_0_ready),
    .dataOut_0_valid(f_82_dataOut_0_valid),
    .dataOut_0_bits(f_82_dataOut_0_bits),
    .dataOut_1_ready(f_82_dataOut_1_ready),
    .dataOut_1_valid(f_82_dataOut_1_valid),
    .dataOut_1_bits(f_82_dataOut_1_bits)
  );
  Fork_5 f_83 ( // @[aeloss_push.scala 666:20]
    .clock(f_83_clock),
    .reset(f_83_reset),
    .dataIn_ready(f_83_dataIn_ready),
    .dataIn_valid(f_83_dataIn_valid),
    .dataIn_bits(f_83_dataIn_bits),
    .dataOut_0_ready(f_83_dataOut_0_ready),
    .dataOut_0_valid(f_83_dataOut_0_valid),
    .dataOut_0_bits(f_83_dataOut_0_bits),
    .dataOut_1_ready(f_83_dataOut_1_ready),
    .dataOut_1_valid(f_83_dataOut_1_valid),
    .dataOut_1_bits(f_83_dataOut_1_bits)
  );
  Fork_5 f_84 ( // @[aeloss_push.scala 673:20]
    .clock(f_84_clock),
    .reset(f_84_reset),
    .dataIn_ready(f_84_dataIn_ready),
    .dataIn_valid(f_84_dataIn_valid),
    .dataIn_bits(f_84_dataIn_bits),
    .dataOut_0_ready(f_84_dataOut_0_ready),
    .dataOut_0_valid(f_84_dataOut_0_valid),
    .dataOut_0_bits(f_84_dataOut_0_bits),
    .dataOut_1_ready(f_84_dataOut_1_ready),
    .dataOut_1_valid(f_84_dataOut_1_valid),
    .dataOut_1_bits(f_84_dataOut_1_bits)
  );
  Fork_8 f_85 ( // @[aeloss_push.scala 680:20]
    .clock(f_85_clock),
    .reset(f_85_reset),
    .dataIn_ready(f_85_dataIn_ready),
    .dataIn_valid(f_85_dataIn_valid),
    .dataIn_bits(f_85_dataIn_bits),
    .dataOut_0_ready(f_85_dataOut_0_ready),
    .dataOut_0_valid(f_85_dataOut_0_valid),
    .dataOut_0_bits(f_85_dataOut_0_bits),
    .dataOut_1_ready(f_85_dataOut_1_ready),
    .dataOut_1_valid(f_85_dataOut_1_valid),
    .dataOut_1_bits(f_85_dataOut_1_bits),
    .dataOut_2_ready(f_85_dataOut_2_ready),
    .dataOut_2_valid(f_85_dataOut_2_valid),
    .dataOut_2_bits(f_85_dataOut_2_bits)
  );
  Fork_3 f_86 ( // @[aeloss_push.scala 689:20]
    .clock(f_86_clock),
    .reset(f_86_reset),
    .dataIn_ready(f_86_dataIn_ready),
    .dataIn_valid(f_86_dataIn_valid),
    .dataIn_bits(f_86_dataIn_bits),
    .dataOut_0_ready(f_86_dataOut_0_ready),
    .dataOut_0_valid(f_86_dataOut_0_valid),
    .dataOut_0_bits(f_86_dataOut_0_bits),
    .dataOut_1_ready(f_86_dataOut_1_ready),
    .dataOut_1_valid(f_86_dataOut_1_valid),
    .dataOut_1_bits(f_86_dataOut_1_bits),
    .dataOut_2_ready(f_86_dataOut_2_ready),
    .dataOut_2_valid(f_86_dataOut_2_valid),
    .dataOut_2_bits(f_86_dataOut_2_bits),
    .dataOut_3_ready(f_86_dataOut_3_ready),
    .dataOut_3_valid(f_86_dataOut_3_valid),
    .dataOut_3_bits(f_86_dataOut_3_bits)
  );
  Fork_10 f_87 ( // @[aeloss_push.scala 700:20]
    .clock(f_87_clock),
    .reset(f_87_reset),
    .dataIn_ready(f_87_dataIn_ready),
    .dataIn_valid(f_87_dataIn_valid),
    .dataOut_0_ready(f_87_dataOut_0_ready),
    .dataOut_0_valid(f_87_dataOut_0_valid),
    .dataOut_1_ready(f_87_dataOut_1_ready),
    .dataOut_1_valid(f_87_dataOut_1_valid),
    .dataOut_2_ready(f_87_dataOut_2_ready),
    .dataOut_2_valid(f_87_dataOut_2_valid),
    .dataOut_3_ready(f_87_dataOut_3_ready),
    .dataOut_3_valid(f_87_dataOut_3_valid)
  );
  Fork_11 f_88 ( // @[aeloss_push.scala 711:20]
    .clock(f_88_clock),
    .reset(f_88_reset),
    .dataIn_ready(f_88_dataIn_ready),
    .dataIn_valid(f_88_dataIn_valid),
    .dataIn_bits(f_88_dataIn_bits),
    .dataOut_0_ready(f_88_dataOut_0_ready),
    .dataOut_0_valid(f_88_dataOut_0_valid),
    .dataOut_0_bits(f_88_dataOut_0_bits),
    .dataOut_1_ready(f_88_dataOut_1_ready),
    .dataOut_1_valid(f_88_dataOut_1_valid),
    .dataOut_1_bits(f_88_dataOut_1_bits),
    .dataOut_2_ready(f_88_dataOut_2_ready),
    .dataOut_2_valid(f_88_dataOut_2_valid),
    .dataOut_2_bits(f_88_dataOut_2_bits),
    .dataOut_3_ready(f_88_dataOut_3_ready),
    .dataOut_3_valid(f_88_dataOut_3_valid),
    .dataOut_3_bits(f_88_dataOut_3_bits),
    .dataOut_4_ready(f_88_dataOut_4_ready),
    .dataOut_4_valid(f_88_dataOut_4_valid),
    .dataOut_4_bits(f_88_dataOut_4_bits),
    .dataOut_5_ready(f_88_dataOut_5_ready),
    .dataOut_5_valid(f_88_dataOut_5_valid),
    .dataOut_5_bits(f_88_dataOut_5_bits)
  );
  Fork_2 f_89 ( // @[aeloss_push.scala 726:20]
    .clock(f_89_clock),
    .reset(f_89_reset),
    .dataIn_ready(f_89_dataIn_ready),
    .dataIn_valid(f_89_dataIn_valid),
    .dataIn_bits(f_89_dataIn_bits),
    .dataOut_0_ready(f_89_dataOut_0_ready),
    .dataOut_0_valid(f_89_dataOut_0_valid),
    .dataOut_0_bits(f_89_dataOut_0_bits),
    .dataOut_1_ready(f_89_dataOut_1_ready),
    .dataOut_1_valid(f_89_dataOut_1_valid),
    .dataOut_1_bits(f_89_dataOut_1_bits),
    .dataOut_2_ready(f_89_dataOut_2_ready),
    .dataOut_2_valid(f_89_dataOut_2_valid),
    .dataOut_2_bits(f_89_dataOut_2_bits),
    .dataOut_3_ready(f_89_dataOut_3_ready),
    .dataOut_3_valid(f_89_dataOut_3_valid),
    .dataOut_3_bits(f_89_dataOut_3_bits),
    .dataOut_4_ready(f_89_dataOut_4_ready),
    .dataOut_4_valid(f_89_dataOut_4_valid),
    .dataOut_4_bits(f_89_dataOut_4_bits)
  );
  Fork_13 f_90 ( // @[aeloss_push.scala 739:20]
    .clock(f_90_clock),
    .reset(f_90_reset),
    .dataIn_ready(f_90_dataIn_ready),
    .dataIn_valid(f_90_dataIn_valid),
    .dataOut_0_ready(f_90_dataOut_0_ready),
    .dataOut_0_valid(f_90_dataOut_0_valid),
    .dataOut_1_ready(f_90_dataOut_1_ready),
    .dataOut_1_valid(f_90_dataOut_1_valid),
    .dataOut_3_ready(f_90_dataOut_3_ready),
    .dataOut_3_valid(f_90_dataOut_3_valid),
    .dataOut_4_ready(f_90_dataOut_4_ready),
    .dataOut_4_valid(f_90_dataOut_4_valid),
    .dataOut_5_ready(f_90_dataOut_5_ready),
    .dataOut_5_valid(f_90_dataOut_5_valid),
    .dataOut_6_ready(f_90_dataOut_6_ready),
    .dataOut_6_valid(f_90_dataOut_6_valid),
    .dataOut_7_ready(f_90_dataOut_7_ready),
    .dataOut_7_valid(f_90_dataOut_7_valid)
  );
  Fork_5 f_91 ( // @[aeloss_push.scala 762:20]
    .clock(f_91_clock),
    .reset(f_91_reset),
    .dataIn_ready(f_91_dataIn_ready),
    .dataIn_valid(f_91_dataIn_valid),
    .dataIn_bits(f_91_dataIn_bits),
    .dataOut_0_ready(f_91_dataOut_0_ready),
    .dataOut_0_valid(f_91_dataOut_0_valid),
    .dataOut_0_bits(f_91_dataOut_0_bits),
    .dataOut_1_ready(f_91_dataOut_1_ready),
    .dataOut_1_valid(f_91_dataOut_1_valid),
    .dataOut_1_bits(f_91_dataOut_1_bits)
  );
  Fork_5 f_92 ( // @[aeloss_push.scala 769:20]
    .clock(f_92_clock),
    .reset(f_92_reset),
    .dataIn_ready(f_92_dataIn_ready),
    .dataIn_valid(f_92_dataIn_valid),
    .dataIn_bits(f_92_dataIn_bits),
    .dataOut_0_ready(f_92_dataOut_0_ready),
    .dataOut_0_valid(f_92_dataOut_0_valid),
    .dataOut_0_bits(f_92_dataOut_0_bits),
    .dataOut_1_ready(f_92_dataOut_1_ready),
    .dataOut_1_valid(f_92_dataOut_1_valid),
    .dataOut_1_bits(f_92_dataOut_1_bits)
  );
  Fork_8 f_93 ( // @[aeloss_push.scala 776:20]
    .clock(f_93_clock),
    .reset(f_93_reset),
    .dataIn_ready(f_93_dataIn_ready),
    .dataIn_valid(f_93_dataIn_valid),
    .dataIn_bits(f_93_dataIn_bits),
    .dataOut_0_ready(f_93_dataOut_0_ready),
    .dataOut_0_valid(f_93_dataOut_0_valid),
    .dataOut_0_bits(f_93_dataOut_0_bits),
    .dataOut_1_ready(f_93_dataOut_1_ready),
    .dataOut_1_valid(f_93_dataOut_1_valid),
    .dataOut_1_bits(f_93_dataOut_1_bits),
    .dataOut_2_ready(f_93_dataOut_2_ready),
    .dataOut_2_valid(f_93_dataOut_2_valid),
    .dataOut_2_bits(f_93_dataOut_2_bits)
  );
  Fork_5 f_94 ( // @[aeloss_push.scala 785:20]
    .clock(f_94_clock),
    .reset(f_94_reset),
    .dataIn_ready(f_94_dataIn_ready),
    .dataIn_valid(f_94_dataIn_valid),
    .dataIn_bits(f_94_dataIn_bits),
    .dataOut_0_ready(f_94_dataOut_0_ready),
    .dataOut_0_valid(f_94_dataOut_0_valid),
    .dataOut_0_bits(f_94_dataOut_0_bits),
    .dataOut_1_ready(f_94_dataOut_1_ready),
    .dataOut_1_valid(f_94_dataOut_1_valid),
    .dataOut_1_bits(f_94_dataOut_1_bits)
  );
  Fork_18 f_95 ( // @[aeloss_push.scala 792:20]
    .clock(f_95_clock),
    .reset(f_95_reset),
    .dataIn_ready(f_95_dataIn_ready),
    .dataIn_valid(f_95_dataIn_valid),
    .dataIn_bits(f_95_dataIn_bits),
    .dataOut_0_ready(f_95_dataOut_0_ready),
    .dataOut_0_valid(f_95_dataOut_0_valid),
    .dataOut_0_bits(f_95_dataOut_0_bits),
    .dataOut_1_ready(f_95_dataOut_1_ready),
    .dataOut_1_valid(f_95_dataOut_1_valid),
    .dataOut_1_bits(f_95_dataOut_1_bits),
    .dataOut_2_ready(f_95_dataOut_2_ready),
    .dataOut_2_valid(f_95_dataOut_2_valid),
    .dataOut_2_bits(f_95_dataOut_2_bits),
    .dataOut_3_ready(f_95_dataOut_3_ready),
    .dataOut_3_valid(f_95_dataOut_3_valid),
    .dataOut_3_bits(f_95_dataOut_3_bits)
  );
  Fork_19 f_96 ( // @[aeloss_push.scala 803:20]
    .clock(f_96_clock),
    .reset(f_96_reset),
    .dataIn_ready(f_96_dataIn_ready),
    .dataIn_valid(f_96_dataIn_valid),
    .dataIn_bits(f_96_dataIn_bits),
    .dataOut_0_ready(f_96_dataOut_0_ready),
    .dataOut_0_valid(f_96_dataOut_0_valid),
    .dataOut_0_bits(f_96_dataOut_0_bits),
    .dataOut_1_ready(f_96_dataOut_1_ready),
    .dataOut_1_valid(f_96_dataOut_1_valid),
    .dataOut_1_bits(f_96_dataOut_1_bits),
    .dataOut_2_ready(f_96_dataOut_2_ready),
    .dataOut_2_valid(f_96_dataOut_2_valid),
    .dataOut_2_bits(f_96_dataOut_2_bits)
  );
  Fork_20 f_97 ( // @[aeloss_push.scala 812:20]
    .clock(f_97_clock),
    .reset(f_97_reset),
    .dataIn_ready(f_97_dataIn_ready),
    .dataIn_valid(f_97_dataIn_valid),
    .dataIn_bits(f_97_dataIn_bits),
    .dataOut_0_ready(f_97_dataOut_0_ready),
    .dataOut_0_valid(f_97_dataOut_0_valid),
    .dataOut_0_bits(f_97_dataOut_0_bits),
    .dataOut_1_ready(f_97_dataOut_1_ready),
    .dataOut_1_valid(f_97_dataOut_1_valid),
    .dataOut_1_bits(f_97_dataOut_1_bits)
  );
  Fork_3 f_98 ( // @[aeloss_push.scala 819:20]
    .clock(f_98_clock),
    .reset(f_98_reset),
    .dataIn_ready(f_98_dataIn_ready),
    .dataIn_valid(f_98_dataIn_valid),
    .dataIn_bits(f_98_dataIn_bits),
    .dataOut_0_ready(f_98_dataOut_0_ready),
    .dataOut_0_valid(f_98_dataOut_0_valid),
    .dataOut_0_bits(f_98_dataOut_0_bits),
    .dataOut_1_ready(f_98_dataOut_1_ready),
    .dataOut_1_valid(f_98_dataOut_1_valid),
    .dataOut_1_bits(f_98_dataOut_1_bits),
    .dataOut_2_ready(f_98_dataOut_2_ready),
    .dataOut_2_valid(f_98_dataOut_2_valid),
    .dataOut_2_bits(f_98_dataOut_2_bits),
    .dataOut_3_ready(f_98_dataOut_3_ready),
    .dataOut_3_valid(f_98_dataOut_3_valid),
    .dataOut_3_bits(f_98_dataOut_3_bits)
  );
  Fork_22 f_99 ( // @[aeloss_push.scala 830:20]
    .clock(f_99_clock),
    .reset(f_99_reset),
    .dataIn_ready(f_99_dataIn_ready),
    .dataIn_valid(f_99_dataIn_valid),
    .dataOut_0_ready(f_99_dataOut_0_ready),
    .dataOut_0_valid(f_99_dataOut_0_valid),
    .dataOut_1_ready(f_99_dataOut_1_ready),
    .dataOut_1_valid(f_99_dataOut_1_valid)
  );
  ElasticFIFO fifo_100 ( // @[aeloss_push.scala 837:24]
    .clock(fifo_100_clock),
    .reset(fifo_100_reset),
    .dataIn_ready(fifo_100_dataIn_ready),
    .dataIn_valid(fifo_100_dataIn_valid),
    .dataIn_bits(fifo_100_dataIn_bits),
    .dataOut_ready(fifo_100_dataOut_ready),
    .dataOut_valid(fifo_100_dataOut_valid),
    .dataOut_bits(fifo_100_dataOut_bits)
  );
  ElasticFIFO fifo_101 ( // @[aeloss_push.scala 842:24]
    .clock(fifo_101_clock),
    .reset(fifo_101_reset),
    .dataIn_ready(fifo_101_dataIn_ready),
    .dataIn_valid(fifo_101_dataIn_valid),
    .dataIn_bits(fifo_101_dataIn_bits),
    .dataOut_ready(fifo_101_dataOut_ready),
    .dataOut_valid(fifo_101_dataOut_valid),
    .dataOut_bits(fifo_101_dataOut_bits)
  );
  ElasticFIFO fifo_102 ( // @[aeloss_push.scala 847:24]
    .clock(fifo_102_clock),
    .reset(fifo_102_reset),
    .dataIn_ready(fifo_102_dataIn_ready),
    .dataIn_valid(fifo_102_dataIn_valid),
    .dataIn_bits(fifo_102_dataIn_bits),
    .dataOut_ready(fifo_102_dataOut_ready),
    .dataOut_valid(fifo_102_dataOut_valid),
    .dataOut_bits(fifo_102_dataOut_bits)
  );
  ElasticFIFO_3 fifo_103 ( // @[aeloss_push.scala 852:24]
    .clock(fifo_103_clock),
    .reset(fifo_103_reset),
    .dataIn_ready(fifo_103_dataIn_ready),
    .dataIn_valid(fifo_103_dataIn_valid),
    .dataIn_bits(fifo_103_dataIn_bits),
    .dataOut_ready(fifo_103_dataOut_ready),
    .dataOut_valid(fifo_103_dataOut_valid),
    .dataOut_bits(fifo_103_dataOut_bits)
  );
  ElasticFIFO fifo_104 ( // @[aeloss_push.scala 857:24]
    .clock(fifo_104_clock),
    .reset(fifo_104_reset),
    .dataIn_ready(fifo_104_dataIn_ready),
    .dataIn_valid(fifo_104_dataIn_valid),
    .dataIn_bits(fifo_104_dataIn_bits),
    .dataOut_ready(fifo_104_dataOut_ready),
    .dataOut_valid(fifo_104_dataOut_valid),
    .dataOut_bits(fifo_104_dataOut_bits)
  );
  ElasticFIFO_3 fifo_105 ( // @[aeloss_push.scala 862:24]
    .clock(fifo_105_clock),
    .reset(fifo_105_reset),
    .dataIn_ready(fifo_105_dataIn_ready),
    .dataIn_valid(fifo_105_dataIn_valid),
    .dataIn_bits(fifo_105_dataIn_bits),
    .dataOut_ready(fifo_105_dataOut_ready),
    .dataOut_valid(fifo_105_dataOut_valid),
    .dataOut_bits(fifo_105_dataOut_bits)
  );
  ElasticFIFO fifo_106 ( // @[aeloss_push.scala 867:24]
    .clock(fifo_106_clock),
    .reset(fifo_106_reset),
    .dataIn_ready(fifo_106_dataIn_ready),
    .dataIn_valid(fifo_106_dataIn_valid),
    .dataIn_bits(fifo_106_dataIn_bits),
    .dataOut_ready(fifo_106_dataOut_ready),
    .dataOut_valid(fifo_106_dataOut_valid),
    .dataOut_bits(fifo_106_dataOut_bits)
  );
  ElasticFIFO_3 fifo_107 ( // @[aeloss_push.scala 872:24]
    .clock(fifo_107_clock),
    .reset(fifo_107_reset),
    .dataIn_ready(fifo_107_dataIn_ready),
    .dataIn_valid(fifo_107_dataIn_valid),
    .dataIn_bits(fifo_107_dataIn_bits),
    .dataOut_ready(fifo_107_dataOut_ready),
    .dataOut_valid(fifo_107_dataOut_valid),
    .dataOut_bits(fifo_107_dataOut_bits)
  );
  ElasticFIFO_3 fifo_108 ( // @[aeloss_push.scala 877:24]
    .clock(fifo_108_clock),
    .reset(fifo_108_reset),
    .dataIn_ready(fifo_108_dataIn_ready),
    .dataIn_valid(fifo_108_dataIn_valid),
    .dataIn_bits(fifo_108_dataIn_bits),
    .dataOut_ready(fifo_108_dataOut_ready),
    .dataOut_valid(fifo_108_dataOut_valid),
    .dataOut_bits(fifo_108_dataOut_bits)
  );
  ElasticFIFO_9 fifo_109 ( // @[aeloss_push.scala 882:24]
    .clock(fifo_109_clock),
    .reset(fifo_109_reset),
    .dataIn_ready(fifo_109_dataIn_ready),
    .dataIn_valid(fifo_109_dataIn_valid),
    .dataIn_bits(fifo_109_dataIn_bits),
    .dataOut_ready(fifo_109_dataOut_ready),
    .dataOut_valid(fifo_109_dataOut_valid),
    .dataOut_bits(fifo_109_dataOut_bits)
  );
  ElasticFIFO_10 fifo_110 ( // @[aeloss_push.scala 887:24]
    .clock(fifo_110_clock),
    .reset(fifo_110_reset),
    .dataIn_ready(fifo_110_dataIn_ready),
    .dataIn_valid(fifo_110_dataIn_valid),
    .dataIn_bits(fifo_110_dataIn_bits),
    .dataOut_ready(fifo_110_dataOut_ready),
    .dataOut_valid(fifo_110_dataOut_valid),
    .dataOut_bits(fifo_110_dataOut_bits)
  );
  ElasticFIFO fifo_111 ( // @[aeloss_push.scala 892:24]
    .clock(fifo_111_clock),
    .reset(fifo_111_reset),
    .dataIn_ready(fifo_111_dataIn_ready),
    .dataIn_valid(fifo_111_dataIn_valid),
    .dataIn_bits(fifo_111_dataIn_bits),
    .dataOut_ready(fifo_111_dataOut_ready),
    .dataOut_valid(fifo_111_dataOut_valid),
    .dataOut_bits(fifo_111_dataOut_bits)
  );
  ElasticFIFO fifo_112 ( // @[aeloss_push.scala 897:24]
    .clock(fifo_112_clock),
    .reset(fifo_112_reset),
    .dataIn_ready(fifo_112_dataIn_ready),
    .dataIn_valid(fifo_112_dataIn_valid),
    .dataIn_bits(fifo_112_dataIn_bits),
    .dataOut_ready(fifo_112_dataOut_ready),
    .dataOut_valid(fifo_112_dataOut_valid),
    .dataOut_bits(fifo_112_dataOut_bits)
  );
  ElasticFIFO_13 fifo_113 ( // @[aeloss_push.scala 902:24]
    .clock(fifo_113_clock),
    .reset(fifo_113_reset),
    .dataIn_ready(fifo_113_dataIn_ready),
    .dataIn_valid(fifo_113_dataIn_valid),
    .dataIn_bits(fifo_113_dataIn_bits),
    .dataOut_ready(fifo_113_dataOut_ready),
    .dataOut_valid(fifo_113_dataOut_valid),
    .dataOut_bits(fifo_113_dataOut_bits)
  );
  ElasticFIFO_14 fifo_114 ( // @[aeloss_push.scala 907:24]
    .clock(fifo_114_clock),
    .reset(fifo_114_reset),
    .dataIn_ready(fifo_114_dataIn_ready),
    .dataIn_valid(fifo_114_dataIn_valid),
    .dataIn_bits(fifo_114_dataIn_bits),
    .dataOut_ready(fifo_114_dataOut_ready),
    .dataOut_valid(fifo_114_dataOut_valid),
    .dataOut_bits(fifo_114_dataOut_bits)
  );
  ElasticFIFO_15 fifo_115 ( // @[aeloss_push.scala 912:24]
    .clock(fifo_115_clock),
    .reset(fifo_115_reset),
    .dataIn_ready(fifo_115_dataIn_ready),
    .dataIn_valid(fifo_115_dataIn_valid),
    .dataIn_bits(fifo_115_dataIn_bits),
    .dataOut_ready(fifo_115_dataOut_ready),
    .dataOut_valid(fifo_115_dataOut_valid),
    .dataOut_bits(fifo_115_dataOut_bits)
  );
  ElasticFIFO_16 fifo_116 ( // @[aeloss_push.scala 917:24]
    .clock(fifo_116_clock),
    .reset(fifo_116_reset),
    .dataIn_ready(fifo_116_dataIn_ready),
    .dataIn_valid(fifo_116_dataIn_valid),
    .dataIn_bits(fifo_116_dataIn_bits),
    .dataOut_ready(fifo_116_dataOut_ready),
    .dataOut_valid(fifo_116_dataOut_valid),
    .dataOut_bits(fifo_116_dataOut_bits)
  );
  assign var0_ready = const_18_control_ready; // @[aeloss_push.scala 949:9]
  assign var1_valid = b_8_dataOut_1_valid; // @[aeloss_push.scala 1081:8]
  assign var1_bits = b_8_dataOut_1_bits; // @[aeloss_push.scala 1081:8]
  assign var2_valid = 1'h0;
  assign mem_0_clock = clock;
  assign mem_0_reset = reset;
  assign mem_0_load_address_0_valid = load_52_address_out_valid; // @[aeloss_push.scala 1025:8]
  assign mem_0_load_address_0_bits = load_52_address_out_bits; // @[aeloss_push.scala 1025:8]
  assign mem_0_load_address_1_valid = load_53_address_out_valid; // @[aeloss_push.scala 1029:8]
  assign mem_0_load_address_1_bits = load_53_address_out_bits; // @[aeloss_push.scala 1029:8]
  assign mem_0_load_data_0_ready = load_52_data_in_ready; // @[aeloss_push.scala 1026:10]
  assign mem_0_load_data_1_ready = load_53_data_in_ready; // @[aeloss_push.scala 1030:10]
  assign mem_1_clock = clock;
  assign mem_1_reset = reset;
  assign mem_1_load_address_0_valid = load_23_address_out_valid; // @[aeloss_push.scala 967:8]
  assign mem_1_load_address_0_bits = load_23_address_out_bits; // @[aeloss_push.scala 967:8]
  assign mem_1_load_address_1_valid = load_66_address_out_valid; // @[aeloss_push.scala 1054:8]
  assign mem_1_load_address_1_bits = load_66_address_out_bits; // @[aeloss_push.scala 1054:8]
  assign mem_1_load_data_0_ready = load_23_data_in_ready; // @[aeloss_push.scala 968:9]
  assign mem_1_load_data_1_ready = load_66_data_in_ready; // @[aeloss_push.scala 1055:10]
  assign cmpi_sle_2_operand0_valid = f_84_dataOut_1_valid; // @[aeloss_push.scala 957:9]
  assign cmpi_sle_2_operand0_bits = f_84_dataOut_1_bits; // @[aeloss_push.scala 957:9]
  assign cmpi_sle_2_operand1_valid = f_82_dataOut_0_valid; // @[aeloss_push.scala 958:9]
  assign cmpi_sle_2_operand1_bits = f_82_dataOut_0_bits; // @[aeloss_push.scala 958:9]
  assign cmpi_sle_2_result_ready = f_79_dataIn_ready; // @[aeloss_push.scala 1082:10]
  assign m_3_clock = clock;
  assign m_3_reset = reset;
  assign m_3_dataIn_0_valid = var0_valid; // @[aeloss_push.scala 925:9]
  assign m_3_dataIn_1_valid = f_81_dataOut_0_valid; // @[aeloss_push.scala 1080:9]
  assign m_3_condition_ready = f_80_dataIn_ready; // @[aeloss_push.scala 1083:10]
  assign m_3_dataOut_ready = buf_4_dataIn_ready; // @[aeloss_push.scala 923:9]
  assign buf_4_clock = clock;
  assign buf_4_reset = reset;
  assign buf_4_dataIn_valid = m_3_dataOut_valid; // @[aeloss_push.scala 923:9]
  assign buf_4_dataOut_ready = b_5_dataIn_ready; // @[aeloss_push.scala 922:9]
  assign b_5_dataIn_valid = buf_4_dataOut_valid; // @[aeloss_push.scala 922:9]
  assign b_5_dataOut_0_ready = f_81_dataIn_ready; // @[aeloss_push.scala 1084:10]
  assign b_5_condition_valid = f_79_dataOut_4_valid; // @[aeloss_push.scala 924:9]
  assign b_5_condition_bits = f_79_dataOut_4_bits; // @[aeloss_push.scala 924:9]
  assign m_6_clock = clock;
  assign m_6_reset = reset;
  assign m_6_dataIn_0_valid = const_9_dataOut_valid; // @[aeloss_push.scala 932:9]
  assign m_6_dataIn_0_bits = const_9_dataOut_bits; // @[aeloss_push.scala 932:9]
  assign m_6_dataIn_1_valid = m_28_dataOut_valid; // @[aeloss_push.scala 1079:9]
  assign m_6_dataIn_1_bits = m_28_dataOut_bits; // @[aeloss_push.scala 1079:9]
  assign m_6_dataOut_ready = buf_7_dataIn_ready; // @[aeloss_push.scala 927:9]
  assign m_6_condition_valid = f_80_dataOut_3_valid; // @[aeloss_push.scala 933:9]
  assign m_6_condition_bits = f_80_dataOut_3_bits; // @[aeloss_push.scala 933:9]
  assign buf_7_clock = clock;
  assign buf_7_reset = reset;
  assign buf_7_dataIn_valid = m_6_dataOut_valid; // @[aeloss_push.scala 927:9]
  assign buf_7_dataIn_bits = m_6_dataOut_bits; // @[aeloss_push.scala 927:9]
  assign buf_7_dataOut_ready = b_8_dataIn_ready; // @[aeloss_push.scala 926:9]
  assign b_8_dataIn_valid = buf_7_dataOut_valid; // @[aeloss_push.scala 926:9]
  assign b_8_dataIn_bits = buf_7_dataOut_bits; // @[aeloss_push.scala 926:9]
  assign b_8_dataOut_0_ready = b_27_dataIn_ready; // @[aeloss_push.scala 975:9]
  assign b_8_dataOut_1_ready = var1_ready; // @[aeloss_push.scala 1081:8]
  assign b_8_condition_valid = f_79_dataOut_3_valid; // @[aeloss_push.scala 928:9]
  assign b_8_condition_bits = f_79_dataOut_3_bits; // @[aeloss_push.scala 928:9]
  assign const_9_control_valid = var0_valid; // @[aeloss_push.scala 929:9]
  assign const_9_dataIn_bits = 64'h0; // @[aeloss_push.scala 930:14]
  assign const_9_dataOut_ready = m_6_dataIn_0_ready; // @[aeloss_push.scala 932:9]
  assign const_10_control_valid = var0_valid; // @[aeloss_push.scala 934:9]
  assign const_10_dataIn_bits = 32'h0; // @[aeloss_push.scala 935:14]
  assign const_10_dataOut_ready = m_19_dataIn_0_ready; // @[aeloss_push.scala 956:9]
  assign m_11_clock = clock;
  assign m_11_reset = reset;
  assign m_11_dataIn_0_valid = const_14_dataOut_valid; // @[aeloss_push.scala 943:9]
  assign m_11_dataIn_0_bits = const_14_dataOut_bits; // @[aeloss_push.scala 943:9]
  assign m_11_dataIn_1_valid = b_13_dataOut_0_valid; // @[aeloss_push.scala 944:9]
  assign m_11_dataIn_1_bits = b_13_dataOut_0_bits; // @[aeloss_push.scala 944:9]
  assign m_11_dataOut_ready = buf_12_dataIn_ready; // @[aeloss_push.scala 938:9]
  assign m_11_condition_valid = f_80_dataOut_2_valid; // @[aeloss_push.scala 945:9]
  assign m_11_condition_bits = f_80_dataOut_2_bits; // @[aeloss_push.scala 945:9]
  assign buf_12_clock = clock;
  assign buf_12_reset = reset;
  assign buf_12_dataIn_valid = m_11_dataOut_valid; // @[aeloss_push.scala 938:9]
  assign buf_12_dataIn_bits = m_11_dataOut_bits; // @[aeloss_push.scala 938:9]
  assign buf_12_dataOut_ready = f_82_dataIn_ready; // @[aeloss_push.scala 1085:10]
  assign b_13_dataIn_valid = f_82_dataOut_1_valid; // @[aeloss_push.scala 937:9]
  assign b_13_dataIn_bits = f_82_dataOut_1_bits; // @[aeloss_push.scala 937:9]
  assign b_13_dataOut_0_ready = m_11_dataIn_1_ready; // @[aeloss_push.scala 944:9]
  assign b_13_condition_valid = f_79_dataOut_2_valid; // @[aeloss_push.scala 939:9]
  assign b_13_condition_bits = f_79_dataOut_2_bits; // @[aeloss_push.scala 939:9]
  assign const_14_control_valid = var0_valid; // @[aeloss_push.scala 940:9]
  assign const_14_dataIn_bits = 32'h3ff; // @[aeloss_push.scala 941:14]
  assign const_14_dataOut_ready = m_11_dataIn_0_ready; // @[aeloss_push.scala 943:9]
  assign m_15_clock = clock;
  assign m_15_reset = reset;
  assign m_15_dataIn_0_valid = const_18_dataOut_valid; // @[aeloss_push.scala 952:9]
  assign m_15_dataIn_0_bits = const_18_dataOut_bits; // @[aeloss_push.scala 952:9]
  assign m_15_dataIn_1_valid = f_83_dataOut_1_valid; // @[aeloss_push.scala 953:9]
  assign m_15_dataIn_1_bits = f_83_dataOut_1_bits; // @[aeloss_push.scala 953:9]
  assign m_15_dataOut_ready = buf_16_dataIn_ready; // @[aeloss_push.scala 947:9]
  assign m_15_condition_valid = f_80_dataOut_1_valid; // @[aeloss_push.scala 954:9]
  assign m_15_condition_bits = f_80_dataOut_1_bits; // @[aeloss_push.scala 954:9]
  assign buf_16_clock = clock;
  assign buf_16_reset = reset;
  assign buf_16_dataIn_valid = m_15_dataOut_valid; // @[aeloss_push.scala 947:9]
  assign buf_16_dataIn_bits = m_15_dataOut_bits; // @[aeloss_push.scala 947:9]
  assign buf_16_dataOut_ready = b_17_dataIn_ready; // @[aeloss_push.scala 946:9]
  assign b_17_dataIn_valid = buf_16_dataOut_valid; // @[aeloss_push.scala 946:9]
  assign b_17_dataIn_bits = buf_16_dataOut_bits; // @[aeloss_push.scala 946:9]
  assign b_17_dataOut_0_ready = f_83_dataIn_ready; // @[aeloss_push.scala 1086:10]
  assign b_17_condition_valid = f_79_dataOut_1_valid; // @[aeloss_push.scala 948:9]
  assign b_17_condition_bits = f_79_dataOut_1_bits; // @[aeloss_push.scala 948:9]
  assign const_18_control_valid = var0_valid; // @[aeloss_push.scala 949:9]
  assign const_18_dataIn_bits = 32'h1; // @[aeloss_push.scala 950:14]
  assign const_18_dataOut_ready = m_15_dataIn_0_ready; // @[aeloss_push.scala 952:9]
  assign m_19_clock = clock;
  assign m_19_reset = reset;
  assign m_19_dataIn_0_valid = const_10_dataOut_valid; // @[aeloss_push.scala 956:9]
  assign m_19_dataIn_0_bits = const_10_dataOut_bits; // @[aeloss_push.scala 956:9]
  assign m_19_dataIn_1_valid = addi_22_result_valid; // @[aeloss_push.scala 963:9]
  assign m_19_dataIn_1_bits = addi_22_result_bits; // @[aeloss_push.scala 963:9]
  assign m_19_dataOut_ready = buf_20_dataIn_ready; // @[aeloss_push.scala 955:9]
  assign m_19_condition_valid = f_80_dataOut_0_valid; // @[aeloss_push.scala 964:9]
  assign m_19_condition_bits = f_80_dataOut_0_bits; // @[aeloss_push.scala 964:9]
  assign buf_20_clock = clock;
  assign buf_20_reset = reset;
  assign buf_20_dataIn_valid = m_19_dataOut_valid; // @[aeloss_push.scala 955:9]
  assign buf_20_dataIn_bits = m_19_dataOut_bits; // @[aeloss_push.scala 955:9]
  assign buf_20_dataOut_ready = f_84_dataIn_ready; // @[aeloss_push.scala 1087:10]
  assign b_21_dataIn_valid = f_84_dataOut_0_valid; // @[aeloss_push.scala 960:9]
  assign b_21_dataIn_bits = f_84_dataOut_0_bits; // @[aeloss_push.scala 960:9]
  assign b_21_dataOut_0_ready = f_85_dataIn_ready; // @[aeloss_push.scala 1088:10]
  assign b_21_condition_valid = f_79_dataOut_0_valid; // @[aeloss_push.scala 959:9]
  assign b_21_condition_bits = f_79_dataOut_0_bits; // @[aeloss_push.scala 959:9]
  assign addi_22_operand0_valid = f_85_dataOut_2_valid; // @[aeloss_push.scala 961:9]
  assign addi_22_operand0_bits = f_85_dataOut_2_bits; // @[aeloss_push.scala 961:9]
  assign addi_22_operand1_valid = f_83_dataOut_0_valid; // @[aeloss_push.scala 962:9]
  assign addi_22_operand1_bits = f_83_dataOut_0_bits; // @[aeloss_push.scala 962:9]
  assign addi_22_result_ready = m_19_dataIn_1_ready; // @[aeloss_push.scala 963:9]
  assign load_23_address_in_valid = f_85_dataOut_1_valid; // @[aeloss_push.scala 965:9]
  assign load_23_address_in_bits = f_85_dataOut_1_bits[9:0]; // @[aeloss_push.scala 965:9]
  assign load_23_data_out_ready = trunci_24_operand_ready; // @[aeloss_push.scala 969:9]
  assign load_23_address_out_ready = mem_1_load_address_0_ready; // @[aeloss_push.scala 967:8]
  assign load_23_data_in_valid = mem_1_load_data_0_valid; // @[aeloss_push.scala 968:9]
  assign load_23_data_in_bits = mem_1_load_data_0_bits; // @[aeloss_push.scala 968:9]
  assign trunci_24_operand_valid = load_23_data_out_valid; // @[aeloss_push.scala 969:9]
  assign trunci_24_operand_bits = load_23_data_out_bits; // @[aeloss_push.scala 969:9]
  assign trunci_24_result_ready = f_86_dataIn_ready; // @[aeloss_push.scala 1089:10]
  assign b_25_dataIn_valid = f_81_dataOut_1_valid; // @[aeloss_push.scala 971:9]
  assign b_25_dataOut_0_ready = f_87_dataIn_ready; // @[aeloss_push.scala 1090:10]
  assign b_25_condition_valid = f_86_dataOut_3_valid; // @[aeloss_push.scala 970:9]
  assign b_25_condition_bits = f_86_dataOut_3_bits; // @[aeloss_push.scala 970:9]
  assign b_26_dataIn_valid = f_85_dataOut_0_valid; // @[aeloss_push.scala 973:9]
  assign b_26_dataIn_bits = f_85_dataOut_0_bits; // @[aeloss_push.scala 973:9]
  assign b_26_dataOut_0_ready = m_45_dataIn_0_ready; // @[aeloss_push.scala 1010:10]
  assign b_26_condition_valid = f_86_dataOut_2_valid; // @[aeloss_push.scala 972:9]
  assign b_26_condition_bits = f_86_dataOut_2_bits; // @[aeloss_push.scala 972:9]
  assign b_27_dataIn_valid = b_8_dataOut_0_valid; // @[aeloss_push.scala 975:9]
  assign b_27_dataIn_bits = b_8_dataOut_0_bits; // @[aeloss_push.scala 975:9]
  assign b_27_dataOut_0_ready = m_33_dataIn_0_ready; // @[aeloss_push.scala 984:10]
  assign b_27_dataOut_1_ready = m_28_dataIn_0_ready; // @[aeloss_push.scala 1078:9]
  assign b_27_condition_valid = f_86_dataOut_1_valid; // @[aeloss_push.scala 974:9]
  assign b_27_condition_bits = f_86_dataOut_1_bits; // @[aeloss_push.scala 974:9]
  assign m_28_clock = clock;
  assign m_28_reset = reset;
  assign m_28_dataIn_0_valid = b_27_dataOut_1_valid; // @[aeloss_push.scala 1078:9]
  assign m_28_dataIn_0_bits = b_27_dataOut_1_bits; // @[aeloss_push.scala 1078:9]
  assign m_28_dataIn_1_valid = b_35_dataOut_1_valid; // @[aeloss_push.scala 1077:9]
  assign m_28_dataIn_1_bits = b_35_dataOut_1_bits; // @[aeloss_push.scala 1077:9]
  assign m_28_dataOut_ready = m_6_dataIn_1_ready; // @[aeloss_push.scala 1079:9]
  assign m_28_condition_valid = f_86_dataOut_0_valid; // @[aeloss_push.scala 976:10]
  assign m_28_condition_bits = f_86_dataOut_0_bits; // @[aeloss_push.scala 976:10]
  assign cmpi_sle_29_operand0_valid = f_94_dataOut_1_valid; // @[aeloss_push.scala 1015:10]
  assign cmpi_sle_29_operand0_bits = f_94_dataOut_1_bits; // @[aeloss_push.scala 1015:10]
  assign cmpi_sle_29_operand1_valid = f_91_dataOut_0_valid; // @[aeloss_push.scala 1016:10]
  assign cmpi_sle_29_operand1_bits = f_91_dataOut_0_bits; // @[aeloss_push.scala 1016:10]
  assign cmpi_sle_29_result_ready = f_88_dataIn_ready; // @[aeloss_push.scala 1091:10]
  assign m_30_clock = clock;
  assign m_30_reset = reset;
  assign m_30_dataIn_0_valid = f_87_dataOut_3_valid; // @[aeloss_push.scala 980:10]
  assign m_30_dataIn_1_valid = f_90_dataOut_0_valid; // @[aeloss_push.scala 1076:10]
  assign m_30_condition_ready = f_89_dataIn_ready; // @[aeloss_push.scala 1092:10]
  assign m_30_dataOut_ready = buf_31_dataIn_ready; // @[aeloss_push.scala 978:10]
  assign buf_31_clock = clock;
  assign buf_31_reset = reset;
  assign buf_31_dataIn_valid = m_30_dataOut_valid; // @[aeloss_push.scala 978:10]
  assign buf_31_dataOut_ready = b_32_dataIn_ready; // @[aeloss_push.scala 977:10]
  assign b_32_dataIn_valid = buf_31_dataOut_valid; // @[aeloss_push.scala 977:10]
  assign b_32_dataOut_0_ready = f_90_dataIn_ready; // @[aeloss_push.scala 1093:10]
  assign b_32_condition_valid = f_88_dataOut_5_valid; // @[aeloss_push.scala 979:10]
  assign b_32_condition_bits = f_88_dataOut_5_bits; // @[aeloss_push.scala 979:10]
  assign m_33_clock = clock;
  assign m_33_reset = reset;
  assign m_33_dataIn_0_valid = b_27_dataOut_0_valid; // @[aeloss_push.scala 984:10]
  assign m_33_dataIn_0_bits = b_27_dataOut_0_bits; // @[aeloss_push.scala 984:10]
  assign m_33_dataIn_1_valid = m_73_dataOut_valid; // @[aeloss_push.scala 1075:10]
  assign m_33_dataIn_1_bits = m_73_dataOut_bits; // @[aeloss_push.scala 1075:10]
  assign m_33_dataOut_ready = buf_34_dataIn_ready; // @[aeloss_push.scala 982:10]
  assign m_33_condition_valid = f_89_dataOut_4_valid; // @[aeloss_push.scala 985:10]
  assign m_33_condition_bits = f_89_dataOut_4_bits; // @[aeloss_push.scala 985:10]
  assign buf_34_clock = clock;
  assign buf_34_reset = reset;
  assign buf_34_dataIn_valid = m_33_dataOut_valid; // @[aeloss_push.scala 982:10]
  assign buf_34_dataIn_bits = m_33_dataOut_bits; // @[aeloss_push.scala 982:10]
  assign buf_34_dataOut_ready = b_35_dataIn_ready; // @[aeloss_push.scala 981:10]
  assign b_35_dataIn_valid = buf_34_dataOut_valid; // @[aeloss_push.scala 981:10]
  assign b_35_dataIn_bits = buf_34_dataOut_bits; // @[aeloss_push.scala 981:10]
  assign b_35_dataOut_0_ready = b_71_dataIn_ready; // @[aeloss_push.scala 1064:10]
  assign b_35_dataOut_1_ready = m_28_dataIn_1_ready; // @[aeloss_push.scala 1077:9]
  assign b_35_condition_valid = f_88_dataOut_4_valid; // @[aeloss_push.scala 983:10]
  assign b_35_condition_bits = f_88_dataOut_4_bits; // @[aeloss_push.scala 983:10]
  assign const_36_control_valid = f_87_dataOut_2_valid; // @[aeloss_push.scala 986:10]
  assign const_36_dataIn_bits = 32'h0; // @[aeloss_push.scala 987:15]
  assign const_36_dataOut_ready = m_48_dataIn_0_ready; // @[aeloss_push.scala 1014:10]
  assign m_37_clock = clock;
  assign m_37_reset = reset;
  assign m_37_dataIn_0_valid = const_40_dataOut_valid; // @[aeloss_push.scala 995:10]
  assign m_37_dataIn_0_bits = const_40_dataOut_bits; // @[aeloss_push.scala 995:10]
  assign m_37_dataIn_1_valid = b_39_dataOut_0_valid; // @[aeloss_push.scala 996:10]
  assign m_37_dataIn_1_bits = b_39_dataOut_0_bits; // @[aeloss_push.scala 996:10]
  assign m_37_dataOut_ready = buf_38_dataIn_ready; // @[aeloss_push.scala 990:10]
  assign m_37_condition_valid = f_89_dataOut_3_valid; // @[aeloss_push.scala 997:10]
  assign m_37_condition_bits = f_89_dataOut_3_bits; // @[aeloss_push.scala 997:10]
  assign buf_38_clock = clock;
  assign buf_38_reset = reset;
  assign buf_38_dataIn_valid = m_37_dataOut_valid; // @[aeloss_push.scala 990:10]
  assign buf_38_dataIn_bits = m_37_dataOut_bits; // @[aeloss_push.scala 990:10]
  assign buf_38_dataOut_ready = f_91_dataIn_ready; // @[aeloss_push.scala 1094:10]
  assign b_39_dataIn_valid = f_91_dataOut_1_valid; // @[aeloss_push.scala 989:10]
  assign b_39_dataIn_bits = f_91_dataOut_1_bits; // @[aeloss_push.scala 989:10]
  assign b_39_dataOut_0_ready = m_37_dataIn_1_ready; // @[aeloss_push.scala 996:10]
  assign b_39_condition_valid = f_88_dataOut_3_valid; // @[aeloss_push.scala 991:10]
  assign b_39_condition_bits = f_88_dataOut_3_bits; // @[aeloss_push.scala 991:10]
  assign const_40_control_valid = f_87_dataOut_1_valid; // @[aeloss_push.scala 992:10]
  assign const_40_dataIn_bits = 32'h3ff; // @[aeloss_push.scala 993:15]
  assign const_40_dataOut_ready = m_37_dataIn_0_ready; // @[aeloss_push.scala 995:10]
  assign m_41_clock = clock;
  assign m_41_reset = reset;
  assign m_41_dataIn_0_valid = const_44_dataOut_valid; // @[aeloss_push.scala 1004:10]
  assign m_41_dataIn_0_bits = const_44_dataOut_bits; // @[aeloss_push.scala 1004:10]
  assign m_41_dataIn_1_valid = f_92_dataOut_1_valid; // @[aeloss_push.scala 1005:10]
  assign m_41_dataIn_1_bits = f_92_dataOut_1_bits; // @[aeloss_push.scala 1005:10]
  assign m_41_dataOut_ready = buf_42_dataIn_ready; // @[aeloss_push.scala 999:10]
  assign m_41_condition_valid = f_89_dataOut_2_valid; // @[aeloss_push.scala 1006:10]
  assign m_41_condition_bits = f_89_dataOut_2_bits; // @[aeloss_push.scala 1006:10]
  assign buf_42_clock = clock;
  assign buf_42_reset = reset;
  assign buf_42_dataIn_valid = m_41_dataOut_valid; // @[aeloss_push.scala 999:10]
  assign buf_42_dataIn_bits = m_41_dataOut_bits; // @[aeloss_push.scala 999:10]
  assign buf_42_dataOut_ready = b_43_dataIn_ready; // @[aeloss_push.scala 998:10]
  assign b_43_dataIn_valid = buf_42_dataOut_valid; // @[aeloss_push.scala 998:10]
  assign b_43_dataIn_bits = buf_42_dataOut_bits; // @[aeloss_push.scala 998:10]
  assign b_43_dataOut_0_ready = f_92_dataIn_ready; // @[aeloss_push.scala 1095:10]
  assign b_43_condition_valid = f_88_dataOut_2_valid; // @[aeloss_push.scala 1000:10]
  assign b_43_condition_bits = f_88_dataOut_2_bits; // @[aeloss_push.scala 1000:10]
  assign const_44_control_valid = f_87_dataOut_0_valid; // @[aeloss_push.scala 1001:10]
  assign const_44_dataIn_bits = 32'h1; // @[aeloss_push.scala 1002:15]
  assign const_44_dataOut_ready = m_41_dataIn_0_ready; // @[aeloss_push.scala 1004:10]
  assign m_45_clock = clock;
  assign m_45_reset = reset;
  assign m_45_dataIn_0_valid = b_26_dataOut_0_valid; // @[aeloss_push.scala 1010:10]
  assign m_45_dataIn_0_bits = b_26_dataOut_0_bits; // @[aeloss_push.scala 1010:10]
  assign m_45_dataIn_1_valid = f_93_dataOut_2_valid; // @[aeloss_push.scala 1011:10]
  assign m_45_dataIn_1_bits = f_93_dataOut_2_bits; // @[aeloss_push.scala 1011:10]
  assign m_45_dataOut_ready = buf_46_dataIn_ready; // @[aeloss_push.scala 1008:10]
  assign m_45_condition_valid = f_89_dataOut_1_valid; // @[aeloss_push.scala 1012:10]
  assign m_45_condition_bits = f_89_dataOut_1_bits; // @[aeloss_push.scala 1012:10]
  assign buf_46_clock = clock;
  assign buf_46_reset = reset;
  assign buf_46_dataIn_valid = m_45_dataOut_valid; // @[aeloss_push.scala 1008:10]
  assign buf_46_dataIn_bits = m_45_dataOut_bits; // @[aeloss_push.scala 1008:10]
  assign buf_46_dataOut_ready = b_47_dataIn_ready; // @[aeloss_push.scala 1007:10]
  assign b_47_dataIn_valid = buf_46_dataOut_valid; // @[aeloss_push.scala 1007:10]
  assign b_47_dataIn_bits = buf_46_dataOut_bits; // @[aeloss_push.scala 1007:10]
  assign b_47_dataOut_0_ready = f_93_dataIn_ready; // @[aeloss_push.scala 1096:10]
  assign b_47_condition_valid = f_88_dataOut_1_valid; // @[aeloss_push.scala 1009:10]
  assign b_47_condition_bits = f_88_dataOut_1_bits; // @[aeloss_push.scala 1009:10]
  assign m_48_clock = clock;
  assign m_48_reset = reset;
  assign m_48_dataIn_0_valid = const_36_dataOut_valid; // @[aeloss_push.scala 1014:10]
  assign m_48_dataIn_0_bits = const_36_dataOut_bits; // @[aeloss_push.scala 1014:10]
  assign m_48_dataIn_1_valid = addi_51_result_valid; // @[aeloss_push.scala 1021:10]
  assign m_48_dataIn_1_bits = addi_51_result_bits; // @[aeloss_push.scala 1021:10]
  assign m_48_dataOut_ready = buf_49_dataIn_ready; // @[aeloss_push.scala 1013:10]
  assign m_48_condition_valid = f_89_dataOut_0_valid; // @[aeloss_push.scala 1022:10]
  assign m_48_condition_bits = f_89_dataOut_0_bits; // @[aeloss_push.scala 1022:10]
  assign buf_49_clock = clock;
  assign buf_49_reset = reset;
  assign buf_49_dataIn_valid = m_48_dataOut_valid; // @[aeloss_push.scala 1013:10]
  assign buf_49_dataIn_bits = m_48_dataOut_bits; // @[aeloss_push.scala 1013:10]
  assign buf_49_dataOut_ready = f_94_dataIn_ready; // @[aeloss_push.scala 1097:10]
  assign b_50_dataIn_valid = f_94_dataOut_0_valid; // @[aeloss_push.scala 1018:10]
  assign b_50_dataIn_bits = f_94_dataOut_0_bits; // @[aeloss_push.scala 1018:10]
  assign b_50_dataOut_0_ready = f_95_dataIn_ready; // @[aeloss_push.scala 1098:10]
  assign b_50_condition_valid = f_88_dataOut_0_valid; // @[aeloss_push.scala 1017:10]
  assign b_50_condition_bits = f_88_dataOut_0_bits; // @[aeloss_push.scala 1017:10]
  assign addi_51_operand0_valid = f_95_dataOut_3_valid; // @[aeloss_push.scala 1019:10]
  assign addi_51_operand0_bits = f_95_dataOut_3_bits; // @[aeloss_push.scala 1019:10]
  assign addi_51_operand1_valid = f_92_dataOut_0_valid; // @[aeloss_push.scala 1020:10]
  assign addi_51_operand1_bits = f_92_dataOut_0_bits; // @[aeloss_push.scala 1020:10]
  assign addi_51_result_ready = m_48_dataIn_1_ready; // @[aeloss_push.scala 1021:10]
  assign load_52_address_in_valid = f_93_dataOut_1_valid; // @[aeloss_push.scala 1023:10]
  assign load_52_address_in_bits = f_93_dataOut_1_bits[9:0]; // @[aeloss_push.scala 1023:10]
  assign load_52_data_out_ready = fifo_100_dataIn_ready; // @[aeloss_push.scala 1103:10]
  assign load_52_address_out_ready = mem_0_load_address_0_ready; // @[aeloss_push.scala 1025:8]
  assign load_52_data_in_valid = mem_0_load_data_0_valid; // @[aeloss_push.scala 1026:10]
  assign load_52_data_in_bits = mem_0_load_data_0_bits; // @[aeloss_push.scala 1026:10]
  assign load_53_address_in_valid = f_95_dataOut_2_valid; // @[aeloss_push.scala 1027:10]
  assign load_53_address_in_bits = f_95_dataOut_2_bits[9:0]; // @[aeloss_push.scala 1027:10]
  assign load_53_data_out_ready = fifo_101_dataIn_ready; // @[aeloss_push.scala 1105:10]
  assign load_53_address_out_ready = mem_0_load_address_1_ready; // @[aeloss_push.scala 1029:8]
  assign load_53_data_in_valid = mem_0_load_data_1_valid; // @[aeloss_push.scala 1030:10]
  assign load_53_data_in_bits = mem_0_load_data_1_bits; // @[aeloss_push.scala 1030:10]
  assign subf_54_clock = clock;
  assign subf_54_reset = reset;
  assign subf_54_operand0_valid = fifo_100_dataOut_valid; // @[aeloss_push.scala 1104:10]
  assign subf_54_operand0_bits = fifo_100_dataOut_bits; // @[aeloss_push.scala 1104:10]
  assign subf_54_operand1_valid = fifo_101_dataOut_valid; // @[aeloss_push.scala 1106:10]
  assign subf_54_operand1_bits = fifo_101_dataOut_bits; // @[aeloss_push.scala 1106:10]
  assign subf_54_result_ready = f_96_dataIn_ready; // @[aeloss_push.scala 1099:10]
  assign cmpf_55_clock = clock;
  assign cmpf_55_reset = reset;
  assign cmpf_55_operand0_valid = f_96_dataOut_2_valid; // @[aeloss_push.scala 1031:10]
  assign cmpf_55_operand0_bits = f_96_dataOut_2_bits; // @[aeloss_push.scala 1031:10]
  assign cmpf_55_operand1_valid = fifo_102_dataOut_valid; // @[aeloss_push.scala 1108:10]
  assign cmpf_55_operand1_bits = fifo_102_dataOut_bits; // @[aeloss_push.scala 1108:10]
  assign cmpf_55_result_ready = fifo_109_dataIn_ready; // @[aeloss_push.scala 1121:10]
  assign const_56_control_valid = f_90_dataOut_7_valid; // @[aeloss_push.scala 1032:10]
  assign const_56_dataIn_bits = 64'h0; // @[aeloss_push.scala 1033:15]
  assign const_56_dataOut_ready = fifo_102_dataIn_ready; // @[aeloss_push.scala 1107:10]
  assign subf_57_clock = clock;
  assign subf_57_reset = reset;
  assign subf_57_operand0_valid = fifo_105_dataOut_valid; // @[aeloss_push.scala 1114:10]
  assign subf_57_operand0_bits = fifo_105_dataOut_bits; // @[aeloss_push.scala 1114:10]
  assign subf_57_operand1_valid = fifo_106_dataOut_valid; // @[aeloss_push.scala 1116:10]
  assign subf_57_operand1_bits = fifo_106_dataOut_bits; // @[aeloss_push.scala 1116:10]
  assign subf_57_result_ready = select_61_dataIn_0_ready; // @[aeloss_push.scala 1041:10]
  assign const_58_control_valid = f_90_dataOut_6_valid; // @[aeloss_push.scala 1035:10]
  assign const_58_dataIn_bits = 64'h3ff0000000000000; // @[aeloss_push.scala 1036:15]
  assign const_58_dataOut_ready = fifo_105_dataIn_ready; // @[aeloss_push.scala 1113:10]
  assign addf_59_clock = clock;
  assign addf_59_reset = reset;
  assign addf_59_operand0_valid = fifo_103_dataOut_valid; // @[aeloss_push.scala 1110:10]
  assign addf_59_operand0_bits = fifo_103_dataOut_bits; // @[aeloss_push.scala 1110:10]
  assign addf_59_operand1_valid = fifo_104_dataOut_valid; // @[aeloss_push.scala 1112:10]
  assign addf_59_operand1_bits = fifo_104_dataOut_bits; // @[aeloss_push.scala 1112:10]
  assign addf_59_result_ready = select_61_dataIn_1_ready; // @[aeloss_push.scala 1042:10]
  assign const_60_control_valid = f_90_dataOut_5_valid; // @[aeloss_push.scala 1038:10]
  assign const_60_dataIn_bits = 64'h3ff0000000000000; // @[aeloss_push.scala 1039:15]
  assign const_60_dataOut_ready = fifo_103_dataIn_ready; // @[aeloss_push.scala 1109:10]
  assign select_61_dataIn_0_valid = subf_57_result_valid; // @[aeloss_push.scala 1041:10]
  assign select_61_dataIn_0_bits = subf_57_result_bits; // @[aeloss_push.scala 1041:10]
  assign select_61_dataIn_1_valid = addf_59_result_valid; // @[aeloss_push.scala 1042:10]
  assign select_61_dataIn_1_bits = addf_59_result_bits; // @[aeloss_push.scala 1042:10]
  assign select_61_condition_valid = fifo_109_dataOut_valid; // @[aeloss_push.scala 1122:10]
  assign select_61_condition_bits = fifo_109_dataOut_bits; // @[aeloss_push.scala 1122:10]
  assign select_61_dataOut_ready = f_97_dataIn_ready; // @[aeloss_push.scala 1100:10]
  assign cmpf_62_clock = clock;
  assign cmpf_62_reset = reset;
  assign cmpf_62_operand0_valid = f_97_dataOut_1_valid; // @[aeloss_push.scala 1043:10]
  assign cmpf_62_operand0_bits = f_97_dataOut_1_bits; // @[aeloss_push.scala 1043:10]
  assign cmpf_62_operand1_valid = fifo_108_dataOut_valid; // @[aeloss_push.scala 1120:10]
  assign cmpf_62_operand1_bits = fifo_108_dataOut_bits; // @[aeloss_push.scala 1120:10]
  assign cmpf_62_result_ready = select_64_condition_ready; // @[aeloss_push.scala 1047:10]
  assign const_63_control_valid = f_90_dataOut_4_valid; // @[aeloss_push.scala 1044:10]
  assign const_63_dataIn_bits = 64'h0; // @[aeloss_push.scala 1045:15]
  assign const_63_dataOut_ready = fifo_108_dataIn_ready; // @[aeloss_push.scala 1119:10]
  assign select_64_dataIn_0_valid = f_97_dataOut_0_valid; // @[aeloss_push.scala 1048:10]
  assign select_64_dataIn_0_bits = f_97_dataOut_0_bits; // @[aeloss_push.scala 1048:10]
  assign select_64_dataIn_1_valid = fifo_107_dataOut_valid; // @[aeloss_push.scala 1118:10]
  assign select_64_dataIn_1_bits = fifo_107_dataOut_bits; // @[aeloss_push.scala 1118:10]
  assign select_64_condition_valid = cmpf_62_result_valid; // @[aeloss_push.scala 1047:10]
  assign select_64_condition_bits = cmpf_62_result_bits[0]; // @[aeloss_push.scala 1047:10]
  assign select_64_dataOut_ready = b_72_dataIn_ready; // @[aeloss_push.scala 1065:10]
  assign const_65_control_valid = f_90_dataOut_3_valid; // @[aeloss_push.scala 1049:10]
  assign const_65_dataIn_bits = 64'h0; // @[aeloss_push.scala 1050:15]
  assign const_65_dataOut_ready = fifo_107_dataIn_ready; // @[aeloss_push.scala 1117:10]
  assign load_66_address_in_valid = f_95_dataOut_1_valid; // @[aeloss_push.scala 1052:10]
  assign load_66_address_in_bits = f_95_dataOut_1_bits[9:0]; // @[aeloss_push.scala 1052:10]
  assign load_66_data_out_ready = trunci_68_operand_ready; // @[aeloss_push.scala 1058:10]
  assign load_66_address_out_ready = mem_1_load_address_1_ready; // @[aeloss_push.scala 1054:8]
  assign load_66_data_in_valid = mem_1_load_data_1_valid; // @[aeloss_push.scala 1055:10]
  assign load_66_data_in_bits = mem_1_load_data_1_bits; // @[aeloss_push.scala 1055:10]
  assign cmpi_67_operand0_valid = f_93_dataOut_0_valid; // @[aeloss_push.scala 1056:10]
  assign cmpi_67_operand0_bits = f_93_dataOut_0_bits; // @[aeloss_push.scala 1056:10]
  assign cmpi_67_operand1_valid = f_95_dataOut_0_valid; // @[aeloss_push.scala 1057:10]
  assign cmpi_67_operand1_bits = f_95_dataOut_0_bits; // @[aeloss_push.scala 1057:10]
  assign cmpi_67_result_ready = and_69_operand1_ready; // @[aeloss_push.scala 1060:10]
  assign trunci_68_operand_valid = load_66_data_out_valid; // @[aeloss_push.scala 1058:10]
  assign trunci_68_operand_bits = load_66_data_out_bits; // @[aeloss_push.scala 1058:10]
  assign trunci_68_result_ready = and_69_operand0_ready; // @[aeloss_push.scala 1059:10]
  assign and_69_operand0_valid = trunci_68_result_valid; // @[aeloss_push.scala 1059:10]
  assign and_69_operand0_bits = trunci_68_result_bits; // @[aeloss_push.scala 1059:10]
  assign and_69_operand1_valid = cmpi_67_result_valid; // @[aeloss_push.scala 1060:10]
  assign and_69_operand1_bits = cmpi_67_result_bits; // @[aeloss_push.scala 1060:10]
  assign and_69_result_ready = f_98_dataIn_ready; // @[aeloss_push.scala 1101:10]
  assign b_70_dataIn_valid = f_90_dataOut_1_valid; // @[aeloss_push.scala 1062:10]
  assign b_70_dataOut_0_ready = f_99_dataIn_ready; // @[aeloss_push.scala 1102:10]
  assign b_70_condition_valid = f_98_dataOut_3_valid; // @[aeloss_push.scala 1061:10]
  assign b_70_condition_bits = f_98_dataOut_3_bits; // @[aeloss_push.scala 1061:10]
  assign b_71_dataIn_valid = b_35_dataOut_0_valid; // @[aeloss_push.scala 1064:10]
  assign b_71_dataIn_bits = b_35_dataOut_0_bits; // @[aeloss_push.scala 1064:10]
  assign b_71_dataOut_0_ready = fifo_110_dataIn_ready; // @[aeloss_push.scala 1123:10]
  assign b_71_dataOut_1_ready = m_73_dataIn_0_ready; // @[aeloss_push.scala 1074:10]
  assign b_71_condition_valid = f_98_dataOut_2_valid; // @[aeloss_push.scala 1063:10]
  assign b_71_condition_bits = f_98_dataOut_2_bits; // @[aeloss_push.scala 1063:10]
  assign b_72_dataIn_valid = select_64_dataOut_valid; // @[aeloss_push.scala 1065:10]
  assign b_72_dataIn_bits = select_64_dataOut_bits; // @[aeloss_push.scala 1065:10]
  assign b_72_dataOut_0_ready = fifo_112_dataIn_ready; // @[aeloss_push.scala 1127:10]
  assign b_72_dataOut_1_ready = 1'h1; // @[aeloss_push.scala 1149:16]
  assign b_72_condition_valid = fifo_116_dataOut_valid; // @[aeloss_push.scala 1136:10]
  assign b_72_condition_bits = fifo_116_dataOut_bits; // @[aeloss_push.scala 1136:10]
  assign m_73_clock = clock;
  assign m_73_reset = reset;
  assign m_73_dataIn_0_valid = b_71_dataOut_1_valid; // @[aeloss_push.scala 1074:10]
  assign m_73_dataIn_0_bits = b_71_dataOut_1_bits; // @[aeloss_push.scala 1074:10]
  assign m_73_dataIn_1_valid = addf_78_result_valid; // @[aeloss_push.scala 1073:10]
  assign m_73_dataIn_1_bits = addf_78_result_bits; // @[aeloss_push.scala 1073:10]
  assign m_73_dataOut_ready = m_33_dataIn_1_ready; // @[aeloss_push.scala 1075:10]
  assign m_73_condition_valid = f_98_dataOut_0_valid; // @[aeloss_push.scala 1066:10]
  assign m_73_condition_bits = f_98_dataOut_0_bits; // @[aeloss_push.scala 1066:10]
  assign subf_74_clock = clock;
  assign subf_74_reset = reset;
  assign subf_74_operand0_valid = fifo_112_dataOut_valid; // @[aeloss_push.scala 1128:10]
  assign subf_74_operand0_bits = fifo_112_dataOut_bits; // @[aeloss_push.scala 1128:10]
  assign subf_74_operand1_valid = fifo_113_dataOut_valid; // @[aeloss_push.scala 1130:10]
  assign subf_74_operand1_bits = fifo_113_dataOut_bits; // @[aeloss_push.scala 1130:10]
  assign subf_74_result_ready = fifo_114_dataIn_ready; // @[aeloss_push.scala 1131:10]
  assign const_75_control_valid = f_99_dataOut_1_valid; // @[aeloss_push.scala 1067:10]
  assign const_75_dataIn_bits = 64'h3fb903807d823611; // @[aeloss_push.scala 1068:15]
  assign const_75_dataOut_ready = fifo_113_dataIn_ready; // @[aeloss_push.scala 1129:10]
  assign divf_76_clock = clock;
  assign divf_76_reset = reset;
  assign divf_76_operand0_valid = fifo_114_dataOut_valid; // @[aeloss_push.scala 1132:10]
  assign divf_76_operand0_bits = fifo_114_dataOut_bits; // @[aeloss_push.scala 1132:10]
  assign divf_76_operand1_valid = fifo_115_dataOut_valid; // @[aeloss_push.scala 1134:10]
  assign divf_76_operand1_bits = fifo_115_dataOut_bits; // @[aeloss_push.scala 1134:10]
  assign divf_76_result_ready = fifo_111_dataIn_ready; // @[aeloss_push.scala 1125:10]
  assign const_77_control_valid = f_99_dataOut_0_valid; // @[aeloss_push.scala 1070:10]
  assign const_77_dataIn_bits = 64'h4057a012f09d8c6d; // @[aeloss_push.scala 1071:15]
  assign const_77_dataOut_ready = fifo_115_dataIn_ready; // @[aeloss_push.scala 1133:10]
  assign addf_78_clock = clock;
  assign addf_78_reset = reset;
  assign addf_78_operand0_valid = fifo_110_dataOut_valid; // @[aeloss_push.scala 1124:10]
  assign addf_78_operand0_bits = fifo_110_dataOut_bits; // @[aeloss_push.scala 1124:10]
  assign addf_78_operand1_valid = fifo_111_dataOut_valid; // @[aeloss_push.scala 1126:10]
  assign addf_78_operand1_bits = fifo_111_dataOut_bits; // @[aeloss_push.scala 1126:10]
  assign addf_78_result_ready = m_73_dataIn_1_ready; // @[aeloss_push.scala 1073:10]
  assign f_79_clock = clock;
  assign f_79_reset = reset;
  assign f_79_dataIn_valid = cmpi_sle_2_result_valid; // @[aeloss_push.scala 1082:10]
  assign f_79_dataIn_bits = cmpi_sle_2_result_bits; // @[aeloss_push.scala 1082:10]
  assign f_79_dataOut_0_ready = b_21_condition_ready; // @[aeloss_push.scala 959:9]
  assign f_79_dataOut_1_ready = b_17_condition_ready; // @[aeloss_push.scala 948:9]
  assign f_79_dataOut_2_ready = b_13_condition_ready; // @[aeloss_push.scala 939:9]
  assign f_79_dataOut_3_ready = b_8_condition_ready; // @[aeloss_push.scala 928:9]
  assign f_79_dataOut_4_ready = b_5_condition_ready; // @[aeloss_push.scala 924:9]
  assign f_80_clock = clock;
  assign f_80_reset = reset;
  assign f_80_dataIn_valid = m_3_condition_valid; // @[aeloss_push.scala 1083:10]
  assign f_80_dataIn_bits = m_3_condition_bits; // @[aeloss_push.scala 1083:10]
  assign f_80_dataOut_0_ready = m_19_condition_ready; // @[aeloss_push.scala 964:9]
  assign f_80_dataOut_1_ready = m_15_condition_ready; // @[aeloss_push.scala 954:9]
  assign f_80_dataOut_2_ready = m_11_condition_ready; // @[aeloss_push.scala 945:9]
  assign f_80_dataOut_3_ready = m_6_condition_ready; // @[aeloss_push.scala 933:9]
  assign f_81_clock = clock;
  assign f_81_reset = reset;
  assign f_81_dataIn_valid = b_5_dataOut_0_valid; // @[aeloss_push.scala 1084:10]
  assign f_81_dataOut_0_ready = m_3_dataIn_1_ready; // @[aeloss_push.scala 1080:9]
  assign f_81_dataOut_1_ready = b_25_dataIn_ready; // @[aeloss_push.scala 971:9]
  assign f_82_clock = clock;
  assign f_82_reset = reset;
  assign f_82_dataIn_valid = buf_12_dataOut_valid; // @[aeloss_push.scala 1085:10]
  assign f_82_dataIn_bits = buf_12_dataOut_bits; // @[aeloss_push.scala 1085:10]
  assign f_82_dataOut_0_ready = cmpi_sle_2_operand1_ready; // @[aeloss_push.scala 958:9]
  assign f_82_dataOut_1_ready = b_13_dataIn_ready; // @[aeloss_push.scala 937:9]
  assign f_83_clock = clock;
  assign f_83_reset = reset;
  assign f_83_dataIn_valid = b_17_dataOut_0_valid; // @[aeloss_push.scala 1086:10]
  assign f_83_dataIn_bits = b_17_dataOut_0_bits; // @[aeloss_push.scala 1086:10]
  assign f_83_dataOut_0_ready = addi_22_operand1_ready; // @[aeloss_push.scala 962:9]
  assign f_83_dataOut_1_ready = m_15_dataIn_1_ready; // @[aeloss_push.scala 953:9]
  assign f_84_clock = clock;
  assign f_84_reset = reset;
  assign f_84_dataIn_valid = buf_20_dataOut_valid; // @[aeloss_push.scala 1087:10]
  assign f_84_dataIn_bits = buf_20_dataOut_bits; // @[aeloss_push.scala 1087:10]
  assign f_84_dataOut_0_ready = b_21_dataIn_ready; // @[aeloss_push.scala 960:9]
  assign f_84_dataOut_1_ready = cmpi_sle_2_operand0_ready; // @[aeloss_push.scala 957:9]
  assign f_85_clock = clock;
  assign f_85_reset = reset;
  assign f_85_dataIn_valid = b_21_dataOut_0_valid; // @[aeloss_push.scala 1088:10]
  assign f_85_dataIn_bits = b_21_dataOut_0_bits; // @[aeloss_push.scala 1088:10]
  assign f_85_dataOut_0_ready = b_26_dataIn_ready; // @[aeloss_push.scala 973:9]
  assign f_85_dataOut_1_ready = load_23_address_in_ready; // @[aeloss_push.scala 965:9]
  assign f_85_dataOut_2_ready = addi_22_operand0_ready; // @[aeloss_push.scala 961:9]
  assign f_86_clock = clock;
  assign f_86_reset = reset;
  assign f_86_dataIn_valid = trunci_24_result_valid; // @[aeloss_push.scala 1089:10]
  assign f_86_dataIn_bits = trunci_24_result_bits; // @[aeloss_push.scala 1089:10]
  assign f_86_dataOut_0_ready = m_28_condition_ready; // @[aeloss_push.scala 976:10]
  assign f_86_dataOut_1_ready = b_27_condition_ready; // @[aeloss_push.scala 974:9]
  assign f_86_dataOut_2_ready = b_26_condition_ready; // @[aeloss_push.scala 972:9]
  assign f_86_dataOut_3_ready = b_25_condition_ready; // @[aeloss_push.scala 970:9]
  assign f_87_clock = clock;
  assign f_87_reset = reset;
  assign f_87_dataIn_valid = b_25_dataOut_0_valid; // @[aeloss_push.scala 1090:10]
  assign f_87_dataOut_0_ready = const_44_control_ready; // @[aeloss_push.scala 1001:10]
  assign f_87_dataOut_1_ready = const_40_control_ready; // @[aeloss_push.scala 992:10]
  assign f_87_dataOut_2_ready = const_36_control_ready; // @[aeloss_push.scala 986:10]
  assign f_87_dataOut_3_ready = m_30_dataIn_0_ready; // @[aeloss_push.scala 980:10]
  assign f_88_clock = clock;
  assign f_88_reset = reset;
  assign f_88_dataIn_valid = cmpi_sle_29_result_valid; // @[aeloss_push.scala 1091:10]
  assign f_88_dataIn_bits = cmpi_sle_29_result_bits; // @[aeloss_push.scala 1091:10]
  assign f_88_dataOut_0_ready = b_50_condition_ready; // @[aeloss_push.scala 1017:10]
  assign f_88_dataOut_1_ready = b_47_condition_ready; // @[aeloss_push.scala 1009:10]
  assign f_88_dataOut_2_ready = b_43_condition_ready; // @[aeloss_push.scala 1000:10]
  assign f_88_dataOut_3_ready = b_39_condition_ready; // @[aeloss_push.scala 991:10]
  assign f_88_dataOut_4_ready = b_35_condition_ready; // @[aeloss_push.scala 983:10]
  assign f_88_dataOut_5_ready = b_32_condition_ready; // @[aeloss_push.scala 979:10]
  assign f_89_clock = clock;
  assign f_89_reset = reset;
  assign f_89_dataIn_valid = m_30_condition_valid; // @[aeloss_push.scala 1092:10]
  assign f_89_dataIn_bits = m_30_condition_bits; // @[aeloss_push.scala 1092:10]
  assign f_89_dataOut_0_ready = m_48_condition_ready; // @[aeloss_push.scala 1022:10]
  assign f_89_dataOut_1_ready = m_45_condition_ready; // @[aeloss_push.scala 1012:10]
  assign f_89_dataOut_2_ready = m_41_condition_ready; // @[aeloss_push.scala 1006:10]
  assign f_89_dataOut_3_ready = m_37_condition_ready; // @[aeloss_push.scala 997:10]
  assign f_89_dataOut_4_ready = m_33_condition_ready; // @[aeloss_push.scala 985:10]
  assign f_90_clock = clock;
  assign f_90_reset = reset;
  assign f_90_dataIn_valid = b_32_dataOut_0_valid; // @[aeloss_push.scala 1093:10]
  assign f_90_dataOut_0_ready = m_30_dataIn_1_ready; // @[aeloss_push.scala 1076:10]
  assign f_90_dataOut_1_ready = b_70_dataIn_ready; // @[aeloss_push.scala 1062:10]
  assign f_90_dataOut_3_ready = const_65_control_ready; // @[aeloss_push.scala 1049:10]
  assign f_90_dataOut_4_ready = const_63_control_ready; // @[aeloss_push.scala 1044:10]
  assign f_90_dataOut_5_ready = const_60_control_ready; // @[aeloss_push.scala 1038:10]
  assign f_90_dataOut_6_ready = const_58_control_ready; // @[aeloss_push.scala 1035:10]
  assign f_90_dataOut_7_ready = const_56_control_ready; // @[aeloss_push.scala 1032:10]
  assign f_91_clock = clock;
  assign f_91_reset = reset;
  assign f_91_dataIn_valid = buf_38_dataOut_valid; // @[aeloss_push.scala 1094:10]
  assign f_91_dataIn_bits = buf_38_dataOut_bits; // @[aeloss_push.scala 1094:10]
  assign f_91_dataOut_0_ready = cmpi_sle_29_operand1_ready; // @[aeloss_push.scala 1016:10]
  assign f_91_dataOut_1_ready = b_39_dataIn_ready; // @[aeloss_push.scala 989:10]
  assign f_92_clock = clock;
  assign f_92_reset = reset;
  assign f_92_dataIn_valid = b_43_dataOut_0_valid; // @[aeloss_push.scala 1095:10]
  assign f_92_dataIn_bits = b_43_dataOut_0_bits; // @[aeloss_push.scala 1095:10]
  assign f_92_dataOut_0_ready = addi_51_operand1_ready; // @[aeloss_push.scala 1020:10]
  assign f_92_dataOut_1_ready = m_41_dataIn_1_ready; // @[aeloss_push.scala 1005:10]
  assign f_93_clock = clock;
  assign f_93_reset = reset;
  assign f_93_dataIn_valid = b_47_dataOut_0_valid; // @[aeloss_push.scala 1096:10]
  assign f_93_dataIn_bits = b_47_dataOut_0_bits; // @[aeloss_push.scala 1096:10]
  assign f_93_dataOut_0_ready = cmpi_67_operand0_ready; // @[aeloss_push.scala 1056:10]
  assign f_93_dataOut_1_ready = load_52_address_in_ready; // @[aeloss_push.scala 1023:10]
  assign f_93_dataOut_2_ready = m_45_dataIn_1_ready; // @[aeloss_push.scala 1011:10]
  assign f_94_clock = clock;
  assign f_94_reset = reset;
  assign f_94_dataIn_valid = buf_49_dataOut_valid; // @[aeloss_push.scala 1097:10]
  assign f_94_dataIn_bits = buf_49_dataOut_bits; // @[aeloss_push.scala 1097:10]
  assign f_94_dataOut_0_ready = b_50_dataIn_ready; // @[aeloss_push.scala 1018:10]
  assign f_94_dataOut_1_ready = cmpi_sle_29_operand0_ready; // @[aeloss_push.scala 1015:10]
  assign f_95_clock = clock;
  assign f_95_reset = reset;
  assign f_95_dataIn_valid = b_50_dataOut_0_valid; // @[aeloss_push.scala 1098:10]
  assign f_95_dataIn_bits = b_50_dataOut_0_bits; // @[aeloss_push.scala 1098:10]
  assign f_95_dataOut_0_ready = cmpi_67_operand1_ready; // @[aeloss_push.scala 1057:10]
  assign f_95_dataOut_1_ready = load_66_address_in_ready; // @[aeloss_push.scala 1052:10]
  assign f_95_dataOut_2_ready = load_53_address_in_ready; // @[aeloss_push.scala 1027:10]
  assign f_95_dataOut_3_ready = addi_51_operand0_ready; // @[aeloss_push.scala 1019:10]
  assign f_96_clock = clock;
  assign f_96_reset = reset;
  assign f_96_dataIn_valid = subf_54_result_valid; // @[aeloss_push.scala 1099:10]
  assign f_96_dataIn_bits = subf_54_result_bits; // @[aeloss_push.scala 1099:10]
  assign f_96_dataOut_0_ready = fifo_104_dataIn_ready; // @[aeloss_push.scala 1111:10]
  assign f_96_dataOut_1_ready = fifo_106_dataIn_ready; // @[aeloss_push.scala 1115:10]
  assign f_96_dataOut_2_ready = cmpf_55_operand0_ready; // @[aeloss_push.scala 1031:10]
  assign f_97_clock = clock;
  assign f_97_reset = reset;
  assign f_97_dataIn_valid = select_61_dataOut_valid; // @[aeloss_push.scala 1100:10]
  assign f_97_dataIn_bits = select_61_dataOut_bits; // @[aeloss_push.scala 1100:10]
  assign f_97_dataOut_0_ready = select_64_dataIn_0_ready; // @[aeloss_push.scala 1048:10]
  assign f_97_dataOut_1_ready = cmpf_62_operand0_ready; // @[aeloss_push.scala 1043:10]
  assign f_98_clock = clock;
  assign f_98_reset = reset;
  assign f_98_dataIn_valid = and_69_result_valid; // @[aeloss_push.scala 1101:10]
  assign f_98_dataIn_bits = and_69_result_bits; // @[aeloss_push.scala 1101:10]
  assign f_98_dataOut_0_ready = m_73_condition_ready; // @[aeloss_push.scala 1066:10]
  assign f_98_dataOut_1_ready = fifo_116_dataIn_ready; // @[aeloss_push.scala 1135:10]
  assign f_98_dataOut_2_ready = b_71_condition_ready; // @[aeloss_push.scala 1063:10]
  assign f_98_dataOut_3_ready = b_70_condition_ready; // @[aeloss_push.scala 1061:10]
  assign f_99_clock = clock;
  assign f_99_reset = reset;
  assign f_99_dataIn_valid = b_70_dataOut_0_valid; // @[aeloss_push.scala 1102:10]
  assign f_99_dataOut_0_ready = const_77_control_ready; // @[aeloss_push.scala 1070:10]
  assign f_99_dataOut_1_ready = const_75_control_ready; // @[aeloss_push.scala 1067:10]
  assign fifo_100_clock = clock;
  assign fifo_100_reset = reset;
  assign fifo_100_dataIn_valid = load_52_data_out_valid; // @[aeloss_push.scala 1103:10]
  assign fifo_100_dataIn_bits = load_52_data_out_bits; // @[aeloss_push.scala 1103:10]
  assign fifo_100_dataOut_ready = subf_54_operand0_ready; // @[aeloss_push.scala 1104:10]
  assign fifo_101_clock = clock;
  assign fifo_101_reset = reset;
  assign fifo_101_dataIn_valid = load_53_data_out_valid; // @[aeloss_push.scala 1105:10]
  assign fifo_101_dataIn_bits = load_53_data_out_bits; // @[aeloss_push.scala 1105:10]
  assign fifo_101_dataOut_ready = subf_54_operand1_ready; // @[aeloss_push.scala 1106:10]
  assign fifo_102_clock = clock;
  assign fifo_102_reset = reset;
  assign fifo_102_dataIn_valid = const_56_dataOut_valid; // @[aeloss_push.scala 1107:10]
  assign fifo_102_dataIn_bits = const_56_dataOut_bits; // @[aeloss_push.scala 1107:10]
  assign fifo_102_dataOut_ready = cmpf_55_operand1_ready; // @[aeloss_push.scala 1108:10]
  assign fifo_103_clock = clock;
  assign fifo_103_reset = reset;
  assign fifo_103_dataIn_valid = const_60_dataOut_valid; // @[aeloss_push.scala 1109:10]
  assign fifo_103_dataIn_bits = const_60_dataOut_bits; // @[aeloss_push.scala 1109:10]
  assign fifo_103_dataOut_ready = addf_59_operand0_ready; // @[aeloss_push.scala 1110:10]
  assign fifo_104_clock = clock;
  assign fifo_104_reset = reset;
  assign fifo_104_dataIn_valid = f_96_dataOut_0_valid; // @[aeloss_push.scala 1111:10]
  assign fifo_104_dataIn_bits = f_96_dataOut_0_bits; // @[aeloss_push.scala 1111:10]
  assign fifo_104_dataOut_ready = addf_59_operand1_ready; // @[aeloss_push.scala 1112:10]
  assign fifo_105_clock = clock;
  assign fifo_105_reset = reset;
  assign fifo_105_dataIn_valid = const_58_dataOut_valid; // @[aeloss_push.scala 1113:10]
  assign fifo_105_dataIn_bits = const_58_dataOut_bits; // @[aeloss_push.scala 1113:10]
  assign fifo_105_dataOut_ready = subf_57_operand0_ready; // @[aeloss_push.scala 1114:10]
  assign fifo_106_clock = clock;
  assign fifo_106_reset = reset;
  assign fifo_106_dataIn_valid = f_96_dataOut_1_valid; // @[aeloss_push.scala 1115:10]
  assign fifo_106_dataIn_bits = f_96_dataOut_1_bits; // @[aeloss_push.scala 1115:10]
  assign fifo_106_dataOut_ready = subf_57_operand1_ready; // @[aeloss_push.scala 1116:10]
  assign fifo_107_clock = clock;
  assign fifo_107_reset = reset;
  assign fifo_107_dataIn_valid = const_65_dataOut_valid; // @[aeloss_push.scala 1117:10]
  assign fifo_107_dataIn_bits = const_65_dataOut_bits; // @[aeloss_push.scala 1117:10]
  assign fifo_107_dataOut_ready = select_64_dataIn_1_ready; // @[aeloss_push.scala 1118:10]
  assign fifo_108_clock = clock;
  assign fifo_108_reset = reset;
  assign fifo_108_dataIn_valid = const_63_dataOut_valid; // @[aeloss_push.scala 1119:10]
  assign fifo_108_dataIn_bits = const_63_dataOut_bits; // @[aeloss_push.scala 1119:10]
  assign fifo_108_dataOut_ready = cmpf_62_operand1_ready; // @[aeloss_push.scala 1120:10]
  assign fifo_109_clock = clock;
  assign fifo_109_reset = reset;
  assign fifo_109_dataIn_valid = cmpf_55_result_valid; // @[aeloss_push.scala 1121:10]
  assign fifo_109_dataIn_bits = cmpf_55_result_bits[0]; // @[aeloss_push.scala 1121:10]
  assign fifo_109_dataOut_ready = select_61_condition_ready; // @[aeloss_push.scala 1122:10]
  assign fifo_110_clock = clock;
  assign fifo_110_reset = reset;
  assign fifo_110_dataIn_valid = b_71_dataOut_0_valid; // @[aeloss_push.scala 1123:10]
  assign fifo_110_dataIn_bits = b_71_dataOut_0_bits; // @[aeloss_push.scala 1123:10]
  assign fifo_110_dataOut_ready = addf_78_operand0_ready; // @[aeloss_push.scala 1124:10]
  assign fifo_111_clock = clock;
  assign fifo_111_reset = reset;
  assign fifo_111_dataIn_valid = divf_76_result_valid; // @[aeloss_push.scala 1125:10]
  assign fifo_111_dataIn_bits = divf_76_result_bits; // @[aeloss_push.scala 1125:10]
  assign fifo_111_dataOut_ready = addf_78_operand1_ready; // @[aeloss_push.scala 1126:10]
  assign fifo_112_clock = clock;
  assign fifo_112_reset = reset;
  assign fifo_112_dataIn_valid = b_72_dataOut_0_valid; // @[aeloss_push.scala 1127:10]
  assign fifo_112_dataIn_bits = b_72_dataOut_0_bits; // @[aeloss_push.scala 1127:10]
  assign fifo_112_dataOut_ready = subf_74_operand0_ready; // @[aeloss_push.scala 1128:10]
  assign fifo_113_clock = clock;
  assign fifo_113_reset = reset;
  assign fifo_113_dataIn_valid = const_75_dataOut_valid; // @[aeloss_push.scala 1129:10]
  assign fifo_113_dataIn_bits = const_75_dataOut_bits; // @[aeloss_push.scala 1129:10]
  assign fifo_113_dataOut_ready = subf_74_operand1_ready; // @[aeloss_push.scala 1130:10]
  assign fifo_114_clock = clock;
  assign fifo_114_reset = reset;
  assign fifo_114_dataIn_valid = subf_74_result_valid; // @[aeloss_push.scala 1131:10]
  assign fifo_114_dataIn_bits = subf_74_result_bits; // @[aeloss_push.scala 1131:10]
  assign fifo_114_dataOut_ready = divf_76_operand0_ready; // @[aeloss_push.scala 1132:10]
  assign fifo_115_clock = clock;
  assign fifo_115_reset = reset;
  assign fifo_115_dataIn_valid = const_77_dataOut_valid; // @[aeloss_push.scala 1133:10]
  assign fifo_115_dataIn_bits = const_77_dataOut_bits; // @[aeloss_push.scala 1133:10]
  assign fifo_115_dataOut_ready = divf_76_operand1_ready; // @[aeloss_push.scala 1134:10]
  assign fifo_116_clock = clock;
  assign fifo_116_reset = reset;
  assign fifo_116_dataIn_valid = f_98_dataOut_1_valid; // @[aeloss_push.scala 1135:10]
  assign fifo_116_dataIn_bits = f_98_dataOut_1_bits; // @[aeloss_push.scala 1135:10]
  assign fifo_116_dataOut_ready = b_72_condition_ready; // @[aeloss_push.scala 1136:10]
endmodule
