module attributes {calyx.entrypoint = "main"} {
  calyx.component @kernel_2mm(%in0: i32, %in1: i32, %ext_mem0_read_data: i32 {mem = {id = 0 : i32, tag = "read_data"}}, %ext_mem0_done: i1 {mem = {id = 0 : i32, tag = "done"}}, %ext_mem1_read_data: i32 {mem = {id = 1 : i32, tag = "read_data"}}, %ext_mem1_done: i1 {mem = {id = 1 : i32, tag = "done"}}, %ext_mem2_read_data: i32 {mem = {id = 2 : i32, tag = "read_data"}}, %ext_mem2_done: i1 {mem = {id = 2 : i32, tag = "done"}}, %ext_mem3_read_data: i32 {mem = {id = 3 : i32, tag = "read_data"}}, %ext_mem3_done: i1 {mem = {id = 3 : i32, tag = "done"}}, %ext_mem4_read_data: i32 {mem = {id = 4 : i32, tag = "read_data"}}, %ext_mem4_done: i1 {mem = {id = 4 : i32, tag = "done"}}, %clk: i1 {clk}, %reset: i1 {reset}, %go: i1 {go}) -> (%ext_mem0_write_data: i32 {mem = {id = 0 : i32, tag = "write_data"}}, %ext_mem0_addr0: i63 {mem = {addr_idx = 0 : i32, id = 0 : i32, tag = "addr"}}, %ext_mem0_addr1: i10 {mem = {addr_idx = 1 : i32, id = 0 : i32, tag = "addr"}}, %ext_mem0_write_en: i1 {mem = {id = 0 : i32, tag = "write_en"}}, %ext_mem1_write_data: i32 {mem = {id = 1 : i32, tag = "write_data"}}, %ext_mem1_addr0: i63 {mem = {addr_idx = 0 : i32, id = 1 : i32, tag = "addr"}}, %ext_mem1_addr1: i11 {mem = {addr_idx = 1 : i32, id = 1 : i32, tag = "addr"}}, %ext_mem1_write_en: i1 {mem = {id = 1 : i32, tag = "write_en"}}, %ext_mem2_write_data: i32 {mem = {id = 2 : i32, tag = "write_data"}}, %ext_mem2_addr0: i63 {mem = {addr_idx = 0 : i32, id = 2 : i32, tag = "addr"}}, %ext_mem2_addr1: i10 {mem = {addr_idx = 1 : i32, id = 2 : i32, tag = "addr"}}, %ext_mem2_write_en: i1 {mem = {id = 2 : i32, tag = "write_en"}}, %ext_mem3_write_data: i32 {mem = {id = 3 : i32, tag = "write_data"}}, %ext_mem3_addr0: i63 {mem = {addr_idx = 0 : i32, id = 3 : i32, tag = "addr"}}, %ext_mem3_addr1: i11 {mem = {addr_idx = 1 : i32, id = 3 : i32, tag = "addr"}}, %ext_mem3_write_en: i1 {mem = {id = 3 : i32, tag = "write_en"}}, %ext_mem4_write_data: i32 {mem = {id = 4 : i32, tag = "write_data"}}, %ext_mem4_addr0: i63 {mem = {addr_idx = 0 : i32, id = 4 : i32, tag = "addr"}}, %ext_mem4_addr1: i11 {mem = {addr_idx = 1 : i32, id = 4 : i32, tag = "addr"}}, %ext_mem4_write_en: i1 {mem = {id = 4 : i32, tag = "write_en"}}, %done: i1 {done}) {
    %true = hw.constant true
    %c1_i32 = hw.constant 1 : i32
    %c0_i32 = hw.constant 0 : i32
    %std_pad_10.in, %std_pad_10.out = calyx.std_pad @std_pad_10 : i32, i63
    %std_slice_10.in, %std_slice_10.out = calyx.std_slice @std_slice_10 : i32, i10
    %std_pad_9.in, %std_pad_9.out = calyx.std_pad @std_pad_9 : i32, i63
    %std_slice_9.in, %std_slice_9.out = calyx.std_slice @std_slice_9 : i32, i11
    %std_pad_8.in, %std_pad_8.out = calyx.std_pad @std_pad_8 : i32, i63
    %std_slice_8.in, %std_slice_8.out = calyx.std_slice @std_slice_8 : i32, i10
    %std_pad_7.in, %std_pad_7.out = calyx.std_pad @std_pad_7 : i32, i63
    %std_slice_7.in, %std_slice_7.out = calyx.std_slice @std_slice_7 : i32, i10
    %std_pad_6.in, %std_pad_6.out = calyx.std_pad @std_pad_6 : i32, i63
    %std_slice_6.in, %std_slice_6.out = calyx.std_slice @std_slice_6 : i32, i10
    %std_pad_5.in, %std_pad_5.out = calyx.std_pad @std_pad_5 : i32, i63
    %std_slice_5.in, %std_slice_5.out = calyx.std_slice @std_slice_5 : i32, i11
    %std_pad_4.in, %std_pad_4.out = calyx.std_pad @std_pad_4 : i32, i63
    %std_slice_4.in, %std_slice_4.out = calyx.std_slice @std_slice_4 : i32, i11
    %std_pad_3.in, %std_pad_3.out = calyx.std_pad @std_pad_3 : i32, i63
    %std_slice_3.in, %std_slice_3.out = calyx.std_slice @std_slice_3 : i32, i10
    %std_pad_2.in, %std_pad_2.out = calyx.std_pad @std_pad_2 : i32, i63
    %std_slice_2.in, %std_slice_2.out = calyx.std_slice @std_slice_2 : i32, i11
    %std_pad_1.in, %std_pad_1.out = calyx.std_pad @std_pad_1 : i32, i63
    %std_slice_1.in, %std_slice_1.out = calyx.std_slice @std_slice_1 : i32, i11
    %std_pad_0.in, %std_pad_0.out = calyx.std_pad @std_pad_0 : i32, i63
    %std_slice_0.in, %std_slice_0.out = calyx.std_slice @std_slice_0 : i32, i11
    %std_add_7.left, %std_add_7.right, %std_add_7.out = calyx.std_add @std_add_7 : i32, i32, i32
    %std_add_6.left, %std_add_6.right, %std_add_6.out = calyx.std_add @std_add_6 : i32, i32, i32
    %std_add_5.left, %std_add_5.right, %std_add_5.out = calyx.std_add @std_add_5 : i32, i32, i32
    %std_add_4.left, %std_add_4.right, %std_add_4.out = calyx.std_add @std_add_4 : i32, i32, i32
    %load_6_reg.in, %load_6_reg.write_en, %load_6_reg.clk, %load_6_reg.reset, %load_6_reg.out, %load_6_reg.done = calyx.register @load_6_reg : i32, i1, i1, i1, i32, i1
    %muli_3_reg.in, %muli_3_reg.write_en, %muli_3_reg.clk, %muli_3_reg.reset, %muli_3_reg.out, %muli_3_reg.done = calyx.register @muli_3_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_3.clk, %std_mult_pipe_3.reset, %std_mult_pipe_3.go, %std_mult_pipe_3.left, %std_mult_pipe_3.right, %std_mult_pipe_3.out, %std_mult_pipe_3.done = calyx.std_mult_pipe @std_mult_pipe_3 : i1, i1, i1, i32, i32, i32, i1
    %load_5_reg.in, %load_5_reg.write_en, %load_5_reg.clk, %load_5_reg.reset, %load_5_reg.out, %load_5_reg.done = calyx.register @load_5_reg : i32, i1, i1, i1, i32, i1
    %load_4_reg.in, %load_4_reg.write_en, %load_4_reg.clk, %load_4_reg.reset, %load_4_reg.out, %load_4_reg.done = calyx.register @load_4_reg : i32, i1, i1, i1, i32, i1
    %muli_2_reg.in, %muli_2_reg.write_en, %muli_2_reg.clk, %muli_2_reg.reset, %muli_2_reg.out, %muli_2_reg.done = calyx.register @muli_2_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_2.clk, %std_mult_pipe_2.reset, %std_mult_pipe_2.go, %std_mult_pipe_2.left, %std_mult_pipe_2.right, %std_mult_pipe_2.out, %std_mult_pipe_2.done = calyx.std_mult_pipe @std_mult_pipe_2 : i1, i1, i1, i32, i32, i32, i1
    %load_3_reg.in, %load_3_reg.write_en, %load_3_reg.clk, %load_3_reg.reset, %load_3_reg.out, %load_3_reg.done = calyx.register @load_3_reg : i32, i1, i1, i1, i32, i1
    %std_add_3.left, %std_add_3.right, %std_add_3.out = calyx.std_add @std_add_3 : i32, i32, i32
    %std_add_2.left, %std_add_2.right, %std_add_2.out = calyx.std_add @std_add_2 : i32, i32, i32
    %std_add_1.left, %std_add_1.right, %std_add_1.out = calyx.std_add @std_add_1 : i32, i32, i32
    %std_add_0.left, %std_add_0.right, %std_add_0.out = calyx.std_add @std_add_0 : i32, i32, i32
    %load_2_reg.in, %load_2_reg.write_en, %load_2_reg.clk, %load_2_reg.reset, %load_2_reg.out, %load_2_reg.done = calyx.register @load_2_reg : i32, i1, i1, i1, i32, i1
    %muli_1_reg.in, %muli_1_reg.write_en, %muli_1_reg.clk, %muli_1_reg.reset, %muli_1_reg.out, %muli_1_reg.done = calyx.register @muli_1_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_1.clk, %std_mult_pipe_1.reset, %std_mult_pipe_1.go, %std_mult_pipe_1.left, %std_mult_pipe_1.right, %std_mult_pipe_1.out, %std_mult_pipe_1.done = calyx.std_mult_pipe @std_mult_pipe_1 : i1, i1, i1, i32, i32, i32, i1
    %load_1_reg.in, %load_1_reg.write_en, %load_1_reg.clk, %load_1_reg.reset, %load_1_reg.out, %load_1_reg.done = calyx.register @load_1_reg : i32, i1, i1, i1, i32, i1
    %muli_0_reg.in, %muli_0_reg.write_en, %muli_0_reg.clk, %muli_0_reg.reset, %muli_0_reg.out, %muli_0_reg.done = calyx.register @muli_0_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_0.clk, %std_mult_pipe_0.reset, %std_mult_pipe_0.go, %std_mult_pipe_0.left, %std_mult_pipe_0.right, %std_mult_pipe_0.out, %std_mult_pipe_0.done = calyx.std_mult_pipe @std_mult_pipe_0 : i1, i1, i1, i32, i32, i32, i1
    %load_0_reg.in, %load_0_reg.write_en, %load_0_reg.clk, %load_0_reg.reset, %load_0_reg.out, %load_0_reg.done = calyx.register @load_0_reg : i32, i1, i1, i1, i32, i1
    %for_5_induction_var_reg.in, %for_5_induction_var_reg.write_en, %for_5_induction_var_reg.clk, %for_5_induction_var_reg.reset, %for_5_induction_var_reg.out, %for_5_induction_var_reg.done = calyx.register @for_5_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_4_induction_var_reg.in, %for_4_induction_var_reg.write_en, %for_4_induction_var_reg.clk, %for_4_induction_var_reg.reset, %for_4_induction_var_reg.out, %for_4_induction_var_reg.done = calyx.register @for_4_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_3_induction_var_reg.in, %for_3_induction_var_reg.write_en, %for_3_induction_var_reg.clk, %for_3_induction_var_reg.reset, %for_3_induction_var_reg.out, %for_3_induction_var_reg.done = calyx.register @for_3_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_2_induction_var_reg.in, %for_2_induction_var_reg.write_en, %for_2_induction_var_reg.clk, %for_2_induction_var_reg.reset, %for_2_induction_var_reg.out, %for_2_induction_var_reg.done = calyx.register @for_2_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_1_induction_var_reg.in, %for_1_induction_var_reg.write_en, %for_1_induction_var_reg.clk, %for_1_induction_var_reg.reset, %for_1_induction_var_reg.out, %for_1_induction_var_reg.done = calyx.register @for_1_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_0_induction_var_reg.in, %for_0_induction_var_reg.write_en, %for_0_induction_var_reg.clk, %for_0_induction_var_reg.reset, %for_0_induction_var_reg.out, %for_0_induction_var_reg.done = calyx.register @for_0_induction_var_reg : i32, i1, i1, i1, i32, i1
    calyx.wires {
      calyx.group @init_for_0_induction_var {
        calyx.assign %for_0_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_0_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_0_induction_var_reg.done : i1
      }
      calyx.group @init_for_1_induction_var {
        calyx.assign %for_1_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_1_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_1_induction_var_reg.done : i1
      }
      calyx.group @init_for_2_induction_var {
        calyx.assign %for_2_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_2_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_2_induction_var_reg.done : i1
      }
      calyx.group @init_for_3_induction_var {
        calyx.assign %for_3_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_3_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_3_induction_var_reg.done : i1
      }
      calyx.group @init_for_4_induction_var {
        calyx.assign %for_4_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_4_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_4_induction_var_reg.done : i1
      }
      calyx.group @init_for_5_induction_var {
        calyx.assign %for_5_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_5_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_5_induction_var_reg.done : i1
      }
      calyx.group @bb0_0 {
        calyx.assign %std_pad_10.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_10.in = %for_1_induction_var_reg.out : i32
        calyx.assign %ext_mem0_addr0 = %std_pad_10.out : i63
        calyx.assign %ext_mem0_addr1 = %std_slice_10.out : i10
        calyx.assign %ext_mem0_write_data = %c0_i32 : i32
        calyx.assign %ext_mem0_write_en = %true : i1
        calyx.group_done %ext_mem0_done : i1
      }
      calyx.group @bb0_1 {
        calyx.assign %std_pad_9.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_9.in = %for_0_induction_var_reg.out : i32
        calyx.assign %ext_mem1_addr0 = %std_pad_9.out : i63
        calyx.assign %ext_mem1_addr1 = %std_slice_9.out : i11
        calyx.assign %load_0_reg.in = %ext_mem1_read_data : i32
        calyx.assign %load_0_reg.write_en = %true : i1
        calyx.group_done %load_0_reg.done : i1
      }
      calyx.group @bb0_2 {
        calyx.assign %std_mult_pipe_0.left = %in0 : i32
        calyx.assign %std_mult_pipe_0.right = %load_0_reg.out : i32
        calyx.assign %muli_0_reg.in = %std_mult_pipe_0.out : i32
        calyx.assign %muli_0_reg.write_en = %std_mult_pipe_0.done : i1
        %0 = comb.xor %std_mult_pipe_0.done, %true : i1
        calyx.assign %std_mult_pipe_0.go = %0 ? %true : i1
        calyx.group_done %muli_0_reg.done : i1
      }
      calyx.group @bb0_3 {
        calyx.assign %std_pad_8.in = %for_0_induction_var_reg.out : i32
        calyx.assign %std_slice_8.in = %for_1_induction_var_reg.out : i32
        calyx.assign %ext_mem2_addr0 = %std_pad_8.out : i63
        calyx.assign %ext_mem2_addr1 = %std_slice_8.out : i10
        calyx.assign %load_1_reg.in = %ext_mem2_read_data : i32
        calyx.assign %load_1_reg.write_en = %true : i1
        calyx.group_done %load_1_reg.done : i1
      }
      calyx.group @bb0_4 {
        calyx.assign %std_mult_pipe_1.left = %std_mult_pipe_0.out : i32
        calyx.assign %std_mult_pipe_1.right = %load_1_reg.out : i32
        calyx.assign %muli_1_reg.in = %std_mult_pipe_1.out : i32
        calyx.assign %muli_1_reg.write_en = %std_mult_pipe_1.done : i1
        %0 = comb.xor %std_mult_pipe_1.done, %true : i1
        calyx.assign %std_mult_pipe_1.go = %0 ? %true : i1
        calyx.group_done %muli_1_reg.done : i1
      }
      calyx.group @bb0_5 {
        calyx.assign %std_pad_7.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_7.in = %for_1_induction_var_reg.out : i32
        calyx.assign %ext_mem0_addr0 = %std_pad_7.out : i63
        calyx.assign %ext_mem0_addr1 = %std_slice_7.out : i10
        calyx.assign %load_2_reg.in = %ext_mem0_read_data : i32
        calyx.assign %load_2_reg.write_en = %true : i1
        calyx.group_done %load_2_reg.done : i1
      }
      calyx.group @bb0_7 {
        calyx.assign %std_pad_6.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_6.in = %for_1_induction_var_reg.out : i32
        calyx.assign %ext_mem0_addr0 = %std_pad_6.out : i63
        calyx.assign %ext_mem0_addr1 = %std_slice_6.out : i10
        calyx.assign %ext_mem0_write_data = %std_add_0.out : i32
        calyx.assign %ext_mem0_write_en = %true : i1
        calyx.assign %std_add_0.left = %load_2_reg.out : i32
        calyx.assign %std_add_0.right = %std_mult_pipe_1.out : i32
        calyx.group_done %ext_mem0_done : i1
      }
      calyx.group @incr_for_0_induction_var {
        calyx.assign %std_add_1.left = %for_0_induction_var_reg.out : i32
        calyx.assign %std_add_1.right = %c1_i32 : i32
        calyx.assign %for_0_induction_var_reg.in = %std_add_1.out : i32
        calyx.assign %for_0_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_0_induction_var_reg.done : i1
      }
      calyx.group @incr_for_1_induction_var {
        calyx.assign %std_add_2.left = %for_1_induction_var_reg.out : i32
        calyx.assign %std_add_2.right = %c1_i32 : i32
        calyx.assign %for_1_induction_var_reg.in = %std_add_2.out : i32
        calyx.assign %for_1_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_1_induction_var_reg.done : i1
      }
      calyx.group @incr_for_2_induction_var {
        calyx.assign %std_add_3.left = %for_2_induction_var_reg.out : i32
        calyx.assign %std_add_3.right = %c1_i32 : i32
        calyx.assign %for_2_induction_var_reg.in = %std_add_3.out : i32
        calyx.assign %for_2_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_2_induction_var_reg.done : i1
      }
      calyx.group @bb0_8 {
        calyx.assign %std_pad_5.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_5.in = %for_4_induction_var_reg.out : i32
        calyx.assign %ext_mem4_addr0 = %std_pad_5.out : i63
        calyx.assign %ext_mem4_addr1 = %std_slice_5.out : i11
        calyx.assign %load_3_reg.in = %ext_mem4_read_data : i32
        calyx.assign %load_3_reg.write_en = %true : i1
        calyx.group_done %load_3_reg.done : i1
      }
      calyx.group @bb0_9 {
        calyx.assign %std_mult_pipe_2.left = %load_3_reg.out : i32
        calyx.assign %std_mult_pipe_2.right = %in1 : i32
        calyx.assign %muli_2_reg.in = %std_mult_pipe_2.out : i32
        calyx.assign %muli_2_reg.write_en = %std_mult_pipe_2.done : i1
        %0 = comb.xor %std_mult_pipe_2.done, %true : i1
        calyx.assign %std_mult_pipe_2.go = %0 ? %true : i1
        calyx.group_done %muli_2_reg.done : i1
      }
      calyx.group @bb0_10 {
        calyx.assign %std_pad_4.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_4.in = %for_4_induction_var_reg.out : i32
        calyx.assign %ext_mem4_addr0 = %std_pad_4.out : i63
        calyx.assign %ext_mem4_addr1 = %std_slice_4.out : i11
        calyx.assign %ext_mem4_write_data = %std_mult_pipe_2.out : i32
        calyx.assign %ext_mem4_write_en = %true : i1
        calyx.group_done %ext_mem4_done : i1
      }
      calyx.group @bb0_11 {
        calyx.assign %std_pad_3.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_3.in = %for_3_induction_var_reg.out : i32
        calyx.assign %ext_mem0_addr0 = %std_pad_3.out : i63
        calyx.assign %ext_mem0_addr1 = %std_slice_3.out : i10
        calyx.assign %load_4_reg.in = %ext_mem0_read_data : i32
        calyx.assign %load_4_reg.write_en = %true : i1
        calyx.group_done %load_4_reg.done : i1
      }
      calyx.group @bb0_12 {
        calyx.assign %std_pad_2.in = %for_3_induction_var_reg.out : i32
        calyx.assign %std_slice_2.in = %for_4_induction_var_reg.out : i32
        calyx.assign %ext_mem3_addr0 = %std_pad_2.out : i63
        calyx.assign %ext_mem3_addr1 = %std_slice_2.out : i11
        calyx.assign %load_5_reg.in = %ext_mem3_read_data : i32
        calyx.assign %load_5_reg.write_en = %true : i1
        calyx.group_done %load_5_reg.done : i1
      }
      calyx.group @bb0_13 {
        calyx.assign %std_mult_pipe_3.left = %load_4_reg.out : i32
        calyx.assign %std_mult_pipe_3.right = %load_5_reg.out : i32
        calyx.assign %muli_3_reg.in = %std_mult_pipe_3.out : i32
        calyx.assign %muli_3_reg.write_en = %std_mult_pipe_3.done : i1
        %0 = comb.xor %std_mult_pipe_3.done, %true : i1
        calyx.assign %std_mult_pipe_3.go = %0 ? %true : i1
        calyx.group_done %muli_3_reg.done : i1
      }
      calyx.group @bb0_14 {
        calyx.assign %std_pad_1.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_1.in = %for_4_induction_var_reg.out : i32
        calyx.assign %ext_mem4_addr0 = %std_pad_1.out : i63
        calyx.assign %ext_mem4_addr1 = %std_slice_1.out : i11
        calyx.assign %load_6_reg.in = %ext_mem4_read_data : i32
        calyx.assign %load_6_reg.write_en = %true : i1
        calyx.group_done %load_6_reg.done : i1
      }
      calyx.group @bb0_16 {
        calyx.assign %std_pad_0.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_0.in = %for_4_induction_var_reg.out : i32
        calyx.assign %ext_mem4_addr0 = %std_pad_0.out : i63
        calyx.assign %ext_mem4_addr1 = %std_slice_0.out : i11
        calyx.assign %ext_mem4_write_data = %std_add_4.out : i32
        calyx.assign %ext_mem4_write_en = %true : i1
        calyx.assign %std_add_4.left = %load_6_reg.out : i32
        calyx.assign %std_add_4.right = %std_mult_pipe_3.out : i32
        calyx.group_done %ext_mem4_done : i1
      }
      calyx.group @incr_for_3_induction_var {
        calyx.assign %std_add_5.left = %for_3_induction_var_reg.out : i32
        calyx.assign %std_add_5.right = %c1_i32 : i32
        calyx.assign %for_3_induction_var_reg.in = %std_add_5.out : i32
        calyx.assign %for_3_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_3_induction_var_reg.done : i1
      }
      calyx.group @incr_for_4_induction_var {
        calyx.assign %std_add_6.left = %for_4_induction_var_reg.out : i32
        calyx.assign %std_add_6.right = %c1_i32 : i32
        calyx.assign %for_4_induction_var_reg.in = %std_add_6.out : i32
        calyx.assign %for_4_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_4_induction_var_reg.done : i1
      }
      calyx.group @incr_for_5_induction_var {
        calyx.assign %std_add_7.left = %for_5_induction_var_reg.out : i32
        calyx.assign %std_add_7.right = %c1_i32 : i32
        calyx.assign %for_5_induction_var_reg.in = %std_add_7.out : i32
        calyx.assign %for_5_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_5_induction_var_reg.done : i1
      }
    }
    calyx.control {
      calyx.seq {
        calyx.enable @init_for_2_induction_var
        calyx.repeat 800 {
          calyx.seq {
            calyx.enable @init_for_1_induction_var
            calyx.repeat 900 {
              calyx.seq {
                calyx.enable @bb0_0
                calyx.enable @init_for_0_induction_var
                calyx.repeat 1100 {
                  calyx.seq {
                    calyx.enable @bb0_1
                    calyx.enable @bb0_2
                    calyx.enable @bb0_3
                    calyx.enable @bb0_4
                    calyx.enable @bb0_5
                    calyx.enable @bb0_7
                    calyx.enable @incr_for_0_induction_var
                  }
                }
                calyx.enable @incr_for_1_induction_var
              }
            }
            calyx.enable @incr_for_2_induction_var
          }
        }
        calyx.enable @init_for_5_induction_var
        calyx.repeat 800 {
          calyx.seq {
            calyx.enable @init_for_4_induction_var
            calyx.repeat 1200 {
              calyx.seq {
                calyx.enable @bb0_8
                calyx.enable @bb0_9
                calyx.enable @bb0_10
                calyx.enable @init_for_3_induction_var
                calyx.repeat 900 {
                  calyx.seq {
                    calyx.enable @bb0_11
                    calyx.enable @bb0_12
                    calyx.enable @bb0_13
                    calyx.enable @bb0_14
                    calyx.enable @bb0_16
                    calyx.enable @incr_for_3_induction_var
                  }
                }
                calyx.enable @incr_for_4_induction_var
              }
            }
            calyx.enable @incr_for_5_induction_var
          }
        }
      }
    }
  } {toplevel}
  calyx.component @main(%clk: i1 {clk}, %reset: i1 {reset}, %go: i1 {go}) -> (%done: i1 {done}) {
    %true = hw.constant true
    %c5_i32 = hw.constant 5 : i32
    %c4_i32 = hw.constant 4 : i32
    %c0_i32 = hw.constant 0 : i32
    %c1_i32 = hw.constant 1 : i32
    %std_slice_21.in, %std_slice_21.out = calyx.std_slice @std_slice_21 : i32, i10
    %std_slice_20.in, %std_slice_20.out = calyx.std_slice @std_slice_20 : i32, i10
    %std_slice_19.in, %std_slice_19.out = calyx.std_slice @std_slice_19 : i32, i10
    %std_slice_18.in, %std_slice_18.out = calyx.std_slice @std_slice_18 : i32, i11
    %std_slice_17.in, %std_slice_17.out = calyx.std_slice @std_slice_17 : i32, i11
    %std_slice_16.in, %std_slice_16.out = calyx.std_slice @std_slice_16 : i32, i10
    %std_slice_15.in, %std_slice_15.out = calyx.std_slice @std_slice_15 : i32, i10
    %std_slice_14.in, %std_slice_14.out = calyx.std_slice @std_slice_14 : i32, i10
    %std_slice_13.in, %std_slice_13.out = calyx.std_slice @std_slice_13 : i32, i10
    %std_slice_12.in, %std_slice_12.out = calyx.std_slice @std_slice_12 : i32, i10
    %std_slice_11.in, %std_slice_11.out = calyx.std_slice @std_slice_11 : i32, i10
    %std_slice_10.in, %std_slice_10.out = calyx.std_slice @std_slice_10 : i32, i11
    %std_slice_9.in, %std_slice_9.out = calyx.std_slice @std_slice_9 : i32, i10
    %std_slice_8.in, %std_slice_8.out = calyx.std_slice @std_slice_8 : i32, i11
    %std_slice_7.in, %std_slice_7.out = calyx.std_slice @std_slice_7 : i32, i10
    %std_slice_6.in, %std_slice_6.out = calyx.std_slice @std_slice_6 : i32, i10
    %std_slice_5.in, %std_slice_5.out = calyx.std_slice @std_slice_5 : i32, i10
    %std_slice_4.in, %std_slice_4.out = calyx.std_slice @std_slice_4 : i32, i11
    %std_slice_3.in, %std_slice_3.out = calyx.std_slice @std_slice_3 : i32, i10
    %std_slice_2.in, %std_slice_2.out = calyx.std_slice @std_slice_2 : i32, i11
    %std_slice_1.in, %std_slice_1.out = calyx.std_slice @std_slice_1 : i32, i10
    %std_slice_0.in, %std_slice_0.out = calyx.std_slice @std_slice_0 : i32, i11
    %std_add_7.left, %std_add_7.right, %std_add_7.out = calyx.std_add @std_add_7 : i32, i32, i32
    %std_add_6.left, %std_add_6.right, %std_add_6.out = calyx.std_add @std_add_6 : i32, i32, i32
    %std_add_5.left, %std_add_5.right, %std_add_5.out = calyx.std_add @std_add_5 : i32, i32, i32
    %std_add_4.left, %std_add_4.right, %std_add_4.out = calyx.std_add @std_add_4 : i32, i32, i32
    %load_3_reg.in, %load_3_reg.write_en, %load_3_reg.clk, %load_3_reg.reset, %load_3_reg.out, %load_3_reg.done = calyx.register @load_3_reg : i32, i1, i1, i1, i32, i1
    %muli_3_reg.in, %muli_3_reg.write_en, %muli_3_reg.clk, %muli_3_reg.reset, %muli_3_reg.out, %muli_3_reg.done = calyx.register @muli_3_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_3.clk, %std_mult_pipe_3.reset, %std_mult_pipe_3.go, %std_mult_pipe_3.left, %std_mult_pipe_3.right, %std_mult_pipe_3.out, %std_mult_pipe_3.done = calyx.std_mult_pipe @std_mult_pipe_3 : i1, i1, i1, i32, i32, i32, i1
    %load_2_reg.in, %load_2_reg.write_en, %load_2_reg.clk, %load_2_reg.reset, %load_2_reg.out, %load_2_reg.done = calyx.register @load_2_reg : i32, i1, i1, i1, i32, i1
    %muli_2_reg.in, %muli_2_reg.write_en, %muli_2_reg.clk, %muli_2_reg.reset, %muli_2_reg.out, %muli_2_reg.done = calyx.register @muli_2_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_2.clk, %std_mult_pipe_2.reset, %std_mult_pipe_2.go, %std_mult_pipe_2.left, %std_mult_pipe_2.right, %std_mult_pipe_2.out, %std_mult_pipe_2.done = calyx.std_mult_pipe @std_mult_pipe_2 : i1, i1, i1, i32, i32, i32, i1
    %load_1_reg.in, %load_1_reg.write_en, %load_1_reg.clk, %load_1_reg.reset, %load_1_reg.out, %load_1_reg.done = calyx.register @load_1_reg : i32, i1, i1, i1, i32, i1
    %std_add_3.left, %std_add_3.right, %std_add_3.out = calyx.std_add @std_add_3 : i32, i32, i32
    %std_add_2.left, %std_add_2.right, %std_add_2.out = calyx.std_add @std_add_2 : i32, i32, i32
    %std_add_1.left, %std_add_1.right, %std_add_1.out = calyx.std_add @std_add_1 : i32, i32, i32
    %std_add_0.left, %std_add_0.right, %std_add_0.out = calyx.std_add @std_add_0 : i32, i32, i32
    %load_0_reg.in, %load_0_reg.write_en, %load_0_reg.clk, %load_0_reg.reset, %load_0_reg.out, %load_0_reg.done = calyx.register @load_0_reg : i32, i1, i1, i1, i32, i1
    %muli_1_reg.in, %muli_1_reg.write_en, %muli_1_reg.clk, %muli_1_reg.reset, %muli_1_reg.out, %muli_1_reg.done = calyx.register @muli_1_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_1.clk, %std_mult_pipe_1.reset, %std_mult_pipe_1.go, %std_mult_pipe_1.left, %std_mult_pipe_1.right, %std_mult_pipe_1.out, %std_mult_pipe_1.done = calyx.std_mult_pipe @std_mult_pipe_1 : i1, i1, i1, i32, i32, i32, i1
    %muli_0_reg.in, %muli_0_reg.write_en, %muli_0_reg.clk, %muli_0_reg.reset, %muli_0_reg.out, %muli_0_reg.done = calyx.register @muli_0_reg : i32, i1, i1, i1, i32, i1
    %std_mult_pipe_0.clk, %std_mult_pipe_0.reset, %std_mult_pipe_0.go, %std_mult_pipe_0.left, %std_mult_pipe_0.right, %std_mult_pipe_0.out, %std_mult_pipe_0.done = calyx.std_mult_pipe @std_mult_pipe_0 : i1, i1, i1, i32, i32, i32, i1
    %mem_4.addr0, %mem_4.addr1, %mem_4.write_data, %mem_4.write_en, %mem_4.write_done, %mem_4.clk, %mem_4.read_data, %mem_4.read_en, %mem_4.read_done = calyx.seq_mem @mem_4 <[800, 900] x 32> [10, 10] {external = true} : i10, i10, i32, i1, i1, i1, i32, i1, i1
    %mem_3.addr0, %mem_3.addr1, %mem_3.write_data, %mem_3.write_en, %mem_3.write_done, %mem_3.clk, %mem_3.read_data, %mem_3.read_en, %mem_3.read_done = calyx.seq_mem @mem_3 <[800, 1100] x 32> [10, 11] {external = true} : i10, i11, i32, i1, i1, i1, i32, i1, i1
    %mem_2.addr0, %mem_2.addr1, %mem_2.write_data, %mem_2.write_en, %mem_2.write_done, %mem_2.clk, %mem_2.read_data, %mem_2.read_en, %mem_2.read_done = calyx.seq_mem @mem_2 <[1100, 900] x 32> [11, 10] {external = true} : i11, i10, i32, i1, i1, i1, i32, i1, i1
    %mem_1.addr0, %mem_1.addr1, %mem_1.write_data, %mem_1.write_en, %mem_1.write_done, %mem_1.clk, %mem_1.read_data, %mem_1.read_en, %mem_1.read_done = calyx.seq_mem @mem_1 <[900, 1200] x 32> [10, 11] {external = true} : i10, i11, i32, i1, i1, i1, i32, i1, i1
    %mem_0.addr0, %mem_0.addr1, %mem_0.write_data, %mem_0.write_en, %mem_0.write_done, %mem_0.clk, %mem_0.read_data, %mem_0.read_en, %mem_0.read_done = calyx.seq_mem @mem_0 <[800, 1200] x 32> [10, 11] {external = true} : i10, i11, i32, i1, i1, i1, i32, i1, i1
    %for_5_induction_var_reg.in, %for_5_induction_var_reg.write_en, %for_5_induction_var_reg.clk, %for_5_induction_var_reg.reset, %for_5_induction_var_reg.out, %for_5_induction_var_reg.done = calyx.register @for_5_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_4_induction_var_reg.in, %for_4_induction_var_reg.write_en, %for_4_induction_var_reg.clk, %for_4_induction_var_reg.reset, %for_4_induction_var_reg.out, %for_4_induction_var_reg.done = calyx.register @for_4_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_3_induction_var_reg.in, %for_3_induction_var_reg.write_en, %for_3_induction_var_reg.clk, %for_3_induction_var_reg.reset, %for_3_induction_var_reg.out, %for_3_induction_var_reg.done = calyx.register @for_3_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_2_induction_var_reg.in, %for_2_induction_var_reg.write_en, %for_2_induction_var_reg.clk, %for_2_induction_var_reg.reset, %for_2_induction_var_reg.out, %for_2_induction_var_reg.done = calyx.register @for_2_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_1_induction_var_reg.in, %for_1_induction_var_reg.write_en, %for_1_induction_var_reg.clk, %for_1_induction_var_reg.reset, %for_1_induction_var_reg.out, %for_1_induction_var_reg.done = calyx.register @for_1_induction_var_reg : i32, i1, i1, i1, i32, i1
    %for_0_induction_var_reg.in, %for_0_induction_var_reg.write_en, %for_0_induction_var_reg.clk, %for_0_induction_var_reg.reset, %for_0_induction_var_reg.out, %for_0_induction_var_reg.done = calyx.register @for_0_induction_var_reg : i32, i1, i1, i1, i32, i1
    calyx.wires {
      calyx.group @init_for_0_induction_var {
        calyx.assign %for_0_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_0_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_0_induction_var_reg.done : i1
      }
      calyx.group @init_for_1_induction_var {
        calyx.assign %for_1_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_1_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_1_induction_var_reg.done : i1
      }
      calyx.group @init_for_2_induction_var {
        calyx.assign %for_2_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_2_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_2_induction_var_reg.done : i1
      }
      calyx.group @init_for_3_induction_var {
        calyx.assign %for_3_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_3_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_3_induction_var_reg.done : i1
      }
      calyx.group @init_for_4_induction_var {
        calyx.assign %for_4_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_4_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_4_induction_var_reg.done : i1
      }
      calyx.group @init_for_5_induction_var {
        calyx.assign %for_5_induction_var_reg.in = %c0_i32 : i32
        calyx.assign %for_5_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_5_induction_var_reg.done : i1
      }
      calyx.group @bb0_0 {
        calyx.assign %std_slice_21.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_20.in = %for_1_induction_var_reg.out : i32
        calyx.assign %mem_4.addr0 = %std_slice_21.out : i10
        calyx.assign %mem_4.addr1 = %std_slice_20.out : i10
        calyx.assign %mem_4.write_data = %c0_i32 : i32
        calyx.assign %mem_4.write_en = %true : i1
        calyx.group_done %mem_4.write_done : i1
      }
      calyx.group @bb0_1 {
        calyx.assign %std_slice_19.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_18.in = %for_0_induction_var_reg.out : i32
        calyx.assign %mem_3.addr0 = %std_slice_19.out : i10
        calyx.assign %mem_3.addr1 = %std_slice_18.out : i11
        calyx.assign %mem_3.read_en = %true : i1
        calyx.group_done %mem_3.read_done : i1
      }
      calyx.group @bb0_2 {
        calyx.assign %std_mult_pipe_0.left = %mem_3.read_data : i32
        calyx.assign %std_mult_pipe_0.right = %c5_i32 : i32
        calyx.assign %muli_0_reg.in = %std_mult_pipe_0.out : i32
        calyx.assign %muli_0_reg.write_en = %std_mult_pipe_0.done : i1
        %0 = comb.xor %std_mult_pipe_0.done, %true : i1
        calyx.assign %std_mult_pipe_0.go = %0 ? %true : i1
        calyx.group_done %muli_0_reg.done : i1
      }
      calyx.group @bb0_3 {
        calyx.assign %std_slice_17.in = %for_0_induction_var_reg.out : i32
        calyx.assign %std_slice_16.in = %for_1_induction_var_reg.out : i32
        calyx.assign %mem_2.addr0 = %std_slice_17.out : i11
        calyx.assign %mem_2.addr1 = %std_slice_16.out : i10
        calyx.assign %mem_2.read_en = %true : i1
        calyx.group_done %mem_2.read_done : i1
      }
      calyx.group @bb0_4 {
        calyx.assign %std_mult_pipe_1.left = %std_mult_pipe_0.out : i32
        calyx.assign %std_mult_pipe_1.right = %mem_2.read_data : i32
        calyx.assign %muli_1_reg.in = %std_mult_pipe_1.out : i32
        calyx.assign %muli_1_reg.write_en = %std_mult_pipe_1.done : i1
        %0 = comb.xor %std_mult_pipe_1.done, %true : i1
        calyx.assign %std_mult_pipe_1.go = %0 ? %true : i1
        calyx.group_done %muli_1_reg.done : i1
      }
      calyx.group @bb0_5 {
        calyx.assign %std_slice_15.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_14.in = %for_1_induction_var_reg.out : i32
        calyx.assign %mem_4.addr0 = %std_slice_15.out : i10
        calyx.assign %mem_4.addr1 = %std_slice_14.out : i10
        calyx.assign %mem_4.read_en = %true : i1
        calyx.assign %load_0_reg.in = %mem_4.read_data : i32
        calyx.assign %load_0_reg.write_en = %mem_4.read_done : i1
        calyx.group_done %load_0_reg.done : i1
      }
      calyx.group @bb0_7 {
        calyx.assign %std_slice_13.in = %for_2_induction_var_reg.out : i32
        calyx.assign %std_slice_12.in = %for_1_induction_var_reg.out : i32
        calyx.assign %mem_4.addr0 = %std_slice_13.out : i10
        calyx.assign %mem_4.addr1 = %std_slice_12.out : i10
        calyx.assign %mem_4.write_data = %std_add_0.out : i32
        calyx.assign %mem_4.write_en = %true : i1
        calyx.assign %std_add_0.left = %load_0_reg.out : i32
        calyx.assign %std_add_0.right = %std_mult_pipe_1.out : i32
        calyx.group_done %mem_4.write_done : i1
      }
      calyx.group @incr_for_0_induction_var {
        calyx.assign %std_add_1.left = %for_0_induction_var_reg.out : i32
        calyx.assign %std_add_1.right = %c1_i32 : i32
        calyx.assign %for_0_induction_var_reg.in = %std_add_1.out : i32
        calyx.assign %for_0_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_0_induction_var_reg.done : i1
      }
      calyx.group @incr_for_1_induction_var {
        calyx.assign %std_add_2.left = %for_1_induction_var_reg.out : i32
        calyx.assign %std_add_2.right = %c1_i32 : i32
        calyx.assign %for_1_induction_var_reg.in = %std_add_2.out : i32
        calyx.assign %for_1_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_1_induction_var_reg.done : i1
      }
      calyx.group @incr_for_2_induction_var {
        calyx.assign %std_add_3.left = %for_2_induction_var_reg.out : i32
        calyx.assign %std_add_3.right = %c1_i32 : i32
        calyx.assign %for_2_induction_var_reg.in = %std_add_3.out : i32
        calyx.assign %for_2_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_2_induction_var_reg.done : i1
      }
      calyx.group @bb0_8 {
        calyx.assign %std_slice_11.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_10.in = %for_4_induction_var_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_11.out : i10
        calyx.assign %mem_0.addr1 = %std_slice_10.out : i11
        calyx.assign %mem_0.read_en = %true : i1
        calyx.assign %load_1_reg.in = %mem_0.read_data : i32
        calyx.assign %load_1_reg.write_en = %mem_0.read_done : i1
        calyx.group_done %load_1_reg.done : i1
      }
      calyx.group @bb0_9 {
        calyx.assign %std_mult_pipe_2.left = %load_1_reg.out : i32
        calyx.assign %std_mult_pipe_2.right = %c4_i32 : i32
        calyx.assign %muli_2_reg.in = %std_mult_pipe_2.out : i32
        calyx.assign %muli_2_reg.write_en = %std_mult_pipe_2.done : i1
        %0 = comb.xor %std_mult_pipe_2.done, %true : i1
        calyx.assign %std_mult_pipe_2.go = %0 ? %true : i1
        calyx.group_done %muli_2_reg.done : i1
      }
      calyx.group @bb0_10 {
        calyx.assign %std_slice_9.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_8.in = %for_4_induction_var_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_9.out : i10
        calyx.assign %mem_0.addr1 = %std_slice_8.out : i11
        calyx.assign %mem_0.write_data = %std_mult_pipe_2.out : i32
        calyx.assign %mem_0.write_en = %true : i1
        calyx.group_done %mem_0.write_done : i1
      }
      calyx.group @bb0_11 {
        calyx.assign %std_slice_7.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_6.in = %for_3_induction_var_reg.out : i32
        calyx.assign %mem_4.addr0 = %std_slice_7.out : i10
        calyx.assign %mem_4.addr1 = %std_slice_6.out : i10
        calyx.assign %mem_4.read_en = %true : i1
        calyx.assign %load_2_reg.in = %mem_4.read_data : i32
        calyx.assign %load_2_reg.write_en = %mem_4.read_done : i1
        calyx.group_done %load_2_reg.done : i1
      }
      calyx.group @bb0_12 {
        calyx.assign %std_slice_5.in = %for_3_induction_var_reg.out : i32
        calyx.assign %std_slice_4.in = %for_4_induction_var_reg.out : i32
        calyx.assign %mem_1.addr0 = %std_slice_5.out : i10
        calyx.assign %mem_1.addr1 = %std_slice_4.out : i11
        calyx.assign %mem_1.read_en = %true : i1
        calyx.group_done %mem_1.read_done : i1
      }
      calyx.group @bb0_13 {
        calyx.assign %std_mult_pipe_3.left = %load_2_reg.out : i32
        calyx.assign %std_mult_pipe_3.right = %mem_1.read_data : i32
        calyx.assign %muli_3_reg.in = %std_mult_pipe_3.out : i32
        calyx.assign %muli_3_reg.write_en = %std_mult_pipe_3.done : i1
        %0 = comb.xor %std_mult_pipe_3.done, %true : i1
        calyx.assign %std_mult_pipe_3.go = %0 ? %true : i1
        calyx.group_done %muli_3_reg.done : i1
      }
      calyx.group @bb0_14 {
        calyx.assign %std_slice_3.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_2.in = %for_4_induction_var_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_3.out : i10
        calyx.assign %mem_0.addr1 = %std_slice_2.out : i11
        calyx.assign %mem_0.read_en = %true : i1
        calyx.assign %load_3_reg.in = %mem_0.read_data : i32
        calyx.assign %load_3_reg.write_en = %mem_0.read_done : i1
        calyx.group_done %load_3_reg.done : i1
      }
      calyx.group @bb0_16 {
        calyx.assign %std_slice_1.in = %for_5_induction_var_reg.out : i32
        calyx.assign %std_slice_0.in = %for_4_induction_var_reg.out : i32
        calyx.assign %mem_0.addr0 = %std_slice_1.out : i10
        calyx.assign %mem_0.addr1 = %std_slice_0.out : i11
        calyx.assign %mem_0.write_data = %std_add_4.out : i32
        calyx.assign %mem_0.write_en = %true : i1
        calyx.assign %std_add_4.left = %load_3_reg.out : i32
        calyx.assign %std_add_4.right = %std_mult_pipe_3.out : i32
        calyx.group_done %mem_0.write_done : i1
      }
      calyx.group @incr_for_3_induction_var {
        calyx.assign %std_add_5.left = %for_3_induction_var_reg.out : i32
        calyx.assign %std_add_5.right = %c1_i32 : i32
        calyx.assign %for_3_induction_var_reg.in = %std_add_5.out : i32
        calyx.assign %for_3_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_3_induction_var_reg.done : i1
      }
      calyx.group @incr_for_4_induction_var {
        calyx.assign %std_add_6.left = %for_4_induction_var_reg.out : i32
        calyx.assign %std_add_6.right = %c1_i32 : i32
        calyx.assign %for_4_induction_var_reg.in = %std_add_6.out : i32
        calyx.assign %for_4_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_4_induction_var_reg.done : i1
      }
      calyx.group @incr_for_5_induction_var {
        calyx.assign %std_add_7.left = %for_5_induction_var_reg.out : i32
        calyx.assign %std_add_7.right = %c1_i32 : i32
        calyx.assign %for_5_induction_var_reg.in = %std_add_7.out : i32
        calyx.assign %for_5_induction_var_reg.write_en = %true : i1
        calyx.group_done %for_5_induction_var_reg.done : i1
      }
    }
    calyx.control {
      calyx.seq {
        calyx.enable @init_for_2_induction_var
        calyx.repeat 800 {
          calyx.seq {
            calyx.enable @init_for_1_induction_var
            calyx.repeat 900 {
              calyx.seq {
                calyx.enable @bb0_0
                calyx.enable @init_for_0_induction_var
                calyx.repeat 1100 {
                  calyx.seq {
                    calyx.enable @bb0_1
                    calyx.enable @bb0_2
                    calyx.enable @bb0_3
                    calyx.enable @bb0_4
                    calyx.enable @bb0_5
                    calyx.enable @bb0_7
                    calyx.enable @incr_for_0_induction_var
                  }
                }
                calyx.enable @incr_for_1_induction_var
              }
            }
            calyx.enable @incr_for_2_induction_var
          }
        }
        calyx.enable @init_for_5_induction_var
        calyx.repeat 800 {
          calyx.seq {
            calyx.enable @init_for_4_induction_var
            calyx.repeat 1200 {
              calyx.seq {
                calyx.enable @bb0_8
                calyx.enable @bb0_9
                calyx.enable @bb0_10
                calyx.enable @init_for_3_induction_var
                calyx.repeat 900 {
                  calyx.seq {
                    calyx.enable @bb0_11
                    calyx.enable @bb0_12
                    calyx.enable @bb0_13
                    calyx.enable @bb0_14
                    calyx.enable @bb0_16
                    calyx.enable @incr_for_3_induction_var
                  }
                }
                calyx.enable @incr_for_4_induction_var
              }
            }
            calyx.enable @incr_for_5_induction_var
          }
        }
      }
    }
  } {toplevel}
}

