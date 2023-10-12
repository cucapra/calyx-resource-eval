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
    output logic [2:0] t0_addr0,
    output logic [31:0] t0_write_data,
    output logic t0_write_en,
    output logic t0_clk,
    input logic [31:0] t0_read_data,
    input logic t0_done,
    output logic [2:0] t1_addr0,
    output logic [31:0] t1_write_data,
    output logic t1_write_en,
    output logic t1_clk,
    input logic [31:0] t1_read_data,
    input logic t1_done,
    output logic [2:0] t2_addr0,
    output logic [31:0] t2_write_data,
    output logic t2_write_en,
    output logic t2_clk,
    input logic [31:0] t2_read_data,
    input logic t2_done,
    output logic [2:0] t3_addr0,
    output logic [31:0] t3_write_data,
    output logic t3_write_en,
    output logic t3_clk,
    input logic [31:0] t3_read_data,
    input logic t3_done,
    output logic [2:0] l0_addr0,
    output logic [31:0] l0_write_data,
    output logic l0_write_en,
    output logic l0_clk,
    input logic [31:0] l0_read_data,
    input logic l0_done,
    output logic [2:0] l1_addr0,
    output logic [31:0] l1_write_data,
    output logic l1_write_en,
    output logic l1_clk,
    input logic [31:0] l1_read_data,
    input logic l1_done,
    output logic [2:0] l2_addr0,
    output logic [31:0] l2_write_data,
    output logic l2_write_en,
    output logic l2_clk,
    input logic [31:0] l2_read_data,
    input logic l2_done,
    output logic [2:0] l3_addr0,
    output logic [31:0] l3_write_data,
    output logic l3_write_en,
    output logic l3_clk,
    input logic [31:0] l3_read_data,
    input logic l3_done,
    output logic [2:0] out_mem_addr0,
    output logic [2:0] out_mem_addr1,
    output logic [31:0] out_mem_write_data,
    output logic out_mem_write_en,
    output logic out_mem_clk,
    input logic [31:0] out_mem_read_data,
    input logic out_mem_done
);
    logic [2:0] t0_idx_in;
    logic t0_idx_write_en;
    logic t0_idx_clk;
    logic [2:0] t0_idx_out;
    logic t0_idx_done;
    logic [2:0] t0_add_left;
    logic [2:0] t0_add_right;
    logic [2:0] t0_add_out;
    logic [2:0] t1_idx_in;
    logic t1_idx_write_en;
    logic t1_idx_clk;
    logic [2:0] t1_idx_out;
    logic t1_idx_done;
    logic [2:0] t1_add_left;
    logic [2:0] t1_add_right;
    logic [2:0] t1_add_out;
    logic [2:0] t2_idx_in;
    logic t2_idx_write_en;
    logic t2_idx_clk;
    logic [2:0] t2_idx_out;
    logic t2_idx_done;
    logic [2:0] t2_add_left;
    logic [2:0] t2_add_right;
    logic [2:0] t2_add_out;
    logic [2:0] t3_idx_in;
    logic t3_idx_write_en;
    logic t3_idx_clk;
    logic [2:0] t3_idx_out;
    logic t3_idx_done;
    logic [2:0] t3_add_left;
    logic [2:0] t3_add_right;
    logic [2:0] t3_add_out;
    logic [2:0] l0_idx_in;
    logic l0_idx_write_en;
    logic l0_idx_clk;
    logic [2:0] l0_idx_out;
    logic l0_idx_done;
    logic [2:0] l0_add_left;
    logic [2:0] l0_add_right;
    logic [2:0] l0_add_out;
    logic [2:0] l1_idx_in;
    logic l1_idx_write_en;
    logic l1_idx_clk;
    logic [2:0] l1_idx_out;
    logic l1_idx_done;
    logic [2:0] l1_add_left;
    logic [2:0] l1_add_right;
    logic [2:0] l1_add_out;
    logic [2:0] l2_idx_in;
    logic l2_idx_write_en;
    logic l2_idx_clk;
    logic [2:0] l2_idx_out;
    logic l2_idx_done;
    logic [2:0] l2_add_left;
    logic [2:0] l2_add_right;
    logic [2:0] l2_add_out;
    logic [2:0] l3_idx_in;
    logic l3_idx_write_en;
    logic l3_idx_clk;
    logic [2:0] l3_idx_out;
    logic l3_idx_done;
    logic [2:0] l3_add_left;
    logic [2:0] l3_add_right;
    logic [2:0] l3_add_out;
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
    logic [31:0] pe_0_2_top;
    logic [31:0] pe_0_2_left;
    logic [31:0] pe_0_2_out;
    logic pe_0_2_go;
    logic pe_0_2_clk;
    logic pe_0_2_done;
    logic [31:0] top_0_2_in;
    logic top_0_2_write_en;
    logic top_0_2_clk;
    logic [31:0] top_0_2_out;
    logic top_0_2_done;
    logic [31:0] left_0_2_in;
    logic left_0_2_write_en;
    logic left_0_2_clk;
    logic [31:0] left_0_2_out;
    logic left_0_2_done;
    logic [31:0] pe_0_3_top;
    logic [31:0] pe_0_3_left;
    logic [31:0] pe_0_3_out;
    logic pe_0_3_go;
    logic pe_0_3_clk;
    logic pe_0_3_done;
    logic [31:0] top_0_3_in;
    logic top_0_3_write_en;
    logic top_0_3_clk;
    logic [31:0] top_0_3_out;
    logic top_0_3_done;
    logic [31:0] left_0_3_in;
    logic left_0_3_write_en;
    logic left_0_3_clk;
    logic [31:0] left_0_3_out;
    logic left_0_3_done;
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
    logic [31:0] pe_1_2_top;
    logic [31:0] pe_1_2_left;
    logic [31:0] pe_1_2_out;
    logic pe_1_2_go;
    logic pe_1_2_clk;
    logic pe_1_2_done;
    logic [31:0] top_1_2_in;
    logic top_1_2_write_en;
    logic top_1_2_clk;
    logic [31:0] top_1_2_out;
    logic top_1_2_done;
    logic [31:0] left_1_2_in;
    logic left_1_2_write_en;
    logic left_1_2_clk;
    logic [31:0] left_1_2_out;
    logic left_1_2_done;
    logic [31:0] pe_1_3_top;
    logic [31:0] pe_1_3_left;
    logic [31:0] pe_1_3_out;
    logic pe_1_3_go;
    logic pe_1_3_clk;
    logic pe_1_3_done;
    logic [31:0] top_1_3_in;
    logic top_1_3_write_en;
    logic top_1_3_clk;
    logic [31:0] top_1_3_out;
    logic top_1_3_done;
    logic [31:0] left_1_3_in;
    logic left_1_3_write_en;
    logic left_1_3_clk;
    logic [31:0] left_1_3_out;
    logic left_1_3_done;
    logic [31:0] pe_2_0_top;
    logic [31:0] pe_2_0_left;
    logic [31:0] pe_2_0_out;
    logic pe_2_0_go;
    logic pe_2_0_clk;
    logic pe_2_0_done;
    logic [31:0] top_2_0_in;
    logic top_2_0_write_en;
    logic top_2_0_clk;
    logic [31:0] top_2_0_out;
    logic top_2_0_done;
    logic [31:0] left_2_0_in;
    logic left_2_0_write_en;
    logic left_2_0_clk;
    logic [31:0] left_2_0_out;
    logic left_2_0_done;
    logic [31:0] pe_2_1_top;
    logic [31:0] pe_2_1_left;
    logic [31:0] pe_2_1_out;
    logic pe_2_1_go;
    logic pe_2_1_clk;
    logic pe_2_1_done;
    logic [31:0] top_2_1_in;
    logic top_2_1_write_en;
    logic top_2_1_clk;
    logic [31:0] top_2_1_out;
    logic top_2_1_done;
    logic [31:0] left_2_1_in;
    logic left_2_1_write_en;
    logic left_2_1_clk;
    logic [31:0] left_2_1_out;
    logic left_2_1_done;
    logic [31:0] pe_2_2_top;
    logic [31:0] pe_2_2_left;
    logic [31:0] pe_2_2_out;
    logic pe_2_2_go;
    logic pe_2_2_clk;
    logic pe_2_2_done;
    logic [31:0] top_2_2_in;
    logic top_2_2_write_en;
    logic top_2_2_clk;
    logic [31:0] top_2_2_out;
    logic top_2_2_done;
    logic [31:0] left_2_2_in;
    logic left_2_2_write_en;
    logic left_2_2_clk;
    logic [31:0] left_2_2_out;
    logic left_2_2_done;
    logic [31:0] pe_2_3_top;
    logic [31:0] pe_2_3_left;
    logic [31:0] pe_2_3_out;
    logic pe_2_3_go;
    logic pe_2_3_clk;
    logic pe_2_3_done;
    logic [31:0] top_2_3_in;
    logic top_2_3_write_en;
    logic top_2_3_clk;
    logic [31:0] top_2_3_out;
    logic top_2_3_done;
    logic [31:0] left_2_3_in;
    logic left_2_3_write_en;
    logic left_2_3_clk;
    logic [31:0] left_2_3_out;
    logic left_2_3_done;
    logic [31:0] pe_3_0_top;
    logic [31:0] pe_3_0_left;
    logic [31:0] pe_3_0_out;
    logic pe_3_0_go;
    logic pe_3_0_clk;
    logic pe_3_0_done;
    logic [31:0] top_3_0_in;
    logic top_3_0_write_en;
    logic top_3_0_clk;
    logic [31:0] top_3_0_out;
    logic top_3_0_done;
    logic [31:0] left_3_0_in;
    logic left_3_0_write_en;
    logic left_3_0_clk;
    logic [31:0] left_3_0_out;
    logic left_3_0_done;
    logic [31:0] pe_3_1_top;
    logic [31:0] pe_3_1_left;
    logic [31:0] pe_3_1_out;
    logic pe_3_1_go;
    logic pe_3_1_clk;
    logic pe_3_1_done;
    logic [31:0] top_3_1_in;
    logic top_3_1_write_en;
    logic top_3_1_clk;
    logic [31:0] top_3_1_out;
    logic top_3_1_done;
    logic [31:0] left_3_1_in;
    logic left_3_1_write_en;
    logic left_3_1_clk;
    logic [31:0] left_3_1_out;
    logic left_3_1_done;
    logic [31:0] pe_3_2_top;
    logic [31:0] pe_3_2_left;
    logic [31:0] pe_3_2_out;
    logic pe_3_2_go;
    logic pe_3_2_clk;
    logic pe_3_2_done;
    logic [31:0] top_3_2_in;
    logic top_3_2_write_en;
    logic top_3_2_clk;
    logic [31:0] top_3_2_out;
    logic top_3_2_done;
    logic [31:0] left_3_2_in;
    logic left_3_2_write_en;
    logic left_3_2_clk;
    logic [31:0] left_3_2_out;
    logic left_3_2_done;
    logic [31:0] pe_3_3_top;
    logic [31:0] pe_3_3_left;
    logic [31:0] pe_3_3_out;
    logic pe_3_3_go;
    logic pe_3_3_clk;
    logic pe_3_3_done;
    logic [31:0] top_3_3_in;
    logic top_3_3_write_en;
    logic top_3_3_clk;
    logic [31:0] top_3_3_out;
    logic top_3_3_done;
    logic [31:0] left_3_3_in;
    logic left_3_3_write_en;
    logic left_3_3_clk;
    logic [31:0] left_3_3_out;
    logic left_3_3_done;
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
    logic [2:0] fsm8_in;
    logic fsm8_write_en;
    logic fsm8_clk;
    logic [2:0] fsm8_out;
    logic fsm8_done;
    logic [2:0] incr8_left;
    logic [2:0] incr8_right;
    logic [2:0] incr8_out;
    logic fsm9_in;
    logic fsm9_write_en;
    logic fsm9_clk;
    logic fsm9_out;
    logic fsm9_done;
    logic incr9_left;
    logic incr9_right;
    logic incr9_out;
    logic [2:0] fsm10_in;
    logic fsm10_write_en;
    logic fsm10_clk;
    logic [2:0] fsm10_out;
    logic fsm10_done;
    logic [2:0] incr10_left;
    logic [2:0] incr10_right;
    logic [2:0] incr10_out;
    logic fsm11_in;
    logic fsm11_write_en;
    logic fsm11_clk;
    logic fsm11_out;
    logic fsm11_done;
    logic incr11_left;
    logic incr11_right;
    logic incr11_out;
    logic [2:0] fsm12_in;
    logic fsm12_write_en;
    logic fsm12_clk;
    logic [2:0] fsm12_out;
    logic fsm12_done;
    logic [2:0] incr12_left;
    logic [2:0] incr12_right;
    logic [2:0] incr12_out;
    logic fsm13_in;
    logic fsm13_write_en;
    logic fsm13_clk;
    logic fsm13_out;
    logic fsm13_done;
    logic incr13_left;
    logic incr13_right;
    logic incr13_out;
    logic [2:0] fsm14_in;
    logic fsm14_write_en;
    logic fsm14_clk;
    logic [2:0] fsm14_out;
    logic fsm14_done;
    logic [2:0] incr14_left;
    logic [2:0] incr14_right;
    logic [2:0] incr14_out;
    logic fsm15_in;
    logic fsm15_write_en;
    logic fsm15_clk;
    logic fsm15_out;
    logic fsm15_done;
    logic incr15_left;
    logic incr15_right;
    logic incr15_out;
    logic [2:0] fsm16_in;
    logic fsm16_write_en;
    logic fsm16_clk;
    logic [2:0] fsm16_out;
    logic fsm16_done;
    logic [2:0] incr16_left;
    logic [2:0] incr16_right;
    logic [2:0] incr16_out;
    logic fsm17_in;
    logic fsm17_write_en;
    logic fsm17_clk;
    logic fsm17_out;
    logic fsm17_done;
    logic incr17_left;
    logic incr17_right;
    logic incr17_out;
    logic [2:0] fsm18_in;
    logic fsm18_write_en;
    logic fsm18_clk;
    logic [2:0] fsm18_out;
    logic fsm18_done;
    logic [2:0] incr18_left;
    logic [2:0] incr18_right;
    logic [2:0] incr18_out;
    logic fsm19_in;
    logic fsm19_write_en;
    logic fsm19_clk;
    logic fsm19_out;
    logic fsm19_done;
    logic incr19_left;
    logic incr19_right;
    logic incr19_out;
    logic [6:0] fsm20_in;
    logic fsm20_write_en;
    logic fsm20_clk;
    logic [6:0] fsm20_out;
    logic fsm20_done;
    logic [6:0] incr20_left;
    logic [6:0] incr20_right;
    logic [6:0] incr20_out;
    initial begin
        t0_idx_in = 3'd0;
        t0_idx_write_en = 1'd0;
        t0_idx_clk = 1'd0;
        t0_add_left = 3'd0;
        t0_add_right = 3'd0;
        t1_idx_in = 3'd0;
        t1_idx_write_en = 1'd0;
        t1_idx_clk = 1'd0;
        t1_add_left = 3'd0;
        t1_add_right = 3'd0;
        t2_idx_in = 3'd0;
        t2_idx_write_en = 1'd0;
        t2_idx_clk = 1'd0;
        t2_add_left = 3'd0;
        t2_add_right = 3'd0;
        t3_idx_in = 3'd0;
        t3_idx_write_en = 1'd0;
        t3_idx_clk = 1'd0;
        t3_add_left = 3'd0;
        t3_add_right = 3'd0;
        l0_idx_in = 3'd0;
        l0_idx_write_en = 1'd0;
        l0_idx_clk = 1'd0;
        l0_add_left = 3'd0;
        l0_add_right = 3'd0;
        l1_idx_in = 3'd0;
        l1_idx_write_en = 1'd0;
        l1_idx_clk = 1'd0;
        l1_add_left = 3'd0;
        l1_add_right = 3'd0;
        l2_idx_in = 3'd0;
        l2_idx_write_en = 1'd0;
        l2_idx_clk = 1'd0;
        l2_add_left = 3'd0;
        l2_add_right = 3'd0;
        l3_idx_in = 3'd0;
        l3_idx_write_en = 1'd0;
        l3_idx_clk = 1'd0;
        l3_add_left = 3'd0;
        l3_add_right = 3'd0;
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
        pe_0_2_top = 32'd0;
        pe_0_2_left = 32'd0;
        pe_0_2_go = 1'd0;
        pe_0_2_clk = 1'd0;
        top_0_2_in = 32'd0;
        top_0_2_write_en = 1'd0;
        top_0_2_clk = 1'd0;
        left_0_2_in = 32'd0;
        left_0_2_write_en = 1'd0;
        left_0_2_clk = 1'd0;
        pe_0_3_top = 32'd0;
        pe_0_3_left = 32'd0;
        pe_0_3_go = 1'd0;
        pe_0_3_clk = 1'd0;
        top_0_3_in = 32'd0;
        top_0_3_write_en = 1'd0;
        top_0_3_clk = 1'd0;
        left_0_3_in = 32'd0;
        left_0_3_write_en = 1'd0;
        left_0_3_clk = 1'd0;
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
        pe_1_2_top = 32'd0;
        pe_1_2_left = 32'd0;
        pe_1_2_go = 1'd0;
        pe_1_2_clk = 1'd0;
        top_1_2_in = 32'd0;
        top_1_2_write_en = 1'd0;
        top_1_2_clk = 1'd0;
        left_1_2_in = 32'd0;
        left_1_2_write_en = 1'd0;
        left_1_2_clk = 1'd0;
        pe_1_3_top = 32'd0;
        pe_1_3_left = 32'd0;
        pe_1_3_go = 1'd0;
        pe_1_3_clk = 1'd0;
        top_1_3_in = 32'd0;
        top_1_3_write_en = 1'd0;
        top_1_3_clk = 1'd0;
        left_1_3_in = 32'd0;
        left_1_3_write_en = 1'd0;
        left_1_3_clk = 1'd0;
        pe_2_0_top = 32'd0;
        pe_2_0_left = 32'd0;
        pe_2_0_go = 1'd0;
        pe_2_0_clk = 1'd0;
        top_2_0_in = 32'd0;
        top_2_0_write_en = 1'd0;
        top_2_0_clk = 1'd0;
        left_2_0_in = 32'd0;
        left_2_0_write_en = 1'd0;
        left_2_0_clk = 1'd0;
        pe_2_1_top = 32'd0;
        pe_2_1_left = 32'd0;
        pe_2_1_go = 1'd0;
        pe_2_1_clk = 1'd0;
        top_2_1_in = 32'd0;
        top_2_1_write_en = 1'd0;
        top_2_1_clk = 1'd0;
        left_2_1_in = 32'd0;
        left_2_1_write_en = 1'd0;
        left_2_1_clk = 1'd0;
        pe_2_2_top = 32'd0;
        pe_2_2_left = 32'd0;
        pe_2_2_go = 1'd0;
        pe_2_2_clk = 1'd0;
        top_2_2_in = 32'd0;
        top_2_2_write_en = 1'd0;
        top_2_2_clk = 1'd0;
        left_2_2_in = 32'd0;
        left_2_2_write_en = 1'd0;
        left_2_2_clk = 1'd0;
        pe_2_3_top = 32'd0;
        pe_2_3_left = 32'd0;
        pe_2_3_go = 1'd0;
        pe_2_3_clk = 1'd0;
        top_2_3_in = 32'd0;
        top_2_3_write_en = 1'd0;
        top_2_3_clk = 1'd0;
        left_2_3_in = 32'd0;
        left_2_3_write_en = 1'd0;
        left_2_3_clk = 1'd0;
        pe_3_0_top = 32'd0;
        pe_3_0_left = 32'd0;
        pe_3_0_go = 1'd0;
        pe_3_0_clk = 1'd0;
        top_3_0_in = 32'd0;
        top_3_0_write_en = 1'd0;
        top_3_0_clk = 1'd0;
        left_3_0_in = 32'd0;
        left_3_0_write_en = 1'd0;
        left_3_0_clk = 1'd0;
        pe_3_1_top = 32'd0;
        pe_3_1_left = 32'd0;
        pe_3_1_go = 1'd0;
        pe_3_1_clk = 1'd0;
        top_3_1_in = 32'd0;
        top_3_1_write_en = 1'd0;
        top_3_1_clk = 1'd0;
        left_3_1_in = 32'd0;
        left_3_1_write_en = 1'd0;
        left_3_1_clk = 1'd0;
        pe_3_2_top = 32'd0;
        pe_3_2_left = 32'd0;
        pe_3_2_go = 1'd0;
        pe_3_2_clk = 1'd0;
        top_3_2_in = 32'd0;
        top_3_2_write_en = 1'd0;
        top_3_2_clk = 1'd0;
        left_3_2_in = 32'd0;
        left_3_2_write_en = 1'd0;
        left_3_2_clk = 1'd0;
        pe_3_3_top = 32'd0;
        pe_3_3_left = 32'd0;
        pe_3_3_go = 1'd0;
        pe_3_3_clk = 1'd0;
        top_3_3_in = 32'd0;
        top_3_3_write_en = 1'd0;
        top_3_3_clk = 1'd0;
        left_3_3_in = 32'd0;
        left_3_3_write_en = 1'd0;
        left_3_3_clk = 1'd0;
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
        fsm8_in = 3'd0;
        fsm8_write_en = 1'd0;
        fsm8_clk = 1'd0;
        incr8_left = 3'd0;
        incr8_right = 3'd0;
        fsm9_in = 1'd0;
        fsm9_write_en = 1'd0;
        fsm9_clk = 1'd0;
        incr9_left = 1'd0;
        incr9_right = 1'd0;
        fsm10_in = 3'd0;
        fsm10_write_en = 1'd0;
        fsm10_clk = 1'd0;
        incr10_left = 3'd0;
        incr10_right = 3'd0;
        fsm11_in = 1'd0;
        fsm11_write_en = 1'd0;
        fsm11_clk = 1'd0;
        incr11_left = 1'd0;
        incr11_right = 1'd0;
        fsm12_in = 3'd0;
        fsm12_write_en = 1'd0;
        fsm12_clk = 1'd0;
        incr12_left = 3'd0;
        incr12_right = 3'd0;
        fsm13_in = 1'd0;
        fsm13_write_en = 1'd0;
        fsm13_clk = 1'd0;
        incr13_left = 1'd0;
        incr13_right = 1'd0;
        fsm14_in = 3'd0;
        fsm14_write_en = 1'd0;
        fsm14_clk = 1'd0;
        incr14_left = 3'd0;
        incr14_right = 3'd0;
        fsm15_in = 1'd0;
        fsm15_write_en = 1'd0;
        fsm15_clk = 1'd0;
        incr15_left = 1'd0;
        incr15_right = 1'd0;
        fsm16_in = 3'd0;
        fsm16_write_en = 1'd0;
        fsm16_clk = 1'd0;
        incr16_left = 3'd0;
        incr16_right = 3'd0;
        fsm17_in = 1'd0;
        fsm17_write_en = 1'd0;
        fsm17_clk = 1'd0;
        incr17_left = 1'd0;
        incr17_right = 1'd0;
        fsm18_in = 3'd0;
        fsm18_write_en = 1'd0;
        fsm18_clk = 1'd0;
        incr18_left = 3'd0;
        incr18_right = 3'd0;
        fsm19_in = 1'd0;
        fsm19_write_en = 1'd0;
        fsm19_clk = 1'd0;
        incr19_left = 1'd0;
        incr19_right = 1'd0;
        fsm20_in = 7'd0;
        fsm20_write_en = 1'd0;
        fsm20_clk = 1'd0;
        incr20_left = 7'd0;
        incr20_right = 7'd0;
    end
    std_reg # (
        .WIDTH(3)
    ) t0_idx (
        .clk(t0_idx_clk),
        .done(t0_idx_done),
        .in(t0_idx_in),
        .out(t0_idx_out),
        .write_en(t0_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) t0_add (
        .left(t0_add_left),
        .out(t0_add_out),
        .right(t0_add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) t1_idx (
        .clk(t1_idx_clk),
        .done(t1_idx_done),
        .in(t1_idx_in),
        .out(t1_idx_out),
        .write_en(t1_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) t1_add (
        .left(t1_add_left),
        .out(t1_add_out),
        .right(t1_add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) t2_idx (
        .clk(t2_idx_clk),
        .done(t2_idx_done),
        .in(t2_idx_in),
        .out(t2_idx_out),
        .write_en(t2_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) t2_add (
        .left(t2_add_left),
        .out(t2_add_out),
        .right(t2_add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) t3_idx (
        .clk(t3_idx_clk),
        .done(t3_idx_done),
        .in(t3_idx_in),
        .out(t3_idx_out),
        .write_en(t3_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) t3_add (
        .left(t3_add_left),
        .out(t3_add_out),
        .right(t3_add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) l0_idx (
        .clk(l0_idx_clk),
        .done(l0_idx_done),
        .in(l0_idx_in),
        .out(l0_idx_out),
        .write_en(l0_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) l0_add (
        .left(l0_add_left),
        .out(l0_add_out),
        .right(l0_add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) l1_idx (
        .clk(l1_idx_clk),
        .done(l1_idx_done),
        .in(l1_idx_in),
        .out(l1_idx_out),
        .write_en(l1_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) l1_add (
        .left(l1_add_left),
        .out(l1_add_out),
        .right(l1_add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) l2_idx (
        .clk(l2_idx_clk),
        .done(l2_idx_done),
        .in(l2_idx_in),
        .out(l2_idx_out),
        .write_en(l2_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) l2_add (
        .left(l2_add_left),
        .out(l2_add_out),
        .right(l2_add_right)
    );
    std_reg # (
        .WIDTH(3)
    ) l3_idx (
        .clk(l3_idx_clk),
        .done(l3_idx_done),
        .in(l3_idx_in),
        .out(l3_idx_out),
        .write_en(l3_idx_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) l3_add (
        .left(l3_add_left),
        .out(l3_add_out),
        .right(l3_add_right)
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
    mac_pe pe_0_2 (
        .clk(pe_0_2_clk),
        .done(pe_0_2_done),
        .go(pe_0_2_go),
        .left(pe_0_2_left),
        .out(pe_0_2_out),
        .top(pe_0_2_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_0_2 (
        .clk(top_0_2_clk),
        .done(top_0_2_done),
        .in(top_0_2_in),
        .out(top_0_2_out),
        .write_en(top_0_2_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_0_2 (
        .clk(left_0_2_clk),
        .done(left_0_2_done),
        .in(left_0_2_in),
        .out(left_0_2_out),
        .write_en(left_0_2_write_en)
    );
    mac_pe pe_0_3 (
        .clk(pe_0_3_clk),
        .done(pe_0_3_done),
        .go(pe_0_3_go),
        .left(pe_0_3_left),
        .out(pe_0_3_out),
        .top(pe_0_3_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_0_3 (
        .clk(top_0_3_clk),
        .done(top_0_3_done),
        .in(top_0_3_in),
        .out(top_0_3_out),
        .write_en(top_0_3_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_0_3 (
        .clk(left_0_3_clk),
        .done(left_0_3_done),
        .in(left_0_3_in),
        .out(left_0_3_out),
        .write_en(left_0_3_write_en)
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
    mac_pe pe_1_2 (
        .clk(pe_1_2_clk),
        .done(pe_1_2_done),
        .go(pe_1_2_go),
        .left(pe_1_2_left),
        .out(pe_1_2_out),
        .top(pe_1_2_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_1_2 (
        .clk(top_1_2_clk),
        .done(top_1_2_done),
        .in(top_1_2_in),
        .out(top_1_2_out),
        .write_en(top_1_2_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_1_2 (
        .clk(left_1_2_clk),
        .done(left_1_2_done),
        .in(left_1_2_in),
        .out(left_1_2_out),
        .write_en(left_1_2_write_en)
    );
    mac_pe pe_1_3 (
        .clk(pe_1_3_clk),
        .done(pe_1_3_done),
        .go(pe_1_3_go),
        .left(pe_1_3_left),
        .out(pe_1_3_out),
        .top(pe_1_3_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_1_3 (
        .clk(top_1_3_clk),
        .done(top_1_3_done),
        .in(top_1_3_in),
        .out(top_1_3_out),
        .write_en(top_1_3_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_1_3 (
        .clk(left_1_3_clk),
        .done(left_1_3_done),
        .in(left_1_3_in),
        .out(left_1_3_out),
        .write_en(left_1_3_write_en)
    );
    mac_pe pe_2_0 (
        .clk(pe_2_0_clk),
        .done(pe_2_0_done),
        .go(pe_2_0_go),
        .left(pe_2_0_left),
        .out(pe_2_0_out),
        .top(pe_2_0_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_2_0 (
        .clk(top_2_0_clk),
        .done(top_2_0_done),
        .in(top_2_0_in),
        .out(top_2_0_out),
        .write_en(top_2_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_2_0 (
        .clk(left_2_0_clk),
        .done(left_2_0_done),
        .in(left_2_0_in),
        .out(left_2_0_out),
        .write_en(left_2_0_write_en)
    );
    mac_pe pe_2_1 (
        .clk(pe_2_1_clk),
        .done(pe_2_1_done),
        .go(pe_2_1_go),
        .left(pe_2_1_left),
        .out(pe_2_1_out),
        .top(pe_2_1_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_2_1 (
        .clk(top_2_1_clk),
        .done(top_2_1_done),
        .in(top_2_1_in),
        .out(top_2_1_out),
        .write_en(top_2_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_2_1 (
        .clk(left_2_1_clk),
        .done(left_2_1_done),
        .in(left_2_1_in),
        .out(left_2_1_out),
        .write_en(left_2_1_write_en)
    );
    mac_pe pe_2_2 (
        .clk(pe_2_2_clk),
        .done(pe_2_2_done),
        .go(pe_2_2_go),
        .left(pe_2_2_left),
        .out(pe_2_2_out),
        .top(pe_2_2_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_2_2 (
        .clk(top_2_2_clk),
        .done(top_2_2_done),
        .in(top_2_2_in),
        .out(top_2_2_out),
        .write_en(top_2_2_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_2_2 (
        .clk(left_2_2_clk),
        .done(left_2_2_done),
        .in(left_2_2_in),
        .out(left_2_2_out),
        .write_en(left_2_2_write_en)
    );
    mac_pe pe_2_3 (
        .clk(pe_2_3_clk),
        .done(pe_2_3_done),
        .go(pe_2_3_go),
        .left(pe_2_3_left),
        .out(pe_2_3_out),
        .top(pe_2_3_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_2_3 (
        .clk(top_2_3_clk),
        .done(top_2_3_done),
        .in(top_2_3_in),
        .out(top_2_3_out),
        .write_en(top_2_3_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_2_3 (
        .clk(left_2_3_clk),
        .done(left_2_3_done),
        .in(left_2_3_in),
        .out(left_2_3_out),
        .write_en(left_2_3_write_en)
    );
    mac_pe pe_3_0 (
        .clk(pe_3_0_clk),
        .done(pe_3_0_done),
        .go(pe_3_0_go),
        .left(pe_3_0_left),
        .out(pe_3_0_out),
        .top(pe_3_0_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_3_0 (
        .clk(top_3_0_clk),
        .done(top_3_0_done),
        .in(top_3_0_in),
        .out(top_3_0_out),
        .write_en(top_3_0_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_3_0 (
        .clk(left_3_0_clk),
        .done(left_3_0_done),
        .in(left_3_0_in),
        .out(left_3_0_out),
        .write_en(left_3_0_write_en)
    );
    mac_pe pe_3_1 (
        .clk(pe_3_1_clk),
        .done(pe_3_1_done),
        .go(pe_3_1_go),
        .left(pe_3_1_left),
        .out(pe_3_1_out),
        .top(pe_3_1_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_3_1 (
        .clk(top_3_1_clk),
        .done(top_3_1_done),
        .in(top_3_1_in),
        .out(top_3_1_out),
        .write_en(top_3_1_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_3_1 (
        .clk(left_3_1_clk),
        .done(left_3_1_done),
        .in(left_3_1_in),
        .out(left_3_1_out),
        .write_en(left_3_1_write_en)
    );
    mac_pe pe_3_2 (
        .clk(pe_3_2_clk),
        .done(pe_3_2_done),
        .go(pe_3_2_go),
        .left(pe_3_2_left),
        .out(pe_3_2_out),
        .top(pe_3_2_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_3_2 (
        .clk(top_3_2_clk),
        .done(top_3_2_done),
        .in(top_3_2_in),
        .out(top_3_2_out),
        .write_en(top_3_2_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_3_2 (
        .clk(left_3_2_clk),
        .done(left_3_2_done),
        .in(left_3_2_in),
        .out(left_3_2_out),
        .write_en(left_3_2_write_en)
    );
    mac_pe pe_3_3 (
        .clk(pe_3_3_clk),
        .done(pe_3_3_done),
        .go(pe_3_3_go),
        .left(pe_3_3_left),
        .out(pe_3_3_out),
        .top(pe_3_3_top)
    );
    std_reg # (
        .WIDTH(32)
    ) top_3_3 (
        .clk(top_3_3_clk),
        .done(top_3_3_done),
        .in(top_3_3_in),
        .out(top_3_3_out),
        .write_en(top_3_3_write_en)
    );
    std_reg # (
        .WIDTH(32)
    ) left_3_3 (
        .clk(left_3_3_clk),
        .done(left_3_3_done),
        .in(left_3_3_in),
        .out(left_3_3_out),
        .write_en(left_3_3_write_en)
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
        .WIDTH(3)
    ) fsm8 (
        .clk(fsm8_clk),
        .done(fsm8_done),
        .in(fsm8_in),
        .out(fsm8_out),
        .write_en(fsm8_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr8 (
        .left(incr8_left),
        .out(incr8_out),
        .right(incr8_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm9 (
        .clk(fsm9_clk),
        .done(fsm9_done),
        .in(fsm9_in),
        .out(fsm9_out),
        .write_en(fsm9_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr9 (
        .left(incr9_left),
        .out(incr9_out),
        .right(incr9_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm10 (
        .clk(fsm10_clk),
        .done(fsm10_done),
        .in(fsm10_in),
        .out(fsm10_out),
        .write_en(fsm10_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr10 (
        .left(incr10_left),
        .out(incr10_out),
        .right(incr10_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm11 (
        .clk(fsm11_clk),
        .done(fsm11_done),
        .in(fsm11_in),
        .out(fsm11_out),
        .write_en(fsm11_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr11 (
        .left(incr11_left),
        .out(incr11_out),
        .right(incr11_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm12 (
        .clk(fsm12_clk),
        .done(fsm12_done),
        .in(fsm12_in),
        .out(fsm12_out),
        .write_en(fsm12_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr12 (
        .left(incr12_left),
        .out(incr12_out),
        .right(incr12_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm13 (
        .clk(fsm13_clk),
        .done(fsm13_done),
        .in(fsm13_in),
        .out(fsm13_out),
        .write_en(fsm13_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr13 (
        .left(incr13_left),
        .out(incr13_out),
        .right(incr13_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm14 (
        .clk(fsm14_clk),
        .done(fsm14_done),
        .in(fsm14_in),
        .out(fsm14_out),
        .write_en(fsm14_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr14 (
        .left(incr14_left),
        .out(incr14_out),
        .right(incr14_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm15 (
        .clk(fsm15_clk),
        .done(fsm15_done),
        .in(fsm15_in),
        .out(fsm15_out),
        .write_en(fsm15_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr15 (
        .left(incr15_left),
        .out(incr15_out),
        .right(incr15_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm16 (
        .clk(fsm16_clk),
        .done(fsm16_done),
        .in(fsm16_in),
        .out(fsm16_out),
        .write_en(fsm16_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr16 (
        .left(incr16_left),
        .out(incr16_out),
        .right(incr16_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm17 (
        .clk(fsm17_clk),
        .done(fsm17_done),
        .in(fsm17_in),
        .out(fsm17_out),
        .write_en(fsm17_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr17 (
        .left(incr17_left),
        .out(incr17_out),
        .right(incr17_right)
    );
    std_reg # (
        .WIDTH(3)
    ) fsm18 (
        .clk(fsm18_clk),
        .done(fsm18_done),
        .in(fsm18_in),
        .out(fsm18_out),
        .write_en(fsm18_write_en)
    );
    std_add # (
        .WIDTH(3)
    ) incr18 (
        .left(incr18_left),
        .out(incr18_out),
        .right(incr18_right)
    );
    std_reg # (
        .WIDTH(1)
    ) fsm19 (
        .clk(fsm19_clk),
        .done(fsm19_done),
        .in(fsm19_in),
        .out(fsm19_out),
        .write_en(fsm19_write_en)
    );
    std_add # (
        .WIDTH(1)
    ) incr19 (
        .left(incr19_left),
        .out(incr19_out),
        .right(incr19_right)
    );
    std_reg # (
        .WIDTH(7)
    ) fsm20 (
        .clk(fsm20_clk),
        .done(fsm20_done),
        .in(fsm20_in),
        .out(fsm20_out),
        .write_en(fsm20_write_en)
    );
    std_add # (
        .WIDTH(7)
    ) incr20 (
        .left(incr20_left),
        .out(incr20_out),
        .right(incr20_right)
    );
    assign done =
     fsm20_out == 7'd78 ? 1'd1 : 1'd0;
    assign l0_addr0 =
     fsm1_out < 1'd1 & fsm20_out == 7'd2 & go | fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go ? l0_idx_out : 3'd0;
    assign l0_clk =
     1'b1 ? clk : 1'd0;
    assign l1_addr0 =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? l1_idx_out : 3'd0;
    assign l1_clk =
     1'b1 ? clk : 1'd0;
    assign l2_addr0 =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? l2_idx_out : 3'd0;
    assign l2_clk =
     1'b1 ? clk : 1'd0;
    assign l3_addr0 =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? l3_idx_out : 3'd0;
    assign l3_clk =
     1'b1 ? clk : 1'd0;
    assign out_mem_addr0 =
     fsm20_out == 7'd62 & go | fsm20_out == 7'd63 & go | fsm20_out == 7'd64 & go | fsm20_out == 7'd65 & go ? 3'd0 :
     fsm20_out == 7'd66 & go | fsm20_out == 7'd67 & go | fsm20_out == 7'd68 & go | fsm20_out == 7'd69 & go ? 3'd1 :
     fsm20_out == 7'd70 & go | fsm20_out == 7'd71 & go | fsm20_out == 7'd72 & go | fsm20_out == 7'd73 & go ? 3'd2 :
     fsm20_out == 7'd74 & go | fsm20_out == 7'd75 & go | fsm20_out == 7'd76 & go | fsm20_out == 7'd77 & go ? 3'd3 : 3'd0;
    assign out_mem_addr1 =
     fsm20_out == 7'd62 & go | fsm20_out == 7'd66 & go | fsm20_out == 7'd70 & go | fsm20_out == 7'd74 & go ? 3'd0 :
     fsm20_out == 7'd63 & go | fsm20_out == 7'd67 & go | fsm20_out == 7'd71 & go | fsm20_out == 7'd75 & go ? 3'd1 :
     fsm20_out == 7'd64 & go | fsm20_out == 7'd68 & go | fsm20_out == 7'd72 & go | fsm20_out == 7'd76 & go ? 3'd2 :
     fsm20_out == 7'd65 & go | fsm20_out == 7'd69 & go | fsm20_out == 7'd73 & go | fsm20_out == 7'd77 & go ? 3'd3 : 3'd0;
    assign out_mem_clk =
     1'b1 ? clk : 1'd0;
    assign out_mem_write_data =
     fsm20_out == 7'd62 & go ? pe_0_0_out :
     fsm20_out == 7'd63 & go ? pe_0_1_out :
     fsm20_out == 7'd64 & go ? pe_0_2_out :
     fsm20_out == 7'd65 & go ? pe_0_3_out :
     fsm20_out == 7'd66 & go ? pe_1_0_out :
     fsm20_out == 7'd67 & go ? pe_1_1_out :
     fsm20_out == 7'd68 & go ? pe_1_2_out :
     fsm20_out == 7'd69 & go ? pe_1_3_out :
     fsm20_out == 7'd70 & go ? pe_2_0_out :
     fsm20_out == 7'd71 & go ? pe_2_1_out :
     fsm20_out == 7'd72 & go ? pe_2_2_out :
     fsm20_out == 7'd73 & go ? pe_2_3_out :
     fsm20_out == 7'd74 & go ? pe_3_0_out :
     fsm20_out == 7'd75 & go ? pe_3_1_out :
     fsm20_out == 7'd76 & go ? pe_3_2_out :
     fsm20_out == 7'd77 & go ? pe_3_3_out : 32'd0;
    assign out_mem_write_en =
     fsm20_out == 7'd62 & go | fsm20_out == 7'd63 & go | fsm20_out == 7'd64 & go | fsm20_out == 7'd65 & go | fsm20_out == 7'd66 & go | fsm20_out == 7'd67 & go | fsm20_out == 7'd68 & go | fsm20_out == 7'd69 & go | fsm20_out == 7'd70 & go | fsm20_out == 7'd71 & go | fsm20_out == 7'd72 & go | fsm20_out == 7'd73 & go | fsm20_out == 7'd74 & go | fsm20_out == 7'd75 & go | fsm20_out == 7'd76 & go | fsm20_out == 7'd77 & go ? 1'd1 : 1'd0;
    assign t0_addr0 =
     fsm1_out < 1'd1 & fsm20_out == 7'd2 & go | fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go ? t0_idx_out : 3'd0;
    assign t0_clk =
     1'b1 ? clk : 1'd0;
    assign t1_addr0 =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? t1_idx_out : 3'd0;
    assign t1_clk =
     1'b1 ? clk : 1'd0;
    assign t2_addr0 =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? t2_idx_out : 3'd0;
    assign t2_clk =
     1'b1 ? clk : 1'd0;
    assign t3_addr0 =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? t3_idx_out : 3'd0;
    assign t3_clk =
     1'b1 ? clk : 1'd0;
    assign fsm_clk =
     1'b1 ? clk : 1'd0;
    assign fsm_in =
     fsm_out == 1'd1 ? 1'd0 :
     fsm_out != 1'd1 & fsm20_out == 7'd0 & go ? incr_out : 1'd0;
    assign fsm_write_en =
     fsm_out != 1'd1 & fsm20_out == 7'd0 & go | fsm_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm0_clk =
     1'b1 ? clk : 1'd0;
    assign fsm0_in =
     fsm0_out == 1'd1 ? 1'd0 :
     fsm0_out != 1'd1 & fsm20_out == 7'd1 & go ? incr0_out : 1'd0;
    assign fsm0_write_en =
     fsm0_out != 1'd1 & fsm20_out == 7'd1 & go | fsm0_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm1_clk =
     1'b1 ? clk : 1'd0;
    assign fsm1_in =
     fsm1_out == 1'd1 ? 1'd0 :
     fsm1_out != 1'd1 & fsm20_out == 7'd2 & go ? incr1_out : 1'd0;
    assign fsm1_write_en =
     fsm1_out != 1'd1 & fsm20_out == 7'd2 & go | fsm1_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm10_clk =
     1'b1 ? clk : 1'd0;
    assign fsm10_in =
     fsm10_out == 3'd5 ? 3'd0 :
     fsm10_out != 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? incr10_out : 3'd0;
    assign fsm10_write_en =
     fsm10_out != 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm10_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm11_clk =
     1'b1 ? clk : 1'd0;
    assign fsm11_in =
     fsm11_out == 1'd1 ? 1'd0 :
     fsm11_out != 1'd1 & fsm20_out == 7'd32 & go ? incr11_out : 1'd0;
    assign fsm11_write_en =
     fsm11_out != 1'd1 & fsm20_out == 7'd32 & go | fsm11_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm12_clk =
     1'b1 ? clk : 1'd0;
    assign fsm12_in =
     fsm12_out == 3'd5 ? 3'd0 :
     fsm12_out != 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? incr12_out : 3'd0;
    assign fsm12_write_en =
     fsm12_out != 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm12_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm13_clk =
     1'b1 ? clk : 1'd0;
    assign fsm13_in =
     fsm13_out == 1'd1 ? 1'd0 :
     fsm13_out != 1'd1 & fsm20_out == 7'd38 & go ? incr13_out : 1'd0;
    assign fsm13_write_en =
     fsm13_out != 1'd1 & fsm20_out == 7'd38 & go | fsm13_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm14_clk =
     1'b1 ? clk : 1'd0;
    assign fsm14_in =
     fsm14_out == 3'd5 ? 3'd0 :
     fsm14_out != 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? incr14_out : 3'd0;
    assign fsm14_write_en =
     fsm14_out != 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm14_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm15_clk =
     1'b1 ? clk : 1'd0;
    assign fsm15_in =
     fsm15_out == 1'd1 ? 1'd0 :
     fsm15_out != 1'd1 & fsm20_out == 7'd44 & go ? incr15_out : 1'd0;
    assign fsm15_write_en =
     fsm15_out != 1'd1 & fsm20_out == 7'd44 & go | fsm15_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm16_clk =
     1'b1 ? clk : 1'd0;
    assign fsm16_in =
     fsm16_out == 3'd5 ? 3'd0 :
     fsm16_out != 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? incr16_out : 3'd0;
    assign fsm16_write_en =
     fsm16_out != 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm16_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm17_clk =
     1'b1 ? clk : 1'd0;
    assign fsm17_in =
     fsm17_out == 1'd1 ? 1'd0 :
     fsm17_out != 1'd1 & fsm20_out == 7'd50 & go ? incr17_out : 1'd0;
    assign fsm17_write_en =
     fsm17_out != 1'd1 & fsm20_out == 7'd50 & go | fsm17_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm18_clk =
     1'b1 ? clk : 1'd0;
    assign fsm18_in =
     fsm18_out == 3'd5 ? 3'd0 :
     fsm18_out != 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? incr18_out : 3'd0;
    assign fsm18_write_en =
     fsm18_out != 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go | fsm18_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm19_clk =
     1'b1 ? clk : 1'd0;
    assign fsm19_in =
     fsm19_out == 1'd1 ? 1'd0 :
     fsm19_out != 1'd1 & fsm20_out == 7'd56 & go ? incr19_out : 1'd0;
    assign fsm19_write_en =
     fsm19_out != 1'd1 & fsm20_out == 7'd56 & go | fsm19_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm2_clk =
     1'b1 ? clk : 1'd0;
    assign fsm2_in =
     fsm2_out == 3'd5 ? 3'd0 :
     fsm2_out != 3'd5 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go ? incr2_out : 3'd0;
    assign fsm2_write_en =
     fsm2_out != 3'd5 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm2_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm20_clk =
     1'b1 ? clk : 1'd0;
    assign fsm20_in =
     fsm20_out == 7'd78 ? 7'd0 :
     fsm20_out != 7'd78 & go ? incr20_out : 7'd0;
    assign fsm20_write_en =
     fsm20_out != 7'd78 & go | fsm20_out == 7'd78 ? 1'd1 : 1'd0;
    assign fsm3_clk =
     1'b1 ? clk : 1'd0;
    assign fsm3_in =
     fsm3_out == 1'd1 ? 1'd0 :
     fsm3_out != 1'd1 & fsm20_out == 7'd8 & go ? incr3_out : 1'd0;
    assign fsm3_write_en =
     fsm3_out != 1'd1 & fsm20_out == 7'd8 & go | fsm3_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm4_clk =
     1'b1 ? clk : 1'd0;
    assign fsm4_in =
     fsm4_out == 3'd5 ? 3'd0 :
     fsm4_out != 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go ? incr4_out : 3'd0;
    assign fsm4_write_en =
     fsm4_out != 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm4_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm5_clk =
     1'b1 ? clk : 1'd0;
    assign fsm5_in =
     fsm5_out == 1'd1 ? 1'd0 :
     fsm5_out != 1'd1 & fsm20_out == 7'd14 & go ? incr5_out : 1'd0;
    assign fsm5_write_en =
     fsm5_out != 1'd1 & fsm20_out == 7'd14 & go | fsm5_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm6_clk =
     1'b1 ? clk : 1'd0;
    assign fsm6_in =
     fsm6_out == 3'd5 ? 3'd0 :
     fsm6_out != 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? incr6_out : 3'd0;
    assign fsm6_write_en =
     fsm6_out != 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm6_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm7_clk =
     1'b1 ? clk : 1'd0;
    assign fsm7_in =
     fsm7_out == 1'd1 ? 1'd0 :
     fsm7_out != 1'd1 & fsm20_out == 7'd20 & go ? incr7_out : 1'd0;
    assign fsm7_write_en =
     fsm7_out != 1'd1 & fsm20_out == 7'd20 & go | fsm7_out == 1'd1 ? 1'd1 : 1'd0;
    assign fsm8_clk =
     1'b1 ? clk : 1'd0;
    assign fsm8_in =
     fsm8_out == 3'd5 ? 3'd0 :
     fsm8_out != 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? incr8_out : 3'd0;
    assign fsm8_write_en =
     fsm8_out != 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm8_out == 3'd5 ? 1'd1 : 1'd0;
    assign fsm9_clk =
     1'b1 ? clk : 1'd0;
    assign fsm9_in =
     fsm9_out == 1'd1 ? 1'd0 :
     fsm9_out != 1'd1 & fsm20_out == 7'd26 & go ? incr9_out : 1'd0;
    assign fsm9_write_en =
     fsm9_out != 1'd1 & fsm20_out == 7'd26 & go | fsm9_out == 1'd1 ? 1'd1 : 1'd0;
    assign incr_left =
     fsm20_out == 7'd0 & go ? 1'd1 : 1'd0;
    assign incr_right =
     fsm20_out == 7'd0 & go ? fsm_out : 1'd0;
    assign incr0_left =
     fsm20_out == 7'd1 & go ? 1'd1 : 1'd0;
    assign incr0_right =
     fsm20_out == 7'd1 & go ? fsm0_out : 1'd0;
    assign incr1_left =
     fsm20_out == 7'd2 & go ? 1'd1 : 1'd0;
    assign incr1_right =
     fsm20_out == 7'd2 & go ? fsm1_out : 1'd0;
    assign incr10_left =
     fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? 3'd1 : 3'd0;
    assign incr10_right =
     fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? fsm10_out : 3'd0;
    assign incr11_left =
     fsm20_out == 7'd32 & go ? 1'd1 : 1'd0;
    assign incr11_right =
     fsm20_out == 7'd32 & go ? fsm11_out : 1'd0;
    assign incr12_left =
     fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 3'd1 : 3'd0;
    assign incr12_right =
     fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? fsm12_out : 3'd0;
    assign incr13_left =
     fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign incr13_right =
     fsm20_out == 7'd38 & go ? fsm13_out : 1'd0;
    assign incr14_left =
     fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? 3'd1 : 3'd0;
    assign incr14_right =
     fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? fsm14_out : 3'd0;
    assign incr15_left =
     fsm20_out == 7'd44 & go ? 1'd1 : 1'd0;
    assign incr15_right =
     fsm20_out == 7'd44 & go ? fsm15_out : 1'd0;
    assign incr16_left =
     fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? 3'd1 : 3'd0;
    assign incr16_right =
     fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? fsm16_out : 3'd0;
    assign incr17_left =
     fsm20_out == 7'd50 & go ? 1'd1 : 1'd0;
    assign incr17_right =
     fsm20_out == 7'd50 & go ? fsm17_out : 1'd0;
    assign incr18_left =
     fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? 3'd1 : 3'd0;
    assign incr18_right =
     fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? fsm18_out : 3'd0;
    assign incr19_left =
     fsm20_out == 7'd56 & go ? 1'd1 : 1'd0;
    assign incr19_right =
     fsm20_out == 7'd56 & go ? fsm19_out : 1'd0;
    assign incr2_left =
     fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go ? 3'd1 : 3'd0;
    assign incr2_right =
     fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go ? fsm2_out : 3'd0;
    assign incr20_left =
     go ? 7'd1 : 7'd0;
    assign incr20_right =
     go ? fsm20_out : 7'd0;
    assign incr3_left =
     fsm20_out == 7'd8 & go ? 1'd1 : 1'd0;
    assign incr3_right =
     fsm20_out == 7'd8 & go ? fsm3_out : 1'd0;
    assign incr4_left =
     fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go ? 3'd1 : 3'd0;
    assign incr4_right =
     fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go ? fsm4_out : 3'd0;
    assign incr5_left =
     fsm20_out == 7'd14 & go ? 1'd1 : 1'd0;
    assign incr5_right =
     fsm20_out == 7'd14 & go ? fsm5_out : 1'd0;
    assign incr6_left =
     fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? 3'd1 : 3'd0;
    assign incr6_right =
     fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? fsm6_out : 3'd0;
    assign incr7_left =
     fsm20_out == 7'd20 & go ? 1'd1 : 1'd0;
    assign incr7_right =
     fsm20_out == 7'd20 & go ? fsm7_out : 1'd0;
    assign incr8_left =
     fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? 3'd1 : 3'd0;
    assign incr8_right =
     fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? fsm8_out : 3'd0;
    assign incr9_left =
     fsm20_out == 7'd26 & go ? 1'd1 : 1'd0;
    assign incr9_right =
     fsm20_out == 7'd26 & go ? fsm9_out : 1'd0;
    assign l0_add_left =
     fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? 3'd1 : 3'd0;
    assign l0_add_right =
     fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? l0_idx_out : 3'd0;
    assign l0_idx_clk =
     1'b1 ? clk : 1'd0;
    assign l0_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? l0_add_out : 3'd0;
    assign l0_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? 1'd1 : 1'd0;
    assign l1_add_left =
     fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? 3'd1 : 3'd0;
    assign l1_add_right =
     fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? l1_idx_out : 3'd0;
    assign l1_idx_clk =
     1'b1 ? clk : 1'd0;
    assign l1_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? l1_add_out : 3'd0;
    assign l1_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? 1'd1 : 1'd0;
    assign l2_add_left =
     fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? 3'd1 : 3'd0;
    assign l2_add_right =
     fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? l2_idx_out : 3'd0;
    assign l2_idx_clk =
     1'b1 ? clk : 1'd0;
    assign l2_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? l2_add_out : 3'd0;
    assign l2_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? 1'd1 : 1'd0;
    assign l3_add_left =
     fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 3'd1 : 3'd0;
    assign l3_add_right =
     fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? l3_idx_out : 3'd0;
    assign l3_idx_clk =
     1'b1 ? clk : 1'd0;
    assign l3_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? l3_add_out : 3'd0;
    assign l3_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 1'd1 : 1'd0;
    assign left_0_0_clk =
     1'b1 ? clk : 1'd0;
    assign left_0_0_in =
     fsm1_out < 1'd1 & fsm20_out == 7'd2 & go | fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go ? l0_read_data : 32'd0;
    assign left_0_0_write_en =
     fsm1_out < 1'd1 & fsm20_out == 7'd2 & go | fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go ? 1'd1 : 1'd0;
    assign left_0_1_clk =
     1'b1 ? clk : 1'd0;
    assign left_0_1_in =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? left_0_0_out : 32'd0;
    assign left_0_1_write_en =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? 1'd1 : 1'd0;
    assign left_0_2_clk =
     1'b1 ? clk : 1'd0;
    assign left_0_2_in =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? left_0_1_out : 32'd0;
    assign left_0_2_write_en =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? 1'd1 : 1'd0;
    assign left_0_3_clk =
     1'b1 ? clk : 1'd0;
    assign left_0_3_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? left_0_2_out : 32'd0;
    assign left_0_3_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign left_1_0_clk =
     1'b1 ? clk : 1'd0;
    assign left_1_0_in =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? l1_read_data : 32'd0;
    assign left_1_0_write_en =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? 1'd1 : 1'd0;
    assign left_1_1_clk =
     1'b1 ? clk : 1'd0;
    assign left_1_1_in =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? left_1_0_out : 32'd0;
    assign left_1_1_write_en =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? 1'd1 : 1'd0;
    assign left_1_2_clk =
     1'b1 ? clk : 1'd0;
    assign left_1_2_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? left_1_1_out : 32'd0;
    assign left_1_2_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign left_1_3_clk =
     1'b1 ? clk : 1'd0;
    assign left_1_3_in =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? left_1_2_out : 32'd0;
    assign left_1_3_write_en =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? 1'd1 : 1'd0;
    assign left_2_0_clk =
     1'b1 ? clk : 1'd0;
    assign left_2_0_in =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? l2_read_data : 32'd0;
    assign left_2_0_write_en =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? 1'd1 : 1'd0;
    assign left_2_1_clk =
     1'b1 ? clk : 1'd0;
    assign left_2_1_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? left_2_0_out : 32'd0;
    assign left_2_1_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign left_2_2_clk =
     1'b1 ? clk : 1'd0;
    assign left_2_2_in =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? left_2_1_out : 32'd0;
    assign left_2_2_write_en =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? 1'd1 : 1'd0;
    assign left_2_3_clk =
     1'b1 ? clk : 1'd0;
    assign left_2_3_in =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? left_2_2_out : 32'd0;
    assign left_2_3_write_en =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? 1'd1 : 1'd0;
    assign left_3_0_clk =
     1'b1 ? clk : 1'd0;
    assign left_3_0_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? l3_read_data : 32'd0;
    assign left_3_0_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign left_3_1_clk =
     1'b1 ? clk : 1'd0;
    assign left_3_1_in =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? left_3_0_out : 32'd0;
    assign left_3_1_write_en =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? 1'd1 : 1'd0;
    assign left_3_2_clk =
     1'b1 ? clk : 1'd0;
    assign left_3_2_in =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? left_3_1_out : 32'd0;
    assign left_3_2_write_en =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? 1'd1 : 1'd0;
    assign left_3_3_clk =
     1'b1 ? clk : 1'd0;
    assign left_3_3_in =
     fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go | fsm19_out < 1'd1 & fsm20_out == 7'd56 & go ? left_3_2_out : 32'd0;
    assign left_3_3_write_en =
     fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go | fsm19_out < 1'd1 & fsm20_out == 7'd56 & go ? 1'd1 : 1'd0;
    assign pe_0_0_clk =
     1'b1 ? clk : 1'd0;
    assign pe_0_0_go =
     fsm2_out < 3'd5 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? 1'd1 : 1'd0;
    assign pe_0_0_left =
     fsm2_out < 3'd5 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? left_0_0_out : 32'd0;
    assign pe_0_0_top =
     fsm2_out < 3'd5 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? top_0_0_out : 32'd0;
    assign pe_0_1_clk =
     1'b1 ? clk : 1'd0;
    assign pe_0_1_go =
     fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? 1'd1 : 1'd0;
    assign pe_0_1_left =
     fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? left_0_1_out : 32'd0;
    assign pe_0_1_top =
     fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? top_0_1_out : 32'd0;
    assign pe_0_2_clk =
     1'b1 ? clk : 1'd0;
    assign pe_0_2_go =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 1'd1 : 1'd0;
    assign pe_0_2_left =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? left_0_2_out : 32'd0;
    assign pe_0_2_top =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? top_0_2_out : 32'd0;
    assign pe_0_3_clk =
     1'b1 ? clk : 1'd0;
    assign pe_0_3_go =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? 1'd1 : 1'd0;
    assign pe_0_3_left =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? left_0_3_out : 32'd0;
    assign pe_0_3_top =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? top_0_3_out : 32'd0;
    assign pe_1_0_clk =
     1'b1 ? clk : 1'd0;
    assign pe_1_0_go =
     fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? 1'd1 : 1'd0;
    assign pe_1_0_left =
     fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? left_1_0_out : 32'd0;
    assign pe_1_0_top =
     fsm4_out < 3'd5 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? top_1_0_out : 32'd0;
    assign pe_1_1_clk =
     1'b1 ? clk : 1'd0;
    assign pe_1_1_go =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 1'd1 : 1'd0;
    assign pe_1_1_left =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? left_1_1_out : 32'd0;
    assign pe_1_1_top =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? top_1_1_out : 32'd0;
    assign pe_1_2_clk =
     1'b1 ? clk : 1'd0;
    assign pe_1_2_go =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? 1'd1 : 1'd0;
    assign pe_1_2_left =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? left_1_2_out : 32'd0;
    assign pe_1_2_top =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? top_1_2_out : 32'd0;
    assign pe_1_3_clk =
     1'b1 ? clk : 1'd0;
    assign pe_1_3_go =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? 1'd1 : 1'd0;
    assign pe_1_3_left =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? left_1_3_out : 32'd0;
    assign pe_1_3_top =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? top_1_3_out : 32'd0;
    assign pe_2_0_clk =
     1'b1 ? clk : 1'd0;
    assign pe_2_0_go =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 1'd1 : 1'd0;
    assign pe_2_0_left =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? left_2_0_out : 32'd0;
    assign pe_2_0_top =
     fsm6_out < 3'd5 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? top_2_0_out : 32'd0;
    assign pe_2_1_clk =
     1'b1 ? clk : 1'd0;
    assign pe_2_1_go =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? 1'd1 : 1'd0;
    assign pe_2_1_left =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? left_2_1_out : 32'd0;
    assign pe_2_1_top =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? top_2_1_out : 32'd0;
    assign pe_2_2_clk =
     1'b1 ? clk : 1'd0;
    assign pe_2_2_go =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? 1'd1 : 1'd0;
    assign pe_2_2_left =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? left_2_2_out : 32'd0;
    assign pe_2_2_top =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? top_2_2_out : 32'd0;
    assign pe_2_3_clk =
     1'b1 ? clk : 1'd0;
    assign pe_2_3_go =
     fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? 1'd1 : 1'd0;
    assign pe_2_3_left =
     fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? left_2_3_out : 32'd0;
    assign pe_2_3_top =
     fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? top_2_3_out : 32'd0;
    assign pe_3_0_clk =
     1'b1 ? clk : 1'd0;
    assign pe_3_0_go =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? 1'd1 : 1'd0;
    assign pe_3_0_left =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? left_3_0_out : 32'd0;
    assign pe_3_0_top =
     fsm8_out < 3'd5 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go ? top_3_0_out : 32'd0;
    assign pe_3_1_clk =
     1'b1 ? clk : 1'd0;
    assign pe_3_1_go =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? 1'd1 : 1'd0;
    assign pe_3_1_left =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? left_3_1_out : 32'd0;
    assign pe_3_1_top =
     fsm10_out < 3'd5 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go ? top_3_1_out : 32'd0;
    assign pe_3_2_clk =
     1'b1 ? clk : 1'd0;
    assign pe_3_2_go =
     fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? 1'd1 : 1'd0;
    assign pe_3_2_left =
     fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? left_3_2_out : 32'd0;
    assign pe_3_2_top =
     fsm12_out < 3'd5 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go | fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go ? top_3_2_out : 32'd0;
    assign pe_3_3_clk =
     1'b1 ? clk : 1'd0;
    assign pe_3_3_go =
     fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go | fsm20_out >= 7'd57 & fsm20_out < 7'd62 & go ? 1'd1 : 1'd0;
    assign pe_3_3_left =
     fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go | fsm20_out >= 7'd57 & fsm20_out < 7'd62 & go ? left_3_3_out : 32'd0;
    assign pe_3_3_top =
     fsm14_out < 3'd5 & fsm20_out >= 7'd39 & fsm20_out < 7'd44 & go | fsm16_out < 3'd5 & fsm20_out >= 7'd45 & fsm20_out < 7'd50 & go | fsm18_out < 3'd5 & fsm20_out >= 7'd51 & fsm20_out < 7'd56 & go | fsm20_out >= 7'd57 & fsm20_out < 7'd62 & go ? top_3_3_out : 32'd0;
    assign t0_add_left =
     fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? 3'd1 : 3'd0;
    assign t0_add_right =
     fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? t0_idx_out : 3'd0;
    assign t0_idx_clk =
     1'b1 ? clk : 1'd0;
    assign t0_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? t0_add_out : 3'd0;
    assign t0_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm0_out < 1'd1 & fsm20_out == 7'd1 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go ? 1'd1 : 1'd0;
    assign t1_add_left =
     fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? 3'd1 : 3'd0;
    assign t1_add_right =
     fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? t1_idx_out : 3'd0;
    assign t1_idx_clk =
     1'b1 ? clk : 1'd0;
    assign t1_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? t1_add_out : 3'd0;
    assign t1_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm2_out < 3'd1 & fsm20_out >= 7'd3 & fsm20_out < 7'd8 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go ? 1'd1 : 1'd0;
    assign t2_add_left =
     fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? 3'd1 : 3'd0;
    assign t2_add_right =
     fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? t2_idx_out : 3'd0;
    assign t2_idx_clk =
     1'b1 ? clk : 1'd0;
    assign t2_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? t2_add_out : 3'd0;
    assign t2_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm4_out < 3'd1 & fsm20_out >= 7'd9 & fsm20_out < 7'd14 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go ? 1'd1 : 1'd0;
    assign t3_add_left =
     fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 3'd1 : 3'd0;
    assign t3_add_right =
     fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? t3_idx_out : 3'd0;
    assign t3_idx_clk =
     1'b1 ? clk : 1'd0;
    assign t3_idx_in =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go ? 3'd7 :
     fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? t3_add_out : 3'd0;
    assign t3_idx_write_en =
     fsm_out < 1'd1 & fsm20_out == 7'd0 & go | fsm6_out < 3'd1 & fsm20_out >= 7'd15 & fsm20_out < 7'd20 & go | fsm8_out < 3'd1 & fsm20_out >= 7'd21 & fsm20_out < 7'd26 & go | fsm10_out < 3'd1 & fsm20_out >= 7'd27 & fsm20_out < 7'd32 & go | fsm12_out < 3'd1 & fsm20_out >= 7'd33 & fsm20_out < 7'd38 & go ? 1'd1 : 1'd0;
    assign top_0_0_clk =
     1'b1 ? clk : 1'd0;
    assign top_0_0_in =
     fsm1_out < 1'd1 & fsm20_out == 7'd2 & go | fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go ? t0_read_data : 32'd0;
    assign top_0_0_write_en =
     fsm1_out < 1'd1 & fsm20_out == 7'd2 & go | fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go ? 1'd1 : 1'd0;
    assign top_0_1_clk =
     1'b1 ? clk : 1'd0;
    assign top_0_1_in =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? t1_read_data : 32'd0;
    assign top_0_1_write_en =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? 1'd1 : 1'd0;
    assign top_0_2_clk =
     1'b1 ? clk : 1'd0;
    assign top_0_2_in =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? t2_read_data : 32'd0;
    assign top_0_2_write_en =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? 1'd1 : 1'd0;
    assign top_0_3_clk =
     1'b1 ? clk : 1'd0;
    assign top_0_3_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? t3_read_data : 32'd0;
    assign top_0_3_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign top_1_0_clk =
     1'b1 ? clk : 1'd0;
    assign top_1_0_in =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? top_0_0_out : 32'd0;
    assign top_1_0_write_en =
     fsm3_out < 1'd1 & fsm20_out == 7'd8 & go | fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go ? 1'd1 : 1'd0;
    assign top_1_1_clk =
     1'b1 ? clk : 1'd0;
    assign top_1_1_in =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? top_0_1_out : 32'd0;
    assign top_1_1_write_en =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? 1'd1 : 1'd0;
    assign top_1_2_clk =
     1'b1 ? clk : 1'd0;
    assign top_1_2_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? top_0_2_out : 32'd0;
    assign top_1_2_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign top_1_3_clk =
     1'b1 ? clk : 1'd0;
    assign top_1_3_in =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? top_0_3_out : 32'd0;
    assign top_1_3_write_en =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? 1'd1 : 1'd0;
    assign top_2_0_clk =
     1'b1 ? clk : 1'd0;
    assign top_2_0_in =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? top_1_0_out : 32'd0;
    assign top_2_0_write_en =
     fsm5_out < 1'd1 & fsm20_out == 7'd14 & go | fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go ? 1'd1 : 1'd0;
    assign top_2_1_clk =
     1'b1 ? clk : 1'd0;
    assign top_2_1_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? top_1_1_out : 32'd0;
    assign top_2_1_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign top_2_2_clk =
     1'b1 ? clk : 1'd0;
    assign top_2_2_in =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? top_1_2_out : 32'd0;
    assign top_2_2_write_en =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? 1'd1 : 1'd0;
    assign top_2_3_clk =
     1'b1 ? clk : 1'd0;
    assign top_2_3_in =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? top_1_3_out : 32'd0;
    assign top_2_3_write_en =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? 1'd1 : 1'd0;
    assign top_3_0_clk =
     1'b1 ? clk : 1'd0;
    assign top_3_0_in =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? top_2_0_out : 32'd0;
    assign top_3_0_write_en =
     fsm7_out < 1'd1 & fsm20_out == 7'd20 & go | fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go ? 1'd1 : 1'd0;
    assign top_3_1_clk =
     1'b1 ? clk : 1'd0;
    assign top_3_1_in =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? top_2_1_out : 32'd0;
    assign top_3_1_write_en =
     fsm9_out < 1'd1 & fsm20_out == 7'd26 & go | fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go ? 1'd1 : 1'd0;
    assign top_3_2_clk =
     1'b1 ? clk : 1'd0;
    assign top_3_2_in =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? top_2_2_out : 32'd0;
    assign top_3_2_write_en =
     fsm11_out < 1'd1 & fsm20_out == 7'd32 & go | fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go ? 1'd1 : 1'd0;
    assign top_3_3_clk =
     1'b1 ? clk : 1'd0;
    assign top_3_3_in =
     fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go | fsm19_out < 1'd1 & fsm20_out == 7'd56 & go ? top_2_3_out : 32'd0;
    assign top_3_3_write_en =
     fsm13_out < 1'd1 & fsm20_out == 7'd38 & go | fsm15_out < 1'd1 & fsm20_out == 7'd44 & go | fsm17_out < 1'd1 & fsm20_out == 7'd50 & go | fsm19_out < 1'd1 & fsm20_out == 7'd56 & go ? 1'd1 : 1'd0;
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
