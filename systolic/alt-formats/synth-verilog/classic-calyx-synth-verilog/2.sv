/// =================== Unsigned, Fixed Point =========================
module std_fp_add #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left + right;
endmodule

module std_fp_sub #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out
);
  assign out = left - right;
endmodule

module std_fp_mult_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    input  logic             go,
    input  logic             clk,
    output logic [WIDTH-1:0] out,
    output logic             done
);
  logic [WIDTH-1:0]          rtmp;
  logic [WIDTH-1:0]          ltmp;
  logic [(WIDTH << 1) - 1:0] out_tmp;
  reg done_buf[1:0];
  always_ff @(posedge clk) begin
    if (go) begin
      rtmp <= right;
      ltmp <= left;
      out_tmp <= ltmp * rtmp;
      out <= out_tmp[(WIDTH << 1) - INT_WIDTH - 1 : WIDTH - INT_WIDTH];

      done <= done_buf[1];
      done_buf[0] <= 1'b1;
      done_buf[1] <= done_buf[0];
    end else begin
      rtmp <= 0;
      ltmp <= 0;
      out_tmp <= 0;
      out <= 0;

      done <= 0;
      done_buf[0] <= 0;
      done_buf[1] <= 0;
    end
  end
endmodule

/* verilator lint_off WIDTH */
module std_fp_div_pipe #(
  parameter WIDTH = 32,
  parameter INT_WIDTH = 16,
  parameter FRAC_WIDTH = 16
) (
    input  logic             go,
    input  logic             clk,
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out_remainder,
    output logic [WIDTH-1:0] out_quotient,
    output logic             done
);
    localparam ITERATIONS = WIDTH + FRAC_WIDTH;

    logic [WIDTH-1:0] quotient, quotient_next;
    logic [WIDTH:0] acc, acc_next;
    logic [$clog2(ITERATIONS)-1:0] idx;
    logic start, running, finished;

    assign start = go && !running;
    assign finished = running && (idx == ITERATIONS - 1);

    always_comb begin
      if (acc >= {1'b0, right}) begin
        acc_next = acc - right;
        {acc_next, quotient_next} = {acc_next[WIDTH-1:0], quotient, 1'b1};
      end else begin
        {acc_next, quotient_next} = {acc, quotient} << 1;
      end
    end

    always_ff @(posedge clk) begin
      if (!go) begin
        running <= 0;
        done <= 0;
        out_remainder <= 0;
        out_quotient <= 0;
      end else if (start && left == 0) begin
        out_remainder <= 0;
        out_quotient <= 0;
        done <= 1;
      end

      if (start) begin
        running <= 1;
        done <= 0;
        idx <= 0;
        {acc, quotient} <= {{WIDTH{1'b0}}, left, 1'b0};
        out_quotient <= 0;
        out_remainder <= left;
      end else if (finished) begin
        running <= 0;
        done <= 1;
        out_quotient <= quotient_next;
      end else begin
        idx <= idx + 1;
        acc <= acc_next;
        quotient <= quotient_next;
        if (right <= out_remainder) begin
          out_remainder <= out_remainder - right;
        end
      end
    end
endmodule

module std_fp_gt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    output logic             out
);
  assign out = left > right;
endmodule

module std_fp_add_dwidth #(
    parameter WIDTH1 = 32,
    parameter WIDTH2 = 32,
    parameter INT_WIDTH1 = 16,
    parameter FRAC_WIDTH1 = 16,
    parameter INT_WIDTH2 = 12,
    parameter FRAC_WIDTH2 = 20,
    parameter OUT_WIDTH = 36
) (
    input  logic [   WIDTH1-1:0] left,
    input  logic [   WIDTH2-1:0] right,
    output logic [OUT_WIDTH-1:0] out
);

  localparam BIG_INT = (INT_WIDTH1 >= INT_WIDTH2) ? INT_WIDTH1 : INT_WIDTH2;
  localparam BIG_FRACT = (FRAC_WIDTH1 >= FRAC_WIDTH2) ? FRAC_WIDTH1 : FRAC_WIDTH2;

  if (BIG_INT + BIG_FRACT != OUT_WIDTH)
    $error("std_fp_add_dwidth: Given output width not equal to computed output width");

  logic [INT_WIDTH1-1:0] left_int;
  logic [INT_WIDTH2-1:0] right_int;
  logic [FRAC_WIDTH1-1:0] left_fract;
  logic [FRAC_WIDTH2-1:0] right_fract;

  logic [BIG_INT-1:0] mod_right_int;
  logic [BIG_FRACT-1:0] mod_left_fract;

  logic [BIG_INT-1:0] whole_int;
  logic [BIG_FRACT-1:0] whole_fract;

  assign {left_int, left_fract} = left;
  assign {right_int, right_fract} = right;

  assign mod_left_fract = left_fract * (2 ** (FRAC_WIDTH2 - FRAC_WIDTH1));

  always_comb begin
    if ((mod_left_fract + right_fract) >= 2 ** FRAC_WIDTH2) begin
      whole_int = left_int + right_int + 1;
      whole_fract = mod_left_fract + right_fract - 2 ** FRAC_WIDTH2;
    end else begin
      whole_int = left_int + right_int;
      whole_fract = mod_left_fract + right_fract;
    end
  end

  assign out = {whole_int, whole_fract};
endmodule

/// =================== Signed, Fixed Point =========================
module std_fp_sadd #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left + right);
endmodule

module std_fp_ssub #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);

  assign out = $signed(left - right);
endmodule

module std_fp_smult_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  signed       [WIDTH-1:0] left,
    input  signed       [WIDTH-1:0] right,
    input  logic                    go,
    input  logic                    clk,
    output logic signed [WIDTH-1:0] out,
    output logic                    done
);
  logic signed [WIDTH-1:0] ltmp;
  logic signed [WIDTH-1:0] rtmp;
  logic signed [(WIDTH << 1) - 1:0] out_tmp;
  reg done_buf[1:0];
  always_ff @(posedge clk) begin
    if (go) begin
      ltmp <= left;
      rtmp <= right;
      // Sign extend by the first bit for the operands.
      out_tmp <= $signed(
                   { {WIDTH{ltmp[WIDTH-1]}}, ltmp} *
                   { {WIDTH{rtmp[WIDTH-1]}}, rtmp}
                 );
      out <= out_tmp[(WIDTH << 1) - INT_WIDTH - 1: WIDTH - INT_WIDTH];

      done <= done_buf[1];
      done_buf[0] <= 1'b1;
      done_buf[1] <= done_buf[0];
    end else begin
      rtmp <= 0;
      ltmp <= 0;
      out_tmp <= 0;
      out <= 0;

      done <= 0;
      done_buf[0] <= 0;
      done_buf[1] <= 0;
    end
  end
endmodule

module std_fp_sdiv_pipe #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input                     clk,
    input                     go,
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out_quotient,
    output signed [WIDTH-1:0] out_remainder,
    output logic              done
);

  logic signed [WIDTH-1:0] left_abs;
  logic signed [WIDTH-1:0] right_abs;
  logic signed [WIDTH-1:0] comp_out_q;
  logic signed [WIDTH-1:0] comp_out_r;

  assign right_abs = right[WIDTH-1] ? -right : right;
  assign left_abs = left[WIDTH-1] ? -left : left;
  assign out_quotient = left[WIDTH-1] ^ right[WIDTH-1] ? -comp_out_q : comp_out_q;
  assign out_remainder = (left[WIDTH-1] && comp_out_r) ? $signed(right - comp_out_r) : comp_out_r;

  std_fp_div_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(INT_WIDTH),
    .FRAC_WIDTH(FRAC_WIDTH)
  ) comp (
    .clk(clk),
    .done(done),
    .go(go),
    .left(left_abs),
    .right(right_abs),
    .out_quotient(comp_out_q),
    .out_remainder(comp_out_r)
  );
endmodule

module std_fp_sadd_dwidth #(
    parameter WIDTH1 = 32,
    parameter WIDTH2 = 32,
    parameter INT_WIDTH1 = 16,
    parameter FRAC_WIDTH1 = 16,
    parameter INT_WIDTH2 = 12,
    parameter FRAC_WIDTH2 = 20,
    parameter OUT_WIDTH = 36
) (
    input  logic [   WIDTH1-1:0] left,
    input  logic [   WIDTH2-1:0] right,
    output logic [OUT_WIDTH-1:0] out
);

  logic signed [INT_WIDTH1-1:0] left_int;
  logic signed [INT_WIDTH2-1:0] right_int;
  logic [FRAC_WIDTH1-1:0] left_fract;
  logic [FRAC_WIDTH2-1:0] right_fract;

  localparam BIG_INT = (INT_WIDTH1 >= INT_WIDTH2) ? INT_WIDTH1 : INT_WIDTH2;
  localparam BIG_FRACT = (FRAC_WIDTH1 >= FRAC_WIDTH2) ? FRAC_WIDTH1 : FRAC_WIDTH2;

  logic [BIG_INT-1:0] mod_right_int;
  logic [BIG_FRACT-1:0] mod_left_fract;

  logic [BIG_INT-1:0] whole_int;
  logic [BIG_FRACT-1:0] whole_fract;

  assign {left_int, left_fract} = left;
  assign {right_int, right_fract} = right;

  assign mod_left_fract = left_fract * (2 ** (FRAC_WIDTH2 - FRAC_WIDTH1));

  always_comb begin
    if ((mod_left_fract + right_fract) >= 2 ** FRAC_WIDTH2) begin
      whole_int = $signed(left_int + right_int + 1);
      whole_fract = mod_left_fract + right_fract - 2 ** FRAC_WIDTH2;
    end else begin
      whole_int = $signed(left_int + right_int);
      whole_fract = mod_left_fract + right_fract;
    end
  end

  assign out = {whole_int, whole_fract};
endmodule

module std_fp_sgt #(
    parameter WIDTH = 32,
    parameter INT_WIDTH = 16,
    parameter FRAC_WIDTH = 16
) (
    input  logic signed [WIDTH-1:0] left,
    input  logic signed [WIDTH-1:0] right,
    output logic signed             out
);
  assign out = $signed(left > right);
endmodule

/// =================== Unsigned, Bitnum =========================
module std_mult_pipe #(
    parameter WIDTH = 32
) (
    input  logic [WIDTH-1:0] left,
    input  logic [WIDTH-1:0] right,
    input  logic             go,
    input  logic             clk,
    output logic [WIDTH-1:0] out,
    output logic             done
);
  std_fp_mult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(WIDTH),
    .FRAC_WIDTH(0)
  ) comp (
    .clk(clk),
    .done(done),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

module std_div_pipe #(
    parameter WIDTH = 32
) (
    input                    clk,
    input                    go,
    input        [WIDTH-1:0] left,
    input        [WIDTH-1:0] right,
    output logic [WIDTH-1:0] out_remainder,
    output logic [WIDTH-1:0] out_quotient,
    output logic             done
);

  logic [WIDTH-1:0] dividend;
  logic [(WIDTH-1)*2:0] divisor;
  logic [WIDTH-1:0] quotient;
  logic [WIDTH-1:0] quotient_msk;
  logic start, running, finished;

  assign start = go && !running;
  assign finished = !quotient_msk && running;

  always_ff @(posedge clk) begin
    if (!go) begin
      running <= 0;
      done <= 0;
      out_remainder <= 0;
      out_quotient <= 0;
    end else if (start && left == 0) begin
      out_remainder <= 0;
      out_quotient <= 0;
      done <= 1;
    end

    if (start) begin
      running <= 1;
      dividend <= left;
      divisor <= right << WIDTH - 1;
      quotient <= 0;
      quotient_msk <= 1 << WIDTH - 1;
    end else if (finished) begin
      running <= 0;
      done <= 1;
      out_remainder <= dividend;
      out_quotient <= quotient;
    end else begin
      if (divisor <= dividend) begin
        dividend <= dividend - divisor;
        quotient <= quotient | quotient_msk;
      end
      divisor <= divisor >> 1;
      quotient_msk <= quotient_msk >> 1;
    end
  end

  `ifdef VERILATOR
    // Simulation self test against unsynthesizable implementation.
    always @(posedge clk) begin
      if (finished && dividend != $unsigned(left % right))
        $error(
          "\nstd_div_pipe (Remainder): Computed and golden outputs do not match!\n",
          "left: %0d", $unsigned(left),
          "  right: %0d\n", $unsigned(right),
          "expected: %0d", $unsigned(left % right),
          "  computed: %0d", $unsigned(dividend)
        );
      if (finished && quotient != $unsigned(left / right))
        $error(
          "\nstd_div_pipe (Quotient): Computed and golden outputs do not match!\n",
          "left: %0d", $unsigned(left),
          "  right: %0d\n", $unsigned(right),
          "expected: %0d", $unsigned(left / right),
          "  computed: %0d", $unsigned(quotient)
        );
    end
  `endif
endmodule

/// =================== Signed, Bitnum =========================
module std_sadd #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left + right);
endmodule

module std_ssub #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = $signed(left - right);
endmodule

module std_smult_pipe #(
    parameter WIDTH = 32
) (
    input  logic                    go,
    input  logic                    clk,
    input  signed       [WIDTH-1:0] left,
    input  signed       [WIDTH-1:0] right,
    output logic signed [WIDTH-1:0] out,
    output logic                    done
);
  std_fp_smult_pipe #(
    .WIDTH(WIDTH),
    .INT_WIDTH(WIDTH),
    .FRAC_WIDTH(0)
  ) comp (
    .clk(clk),
    .done(done),
    .go(go),
    .left(left),
    .right(right),
    .out(out)
  );
endmodule

/* verilator lint_off WIDTH */
module std_sdiv_pipe #(
    parameter WIDTH = 32
) (
    input                     clk,
    input                     go,
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out_quotient,
    output signed [WIDTH-1:0] out_remainder,
    output logic              done
);

  logic signed [WIDTH-1:0] left_abs, right_abs, comp_out_q, comp_out_r;
  logic different_signs;

  assign right_abs = right[WIDTH-1] ? -right : right;
  assign left_abs = left[WIDTH-1] ? -left : left;
  assign different_signs = left[WIDTH-1] ^ right[WIDTH-1];
  assign out_quotient = different_signs ? -comp_out_q : comp_out_q;
  assign out_remainder = (left[WIDTH-1] && comp_out_r) ? $signed(right - comp_out_r) : comp_out_r;

  std_div_pipe #(
    .WIDTH(WIDTH)
  ) comp (
    .clk(clk),
    .done(done),
    .go(go),
    .left(left_abs),
    .right(right_abs),
    .out_quotient(comp_out_q),
    .out_remainder(comp_out_r)
  );

  `ifdef VERILATOR
    // Simulation self test against unsynthesizable implementation.
    always @(posedge clk) begin
      if (done && out_quotient != $signed(left / right))
        $error(
          "\nstd_sdiv_pipe (Quotient): Computed and golden outputs do not match!\n",
          "left: %0d", left,
          "  right: %0d\n", right,
          "expected: %0d", $signed(left / right),
          "  computed: %0d", $signed(out_quotient)
        );
      if (done && out_remainder != $signed(((left % right) + right) % right))
        $error(
          "\nstd_sdiv_pipe (Remainder): Computed and golden outputs do not match!\n",
          "left: %0d", left,
          "  right: %0d\n", right,
          "expected: %0d", $signed(((left % right) + right) % right),
          "  computed: %0d", $signed(out_remainder)
        );
    end
  `endif
endmodule

module std_sgt #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left > right);
endmodule

module std_slt #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left < right);
endmodule

module std_seq #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left == right);
endmodule

module std_sneq #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left != right);
endmodule

module std_sge #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left >= right);
endmodule

module std_sle #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed             out
);
  assign out = $signed(left <= right);
endmodule

module std_slsh #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = left <<< right;
endmodule

module std_srsh #(
    parameter WIDTH = 32
) (
    input  signed [WIDTH-1:0] left,
    input  signed [WIDTH-1:0] right,
    output signed [WIDTH-1:0] out
);
  assign out = left >>> right;
endmodule
/**
 * Core primitives for Calyx.
 * Implements core primitives used by the compiler.
 *
 * Conventions:
 * - All parameter names must be SNAKE_CASE and all caps.
 * - Port names must be snake_case, no caps.
 */
`default_nettype none

module std_const #(
    parameter WIDTH = 32,
    parameter VALUE = 0
) (
   output logic [WIDTH - 1:0] out
);
  assign out = VALUE;
endmodule

module std_slice #(
    parameter IN_WIDTH  = 32,
    parameter OUT_WIDTH = 32
) (
   input wire                   logic [ IN_WIDTH-1:0] in,
   output logic [OUT_WIDTH-1:0] out
);
  assign out = in[OUT_WIDTH-1:0];

  `ifdef VERILATOR
    always_comb begin
      if (IN_WIDTH < OUT_WIDTH)
        $error(
          "std_slice: Input width less than output width\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

module std_pad #(
    parameter IN_WIDTH  = 32,
    parameter OUT_WIDTH = 32
) (
   input wire logic [IN_WIDTH-1:0]  in,
   output logic     [OUT_WIDTH-1:0] out
);
  localparam EXTEND = OUT_WIDTH - IN_WIDTH;
  assign out = { {EXTEND {1'b0}}, in};

  `ifdef VERILATOR
    always_comb begin
      if (IN_WIDTH > OUT_WIDTH)
        $error(
          "std_pad: Output width less than input width\n",
          "IN_WIDTH: %0d", IN_WIDTH,
          "OUT_WIDTH: %0d", OUT_WIDTH
        );
    end
  `endif
endmodule

module std_not #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] in,
   output logic [WIDTH-1:0] out
);
  assign out = ~in;
endmodule

module std_and #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left & right;
endmodule

module std_or #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left | right;
endmodule

module std_xor #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left ^ right;
endmodule

module std_add #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left + right;
endmodule

module std_sub #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left - right;
endmodule

module std_gt #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left > right;
endmodule

module std_lt #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left < right;
endmodule

module std_eq #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left == right;
endmodule

module std_neq #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left != right;
endmodule

module std_ge #(
    parameter WIDTH = 32
) (
    input wire   logic [WIDTH-1:0] left,
    input wire   logic [WIDTH-1:0] right,
    output logic out
);
  assign out = left >= right;
endmodule

module std_le #(
    parameter WIDTH = 32
) (
   input wire   logic [WIDTH-1:0] left,
   input wire   logic [WIDTH-1:0] right,
   output logic out
);
  assign out = left <= right;
endmodule

module std_lsh #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left << right;
endmodule

module std_rsh #(
    parameter WIDTH = 32
) (
   input wire               logic [WIDTH-1:0] left,
   input wire               logic [WIDTH-1:0] right,
   output logic [WIDTH-1:0] out
);
  assign out = left >> right;
endmodule

/// Memories
module std_reg #(
    parameter WIDTH = 32
) (
   input wire [ WIDTH-1:0]    in,
   input wire                 write_en,
   input wire                 clk,
    // output
   output logic [WIDTH - 1:0] out,
   output logic               done
);

  always_ff @(posedge clk) begin
    if (write_en) begin
      out <= in;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d1 #(
    parameter WIDTH = 32,
    parameter SIZE = 16,
    parameter IDX_SIZE = 4
) (
   input wire                logic [IDX_SIZE-1:0] addr0,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  logic [WIDTH-1:0] mem[SIZE-1:0];

  /* verilator lint_off WIDTH */
  assign read_data = mem[addr0];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d2 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0];

  assign read_data = mem[addr0][addr1];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d3 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D2_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4,
    parameter D2_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [D2_IDX_SIZE-1:0] addr2,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0][D2_SIZE-1:0];

  assign read_data = mem[addr0][addr1][addr2];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1][addr2] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

module std_mem_d4 #(
    parameter WIDTH = 32,
    parameter D0_SIZE = 16,
    parameter D1_SIZE = 16,
    parameter D2_SIZE = 16,
    parameter D3_SIZE = 16,
    parameter D0_IDX_SIZE = 4,
    parameter D1_IDX_SIZE = 4,
    parameter D2_IDX_SIZE = 4,
    parameter D3_IDX_SIZE = 4
) (
   input wire                logic [D0_IDX_SIZE-1:0] addr0,
   input wire                logic [D1_IDX_SIZE-1:0] addr1,
   input wire                logic [D2_IDX_SIZE-1:0] addr2,
   input wire                logic [D3_IDX_SIZE-1:0] addr3,
   input wire                logic [ WIDTH-1:0] write_data,
   input wire                logic write_en,
   input wire                logic clk,
   output logic [ WIDTH-1:0] read_data,
   output logic              done
);

  /* verilator lint_off WIDTH */
  logic [WIDTH-1:0] mem[D0_SIZE-1:0][D1_SIZE-1:0][D2_SIZE-1:0][D3_SIZE-1:0];

  assign read_data = mem[addr0][addr1][addr2][addr3];
  always_ff @(posedge clk) begin
    if (write_en) begin
      mem[addr0][addr1][addr2][addr3] <= write_data;
      done <= 1'd1;
    end else done <= 1'd0;
  end
endmodule

`default_nettype wire
module main (
    input logic go,
    input logic clk,
    output logic done,
    output logic [1:0] t0_addr0,
    output logic [31:0] t0_write_data,
    output logic t0_write_en,
    output logic t0_clk,
    input logic [31:0] t0_read_data,
    input logic t0_done,
    output logic [1:0] t1_addr0,
    output logic [31:0] t1_write_data,
    output logic t1_write_en,
    output logic t1_clk,
    input logic [31:0] t1_read_data,
    input logic t1_done,
    output logic [1:0] l0_addr0,
    output logic [31:0] l0_write_data,
    output logic l0_write_en,
    output logic l0_clk,
    input logic [31:0] l0_read_data,
    input logic l0_done,
    output logic [1:0] l1_addr0,
    output logic [31:0] l1_write_data,
    output logic l1_write_en,
    output logic l1_clk,
    input logic [31:0] l1_read_data,
    input logic l1_done,
    output logic [1:0] out_mem_addr0,
    output logic [1:0] out_mem_addr1,
    output logic [31:0] out_mem_write_data,
    output logic out_mem_write_en,
    output logic out_mem_clk,
    input logic [31:0] out_mem_read_data,
    input logic out_mem_done
);
    logic [1:0] t0_idx_in;
    logic t0_idx_write_en;
    logic t0_idx_clk;
    logic [1:0] t0_idx_out;
    logic t0_idx_done;
    logic [1:0] t0_add_left;
    logic [1:0] t0_add_right;
    logic [1:0] t0_add_out;
    logic [1:0] t1_idx_in;
    logic t1_idx_write_en;
    logic t1_idx_clk;
    logic [1:0] t1_idx_out;
    logic t1_idx_done;
    logic [1:0] t1_add_left;
    logic [1:0] t1_add_right;
    logic [1:0] t1_add_out;
    logic [1:0] l0_idx_in;
    logic l0_idx_write_en;
    logic l0_idx_clk;
    logic [1:0] l0_idx_out;
    logic l0_idx_done;
    logic [1:0] l0_add_left;
    logic [1:0] l0_add_right;
    logic [1:0] l0_add_out;
    logic [1:0] l1_idx_in;
    logic l1_idx_write_en;
    logic l1_idx_clk;
    logic [1:0] l1_idx_out;
    logic l1_idx_done;
    logic [1:0] l1_add_left;
    logic [1:0] l1_add_right;
    logic [1:0] l1_add_out;
    logic [31:0] pe_0_0_top;
    logic [31:0] pe_0_0_left;
    logic [31:0] pe_0_0_out;
    logic pe_0_0_go;
    logic pe_0_0_clk;
    logic pe_0_0_done;
    logic [31:0] top_0_0_in;
    logic top_0_0_write_en;
    logic top_0_0_clk;
    logic [31:0] top_0_0_out;
    logic top_0_0_done;
    logic [31:0] left_0_0_in;
    logic left_0_0_write_en;
    logic left_0_0_clk;
    logic [31:0] left_0_0_out;
    logic left_0_0_done;
    logic [31:0] pe_0_1_top;
    logic [31:0] pe_0_1_left;
    logic [31:0] pe_0_1_out;
    logic pe_0_1_go;
    logic pe_0_1_clk;
    logic pe_0_1_done;
    logic [31:0] top_0_1_in;
    logic top_0_1_write_en;
    logic top_0_1_clk;
    logic [31:0] top_0_1_out;
    logic top_0_1_done;
    logic [31:0] left_0_1_in;
    logic left_0_1_write_en;
    logic left_0_1_clk;
    logic [31:0] left_0_1_out;
    logic left_0_1_done;
    logic [31:0] pe_1_0_top;
    logic [31:0] pe_1_0_left;
    logic [31:0] pe_1_0_out;
    logic pe_1_0_go;
    logic pe_1_0_clk;
    logic pe_1_0_done;
    logic [31:0] top_1_0_in;
    logic top_1_0_write_en;
    logic top_1_0_clk;
    logic [31:0] top_1_0_out;
    logic top_1_0_done;
    logic [31:0] left_1_0_in;
    logic left_1_0_write_en;
    logic left_1_0_clk;
    logic [31:0] left_1_0_out;
    logic left_1_0_done;
    logic [31:0] pe_1_1_top;
    logic [31:0] pe_1_1_left;
    logic [31:0] pe_1_1_out;
    logic pe_1_1_go;
    logic pe_1_1_clk;
    logic pe_1_1_done;
    logic [31:0] top_1_1_in;
    logic top_1_1_write_en;
    logic top_1_1_clk;
    logic [31:0] top_1_1_out;
    logic top_1_1_done;
    logic [31:0] left_1_1_in;
    logic left_1_1_write_en;
    logic left_1_1_clk;
    logic [31:0] left_1_1_out;
    logic left_1_1_done;
    logic fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic fsm_out;
    logic fsm_done;
    logic incr_left;
    logic incr_right;
    logic incr_out;
    logic fsm0_in;
    logic fsm0_write_en;
    logic fsm0_clk;
    logic fsm0_out;
    logic fsm0_done;
    logic incr0_left;
    logic incr0_right;
    logic incr0_out;
    logic fsm1_in;
    logic fsm1_write_en;
    logic fsm1_clk;
    logic fsm1_out;
    logic fsm1_done;
    logic incr1_left;
    logic incr1_right;
    logic incr1_out;
    logic [2:0] fsm2_in;
    logic fsm2_write_en;
    logic fsm2_clk;
    logic [2:0] fsm2_out;
    logic fsm2_done;
    logic [2:0] incr2_left;
    logic [2:0] incr2_right;
    logic [2:0] incr2_out;
    logic fsm3_in;
    logic fsm3_write_en;
    logic fsm3_clk;
    logic fsm3_out;
    logic fsm3_done;
    logic incr3_left;
    logic incr3_right;
    logic incr3_out;
    logic [2:0] fsm4_in;
    logic fsm4_write_en;
    logic fsm4_clk;
    logic [2:0] fsm4_out;
    logic fsm4_done;
    logic [2:0] incr4_left;
    logic [2:0] incr4_right;
    logic [2:0] incr4_out;
    logic fsm5_in;
    logic fsm5_write_en;
    logic fsm5_clk;
    logic fsm5_out;
    logic fsm5_done;
    logic incr5_left;
    logic incr5_right;
    logic incr5_out;
    logic [2:0] fsm6_in;
    logic fsm6_write_en;
    logic fsm6_clk;
    logic [2:0] fsm6_out;
    logic fsm6_done;
    logic [2:0] incr6_left;
    logic [2:0] incr6_right;
    logic [2:0] incr6_out;
    logic fsm7_in;
    logic fsm7_write_en;
    logic fsm7_clk;
    logic fsm7_out;
    logic fsm7_done;
    logic incr7_left;
    logic incr7_right;
    logic incr7_out;
    logic [4:0] fsm8_in;
    logic fsm8_write_en;
    logic fsm8_clk;
    logic [4:0] fsm8_out;
    logic fsm8_done;
    logic [4:0] incr8_left;
    logic [4:0] incr8_right;
    logic [4:0] incr8_out;
    initial begin
        t0_idx_in = 2'd0;
        t0_idx_write_en = 1'd0;
        t0_idx_clk = 1'd0;
        t0_add_left = 2'd0;
        t0_add_right = 2'd0;
        t1_idx_in = 2'd0;
        t1_idx_write_en = 1'd0;
        t1_idx_clk = 1'd0;
        t1_add_left = 2'd0;
        t1_add_right = 2'd0;
        l0_idx_in = 2'd0;
        l0_idx_write_en = 1'd0;
        l0_idx_clk = 1'd0;
        l0_add_left = 2'd0;
        l0_add_right = 2'd0;
        l1_idx_in = 2'd0;
        l1_idx_write_en = 1'd0;
        l1_idx_clk = 1'd0;
        l1_add_left = 2'd0;
        l1_add_right = 2'd0;
        pe_0_0_top = 32'd0;
        pe_0_0_left = 32'd0;
        pe_0_0_go = 1'd0;
        pe_0_0_clk = 1'd0;
        top_0_0_in = 32'd0;
        top_0_0_write_en = 1'd0;
        top_0_0_clk = 1'd0;
        left_0_0_in = 32'd0;
        left_0_0_write_en = 1'd0;
        left_0_0_clk = 1'd0;
        pe_0_1_top = 32'd0;
        pe_0_1_left = 32'd0;
        pe_0_1_go = 1'd0;
        pe_0_1_clk = 1'd0;
        top_0_1_in = 32'd0;
        top_0_1_write_en = 1'd0;
        top_0_1_clk = 1'd0;
        left_0_1_in = 32'd0;
        left_0_1_write_en = 1'd0;
        left_0_1_clk = 1'd0;
        pe_1_0_top = 32'd0;
        pe_1_0_left = 32'd0;
        pe_1_0_go = 1'd0;
        pe_1_0_clk = 1'd0;
        top_1_0_in = 32'd0;
        top_1_0_write_en = 1'd0;
        top_1_0_clk = 1'd0;
        left_1_0_in = 32'd0;
        left_1_0_write_en = 1'd0;
        left_1_0_clk = 1'd0;
        pe_1_1_top = 32'd0;
        pe_1_1_left = 32'd0;
        pe_1_1_go = 1'd0;
        pe_1_1_clk = 1'd0;
        top_1_1_in = 32'd0;
        top_1_1_write_en = 1'd0;
        top_1_1_clk = 1'd0;
        left_1_1_in = 32'd0;
        left_1_1_write_en = 1'd0;
        left_1_1_clk = 1'd0;
        fsm_in = 1'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        incr_left = 1'd0;
        incr_right = 1'd0;
        fsm0_in = 1'd0;
        fsm0_write_en = 1'd0;
        fsm0_clk = 1'd0;
        incr0_left = 1'd0;
        incr0_right = 1'd0;
        fsm1_in = 1'd0;
        fsm1_write_en = 1'd0;
        fsm1_clk = 1'd0;
        incr1_left = 1'd0;
        incr1_right = 1'd0;
        fsm2_in = 3'd0;
        fsm2_write_en = 1'd0;
        fsm2_clk = 1'd0;
        incr2_left = 3'd0;
        incr2_right = 3'd0;
        fsm3_in = 1'd0;
        fsm3_write_en = 1'd0;
        fsm3_clk = 1'd0;
        incr3_left = 1'd0;
        incr3_right = 1'd0;
        fsm4_in = 3'd0;
        fsm4_write_en = 1'd0;
        fsm4_clk = 1'd0;
        incr4_left = 3'd0;
        incr4_right = 3'd0;
        fsm5_in = 1'd0;
        fsm5_write_en = 1'd0;
        fsm5_clk = 1'd0;
        incr5_left = 1'd0;
        incr5_right = 1'd0;
        fsm6_in = 3'd0;
        fsm6_write_en = 1'd0;
        fsm6_clk = 1'd0;
        incr6_left = 3'd0;
        incr6_right = 3'd0;
        fsm7_in = 1'd0;
        fsm7_write_en = 1'd0;
        fsm7_clk = 1'd0;
        incr7_left = 1'd0;
        incr7_right = 1'd0;
        fsm8_in = 5'd0;
        fsm8_write_en = 1'd0;
        fsm8_clk = 1'd0;
        incr8_left = 5'd0;
        incr8_right = 5'd0;
    end
    std_reg # (
        .WIDTH(2)
    ) t0_idx (
        .clk(t0_idx_clk),
        .done(t0_idx_done),
        .in(t0_idx_in),
        .out(t0_idx_out),
        .write_en(t0_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) t0_add (
        .left(t0_add_left),
        .out(t0_add_out),
        .right(t0_add_right)
    );
    std_reg # (
        .WIDTH(2)
    ) t1_idx (
        .clk(t1_idx_clk),
        .done(t1_idx_done),
        .in(t1_idx_in),
        .out(t1_idx_out),
        .write_en(t1_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) t1_add (
        .left(t1_add_left),
        .out(t1_add_out),
        .right(t1_add_right)
    );
    std_reg # (
        .WIDTH(2)
    ) l0_idx (
        .clk(l0_idx_clk),
        .done(l0_idx_done),
        .in(l0_idx_in),
        .out(l0_idx_out),
        .write_en(l0_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) l0_add (
        .left(l0_add_left),
        .out(l0_add_out),
        .right(l0_add_right)
    );
    std_reg # (
        .WIDTH(2)
    ) l1_idx (
        .clk(l1_idx_clk),
        .done(l1_idx_done),
        .in(l1_idx_in),
        .out(l1_idx_out),
        .write_en(l1_idx_write_en)
    );
    std_add # (
        .WIDTH(2)
    ) l1_add (
        .left(l1_add_left),
        .out(l1_add_out),
        .right(l1_add_right)
    );
    mac_pe pe_0_0 (
        .clk(pe_0_0_clk),
        .done(pe_0_0_done),
        .go(pe_0_0_go),
        .left(pe_0_0_left),
        .out(pe_0_0_out),
        .top(pe_0_0_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_0_0 (
        .clk(top_0_0_clk),
        .done(top_0_0_done),
        .in(top_0_0_in),
        .out(top_0_0_out),
        .write_en(top_0_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_0_0 (
        .clk(left_0_0_clk),
        .done(left_0_0_done),
        .in(left_0_0_in),
        .out(left_0_0_out),
        .write_en(left_0_0_write_en)
    );
    mac_pe pe_0_1 (
        .clk(pe_0_1_clk),
        .done(pe_0_1_done),
        .go(pe_0_1_go),
        .left(pe_0_1_left),
        .out(pe_0_1_out),
        .top(pe_0_1_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_0_1 (
        .clk(top_0_1_clk),
        .done(top_0_1_done),
        .in(top_0_1_in),
        .out(top_0_1_out),
        .write_en(top_0_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_0_1 (
        .clk(left_0_1_clk),
        .done(left_0_1_done),
        .in(left_0_1_in),
        .out(left_0_1_out),
        .write_en(left_0_1_write_en)
    );
    mac_pe pe_1_0 (
        .clk(pe_1_0_clk),
        .done(pe_1_0_done),
        .go(pe_1_0_go),
        .left(pe_1_0_left),
        .out(pe_1_0_out),
        .top(pe_1_0_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_1_0 (
        .clk(top_1_0_clk),
        .done(top_1_0_done),
        .in(top_1_0_in),
        .out(top_1_0_out),
        .write_en(top_1_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_1_0 (
        .clk(left_1_0_clk),
        .done(left_1_0_done),
        .in(left_1_0_in),
        .out(left_1_0_out),
        .write_en(left_1_0_write_en)
    );
    mac_pe pe_1_1 (
        .clk(pe_1_1_clk),
        .done(pe_1_1_done),
        .go(pe_1_1_go),
        .left(pe_1_1_left),
        .out(pe_1_1_out),
        .top(pe_1_1_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_1_1 (
        .clk(top_1_1_clk),
        .done(top_1_1_done),
        .in(top_1_1_in),
        .out(top_1_1_out),
        .write_en(top_1_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_1_1 (
        .clk(left_1_1_clk),
        .done(left_1_1_done),
        .in(left_1_1_in),
        .out(left_1_1_out),
        .write_en(left_1_1_write_en)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm (
        .clk(fsm_clk),
        .done(fsm_done),
        .in(fsm_in),
        .out(fsm_out),
        .write_en(fsm_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr (
        .left(incr_left),
        .out(incr_out),
        .right(incr_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm0 (
        .clk(fsm0_clk),
        .done(fsm0_done),
        .in(fsm0_in),
        .out(fsm0_out),
        .write_en(fsm0_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr0 (
        .left(incr0_left),
        .out(incr0_out),
        .right(incr0_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm1 (
        .clk(fsm1_clk),
        .done(fsm1_done),
        .in(fsm1_in),
        .out(fsm1_out),
        .write_en(fsm1_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr1 (
        .left(incr1_left),
        .out(incr1_out),
        .right(incr1_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm2 (
        .clk(fsm2_clk),
        .done(fsm2_done),
        .in(fsm2_in),
        .out(fsm2_out),
        .write_en(fsm2_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr2 (
        .left(incr2_left),
        .out(incr2_out),
        .right(incr2_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm3 (
        .clk(fsm3_clk),
        .done(fsm3_done),
        .in(fsm3_in),
        .out(fsm3_out),
        .write_en(fsm3_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr3 (
        .left(incr3_left),
        .out(incr3_out),
        .right(incr3_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm4 (
        .clk(fsm4_clk),
        .done(fsm4_done),
        .in(fsm4_in),
        .out(fsm4_out),
        .write_en(fsm4_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr4 (
        .left(incr4_left),
        .out(incr4_out),
        .right(incr4_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm5 (
        .clk(fsm5_clk),
        .done(fsm5_done),
        .in(fsm5_in),
        .out(fsm5_out),
        .write_en(fsm5_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr5 (
        .left(incr5_left),
        .out(incr5_out),
        .right(incr5_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm6 (
        .clk(fsm6_clk),
        .done(fsm6_done),
        .in(fsm6_in),
        .out(fsm6_out),
        .write_en(fsm6_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr6 (
        .left(incr6_left),
        .out(incr6_out),
        .right(incr6_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm7 (
        .clk(fsm7_clk),
        .done(fsm7_done),
        .in(fsm7_in),
        .out(fsm7_out),
        .write_en(fsm7_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr7 (
        .left(incr7_left),
        .out(incr7_out),
        .right(incr7_right)
    );
    std_reg # (
        .WIDTH(5)
    ) fsm8 (
        .clk(fsm8_clk),
        .done(fsm8_done),
        .in(fsm8_in),
        .out(fsm8_out),
        .write_en(fsm8_write_en)
    );
    std_add # (
        .WIDTH(5)
    ) incr8 (
        .left(incr8_left),
        .out(incr8_out),
        .right(incr8_right)
    );
    assign done =
     fsm8_out == 5'd30 ? 1'd1 : 1'd0;
    assign l0_addr0 =
     fsm1_out < 1'd1 & fsm8_out == 5'd2 & go | fsm3_out < 1'd1 & fsm8_out == 5'd8 & go ? l0_idx_out : 2'd0;
    assign l0_clk =
     1'b1 ? clk : 1'd0;
    assign l1_addr0 =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? l1_idx_out : 2'd0;
    assign l1_clk =
     1'b1 ? clk : 1'd0;
    assign out_mem_addr0 =
     fsm8_out == 5'd26 & go | fsm8_out == 5'd27 & go ? 2'd0 :
     fsm8_out == 5'd28 & go | fsm8_out == 5'd29 & go ? 2'd1 : 2'd0;
    assign out_mem_addr1 =
     fsm8_out == 5'd26 & go | fsm8_out == 5'd28 & go ? 2'd0 :
     fsm8_out == 5'd27 & go | fsm8_out == 5'd29 & go ? 2'd1 : 2'd0;
    assign out_mem_clk =
     1'b1 ? clk : 1'd0;
    assign out_mem_write_data =
     fsm8_out == 5'd26 & go ? pe_0_0_out :
     fsm8_out == 5'd27 & go ? pe_0_1_out :
     fsm8_out == 5'd28 & go ? pe_1_0_out :
     fsm8_out == 5'd29 & go ? pe_1_1_out : 32'd0;
    assign out_mem_write_en =
     fsm8_out == 5'd26 & go | fsm8_out == 5'd27 & go | fsm8_out == 5'd28 & go | fsm8_out == 5'd29 & go ? 1'd1 : 1'd0;
    assign t0_addr0 =
     fsm1_out < 1'd1 & fsm8_out == 5'd2 & go | fsm3_out < 1'd1 & fsm8_out == 5'd8 & go ? t0_idx_out : 2'd0;
    assign t0_clk =
     1'b1 ? clk : 1'd0;
    assign t1_addr0 =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? t1_idx_out : 2'd0;
    assign t1_clk =
     1'b1 ? clk : 1'd0;
    assign fsm_clk =
     1'b1 ? clk : 1'd0;
    assign fsm_in =
     fsm_out == 1'd1 ? 1'd0 :
     fsm_out != 1'd1 & fsm8_out == 5'd0 & go ? incr_out : 1'd0;
    assign fsm_write_en =
     fsm_out != 1'd1 & fsm8_out == 5'd0 & go | fsm_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm0_clk =
     1'b1 ? clk : 1'd0;
    assign fsm0_in =
     fsm0_out == 1'd1 ? 1'd0 :
     fsm0_out != 1'd1 & fsm8_out == 5'd1 & go ? incr0_out : 1'd0;
    assign fsm0_write_en =
     fsm0_out != 1'd1 & fsm8_out == 5'd1 & go | fsm0_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm1_clk =
     1'b1 ? clk : 1'd0;
    assign fsm1_in =
     fsm1_out == 1'd1 ? 1'd0 :
     fsm1_out != 1'd1 & fsm8_out == 5'd2 & go ? incr1_out : 1'd0;
    assign fsm1_write_en =
     fsm1_out != 1'd1 & fsm8_out == 5'd2 & go | fsm1_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm2_clk =
     1'b1 ? clk : 1'd0;
    assign fsm2_in =
     fsm2_out == 3'd5 ? 3'd0 :
     fsm2_out != 3'd5 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? incr2_out : 3'd0;
    assign fsm2_write_en =
     fsm2_out != 3'd5 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm2_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm3_clk =
     1'b1 ? clk : 1'd0;
    assign fsm3_in =
     fsm3_out == 1'd1 ? 1'd0 :
     fsm3_out != 1'd1 & fsm8_out == 5'd8 & go ? incr3_out : 1'd0;
    assign fsm3_write_en =
     fsm3_out != 1'd1 & fsm8_out == 5'd8 & go | fsm3_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm4_clk =
     1'b1 ? clk : 1'd0;
    assign fsm4_in =
     fsm4_out == 3'd5 ? 3'd0 :
     fsm4_out != 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? incr4_out : 3'd0;
    assign fsm4_write_en =
     fsm4_out != 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go | fsm4_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm5_clk =
     1'b1 ? clk : 1'd0;
    assign fsm5_in =
     fsm5_out == 1'd1 ? 1'd0 :
     fsm5_out != 1'd1 & fsm8_out == 5'd14 & go ? incr5_out : 1'd0;
    assign fsm5_write_en =
     fsm5_out != 1'd1 & fsm8_out == 5'd14 & go | fsm5_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm6_clk =
     1'b1 ? clk : 1'd0;
    assign fsm6_in =
     fsm6_out == 3'd5 ? 3'd0 :
     fsm6_out != 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? incr6_out : 3'd0;
    assign fsm6_write_en =
     fsm6_out != 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go | fsm6_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm7_clk =
     1'b1 ? clk : 1'd0;
    assign fsm7_in =
     fsm7_out == 1'd1 ? 1'd0 :
     fsm7_out != 1'd1 & fsm8_out == 5'd20 & go ? incr7_out : 1'd0;
    assign fsm7_write_en =
     fsm7_out != 1'd1 & fsm8_out == 5'd20 & go | fsm7_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm8_clk =
     1'b1 ? clk : 1'd0;
    assign fsm8_in =
     fsm8_out == 5'd30 ? 5'd0 :
     fsm8_out != 5'd30 & go ? incr8_out : 5'd0;
    assign fsm8_write_en =
     fsm8_out != 5'd30 & go | fsm8_out == 5'd30 ? 1'd1 : 1'd0;
    assign incr_left =
     fsm8_out == 5'd0 & go ? 1'd1 : 1'd0;
    assign incr_right =
     fsm8_out == 5'd0 & go ? fsm_out : 1'd0;
    assign incr0_left =
     fsm8_out == 5'd1 & go ? 1'd1 : 1'd0;
    assign incr0_right =
     fsm8_out == 5'd1 & go ? fsm0_out : 1'd0;
    assign incr1_left =
     fsm8_out == 5'd2 & go ? 1'd1 : 1'd0;
    assign incr1_right =
     fsm8_out == 5'd2 & go ? fsm1_out : 1'd0;
    assign incr2_left =
     fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? 3'd1 : 3'd0;
    assign incr2_right =
     fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? fsm2_out : 3'd0;
    assign incr3_left =
     fsm8_out == 5'd8 & go ? 1'd1 : 1'd0;
    assign incr3_right =
     fsm8_out == 5'd8 & go ? fsm3_out : 1'd0;
    assign incr4_left =
     fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? 3'd1 : 3'd0;
    assign incr4_right =
     fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? fsm4_out : 3'd0;
    assign incr5_left =
     fsm8_out == 5'd14 & go ? 1'd1 : 1'd0;
    assign incr5_right =
     fsm8_out == 5'd14 & go ? fsm5_out : 1'd0;
    assign incr6_left =
     fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? 3'd1 : 3'd0;
    assign incr6_right =
     fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? fsm6_out : 3'd0;
    assign incr7_left =
     fsm8_out == 5'd20 & go ? 1'd1 : 1'd0;
    assign incr7_right =
     fsm8_out == 5'd20 & go ? fsm7_out : 1'd0;
    assign incr8_left =
     go ? 5'd1 : 5'd0;
    assign incr8_right =
     go ? fsm8_out : 5'd0;
    assign l0_add_left =
     fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? 2'd1 : 2'd0;
    assign l0_add_right =
     fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? l0_idx_out : 2'd0;
    assign l0_idx_clk =
     1'b1 ? clk : 1'd0;
    assign l0_idx_in =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go ? 2'd3 :
     fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? l0_add_out : 2'd0;
    assign l0_idx_write_en =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go | fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? 1'd1 : 1'd0;
    assign l1_add_left =
     fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? 2'd1 : 2'd0;
    assign l1_add_right =
     fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? l1_idx_out : 2'd0;
    assign l1_idx_clk =
     1'b1 ? clk : 1'd0;
    assign l1_idx_in =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go ? 2'd3 :
     fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? l1_add_out : 2'd0;
    assign l1_idx_write_en =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? 1'd1 : 1'd0;
    assign left_0_0_clk =
     1'b1 ? clk : 1'd0;
    assign left_0_0_in =
     fsm1_out < 1'd1 & fsm8_out == 5'd2 & go | fsm3_out < 1'd1 & fsm8_out == 5'd8 & go ? l0_read_data : 32'd0;
    assign left_0_0_write_en =
     fsm1_out < 1'd1 & fsm8_out == 5'd2 & go | fsm3_out < 1'd1 & fsm8_out == 5'd8 & go ? 1'd1 : 1'd0;
    assign left_0_1_clk =
     1'b1 ? clk : 1'd0;
    assign left_0_1_in =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? left_0_0_out : 32'd0;
    assign left_0_1_write_en =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? 1'd1 : 1'd0;
    assign left_1_0_clk =
     1'b1 ? clk : 1'd0;
    assign left_1_0_in =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? l1_read_data : 32'd0;
    assign left_1_0_write_en =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? 1'd1 : 1'd0;
    assign left_1_1_clk =
     1'b1 ? clk : 1'd0;
    assign left_1_1_in =
     fsm5_out < 1'd1 & fsm8_out == 5'd14 & go | fsm7_out < 1'd1 & fsm8_out == 5'd20 & go ? left_1_0_out : 32'd0;
    assign left_1_1_write_en =
     fsm5_out < 1'd1 & fsm8_out == 5'd14 & go | fsm7_out < 1'd1 & fsm8_out == 5'd20 & go ? 1'd1 : 1'd0;
    assign pe_0_0_clk =
     1'b1 ? clk : 1'd0;
    assign pe_0_0_go =
     fsm2_out < 3'd5 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? 1'd1 : 1'd0;
    assign pe_0_0_left =
     fsm2_out < 3'd5 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? left_0_0_out : 32'd0;
    assign pe_0_0_top =
     fsm2_out < 3'd5 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? top_0_0_out : 32'd0;
    assign pe_0_1_clk =
     1'b1 ? clk : 1'd0;
    assign pe_0_1_go =
     fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go | fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? 1'd1 : 1'd0;
    assign pe_0_1_left =
     fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go | fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? left_0_1_out : 32'd0;
    assign pe_0_1_top =
     fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go | fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? top_0_1_out : 32'd0;
    assign pe_1_0_clk =
     1'b1 ? clk : 1'd0;
    assign pe_1_0_go =
     fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go | fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? 1'd1 : 1'd0;
    assign pe_1_0_left =
     fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go | fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? left_1_0_out : 32'd0;
    assign pe_1_0_top =
     fsm4_out < 3'd5 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go | fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go ? top_1_0_out : 32'd0;
    assign pe_1_1_clk =
     1'b1 ? clk : 1'd0;
    assign pe_1_1_go =
     fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go | fsm8_out >= 5'd21 & fsm8_out < 5'd26 & go ? 1'd1 : 1'd0;
    assign pe_1_1_left =
     fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go | fsm8_out >= 5'd21 & fsm8_out < 5'd26 & go ? left_1_1_out : 32'd0;
    assign pe_1_1_top =
     fsm6_out < 3'd5 & fsm8_out >= 5'd15 & fsm8_out < 5'd20 & go | fsm8_out >= 5'd21 & fsm8_out < 5'd26 & go ? top_1_1_out : 32'd0;
    assign t0_add_left =
     fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? 2'd1 : 2'd0;
    assign t0_add_right =
     fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? t0_idx_out : 2'd0;
    assign t0_idx_clk =
     1'b1 ? clk : 1'd0;
    assign t0_idx_in =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go ? 2'd3 :
     fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? t0_add_out : 2'd0;
    assign t0_idx_write_en =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go | fsm0_out < 1'd1 & fsm8_out == 5'd1 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go ? 1'd1 : 1'd0;
    assign t1_add_left =
     fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? 2'd1 : 2'd0;
    assign t1_add_right =
     fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? t1_idx_out : 2'd0;
    assign t1_idx_clk =
     1'b1 ? clk : 1'd0;
    assign t1_idx_in =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go ? 2'd3 :
     fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? t1_add_out : 2'd0;
    assign t1_idx_write_en =
     fsm_out < 1'd1 & fsm8_out == 5'd0 & go | fsm2_out < 3'd1 & fsm8_out >= 5'd3 & fsm8_out < 5'd8 & go | fsm4_out < 3'd1 & fsm8_out >= 5'd9 & fsm8_out < 5'd14 & go ? 1'd1 : 1'd0;
    assign top_0_0_clk =
     1'b1 ? clk : 1'd0;
    assign top_0_0_in =
     fsm1_out < 1'd1 & fsm8_out == 5'd2 & go | fsm3_out < 1'd1 & fsm8_out == 5'd8 & go ? t0_read_data : 32'd0;
    assign top_0_0_write_en =
     fsm1_out < 1'd1 & fsm8_out == 5'd2 & go | fsm3_out < 1'd1 & fsm8_out == 5'd8 & go ? 1'd1 : 1'd0;
    assign top_0_1_clk =
     1'b1 ? clk : 1'd0;
    assign top_0_1_in =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? t1_read_data : 32'd0;
    assign top_0_1_write_en =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? 1'd1 : 1'd0;
    assign top_1_0_clk =
     1'b1 ? clk : 1'd0;
    assign top_1_0_in =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? top_0_0_out : 32'd0;
    assign top_1_0_write_en =
     fsm3_out < 1'd1 & fsm8_out == 5'd8 & go | fsm5_out < 1'd1 & fsm8_out == 5'd14 & go ? 1'd1 : 1'd0;
    assign top_1_1_clk =
     1'b1 ? clk : 1'd0;
    assign top_1_1_in =
     fsm5_out < 1'd1 & fsm8_out == 5'd14 & go | fsm7_out < 1'd1 & fsm8_out == 5'd20 & go ? top_0_1_out : 32'd0;
    assign top_1_1_write_en =
     fsm5_out < 1'd1 & fsm8_out == 5'd14 & go | fsm7_out < 1'd1 & fsm8_out == 5'd20 & go ? 1'd1 : 1'd0;
endmodule

module mac_pe (
    input logic [31:0] top,
    input logic [31:0] left,
    output logic [31:0] out,
    input logic go,
    input logic clk,
    output logic done
);
    logic [31:0] acc_in;
    logic acc_write_en;
    logic acc_clk;
    logic [31:0] acc_out;
    logic acc_done;
    logic [31:0] mul_reg_in;
    logic mul_reg_write_en;
    logic mul_reg_clk;
    logic [31:0] mul_reg_out;
    logic mul_reg_done;
    logic [31:0] add_left;
    logic [31:0] add_right;
    logic [31:0] add_out;
    logic mul_clk;
    logic mul_go;
    logic [31:0] mul_left;
    logic [31:0] mul_right;
    logic [31:0] mul_out;
    logic mul_done;
    logic [2:0] fsm_in;
    logic fsm_write_en;
    logic fsm_clk;
    logic [2:0] fsm_out;
    logic fsm_done;
    logic [2:0] incr_left;
    logic [2:0] incr_right;
    logic [2:0] incr_out;
    initial begin
        acc_in = 32'd0;
        acc_write_en = 1'd0;
        acc_clk = 1'd0;
        mul_reg_in = 32'd0;
        mul_reg_write_en = 1'd0;
        mul_reg_clk = 1'd0;
        add_left = 32'd0;
        add_right = 32'd0;
        mul_clk = 1'd0;
        mul_go = 1'd0;
        mul_left = 32'd0;
        mul_right = 32'd0;
        fsm_in = 3'd0;
        fsm_write_en = 1'd0;
        fsm_clk = 1'd0;
        incr_left = 3'd0;
        incr_right = 3'd0;
    end
    std_reg # (
        .WIDTH(32)
    ) acc (
        .clk(acc_clk),
        .done(acc_done),
        .in(acc_in),
        .out(acc_out),
        .write_en(acc_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) mul_reg (
        .clk(mul_reg_clk),
        .done(mul_reg_done),
        .in(mul_reg_in),
        .out(mul_reg_out),
        .write_en(mul_reg_write_en)
    );
    std_add # (
        .WIDTH(32)
    ) add (
        .left(add_left),
        .out(add_out),
        .right(add_right)
    );
    std_mult_pipe # (
        .WIDTH(32)
    ) mul (
        .clk(mul_clk),
        .done(mul_done),
        .go(mul_go),
        .left(mul_left),
        .out(mul_out),
        .right(mul_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm (
        .clk(fsm_clk),
        .done(fsm_done),
        .in(fsm_in),
        .out(fsm_out),
        .write_en(fsm_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr (
        .left(incr_left),
        .out(incr_out),
        .right(incr_right)
    );
    assign done =
     fsm_out == 3'd5 ? 1'd1 : 1'd0;
    assign out =
     1'b1 ? acc_out : 32'd0;
    assign acc_clk =
     1'b1 ? clk : 1'd0;
    assign acc_in =
     fsm_out == 3'd4 & go ? add_out : 32'd0;
    assign acc_write_en =
     fsm_out == 3'd4 & go ? 1'd1 : 1'd0;
    assign add_left =
     fsm_out == 3'd4 & go ? acc_out : 32'd0;
    assign add_right =
     fsm_out == 3'd4 & go ? mul_reg_out : 32'd0;
    assign fsm_clk =
     1'b1 ? clk : 1'd0;
    assign fsm_in =
     fsm_out == 3'd5 ? 3'd0 :
     fsm_out != 3'd5 & go ? incr_out : 3'd0;
    assign fsm_write_en =
     fsm_out != 3'd5 & go | fsm_out == 3'd5 ? 1'd1 : 1'd0;
    assign incr_left =
     go ? 3'd1 : 3'd0;
    assign incr_right =
     go ? fsm_out : 3'd0;
    assign mul_clk =
     1'b1 ? clk : 1'd0;
    assign mul_go =
     ~mul_done & fsm_out < 3'd4 & go ? 1'd1 : 1'd0;
    assign mul_left =
     fsm_out < 3'd4 & go ? top : 32'd0;
    assign mul_right =
     fsm_out < 3'd4 & go ? left : 32'd0;
    assign mul_reg_clk =
     1'b1 ? clk : 1'd0;
    assign mul_reg_in =
     mul_done & fsm_out < 3'd4 & go ? mul_out : 32'd0;
    assign mul_reg_write_en =
     mul_done & fsm_out < 3'd4 & go ? 1'd1 : 1'd0;
endmodule
