module attributes {calyx.entrypoint = "main"} {
  calyx.component @main(%clk: i1 {clk}, %reset: i1 {reset}, %go: i1 {go}) -> (%done: i1 {done}) {
    %true = hw.constant true
    %c2_i32 = hw.constant 2 : i32
    %c0_i32 = hw.constant 0 : i32
    %c20_i32 = hw.constant 20 : i32
    %c1_i32 = hw.constant 1 : i32
    %c30_i32 = hw.constant 30 : i32
    %std_slice_17.in, %std_slice_17.out = calyx.std_slice @std_slice_17 : i32, i5
    %std_slice_16.in, %std_slice_16.out = calyx.std_slice @std_slice_16 : i32, i5
    %std_slice_15.in, %std_slice_15.out = calyx.std_slice @std_slice_15 : i32, i5
    %std_slice_14.in, %std_slice_14.out = calyx.std_slice @std_slice_14 : i32, i5
    %std_slice_13.in, %std_slice_13.out = calyx.std_slice @std_slice_13 : i32, i5
    %std_slice_12.in, %std_slice_12.out = calyx.std_slice @std_slice_12 : i32, i5
    %std_slice_11.in, %std_slice_11.out = calyx.std_slice @std_slice_11 : i32, i5
    %std_slice_10.in, %std_slice_10.out = calyx.std_slice @std_slice_10 : i32, i5
    %std_slice_9.in, %std_slice_9.out = calyx.std_slice @std_slice_9 : i32, i5
    %std_slice_8.in, %std_slice_8.out = calyx.std_slice @std_slice_8 : i32, i5
    %std_slice_7.in, %std_slice_7.out = calyx.std_slice @std_slice_7 : i32, i5
    %std_slice_6.in, %std_slice_6.out = calyx.std_slice @std_slice_6 : i32, i5
    %std_slice_5.in, %std_slice_5.out = calyx.std_slice @std_slice_5 : i32, i5
    %std_slice_4.in, %std_slice_4.out = calyx.std_slice @std_slice_4 : i32, i5
    %std_slice_3.in, %std_slice_3.out = calyx.std_slice @std_slice_3 : i32, i5
    %std_slice_2.in, %std_slice_2.out = calyx.std_slice @std_slice_2 : i32, i5
    %std_slice_1.in, %std_slice_1.out = calyx.std_slice @std_slice_1 : i32, i5
    %std_slice_0.in, %std_slice_0.out = calyx.std_slice @std_slice_0 : i32, i5
    %std_add_6.left, %std_add_6.right, %std_add_6.out = calyx.std_add @std_add_6 : i32, i32, i32
    %muli_5_reg.in, %muli_5_reg.write_en, %muli_5_reg.clk, %muli_5_reg.reset, %muli_5_reg.out, %muli_5_reg.done = calyx.register @muli_5_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_5.clk, %std_mult_pipe_5.reset, %std_mult_pipe_5.go, %std_mult_pipe_5.left, %std_mult_pipe_5.right, %std_mult_pipe_5.out, %std_mult_pipe_5.done = calyx.std_mult_pipe @std_mult_pipe_5 : i1, i1, i1, i32, i32, i32, i1
    %load_8_reg.in, %load_8_reg.write_en, %load_8_reg.clk, %load_8_reg.reset, %load_8_reg.out, %load_8_reg.done = calyx.register @load_8_reg : i32, i1, i1, i1, i32, i1
    %std_add_5.left, %std_add_5.right, %std_add_5.out = calyx.std_add @std_add_5 : i32, i32, i32
    %muli_4_reg.in, %muli_4_reg.write_en, %muli_4_reg.clk, %muli_4_reg.reset, %muli_4_reg.out, %muli_4_reg.done = calyx.register @muli_4_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_4.clk, %std_mult_pipe_4.reset, %std_mult_pipe_4.go, %std_mult_pipe_4.left, %std_mult_pipe_4.right, %std_mult_pipe_4.out, %std_mult_pipe_4.done = calyx.std_mult_pipe @std_mult_pipe_4 : i1, i1, i1, i32, i32, i32, i1
    %muli_3_reg.in, %muli_3_reg.write_en, %muli_3_reg.clk, %muli_3_reg.reset, %muli_3_reg.out, %muli_3_reg.done = calyx.register @muli_3_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_3.clk, %std_mult_pipe_3.reset, %std_mult_pipe_3.go, %std_mult_pipe_3.left, %std_mult_pipe_3.right, %std_mult_pipe_3.out, %std_mult_pipe_3.done = calyx.std_mult_pipe @std_mult_pipe_3 : i1, i1, i1, i32, i32, i32, i1
    %load_7_reg.in, %load_7_reg.write_en, %load_7_reg.clk, %load_7_reg.reset, %load_7_reg.out, %load_7_reg.done = calyx.register @load_7_reg : i32, i1, i1, i1, i32, i1
    %load_6_reg.in, %load_6_reg.write_en, %load_6_reg.clk, %load_6_reg.reset, %load_6_reg.out, %load_6_reg.done = calyx.register @load_6_reg : i32, i1, i1, i1, i32, i1
    %std_add_4.left, %std_add_4.right, %std_add_4.out = calyx.std_add @std_add_4 : i32, i32, i32
    %load_5_reg.in, %load_5_reg.write_en, %load_5_reg.clk, %load_5_reg.reset, %load_5_reg.out, %load_5_reg.done = calyx.register @load_5_reg : i32, i1, i1, i1, i32, i1
    %muli_2_reg.in, %muli_2_reg.write_en, %muli_2_reg.clk, %muli_2_reg.reset, %muli_2_reg.out, %muli_2_reg.done = calyx.register @muli_2_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_2.clk, %std_mult_pipe_2.reset, %std_mult_pipe_2.go, %std_mult_pipe_2.left, %std_mult_pipe_2.right, %std_mult_pipe_2.out, %std_mult_pipe_2.done = calyx.std_mult_pipe @std_mult_pipe_2 : i1, i1, i1, i32, i32, i32, i1
    %load_4_reg.in, %load_4_reg.write_en, %load_4_reg.clk, %load_4_reg.reset, %load_4_reg.out, %load_4_reg.done = calyx.register @load_4_reg : i32, i1, i1, i1, i32, i1
    %std_add_3.left, %std_add_3.right, %std_add_3.out = calyx.std_add @std_add_3 : i32, i32, i32
    %load_3_reg.in, %load_3_reg.write_en, %load_3_reg.clk, %load_3_reg.reset, %load_3_reg.out, %load_3_reg.done = calyx.register @load_3_reg : i32, i1, i1, i1, i32, i1
    %muli_1_reg.in, %muli_1_reg.write_en, %muli_1_reg.clk, %muli_1_reg.reset, %muli_1_reg.out, %muli_1_reg.done = calyx.register @muli_1_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_1.clk, %std_mult_pipe_1.reset, %std_mult_pipe_1.go, %std_mult_pipe_1.left, %std_mult_pipe_1.right, %std_mult_pipe_1.out, %std_mult_pipe_1.done = calyx.std_mult_pipe @std_mult_pipe_1 : i1, i1, i1, i32, i32, i32, i1
    %load_2_reg.in, %load_2_reg.write_en, %load_2_reg.clk, %load_2_reg.reset, %load_2_reg.out, %load_2_reg.done = calyx.register @load_2_reg : i32, i1, i1, i1, i32, i1
    %std_add_2.left, %std_add_2.right, %std_add_2.out = calyx.std_add @std_add_2 : i32, i32, i32
    %std_slt_2.left, %std_slt_2.right, %std_slt_2.out = calyx.std_slt @std_slt_2 : i32, i32, i1
    %muli_0_reg.in, %muli_0_reg.write_en, %muli_0_reg.clk, %muli_0_reg.reset, %muli_0_reg.out, %muli_0_reg.done = calyx.register @muli_0_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_0.clk, %std_mult_pipe_0.reset, %std_mult_pipe_0.go, %std_mult_pipe_0.left, %std_mult_pipe_0.right, %std_mult_pipe_0.out, %std_mult_pipe_0.done = calyx.std_mult_pipe @std_mult_pipe_0 : i1, i1, i1, i32, i32, i32, i1
    %load_1_reg.in, %load_1_reg.write_en, %load_1_reg.clk, %load_1_reg.reset, %load_1_reg.out, %load_1_reg.done = calyx.register @load_1_reg : i32, i1, i1, i1, i32, i1
    %std_add_1.left, %std_add_1.right, %std_add_1.out = calyx.std_add @std_add_1 : i32, i32, i32
    %std_slt_1.left, %std_slt_1.right, %std_slt_1.out = calyx.std_slt @std_slt_1 : i32, i32, i1
    %load_0_reg.in, %load_0_reg.write_en, %load_0_reg.clk, %load_0_reg.reset, %load_0_reg.out, %load_0_reg.done = calyx.register @load_0_reg : i32, i1, i1, i1, i32, i1
    %std_add_0.left, %std_add_0.right, %std_add_0.out = calyx.std_add @std_add_0 : i32, i32, i32
    %std_slt_0.left, %std_slt_0.right, %std_slt_0.out = calyx.std_slt @std_slt_0 : i32, i32, i1
    %mem_3.in, %mem_3.write_en, %mem_3.clk, %mem_3.reset, %mem_3.out, %mem_3.done = calyx.register @mem_3 : i32, i1, i1, i1, i32, i1
    %mem_2.addr0, %mem_2.addr1, %mem_2.write_data, %mem_2.write_en, %mem_2.clk, %mem_2.read_data, %mem_2.done = calyx.memory @mem_2 <[20, 20] x 32> [5, 5] {external = true} : i5, i5, i32, i1, i1, i32, i1
    %mem_1.addr0, %mem_1.addr1, %mem_1.write_data, %mem_1.write_en, %mem_1.clk, %mem_1.read_data, %mem_1.done = calyx.memory @mem_1 <[20, 30] x 32> [5, 5] {external = true} : i5, i5, i32, i1, i1, i32, i1
    %mem_0.addr0, %mem_0.addr1, %mem_0.write_data, %mem_0.write_en, %mem_0.clk, %mem_0.read_data, %mem_0.done = calyx.memory @mem_0 <[20, 30] x 32> [5, 5] {external = true} : i5, i5, i32, i1, i1, i32, i1
    %while_2_arg0_reg.in, %while_2_arg0_reg.write_en, %while_2_arg0_reg.clk, %while_2_arg0_reg.reset, %while_2_arg0_reg.out, %while_2_arg0_reg.done = calyx.register @while_2_arg0_reg : i32, i1, i1, i1, i32, i1
    %while_1_arg0_reg.in, %while_1_arg0_reg.write_en, %while_1_arg0_reg.clk, %while_1_arg0_reg.reset, %while_1_arg0_reg.out, %while_1_arg0_reg.done = calyx.register @while_1_arg0_reg : i32, i1, i1, i1, i32, i1
    %while_0_arg0_reg.in, %while_0_arg0_reg.write_en, %while_0_arg0_reg.clk, %while_0_arg0_reg.reset, %while_0_arg0_reg.out, %while_0_arg0_reg.done = calyx.register @while_0_arg0_reg : i32, i1, i1, i1, i32, i1
    calyx.wires {
      calyx.group @assign_while_0_init_0 {
        calyx.assign %while_0_arg0_reg.in = %c0_i32 : i32
        calyx.assign %while_0_arg0_reg.write_en = %true : i1
        calyx.group_done %while_0_arg0_reg.done : i1
      }
      calyx.group @assign_while_1_init_0 {
        calyx.assign %while_1_arg0_reg.in = %c0_i32 : i32
        calyx.assign %while_1_arg0_reg.write_en = %true : i1
        calyx.group_done %while_1_arg0_reg.done : i1
      }
      calyx.group @assign_while_2_init_0 {
        calyx.assign %while_2_arg0_reg.in = %c0_i32 : i32
        calyx.assign %while_2_arg0_reg.write_en = %true : i1
        calyx.group_done %while_2_arg0_reg.done : i1
      }
      calyx.group @bb0_0 {
        calyx.assign %mem_3.in = %c0_i32 : i32
        calyx.assign %mem_3.write_en = %true : i1
        calyx.group_done %mem_3.done : i1
      }
      calyx.comb_group @bb0_1 {
        calyx.assign %std_slt_0.left = %while_2_arg0_reg.out : i32
        calyx.assign %std_slt_0.right = %c20_i32 : i32
      }
      calyx.group @bb0_3 {
        calyx.assign %std_slice_17.in = %while_2_arg0_reg.out : i32
        calyx.assign %std_slice_16.in = %while_2_arg0_reg.out : i32
        calyx.assign %mem_2.addr0 = %std_slice_17.out : i5
        calyx.assign %mem_2.addr1 = %std_slice_16.out : i5
        calyx.assign %load_0_reg.in = %mem_2.read_data : i32
        calyx.assign %load_0_reg.write_en = %true : i1
        calyx.group_done %load_0_reg.done : i1
      }
      calyx.comb_group @bb0_4 {
        calyx.assign %std_slt_1.left = %while_1_arg0_reg.out : i32
        calyx.assign %std_slt_1.right = %c30_i32 : i32
      }
      calyx.group @bb0_6 {
        calyx.assign %mem_3.in = %c0_i32 : i32
        calyx.assign %mem_3.write_en = %true : i1
        calyx.group_done %mem_3.done : i1
      }
      calyx.group @bb0_7 {
        calyx.assign %std_slice_15.in = %while_2_arg0_reg.out : i32
        calyx.assign %std_slice_14.in = %while_1_arg0_reg.out : i32
        calyx.assign %mem_1.addr0 = %std_slice_15.out : i5
        calyx.assign %mem_1.addr1 = %std_slice_14.out : i5
        calyx.assign %load_1_reg.in = %mem_1.read_data : i32
        calyx.assign %load_1_reg.write_en = %true : i1
        calyx.group_done %load_1_reg.done : i1
      }
      calyx.group @bb0_8 {
        calyx.assign %std_mult_pipe_0.left = %load_1_reg.out : i32
        calyx.assign %std_mult_pipe_0.right = %c2_i32 : i32
        calyx.assign %muli_0_reg.in = %std_mult_pipe_0.out : i32
        calyx.assign %muli_0_reg.write_en = %std_mult_pipe_0.done : i1
        calyx.assign %std_mult_pipe_0.go = %true : i1
        calyx.group_done %muli_0_reg.done : i1
      }
      calyx.comb_group @bb0_9 {
        calyx.assign %std_slt_2.left = %while_0_arg0_reg.out : i32
        calyx.assign %std_slt_2.right = %while_2_arg0_reg.out : i32
      }
      calyx.group @bb0_11 {
        calyx.assign %std_slice_13.in = %while_2_arg0_reg.out : i32
        calyx.assign %std_slice_12.in = %while_0_arg0_reg.out : i32
        calyx.assign %mem_2.addr0 = %std_slice_13.out : i5
        calyx.assign %mem_2.addr1 = %std_slice_12.out : i5
        calyx.assign %load_2_reg.in = %mem_2.read_data : i32
        calyx.assign %load_2_reg.write_en = %true : i1
        calyx.group_done %load_2_reg.done : i1
      }
      calyx.group @bb0_12 {
        calyx.assign %std_mult_pipe_1.left = %std_mult_pipe_0.out : i32
        calyx.assign %std_mult_pipe_1.right = %load_2_reg.out : i32
        calyx.assign %muli_1_reg.in = %std_mult_pipe_1.out : i32
        calyx.assign %muli_1_reg.write_en = %std_mult_pipe_1.done : i1
        calyx.assign %std_mult_pipe_1.go = %true : i1
        calyx.group_done %muli_1_reg.done : i1
      }
      calyx.group @bb0_13 {
        calyx.assign %std_slice_11.in = %while_0_arg0_reg.out : i32
        calyx.assign %std_slice_10.in = %while_1_arg0_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_11.out : i5
        calyx.assign %mem_0.addr1 = %std_slice_10.out : i5
        calyx.assign %load_3_reg.in = %mem_0.read_data : i32
        calyx.assign %load_3_reg.write_en = %true : i1
        calyx.group_done %load_3_reg.done : i1
      }
      calyx.group @bb0_15 {
        calyx.assign %std_slice_9.in = %while_0_arg0_reg.out : i32
        calyx.assign %std_slice_8.in = %while_1_arg0_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_9.out : i5
        calyx.assign %mem_0.addr1 = %std_slice_8.out : i5
        calyx.assign %mem_0.write_data = %std_add_3.out : i32
        calyx.assign %mem_0.write_en = %true : i1
        calyx.assign %std_add_3.left = %load_3_reg.out : i32
        calyx.assign %std_add_3.right = %std_mult_pipe_1.out : i32
        calyx.group_done %mem_0.done : i1
      }
      calyx.group @bb0_16 {
        calyx.assign %std_slice_7.in = %while_0_arg0_reg.out : i32
        calyx.assign %std_slice_6.in = %while_1_arg0_reg.out : i32
        calyx.assign %mem_1.addr0 = %std_slice_7.out : i5
        calyx.assign %mem_1.addr1 = %std_slice_6.out : i5
        calyx.assign %load_4_reg.in = %mem_1.read_data : i32
        calyx.assign %load_4_reg.write_en = %true : i1
        calyx.group_done %load_4_reg.done : i1
      }
      calyx.group @bb0_17 {
        calyx.assign %std_mult_pipe_2.left = %load_4_reg.out : i32
        calyx.assign %std_mult_pipe_2.right = %load_2_reg.out : i32
        calyx.assign %muli_2_reg.in = %std_mult_pipe_2.out : i32
        calyx.assign %muli_2_reg.write_en = %std_mult_pipe_2.done : i1
        calyx.assign %std_mult_pipe_2.go = %true : i1
        calyx.group_done %muli_2_reg.done : i1
      }
      calyx.group @bb0_18 {
        calyx.assign %load_5_reg.in = %mem_3.out : i32
        calyx.assign %load_5_reg.write_en = %true : i1
        calyx.group_done %load_5_reg.done : i1
      }
      calyx.group @bb0_20 {
        calyx.assign %mem_3.in = %std_add_4.out : i32
        calyx.assign %mem_3.write_en = %true : i1
        calyx.assign %std_add_4.left = %load_5_reg.out : i32
        calyx.assign %std_add_4.right = %std_mult_pipe_2.out : i32
        calyx.group_done %mem_3.done : i1
      }
      calyx.group @assign_while_0_latch {
        calyx.assign %while_0_arg0_reg.in = %std_add_2.out : i32
        calyx.assign %while_0_arg0_reg.write_en = %true : i1
        calyx.assign %std_add_2.left = %while_0_arg0_reg.out : i32
        calyx.assign %std_add_2.right = %c1_i32 : i32
        calyx.group_done %while_0_arg0_reg.done : i1
      }
      calyx.group @bb0_21 {
        calyx.assign %std_slice_5.in = %while_2_arg0_reg.out : i32
        calyx.assign %std_slice_4.in = %while_1_arg0_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_5.out : i5
        calyx.assign %mem_0.addr1 = %std_slice_4.out : i5
        calyx.assign %load_6_reg.in = %mem_0.read_data : i32
        calyx.assign %load_6_reg.write_en = %true : i1
        calyx.group_done %load_6_reg.done : i1
      }
      calyx.group @bb0_22 {
        calyx.assign %std_slice_3.in = %while_2_arg0_reg.out : i32
        calyx.assign %std_slice_2.in = %while_1_arg0_reg.out : i32
        calyx.assign %mem_1.addr0 = %std_slice_3.out : i5
        calyx.assign %mem_1.addr1 = %std_slice_2.out : i5
        calyx.assign %load_7_reg.in = %mem_1.read_data : i32
        calyx.assign %load_7_reg.write_en = %true : i1
        calyx.group_done %load_7_reg.done : i1
      }
      calyx.group @bb0_23 {
        calyx.assign %std_mult_pipe_3.left = %load_7_reg.out : i32
        calyx.assign %std_mult_pipe_3.right = %c2_i32 : i32
        calyx.assign %muli_3_reg.in = %std_mult_pipe_3.out : i32
        calyx.assign %muli_3_reg.write_en = %std_mult_pipe_3.done : i1
        calyx.assign %std_mult_pipe_3.go = %true : i1
        calyx.group_done %muli_3_reg.done : i1
      }
      calyx.group @bb0_24 {
        calyx.assign %std_mult_pipe_4.left = %std_mult_pipe_3.out : i32
        calyx.assign %std_mult_pipe_4.right = %load_0_reg.out : i32
        calyx.assign %muli_4_reg.in = %std_mult_pipe_4.out : i32
        calyx.assign %muli_4_reg.write_en = %std_mult_pipe_4.done : i1
        calyx.assign %std_mult_pipe_4.go = %true : i1
        calyx.group_done %muli_4_reg.done : i1
      }
      calyx.group @bb0_26 {
        calyx.assign %load_8_reg.in = %mem_3.out : i32
        calyx.assign %load_8_reg.write_en = %true : i1
        calyx.group_done %load_8_reg.done : i1
      }
      calyx.group @bb0_27 {
        calyx.assign %std_mult_pipe_5.left = %load_8_reg.out : i32
        calyx.assign %std_mult_pipe_5.right = %c2_i32 : i32
        calyx.assign %muli_5_reg.in = %std_mult_pipe_5.out : i32
        calyx.assign %muli_5_reg.write_en = %std_mult_pipe_5.done : i1
        calyx.assign %std_mult_pipe_5.go = %true : i1
        calyx.group_done %muli_5_reg.done : i1
      }
      calyx.group @bb0_29 {
        calyx.assign %std_slice_1.in = %while_2_arg0_reg.out : i32
        calyx.assign %std_slice_0.in = %while_1_arg0_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_1.out : i5
        calyx.assign %mem_0.addr1 = %std_slice_0.out : i5
        calyx.assign %mem_0.write_data = %std_add_6.out : i32
        calyx.assign %mem_0.write_en = %true : i1
        calyx.assign %std_add_6.left = %std_add_5.out : i32
        calyx.assign %std_add_5.left = %load_6_reg.out : i32
        calyx.assign %std_add_5.right = %std_mult_pipe_4.out : i32
        calyx.assign %std_add_6.right = %std_mult_pipe_5.out : i32
        calyx.group_done %mem_0.done : i1
      }
      calyx.group @assign_while_1_latch {
        calyx.assign %while_1_arg0_reg.in = %std_add_1.out : i32
        calyx.assign %while_1_arg0_reg.write_en = %true : i1
        calyx.assign %std_add_1.left = %while_1_arg0_reg.out : i32
        calyx.assign %std_add_1.right = %c1_i32 : i32
        calyx.group_done %while_1_arg0_reg.done : i1
      }
      calyx.group @assign_while_2_latch {
        calyx.assign %while_2_arg0_reg.in = %std_add_0.out : i32
        calyx.assign %while_2_arg0_reg.write_en = %true : i1
        calyx.assign %std_add_0.left = %while_2_arg0_reg.out : i32
        calyx.assign %std_add_0.right = %c1_i32 : i32
        calyx.group_done %while_2_arg0_reg.done : i1
      }
    }
    calyx.control {
      calyx.seq {
        calyx.seq {
          calyx.enable @bb0_0
          calyx.par {
            calyx.enable @assign_while_2_init_0
          }
          calyx.while %std_slt_0.out with @bb0_1 {
            calyx.seq {
              calyx.seq {
                calyx.enable @bb0_3
                calyx.par {
                  calyx.enable @assign_while_1_init_0
                }
                calyx.while %std_slt_1.out with @bb0_4 {
                  calyx.seq {
                    calyx.seq {
                      calyx.enable @bb0_6
                      calyx.enable @bb0_7
                      calyx.enable @bb0_8
                      calyx.par {
                        calyx.enable @assign_while_0_init_0
                      }
                      calyx.while %std_slt_2.out with @bb0_9 {
                        calyx.seq {
                          calyx.seq {
                            calyx.enable @bb0_11
                            calyx.enable @bb0_12
                            calyx.enable @bb0_13
                            calyx.enable @bb0_15
                            calyx.enable @bb0_16
                            calyx.enable @bb0_17
                            calyx.enable @bb0_18
                            calyx.enable @bb0_20
                          }
                          calyx.enable @assign_while_0_latch
                        }
                      }
                      calyx.enable @bb0_21
                      calyx.enable @bb0_22
                      calyx.enable @bb0_23
                      calyx.enable @bb0_24
                      calyx.enable @bb0_26
                      calyx.enable @bb0_27
                      calyx.enable @bb0_29
                    }
                    calyx.enable @assign_while_1_latch
                  }
                }
              }
              calyx.enable @assign_while_2_latch
            }
          }
        }
      }
    }
  } {toplevel}
}

