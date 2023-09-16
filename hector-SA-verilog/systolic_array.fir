;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit systolic_array : 
  extmodule mulf_3_8_24_ip : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_1 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h040a450cc"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040edd1d6"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0414fc8c6"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041d19bc1"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a87e7b"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0424e1737"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b7ea0f"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_1 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_1 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_1 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_1 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_1 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_1 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_1 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_2 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_3 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_1 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c2bc7f"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0420219bb"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04147c555"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a233d7"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041e8448f"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c4e46a"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0417a2f0c"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_1 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_1 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_2 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_3 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_2 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_2 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_2 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_2 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_2 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_2 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_4 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_5 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_2 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c2655a"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0422ebed0"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0420a7ae9"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0404b94cc"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0414993c2"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a031ce"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03ffbf9aa"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_2 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_2 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_4 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_5 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_3 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_3 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_3 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_3 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_3 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_3 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_6 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_7 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_3 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c232e7"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0421e7cb4"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041a8f371"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a8c51e"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0421fb3f4"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a0004b"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04279e80a"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_3 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_3 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_6 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_7 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_4 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_4 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_4 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_4 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_4 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_4 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_8 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_9 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_4 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c14d92"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a990d4"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04289ae84"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b3b73f"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b6d361"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0417ecb58"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04293c0eb"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_4 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_4 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_8 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_9 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_5 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_5 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_5 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_5 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_5 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_5 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_10 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_11 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_5 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c1b710"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04284047e"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429dc709"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423d5c88"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429f7522"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0422d992a"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429543f2"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_5 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_5 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_10 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_11 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_6 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_6 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_6 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_6 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_6 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_6 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_12 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_13 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_6 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c5836a"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427a1a60"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a91857"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04280453e"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b2d8cd"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041d8a6e7"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b4977e"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_6 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_6 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_12 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_13 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_7 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_7 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_7 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_7 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_7 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_7 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_14 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_15 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_7 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c5d5f9"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429c8918"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429ebc39"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041b151e9"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427b8d65"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0419130cc"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a46236"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_7 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_7 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_14 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_15 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_1 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_2 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_3 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_4 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_5 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_6 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_7 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  extmodule mulf_3_8_24_ip_8 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_8 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_8 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_8 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_8 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_8 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_16 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_17 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_8 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c53e9e"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0428425ee"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0421b74de"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042838de2"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042337a71"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0418edea8"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427edd21"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_8 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_8 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_16 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_17 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_9 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_9 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_9 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_9 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_9 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_9 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_18 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_19 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_9 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c527af"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f1716e8"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041bd1734"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04284a618"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041f02571"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a2e6fa"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425b6c82"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_9 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_9 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_18 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_19 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_10 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_10 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_10 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_10 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_10 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_10 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_20 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_21 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_10 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c454b4"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042188db8"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040629866"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0424d701a"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042558bb3"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041d4029c"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042556067"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_10 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_10 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_20 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_21 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_11 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_11 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_11 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_11 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_11 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_11 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_22 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_23 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_11 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c43002"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425574e9"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0421cb44a"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b87865"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04119fd63"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04103fc6e"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429e561a"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_11 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_11 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_22 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_23 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_12 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_12 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_12 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_12 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_12 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_12 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_24 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_25 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_12 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c49e16"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040f5faa8"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0420113fb"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0428b375f"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04223a467"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427c05b5"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03fd91926"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_12 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_12 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_24 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_25 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_13 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_13 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_13 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_13 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_13 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_13 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_26 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_27 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_13 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c47965"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041b74d0c"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04287cf60"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04127bdb3"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c24c06"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042330381"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041dc292e"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_13 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_13 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_26 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_27 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_14 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_14 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_14 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_14 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_14 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_14 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_28 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_29 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_14 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c3d8de"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042810cfe"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042753ddf"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04165099e"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042ba6101"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b3ccf1"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042830020"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_14 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_14 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_28 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_29 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_15 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_15 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_15 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_15 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_15 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_15 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_30 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_31 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_15 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c3b8c2"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042536449"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429ffba5"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04296297f"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b8cb99"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c5dbfa"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041518a56"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_15 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_15 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_30 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_31 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line_1 : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE_8 @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_9 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_10 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_11 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_12 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_13 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_14 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_15 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  extmodule mulf_3_8_24_ip_16 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_16 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_16 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_16 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_16 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_16 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_32 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_33 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_16 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c3efcc"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041f012fc"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042991392"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0415c47eb"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04100a6ea"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041d27684"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04294b870"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_16 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_16 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_32 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_33 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_17 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_17 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_17 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_17 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_17 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_17 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_34 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_35 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_17 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c7c0bc"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c73eff"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042827c34"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04249cfd8"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04272d29c"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0421515d2"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0413cb9fd"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_17 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_17 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_34 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_35 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_18 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_18 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_18 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_18 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_18 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_18 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_36 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_37 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_18 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c7a0a1"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042afe425"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a7d8e9"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0413381c2"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426fa7cd"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423933e5"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426d90d4"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_18 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_18 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_36 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_37 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_19 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_19 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_19 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_19 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_19 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_19 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_38 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_39 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_19 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03d968fc0"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040f811aa"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b87d65"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b016fc"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040c1a49c"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04215dbde"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b58f03"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_19 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_19 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_38 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_39 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_20 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_20 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_20 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_20 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_20 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_20 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_40 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_41 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_20 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c7f7c7"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04299919a"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04277283f"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b2476a"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04298b292"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042814c8f"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042921e65"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_20 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_20 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_40 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_41 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_21 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_21 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_21 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_21 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_21 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_21 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_42 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_43 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_21 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c7ee9a"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041f4ba00"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042bf6578"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042456efe"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b4d107"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041216248"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041ec1f79"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_21 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_21 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_42 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_43 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_22 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_22 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_22 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_22 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_22 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_22 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_44 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_45 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_22 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c73bba"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429fa208"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04263af72"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042934128"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041691756"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042386dd9"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a0d0a6"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_22 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_22 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_44 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_45 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_23 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_23 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_23 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_23 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_23 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_23 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_46 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_47 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_23 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c70ddc"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04243650f"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041d3b9ce"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042957195"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a9bb32"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04292958d"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427ac00f"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_23 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_23 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_46 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_47 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line_2 : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE_16 @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_17 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_18 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_19 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_20 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_21 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_22 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_23 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  extmodule mulf_3_8_24_ip_24 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_24 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_24 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_24 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_24 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_24 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_48 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_49 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_24 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c772c4"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04263e947"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04255df4a"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04145052f"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041f1b0b8"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04292f893"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04226af97"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_24 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_24 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_48 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_49 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_25 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_25 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_25 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_25 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_25 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_25 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_50 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_51 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_25 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c6ad8b"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0415d0fc0"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a50496"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426414f4"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a4fafb"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03ec2a998"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040af3866"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_25 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_25 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_50 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_51 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_26 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_26 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_26 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_26 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_26 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_26 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_52 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_53 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_26 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c6a45e"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042873ede"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0418357bb"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04189ea40"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c11970"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423744c6"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04277ba01"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_26 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_26 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_52 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_53 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_27 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_27 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_27 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_27 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_27 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_27 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_54 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_55 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_27 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c68444"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425fc806"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0420c654a"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429c02dc"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042bf8409"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425b62d9"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041187158"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_27 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_27 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_54 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_55 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_28 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_28 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_28 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_28 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_28 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_28 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_56 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_57 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_28 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c6e92b"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042802620"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427867ad"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041798f61"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042246a0a"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425c28e5"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b105ef"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_28 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_28 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_56 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_57 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_29 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_29 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_29 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_29 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_29 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_29 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_58 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_59 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_29 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c6dffe"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0418f0c18"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c0052f"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04297a202"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425ca6f3"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03ef42c98"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04233ded2"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_29 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_29 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_58 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_59 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_30 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_30 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_30 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_30 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_30 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_30 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_60 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_61 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_30 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c6c90f"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04251968a"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a1908c"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04298ba39"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042213f3b"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04280237c"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042106e32"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_30 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_30 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_60 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_61 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_31 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_31 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_31 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_31 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_31 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_31 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_62 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_63 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_31 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c60d03"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425db768"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04297d425"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427367ef"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429d0ff6"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042361bb4"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0422dd2b6"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_31 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_31 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_62 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_63 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line_3 : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE_24 @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_25 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_26 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_27 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_28 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_29 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_30 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_31 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  extmodule mulf_3_8_24_ip_32 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_32 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_32 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_32 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_32 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_32 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_64 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_65 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_32 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c668be"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0418aead8"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042134d5e"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426aa63a"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04217becf"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b65099"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429dca98"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_32 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_32 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_64 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_65 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_33 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_33 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_33 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_33 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_33 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_33 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_66 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_67 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_33 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c651cf"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0424f85ea"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041acc831"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426cd6a8"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041b8ae2c"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425affd3"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0428c1249"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_33 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_33 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_66 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_67 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_34 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_34 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_34 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_34 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_34 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_34 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_68 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_69 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_34 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c648a3"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040b5fdb2"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425e06ca"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0419b6da6"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042149400"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03e3f45a0"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041d3ef0b"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_34 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_34 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_68 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_69 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_35 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_35 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_35 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_35 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_35 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_35 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_70 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_71 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_35 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f88afcc"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041abf4d3"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04124d570"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042bfca43"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042977ffc"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042836d32"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040ef1190"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_35 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_35 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_70 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_71 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_36 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_36 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_36 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_36 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_36 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_36 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_72 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_73 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_36 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f82f438"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042600ae8"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042be260c"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c0e27a"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04273983f"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041ea7208"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c538ca"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_36 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_36 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_72 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_73 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_37 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_37 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_37 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_37 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_37 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_37 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_74 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_75 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_37 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f80a91c"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0411d12d1"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041e7dd92"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04262a51e"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04295ea94"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042957c3b"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425c4486"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_37 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_37 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_74 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_75 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_38 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_38 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_38 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_38 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_38 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_38 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_76 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_77 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_38 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f9b087a"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b61604"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0421c1fd2"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041624ca4"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0427d18ab"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0400dec9e"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425f4a94"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_38 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_38 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_76 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_77 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_39 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_39 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_39 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_39 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_39 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_39 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_78 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_79 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_39 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f954ce6"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041cc790b"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041be6d1c"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0416b0e57"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04241b0f3"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042839eb5"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423bd9f6"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_39 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_39 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_78 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_79 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line_4 : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE_32 @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_33 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_34 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_35 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_36 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_37 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_38 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_39 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  extmodule mulf_3_8_24_ip_40 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_40 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_40 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_40 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_40 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_40 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_80 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_81 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_40 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f47fd44"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a4cb97"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042536070"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426d9740"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f33a380"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b968cc"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0412c45b6"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_40 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_40 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_80 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_81 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_41 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_41 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_41 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_41 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_41 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_41 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_82 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_83 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_41 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f3ed0d4"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b40564"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041a54ba6"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429fabcb"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041e690c2"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a7283f"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041bd6ea7"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_41 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_41 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_82 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_83 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_42 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_42 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_42 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_42 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_42 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_42 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_84 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_85 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_42 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f3359ac"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041c4368e"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040ade474"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a0c402"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0415f82a7"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423caf1d"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0416d1ad4"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_42 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_42 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_84 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_85 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_43 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_43 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_43 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_43 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_43 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_43 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_86 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_87 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_43 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f310e90"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0424db82c"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041b31bce"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04271f819"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0428dff8f"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0419f1dae"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042ba1817"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_43 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_43 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_86 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_87 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_44 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_44 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_44 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_44 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_44 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_44 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_88 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_89 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_44 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f7144d8"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c44780"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423ea836"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0418b6b6e"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04294552d"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a78b45"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0402a6db0"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_44 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_44 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_88 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_89 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_45 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_45 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_45 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_45 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_45 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_45 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_90 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_91 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_45 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f65cd4c"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042029f7f"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04201bef1"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0418fcc48"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426d42a1"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423d752a"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042bb9b1e"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_45 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_45 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_90 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_91 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_46 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_46 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_46 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_46 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_46 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_46 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_92 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_93 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_46 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f5ca0dc"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042211317"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03e822918"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04219a67c"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042aede3a"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04218f411"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040d6e122"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_46 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_46 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_92 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_93 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_47 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_47 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_47 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_47 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_47 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_47 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_94 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_95 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_47 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f53746c"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423f86b0"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0428824da"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426b66d3"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04178d91a"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041e8e5ec"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0419d0418"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_47 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_47 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_94 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_95 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line_5 : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE_40 @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_41 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_42 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_43 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_44 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_45 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_46 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_47 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  extmodule mulf_3_8_24_ip_48 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_48 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_48 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_48 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_48 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_48 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_96 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_97 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_48 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03ee1b090"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040970acc"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c239cc"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04063a7b0"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04287a9f1"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042600724"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a6dcc1"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_48 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_48 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_96 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_97 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_49 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_49 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_49 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_49 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_49 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_49 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_98 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_99 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_49 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03ecf57b0"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0414553c6"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04281dc7d"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041bff5a6"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042bfe6da"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423b860b"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c0afb5"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_49 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_49 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_98 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_99 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_50 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_50 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_50 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_50 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_50 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_50 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_100 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_101 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_50 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f27e220"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0426c2bc6"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b469a4"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a1dc39"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c63c79"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0412c36f6"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040beb0b3"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_50 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_50 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_100 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_101 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_51 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_51 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_51 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_51 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_51 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_51 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_102 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_103 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_51 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f1c6a94"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042bb1e22"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04295f502"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a2f46f"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a8889c"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04294b62f"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042c232bc"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_51 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_51 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_102 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_103 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_52 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_52 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_52 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_52 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_52 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_52 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_104 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_105 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_52 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f133e88"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f95fb82"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0422b2f67"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03ff52698"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041462c2e"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0428275a2"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041202d7e"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_52 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_52 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_104 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_105 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_53 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_53 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_53 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_53 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_53 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_53 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_106 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_107 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_53 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03f0a1218"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0410c8dd6"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04129d326"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041b2d317"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0422204de"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042606a2a"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041b7628f"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_53 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_53 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_106 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_107 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_54 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_54 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_54 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_54 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_54 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_54 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_108 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_109 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_54 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03e5e0d50"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0429a99e9"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041a7ca7e"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040c964e2"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042bb26a4"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04293f022"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0421c8669"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_54 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_54 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_108 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_109 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_55 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_55 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_55 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_55 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_55 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_55 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_110 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_111 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_55 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03e395b90"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a9d3b6"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b19551"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041d5d9e6"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041ad8e36"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04281af96"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042502c51"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_55 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_55 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_110 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_111 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line_6 : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE_48 @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_49 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_50 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_51 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_52 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_53 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_54 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_55 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  extmodule mulf_3_8_24_ip_56 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_56 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_56 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_56 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_56 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_56 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_112 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_113 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_56 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03eb3d260"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04293812b"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042855087"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04094dab0"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042188472"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a66232"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042836c22"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_56 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_56 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_112 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_113 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_57 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_57 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_57 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_57 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_57 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_57 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_114 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_115 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_57 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03eb86898"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423b6570"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04246cfb6"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041c45680"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a232ff"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0412792a8"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042aef766"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_57 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_57 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_114 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_115 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_58 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_58 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_58 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_58 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_58 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_58 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_116 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_117 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_58 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03ea61080"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04259d909"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0418c2a31"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04233eb97"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041137f41"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03fac7218"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h03eca5990"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_58 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_58 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_116 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_117 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_59 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_59 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_59 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_59 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_59 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_59 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_118 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_119 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_59 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03e984dd8"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0420cafbc"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04288c491"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042aa9dec"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a09d97"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0419c057b"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0420c5120"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_59 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_59 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_118 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_119 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_60 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_60 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_60 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_60 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_60 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_60 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_120 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_121 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_60 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h03e85f4f8"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0422b2354"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04210ce85"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h040b7e17c"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04106d404"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041260690"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0423ff708"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_60 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_60 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_120 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_121 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_61 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_61 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_61 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_61 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_61 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_61 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_122 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_123 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_61 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042ba1e5c"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04291f318"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04287246c"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0415c0282"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042715b97"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04298124b"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0422d39b1"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_61 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_61 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_122 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_123 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_62 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_62 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_62 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_62 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_62 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_62 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_124 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_125 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_62 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042ba0c03"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042a12ce4"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0420d8e3c"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04208c0f7"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b0eab6"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04285d1be"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h04260df99"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_62 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_62 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_124 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_125 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  extmodule mulf_3_8_24_ip_63 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = mulf_3_8_24_ip
    
    
  module MulFIP_63 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of mulf_3_8_24_ip_63 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  extmodule addsubf_true_4_8_24_ip_63 : 
    input aclk : Clock
    input aclken : UInt<1>
    input s_axis_a_tdata : UInt<32>
    input s_axis_a_tvalid : UInt<1>
    input s_axis_b_tdata : UInt<32>
    input s_axis_b_tvalid : UInt<1>
    output m_axis_result_tvalid : UInt<1>
    output m_axis_result_tdata : UInt<32>
    
    defname = addsubf_true_4_8_24_ip
    
    
  module AddSubFIP_63 : 
    input clock : Clock
    input reset : Reset
    input operand0 : UInt<32>
    input operand1 : UInt<32>
    input ce : UInt<1>
    output result : UInt<32>
    output valid : UInt<1>
    
    inst IPCore of addsubf_true_4_8_24_ip_63 @[fpunits.scala 315:22]
    IPCore.m_axis_result_tdata is invalid
    IPCore.m_axis_result_tvalid is invalid
    IPCore.s_axis_b_tvalid is invalid
    IPCore.s_axis_b_tdata is invalid
    IPCore.s_axis_a_tvalid is invalid
    IPCore.s_axis_a_tdata is invalid
    IPCore.aclken is invalid
    IPCore.aclk is invalid
    reg operand0Reg : UInt<32>, clock @[fpunits.scala 317:24]
    reg operand1Reg : UInt<32>, clock @[fpunits.scala 318:24]
    reg ceReg : UInt<1>, clock @[fpunits.scala 319:28]
    ceReg <= ce @[fpunits.scala 319:28]
    when ce : @[fpunits.scala 321:12]
      operand0Reg <= operand0 @[fpunits.scala 322:17]
      operand1Reg <= operand1 @[fpunits.scala 323:17]
      skip @[fpunits.scala 321:12]
    IPCore.aclk <= clock @[fpunits.scala 326:29]
    IPCore.aclken <= ceReg @[fpunits.scala 327:29]
    IPCore.s_axis_a_tdata <= operand0Reg @[fpunits.scala 328:29]
    IPCore.s_axis_a_tvalid <= UInt<1>("h01") @[fpunits.scala 329:29]
    IPCore.s_axis_b_tdata <= operand1Reg @[fpunits.scala 330:29]
    IPCore.s_axis_b_tvalid <= UInt<1>("h01") @[fpunits.scala 331:29]
    result <= IPCore.m_axis_result_tdata @[fpunits.scala 332:29]
    valid <= IPCore.m_axis_result_tvalid @[fpunits.scala 333:29]
    
  module DelayBuffer_126 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<33>
    input ready_in : UInt<1>
    output valid_out : UInt<33>
    
    wire _shift_register_WIRE : UInt<33>[7] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[3] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[4] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[5] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[6] <= UInt<33>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<33>[7], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      shift_register[3] <= shift_register[2] @[elastic_component.scala 569:25]
      shift_register[4] <= shift_register[3] @[elastic_component.scala 569:25]
      shift_register[5] <= shift_register[4] @[elastic_component.scala 569:25]
      shift_register[6] <= shift_register[5] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[6] @[elastic_component.scala 572:13]
    
  module DelayBuffer_127 : 
    input clock : Clock
    input reset : Reset
    input valid_in : UInt<32>
    input ready_in : UInt<1>
    output valid_out : UInt<32>
    
    wire _shift_register_WIRE : UInt<32>[3] @[elastic_component.scala 564:39]
    _shift_register_WIRE[0] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[1] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    _shift_register_WIRE[2] <= UInt<32>("h00") @[elastic_component.scala 564:39]
    reg shift_register : UInt<32>[3], clock with : (reset => (reset, _shift_register_WIRE)) @[elastic_component.scala 564:31]
    when ready_in : @[elastic_component.scala 566:18]
      shift_register[0] <= valid_in @[elastic_component.scala 567:23]
      shift_register[1] <= shift_register[0] @[elastic_component.scala 569:25]
      shift_register[2] <= shift_register[1] @[elastic_component.scala 569:25]
      skip @[elastic_component.scala 566:18]
    valid_out <= shift_register[2] @[elastic_component.scala 572:13]
    
  module PE_63 : 
    input clock : Clock
    input reset : Reset
    input A_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input C_in : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output A_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output C_out : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    node valid_in = and(A_in.valid, C_in.valid) @[systolic.scala 20:29]
    wire valid_out : UInt<1> @[systolic.scala 21:23]
    node ce = and(A_out.ready, C_out.ready) @[systolic.scala 22:31]
    reg B : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b9f9ab"))) @[systolic.scala 26:49]
    reg B_reg_1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042b066b1"))) @[systolic.scala 26:49]
    reg B_reg_2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0404d39cb"))) @[systolic.scala 26:49]
    reg B_reg_3 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0425a814e"))) @[systolic.scala 26:49]
    reg B_reg_4 : UInt<32>, clock with : (reset => (reset, UInt<32>("h041849e7d"))) @[systolic.scala 26:49]
    reg B_reg_5 : UInt<32>, clock with : (reset => (reset, UInt<32>("h042672263"))) @[systolic.scala 26:49]
    reg B_reg_6 : UInt<32>, clock with : (reset => (reset, UInt<32>("h0428a42bf"))) @[systolic.scala 26:49]
    when ce : @[systolic.scala 29:12]
      B <= B_reg_1 @[systolic.scala 31:20]
      B_reg_1 <= B_reg_2 @[systolic.scala 31:20]
      B_reg_2 <= B_reg_3 @[systolic.scala 31:20]
      B_reg_3 <= B_reg_4 @[systolic.scala 31:20]
      B_reg_4 <= B_reg_5 @[systolic.scala 31:20]
      B_reg_5 <= B_reg_6 @[systolic.scala 31:20]
      B_reg_6 <= B @[systolic.scala 33:14]
      skip @[systolic.scala 29:12]
    inst mul of MulFIP_63 @[systolic.scala 37:19]
    mul.clock <= clock
    mul.reset <= reset
    mul.ce <= ce @[systolic.scala 38:10]
    inst add of AddSubFIP_63 @[systolic.scala 40:19]
    add.clock <= clock
    add.reset <= reset
    add.ce <= ce @[systolic.scala 41:10]
    inst A_buf of DelayBuffer_126 @[systolic.scala 43:21]
    A_buf.clock <= clock
    A_buf.reset <= reset
    node _A_buf_valid_in_T = shl(A_in.bits, 1) @[systolic.scala 44:32]
    node _A_buf_valid_in_T_1 = or(_A_buf_valid_in_T, valid_in) @[systolic.scala 44:38]
    A_buf.valid_in <= _A_buf_valid_in_T_1 @[systolic.scala 44:18]
    A_buf.ready_in <= ce @[systolic.scala 45:18]
    mul.operand0 <= A_in.bits @[systolic.scala 47:16]
    mul.operand1 <= B @[systolic.scala 48:16]
    inst C_buf of DelayBuffer_127 @[systolic.scala 50:21]
    C_buf.clock <= clock
    C_buf.reset <= reset
    C_buf.valid_in <= C_in.bits @[systolic.scala 51:18]
    C_buf.ready_in <= ce @[systolic.scala 52:18]
    add.operand0 <= C_buf.valid_out @[systolic.scala 53:16]
    add.operand1 <= mul.result @[systolic.scala 54:16]
    node _A_out_bits_T = shr(A_buf.valid_out, 1) @[systolic.scala 56:33]
    A_out.bits <= _A_out_bits_T @[systolic.scala 56:14]
    C_out.bits <= add.result @[systolic.scala 57:14]
    node _valid_out_T = and(A_buf.valid_out, UInt<1>("h01")) @[systolic.scala 59:32]
    valid_out <= _valid_out_T @[systolic.scala 59:13]
    A_out.valid <= valid_out @[systolic.scala 60:15]
    C_out.valid <= valid_out @[systolic.scala 61:15]
    A_in.ready <= ce @[systolic.scala 62:14]
    C_in.ready <= ce @[systolic.scala 63:14]
    
  module PE_line_7 : 
    input clock : Clock
    input reset : Reset
    input var0 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var1 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var2 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var3 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var4 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var5 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var6 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var7 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var8 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var9 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var10 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var11 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var12 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var13 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var14 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var15 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var16 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var9.bits is invalid @[systolic_array.scala 21:14]
    var9.valid is invalid @[systolic_array.scala 21:14]
    var9.ready is invalid @[systolic_array.scala 21:14]
    var10.bits is invalid @[systolic_array.scala 23:15]
    var10.valid is invalid @[systolic_array.scala 23:15]
    var10.ready is invalid @[systolic_array.scala 23:15]
    var11.bits is invalid @[systolic_array.scala 25:15]
    var11.valid is invalid @[systolic_array.scala 25:15]
    var11.ready is invalid @[systolic_array.scala 25:15]
    var12.bits is invalid @[systolic_array.scala 27:15]
    var12.valid is invalid @[systolic_array.scala 27:15]
    var12.ready is invalid @[systolic_array.scala 27:15]
    var13.bits is invalid @[systolic_array.scala 29:15]
    var13.valid is invalid @[systolic_array.scala 29:15]
    var13.ready is invalid @[systolic_array.scala 29:15]
    var14.bits is invalid @[systolic_array.scala 31:15]
    var14.valid is invalid @[systolic_array.scala 31:15]
    var14.ready is invalid @[systolic_array.scala 31:15]
    var15.bits is invalid @[systolic_array.scala 33:15]
    var15.valid is invalid @[systolic_array.scala 33:15]
    var15.ready is invalid @[systolic_array.scala 33:15]
    var16.bits is invalid @[systolic_array.scala 35:15]
    var16.valid is invalid @[systolic_array.scala 35:15]
    var16.ready is invalid @[systolic_array.scala 35:15]
    inst PE_0 of PE_56 @[systolic_array.scala 36:26]
    PE_0.clock <= clock
    PE_0.reset <= reset
    inst PE_1 of PE_57 @[systolic_array.scala 37:26]
    PE_1.clock <= clock
    PE_1.reset <= reset
    inst PE_2 of PE_58 @[systolic_array.scala 38:26]
    PE_2.clock <= clock
    PE_2.reset <= reset
    inst PE_3 of PE_59 @[systolic_array.scala 39:26]
    PE_3.clock <= clock
    PE_3.reset <= reset
    inst PE_4 of PE_60 @[systolic_array.scala 40:26]
    PE_4.clock <= clock
    PE_4.reset <= reset
    inst PE_5 of PE_61 @[systolic_array.scala 41:26]
    PE_5.clock <= clock
    PE_5.reset <= reset
    inst PE_6 of PE_62 @[systolic_array.scala 42:26]
    PE_6.clock <= clock
    PE_6.reset <= reset
    inst PE_7 of PE_63 @[systolic_array.scala 43:26]
    PE_7.clock <= clock
    PE_7.reset <= reset
    PE_7.A_out.ready <= UInt<1>("h01") @[systolic_array.scala 44:26]
    PE_0.A_in.bits <= var0.bits @[systolic_array.scala 45:19]
    PE_0.A_in.valid <= var0.valid @[systolic_array.scala 45:19]
    var0.ready <= PE_0.A_in.ready @[systolic_array.scala 45:19]
    PE_0.C_in.bits <= var1.bits @[systolic_array.scala 46:19]
    PE_0.C_in.valid <= var1.valid @[systolic_array.scala 46:19]
    var1.ready <= PE_0.C_in.ready @[systolic_array.scala 46:19]
    var9.bits <= PE_0.C_out.bits @[systolic_array.scala 47:14]
    var9.valid <= PE_0.C_out.valid @[systolic_array.scala 47:14]
    PE_0.C_out.ready <= var9.ready @[systolic_array.scala 47:14]
    PE_1.A_in.bits <= PE_0.A_out.bits @[systolic_array.scala 48:19]
    PE_1.A_in.valid <= PE_0.A_out.valid @[systolic_array.scala 48:19]
    PE_0.A_out.ready <= PE_1.A_in.ready @[systolic_array.scala 48:19]
    PE_1.C_in.bits <= var2.bits @[systolic_array.scala 49:19]
    PE_1.C_in.valid <= var2.valid @[systolic_array.scala 49:19]
    var2.ready <= PE_1.C_in.ready @[systolic_array.scala 49:19]
    var10.bits <= PE_1.C_out.bits @[systolic_array.scala 50:15]
    var10.valid <= PE_1.C_out.valid @[systolic_array.scala 50:15]
    PE_1.C_out.ready <= var10.ready @[systolic_array.scala 50:15]
    PE_2.A_in.bits <= PE_1.A_out.bits @[systolic_array.scala 51:19]
    PE_2.A_in.valid <= PE_1.A_out.valid @[systolic_array.scala 51:19]
    PE_1.A_out.ready <= PE_2.A_in.ready @[systolic_array.scala 51:19]
    PE_2.C_in.bits <= var3.bits @[systolic_array.scala 52:19]
    PE_2.C_in.valid <= var3.valid @[systolic_array.scala 52:19]
    var3.ready <= PE_2.C_in.ready @[systolic_array.scala 52:19]
    var11.bits <= PE_2.C_out.bits @[systolic_array.scala 53:15]
    var11.valid <= PE_2.C_out.valid @[systolic_array.scala 53:15]
    PE_2.C_out.ready <= var11.ready @[systolic_array.scala 53:15]
    PE_3.A_in.bits <= PE_2.A_out.bits @[systolic_array.scala 54:19]
    PE_3.A_in.valid <= PE_2.A_out.valid @[systolic_array.scala 54:19]
    PE_2.A_out.ready <= PE_3.A_in.ready @[systolic_array.scala 54:19]
    PE_3.C_in.bits <= var4.bits @[systolic_array.scala 55:19]
    PE_3.C_in.valid <= var4.valid @[systolic_array.scala 55:19]
    var4.ready <= PE_3.C_in.ready @[systolic_array.scala 55:19]
    var12.bits <= PE_3.C_out.bits @[systolic_array.scala 56:15]
    var12.valid <= PE_3.C_out.valid @[systolic_array.scala 56:15]
    PE_3.C_out.ready <= var12.ready @[systolic_array.scala 56:15]
    PE_4.A_in.bits <= PE_3.A_out.bits @[systolic_array.scala 57:19]
    PE_4.A_in.valid <= PE_3.A_out.valid @[systolic_array.scala 57:19]
    PE_3.A_out.ready <= PE_4.A_in.ready @[systolic_array.scala 57:19]
    PE_4.C_in.bits <= var5.bits @[systolic_array.scala 58:19]
    PE_4.C_in.valid <= var5.valid @[systolic_array.scala 58:19]
    var5.ready <= PE_4.C_in.ready @[systolic_array.scala 58:19]
    var13.bits <= PE_4.C_out.bits @[systolic_array.scala 59:15]
    var13.valid <= PE_4.C_out.valid @[systolic_array.scala 59:15]
    PE_4.C_out.ready <= var13.ready @[systolic_array.scala 59:15]
    PE_5.A_in.bits <= PE_4.A_out.bits @[systolic_array.scala 60:19]
    PE_5.A_in.valid <= PE_4.A_out.valid @[systolic_array.scala 60:19]
    PE_4.A_out.ready <= PE_5.A_in.ready @[systolic_array.scala 60:19]
    PE_5.C_in.bits <= var6.bits @[systolic_array.scala 61:19]
    PE_5.C_in.valid <= var6.valid @[systolic_array.scala 61:19]
    var6.ready <= PE_5.C_in.ready @[systolic_array.scala 61:19]
    var14.bits <= PE_5.C_out.bits @[systolic_array.scala 62:15]
    var14.valid <= PE_5.C_out.valid @[systolic_array.scala 62:15]
    PE_5.C_out.ready <= var14.ready @[systolic_array.scala 62:15]
    PE_6.A_in.bits <= PE_5.A_out.bits @[systolic_array.scala 63:19]
    PE_6.A_in.valid <= PE_5.A_out.valid @[systolic_array.scala 63:19]
    PE_5.A_out.ready <= PE_6.A_in.ready @[systolic_array.scala 63:19]
    PE_6.C_in.bits <= var7.bits @[systolic_array.scala 64:19]
    PE_6.C_in.valid <= var7.valid @[systolic_array.scala 64:19]
    var7.ready <= PE_6.C_in.ready @[systolic_array.scala 64:19]
    var15.bits <= PE_6.C_out.bits @[systolic_array.scala 65:15]
    var15.valid <= PE_6.C_out.valid @[systolic_array.scala 65:15]
    PE_6.C_out.ready <= var15.ready @[systolic_array.scala 65:15]
    PE_7.A_in.bits <= PE_6.A_out.bits @[systolic_array.scala 66:19]
    PE_7.A_in.valid <= PE_6.A_out.valid @[systolic_array.scala 66:19]
    PE_6.A_out.ready <= PE_7.A_in.ready @[systolic_array.scala 66:19]
    PE_7.C_in.bits <= var8.bits @[systolic_array.scala 67:19]
    PE_7.C_in.valid <= var8.valid @[systolic_array.scala 67:19]
    var8.ready <= PE_7.C_in.ready @[systolic_array.scala 67:19]
    var16.bits <= PE_7.C_out.bits @[systolic_array.scala 68:15]
    var16.valid <= PE_7.C_out.valid @[systolic_array.scala 68:15]
    PE_7.C_out.ready <= var16.ready @[systolic_array.scala 68:15]
    
  module main : 
    input clock : Clock
    input reset : Reset
    input var17 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var18 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var19 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var20 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var21 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var22 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var23 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var24 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var25 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var26 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var27 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var28 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var29 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var30 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var31 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var32 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var33 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var34 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var35 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var36 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var37 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var38 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var39 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var40 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    
    var33.bits is invalid @[systolic_array.scala 88:15]
    var33.valid is invalid @[systolic_array.scala 88:15]
    var33.ready is invalid @[systolic_array.scala 88:15]
    var34.bits is invalid @[systolic_array.scala 90:15]
    var34.valid is invalid @[systolic_array.scala 90:15]
    var34.ready is invalid @[systolic_array.scala 90:15]
    var35.bits is invalid @[systolic_array.scala 92:15]
    var35.valid is invalid @[systolic_array.scala 92:15]
    var35.ready is invalid @[systolic_array.scala 92:15]
    var36.bits is invalid @[systolic_array.scala 94:15]
    var36.valid is invalid @[systolic_array.scala 94:15]
    var36.ready is invalid @[systolic_array.scala 94:15]
    var37.bits is invalid @[systolic_array.scala 96:15]
    var37.valid is invalid @[systolic_array.scala 96:15]
    var37.ready is invalid @[systolic_array.scala 96:15]
    var38.bits is invalid @[systolic_array.scala 98:15]
    var38.valid is invalid @[systolic_array.scala 98:15]
    var38.ready is invalid @[systolic_array.scala 98:15]
    var39.bits is invalid @[systolic_array.scala 100:15]
    var39.valid is invalid @[systolic_array.scala 100:15]
    var39.ready is invalid @[systolic_array.scala 100:15]
    var40.bits is invalid @[systolic_array.scala 102:15]
    var40.valid is invalid @[systolic_array.scala 102:15]
    var40.ready is invalid @[systolic_array.scala 102:15]
    inst Line_0 of PE_line @[systolic_array.scala 103:28]
    Line_0.clock <= clock
    Line_0.reset <= reset
    inst Line_1 of PE_line_1 @[systolic_array.scala 104:28]
    Line_1.clock <= clock
    Line_1.reset <= reset
    inst Line_2 of PE_line_2 @[systolic_array.scala 105:28]
    Line_2.clock <= clock
    Line_2.reset <= reset
    inst Line_3 of PE_line_3 @[systolic_array.scala 106:28]
    Line_3.clock <= clock
    Line_3.reset <= reset
    inst Line_4 of PE_line_4 @[systolic_array.scala 107:28]
    Line_4.clock <= clock
    Line_4.reset <= reset
    inst Line_5 of PE_line_5 @[systolic_array.scala 108:28]
    Line_5.clock <= clock
    Line_5.reset <= reset
    inst Line_6 of PE_line_6 @[systolic_array.scala 109:28]
    Line_6.clock <= clock
    Line_6.reset <= reset
    inst Line_7 of PE_line_7 @[systolic_array.scala 110:28]
    Line_7.clock <= clock
    Line_7.reset <= reset
    Line_0.var0.bits <= var17.bits @[systolic_array.scala 111:21]
    Line_0.var0.valid <= var17.valid @[systolic_array.scala 111:21]
    var17.ready <= Line_0.var0.ready @[systolic_array.scala 111:21]
    Line_1.var0.bits <= var18.bits @[systolic_array.scala 112:21]
    Line_1.var0.valid <= var18.valid @[systolic_array.scala 112:21]
    var18.ready <= Line_1.var0.ready @[systolic_array.scala 112:21]
    Line_2.var0.bits <= var19.bits @[systolic_array.scala 113:21]
    Line_2.var0.valid <= var19.valid @[systolic_array.scala 113:21]
    var19.ready <= Line_2.var0.ready @[systolic_array.scala 113:21]
    Line_3.var0.bits <= var20.bits @[systolic_array.scala 114:21]
    Line_3.var0.valid <= var20.valid @[systolic_array.scala 114:21]
    var20.ready <= Line_3.var0.ready @[systolic_array.scala 114:21]
    Line_4.var0.bits <= var21.bits @[systolic_array.scala 115:21]
    Line_4.var0.valid <= var21.valid @[systolic_array.scala 115:21]
    var21.ready <= Line_4.var0.ready @[systolic_array.scala 115:21]
    Line_5.var0.bits <= var22.bits @[systolic_array.scala 116:21]
    Line_5.var0.valid <= var22.valid @[systolic_array.scala 116:21]
    var22.ready <= Line_5.var0.ready @[systolic_array.scala 116:21]
    Line_6.var0.bits <= var23.bits @[systolic_array.scala 117:21]
    Line_6.var0.valid <= var23.valid @[systolic_array.scala 117:21]
    var23.ready <= Line_6.var0.ready @[systolic_array.scala 117:21]
    Line_7.var0.bits <= var24.bits @[systolic_array.scala 118:21]
    Line_7.var0.valid <= var24.valid @[systolic_array.scala 118:21]
    var24.ready <= Line_7.var0.ready @[systolic_array.scala 118:21]
    Line_0.var1.bits <= var25.bits @[systolic_array.scala 119:21]
    Line_0.var1.valid <= var25.valid @[systolic_array.scala 119:21]
    var25.ready <= Line_0.var1.ready @[systolic_array.scala 119:21]
    Line_0.var2.bits <= var26.bits @[systolic_array.scala 120:21]
    Line_0.var2.valid <= var26.valid @[systolic_array.scala 120:21]
    var26.ready <= Line_0.var2.ready @[systolic_array.scala 120:21]
    Line_0.var3.bits <= var27.bits @[systolic_array.scala 121:21]
    Line_0.var3.valid <= var27.valid @[systolic_array.scala 121:21]
    var27.ready <= Line_0.var3.ready @[systolic_array.scala 121:21]
    Line_0.var4.bits <= var28.bits @[systolic_array.scala 122:21]
    Line_0.var4.valid <= var28.valid @[systolic_array.scala 122:21]
    var28.ready <= Line_0.var4.ready @[systolic_array.scala 122:21]
    Line_0.var5.bits <= var29.bits @[systolic_array.scala 123:21]
    Line_0.var5.valid <= var29.valid @[systolic_array.scala 123:21]
    var29.ready <= Line_0.var5.ready @[systolic_array.scala 123:21]
    Line_0.var6.bits <= var30.bits @[systolic_array.scala 124:21]
    Line_0.var6.valid <= var30.valid @[systolic_array.scala 124:21]
    var30.ready <= Line_0.var6.ready @[systolic_array.scala 124:21]
    Line_0.var7.bits <= var31.bits @[systolic_array.scala 125:21]
    Line_0.var7.valid <= var31.valid @[systolic_array.scala 125:21]
    var31.ready <= Line_0.var7.ready @[systolic_array.scala 125:21]
    Line_0.var8.bits <= var32.bits @[systolic_array.scala 126:21]
    Line_0.var8.valid <= var32.valid @[systolic_array.scala 126:21]
    var32.ready <= Line_0.var8.ready @[systolic_array.scala 126:21]
    Line_1.var1.bits <= Line_0.var9.bits @[systolic_array.scala 127:21]
    Line_1.var1.valid <= Line_0.var9.valid @[systolic_array.scala 127:21]
    Line_0.var9.ready <= Line_1.var1.ready @[systolic_array.scala 127:21]
    Line_1.var2.bits <= Line_0.var10.bits @[systolic_array.scala 128:21]
    Line_1.var2.valid <= Line_0.var10.valid @[systolic_array.scala 128:21]
    Line_0.var10.ready <= Line_1.var2.ready @[systolic_array.scala 128:21]
    Line_1.var3.bits <= Line_0.var11.bits @[systolic_array.scala 129:21]
    Line_1.var3.valid <= Line_0.var11.valid @[systolic_array.scala 129:21]
    Line_0.var11.ready <= Line_1.var3.ready @[systolic_array.scala 129:21]
    Line_1.var4.bits <= Line_0.var12.bits @[systolic_array.scala 130:21]
    Line_1.var4.valid <= Line_0.var12.valid @[systolic_array.scala 130:21]
    Line_0.var12.ready <= Line_1.var4.ready @[systolic_array.scala 130:21]
    Line_1.var5.bits <= Line_0.var13.bits @[systolic_array.scala 131:21]
    Line_1.var5.valid <= Line_0.var13.valid @[systolic_array.scala 131:21]
    Line_0.var13.ready <= Line_1.var5.ready @[systolic_array.scala 131:21]
    Line_1.var6.bits <= Line_0.var14.bits @[systolic_array.scala 132:21]
    Line_1.var6.valid <= Line_0.var14.valid @[systolic_array.scala 132:21]
    Line_0.var14.ready <= Line_1.var6.ready @[systolic_array.scala 132:21]
    Line_1.var7.bits <= Line_0.var15.bits @[systolic_array.scala 133:21]
    Line_1.var7.valid <= Line_0.var15.valid @[systolic_array.scala 133:21]
    Line_0.var15.ready <= Line_1.var7.ready @[systolic_array.scala 133:21]
    Line_1.var8.bits <= Line_0.var16.bits @[systolic_array.scala 134:21]
    Line_1.var8.valid <= Line_0.var16.valid @[systolic_array.scala 134:21]
    Line_0.var16.ready <= Line_1.var8.ready @[systolic_array.scala 134:21]
    Line_2.var1.bits <= Line_1.var9.bits @[systolic_array.scala 135:21]
    Line_2.var1.valid <= Line_1.var9.valid @[systolic_array.scala 135:21]
    Line_1.var9.ready <= Line_2.var1.ready @[systolic_array.scala 135:21]
    Line_2.var2.bits <= Line_1.var10.bits @[systolic_array.scala 136:21]
    Line_2.var2.valid <= Line_1.var10.valid @[systolic_array.scala 136:21]
    Line_1.var10.ready <= Line_2.var2.ready @[systolic_array.scala 136:21]
    Line_2.var3.bits <= Line_1.var11.bits @[systolic_array.scala 137:21]
    Line_2.var3.valid <= Line_1.var11.valid @[systolic_array.scala 137:21]
    Line_1.var11.ready <= Line_2.var3.ready @[systolic_array.scala 137:21]
    Line_2.var4.bits <= Line_1.var12.bits @[systolic_array.scala 138:21]
    Line_2.var4.valid <= Line_1.var12.valid @[systolic_array.scala 138:21]
    Line_1.var12.ready <= Line_2.var4.ready @[systolic_array.scala 138:21]
    Line_2.var5.bits <= Line_1.var13.bits @[systolic_array.scala 139:21]
    Line_2.var5.valid <= Line_1.var13.valid @[systolic_array.scala 139:21]
    Line_1.var13.ready <= Line_2.var5.ready @[systolic_array.scala 139:21]
    Line_2.var6.bits <= Line_1.var14.bits @[systolic_array.scala 140:21]
    Line_2.var6.valid <= Line_1.var14.valid @[systolic_array.scala 140:21]
    Line_1.var14.ready <= Line_2.var6.ready @[systolic_array.scala 140:21]
    Line_2.var7.bits <= Line_1.var15.bits @[systolic_array.scala 141:21]
    Line_2.var7.valid <= Line_1.var15.valid @[systolic_array.scala 141:21]
    Line_1.var15.ready <= Line_2.var7.ready @[systolic_array.scala 141:21]
    Line_2.var8.bits <= Line_1.var16.bits @[systolic_array.scala 142:21]
    Line_2.var8.valid <= Line_1.var16.valid @[systolic_array.scala 142:21]
    Line_1.var16.ready <= Line_2.var8.ready @[systolic_array.scala 142:21]
    Line_3.var1.bits <= Line_2.var9.bits @[systolic_array.scala 143:21]
    Line_3.var1.valid <= Line_2.var9.valid @[systolic_array.scala 143:21]
    Line_2.var9.ready <= Line_3.var1.ready @[systolic_array.scala 143:21]
    Line_3.var2.bits <= Line_2.var10.bits @[systolic_array.scala 144:21]
    Line_3.var2.valid <= Line_2.var10.valid @[systolic_array.scala 144:21]
    Line_2.var10.ready <= Line_3.var2.ready @[systolic_array.scala 144:21]
    Line_3.var3.bits <= Line_2.var11.bits @[systolic_array.scala 145:21]
    Line_3.var3.valid <= Line_2.var11.valid @[systolic_array.scala 145:21]
    Line_2.var11.ready <= Line_3.var3.ready @[systolic_array.scala 145:21]
    Line_3.var4.bits <= Line_2.var12.bits @[systolic_array.scala 146:21]
    Line_3.var4.valid <= Line_2.var12.valid @[systolic_array.scala 146:21]
    Line_2.var12.ready <= Line_3.var4.ready @[systolic_array.scala 146:21]
    Line_3.var5.bits <= Line_2.var13.bits @[systolic_array.scala 147:21]
    Line_3.var5.valid <= Line_2.var13.valid @[systolic_array.scala 147:21]
    Line_2.var13.ready <= Line_3.var5.ready @[systolic_array.scala 147:21]
    Line_3.var6.bits <= Line_2.var14.bits @[systolic_array.scala 148:21]
    Line_3.var6.valid <= Line_2.var14.valid @[systolic_array.scala 148:21]
    Line_2.var14.ready <= Line_3.var6.ready @[systolic_array.scala 148:21]
    Line_3.var7.bits <= Line_2.var15.bits @[systolic_array.scala 149:21]
    Line_3.var7.valid <= Line_2.var15.valid @[systolic_array.scala 149:21]
    Line_2.var15.ready <= Line_3.var7.ready @[systolic_array.scala 149:21]
    Line_3.var8.bits <= Line_2.var16.bits @[systolic_array.scala 150:21]
    Line_3.var8.valid <= Line_2.var16.valid @[systolic_array.scala 150:21]
    Line_2.var16.ready <= Line_3.var8.ready @[systolic_array.scala 150:21]
    Line_4.var1.bits <= Line_3.var9.bits @[systolic_array.scala 151:21]
    Line_4.var1.valid <= Line_3.var9.valid @[systolic_array.scala 151:21]
    Line_3.var9.ready <= Line_4.var1.ready @[systolic_array.scala 151:21]
    Line_4.var2.bits <= Line_3.var10.bits @[systolic_array.scala 152:21]
    Line_4.var2.valid <= Line_3.var10.valid @[systolic_array.scala 152:21]
    Line_3.var10.ready <= Line_4.var2.ready @[systolic_array.scala 152:21]
    Line_4.var3.bits <= Line_3.var11.bits @[systolic_array.scala 153:21]
    Line_4.var3.valid <= Line_3.var11.valid @[systolic_array.scala 153:21]
    Line_3.var11.ready <= Line_4.var3.ready @[systolic_array.scala 153:21]
    Line_4.var4.bits <= Line_3.var12.bits @[systolic_array.scala 154:21]
    Line_4.var4.valid <= Line_3.var12.valid @[systolic_array.scala 154:21]
    Line_3.var12.ready <= Line_4.var4.ready @[systolic_array.scala 154:21]
    Line_4.var5.bits <= Line_3.var13.bits @[systolic_array.scala 155:21]
    Line_4.var5.valid <= Line_3.var13.valid @[systolic_array.scala 155:21]
    Line_3.var13.ready <= Line_4.var5.ready @[systolic_array.scala 155:21]
    Line_4.var6.bits <= Line_3.var14.bits @[systolic_array.scala 156:21]
    Line_4.var6.valid <= Line_3.var14.valid @[systolic_array.scala 156:21]
    Line_3.var14.ready <= Line_4.var6.ready @[systolic_array.scala 156:21]
    Line_4.var7.bits <= Line_3.var15.bits @[systolic_array.scala 157:21]
    Line_4.var7.valid <= Line_3.var15.valid @[systolic_array.scala 157:21]
    Line_3.var15.ready <= Line_4.var7.ready @[systolic_array.scala 157:21]
    Line_4.var8.bits <= Line_3.var16.bits @[systolic_array.scala 158:21]
    Line_4.var8.valid <= Line_3.var16.valid @[systolic_array.scala 158:21]
    Line_3.var16.ready <= Line_4.var8.ready @[systolic_array.scala 158:21]
    Line_5.var1.bits <= Line_4.var9.bits @[systolic_array.scala 159:21]
    Line_5.var1.valid <= Line_4.var9.valid @[systolic_array.scala 159:21]
    Line_4.var9.ready <= Line_5.var1.ready @[systolic_array.scala 159:21]
    Line_5.var2.bits <= Line_4.var10.bits @[systolic_array.scala 160:21]
    Line_5.var2.valid <= Line_4.var10.valid @[systolic_array.scala 160:21]
    Line_4.var10.ready <= Line_5.var2.ready @[systolic_array.scala 160:21]
    Line_5.var3.bits <= Line_4.var11.bits @[systolic_array.scala 161:21]
    Line_5.var3.valid <= Line_4.var11.valid @[systolic_array.scala 161:21]
    Line_4.var11.ready <= Line_5.var3.ready @[systolic_array.scala 161:21]
    Line_5.var4.bits <= Line_4.var12.bits @[systolic_array.scala 162:21]
    Line_5.var4.valid <= Line_4.var12.valid @[systolic_array.scala 162:21]
    Line_4.var12.ready <= Line_5.var4.ready @[systolic_array.scala 162:21]
    Line_5.var5.bits <= Line_4.var13.bits @[systolic_array.scala 163:21]
    Line_5.var5.valid <= Line_4.var13.valid @[systolic_array.scala 163:21]
    Line_4.var13.ready <= Line_5.var5.ready @[systolic_array.scala 163:21]
    Line_5.var6.bits <= Line_4.var14.bits @[systolic_array.scala 164:21]
    Line_5.var6.valid <= Line_4.var14.valid @[systolic_array.scala 164:21]
    Line_4.var14.ready <= Line_5.var6.ready @[systolic_array.scala 164:21]
    Line_5.var7.bits <= Line_4.var15.bits @[systolic_array.scala 165:21]
    Line_5.var7.valid <= Line_4.var15.valid @[systolic_array.scala 165:21]
    Line_4.var15.ready <= Line_5.var7.ready @[systolic_array.scala 165:21]
    Line_5.var8.bits <= Line_4.var16.bits @[systolic_array.scala 166:21]
    Line_5.var8.valid <= Line_4.var16.valid @[systolic_array.scala 166:21]
    Line_4.var16.ready <= Line_5.var8.ready @[systolic_array.scala 166:21]
    Line_6.var1.bits <= Line_5.var9.bits @[systolic_array.scala 167:21]
    Line_6.var1.valid <= Line_5.var9.valid @[systolic_array.scala 167:21]
    Line_5.var9.ready <= Line_6.var1.ready @[systolic_array.scala 167:21]
    Line_6.var2.bits <= Line_5.var10.bits @[systolic_array.scala 168:21]
    Line_6.var2.valid <= Line_5.var10.valid @[systolic_array.scala 168:21]
    Line_5.var10.ready <= Line_6.var2.ready @[systolic_array.scala 168:21]
    Line_6.var3.bits <= Line_5.var11.bits @[systolic_array.scala 169:21]
    Line_6.var3.valid <= Line_5.var11.valid @[systolic_array.scala 169:21]
    Line_5.var11.ready <= Line_6.var3.ready @[systolic_array.scala 169:21]
    Line_6.var4.bits <= Line_5.var12.bits @[systolic_array.scala 170:21]
    Line_6.var4.valid <= Line_5.var12.valid @[systolic_array.scala 170:21]
    Line_5.var12.ready <= Line_6.var4.ready @[systolic_array.scala 170:21]
    Line_6.var5.bits <= Line_5.var13.bits @[systolic_array.scala 171:21]
    Line_6.var5.valid <= Line_5.var13.valid @[systolic_array.scala 171:21]
    Line_5.var13.ready <= Line_6.var5.ready @[systolic_array.scala 171:21]
    Line_6.var6.bits <= Line_5.var14.bits @[systolic_array.scala 172:21]
    Line_6.var6.valid <= Line_5.var14.valid @[systolic_array.scala 172:21]
    Line_5.var14.ready <= Line_6.var6.ready @[systolic_array.scala 172:21]
    Line_6.var7.bits <= Line_5.var15.bits @[systolic_array.scala 173:21]
    Line_6.var7.valid <= Line_5.var15.valid @[systolic_array.scala 173:21]
    Line_5.var15.ready <= Line_6.var7.ready @[systolic_array.scala 173:21]
    Line_6.var8.bits <= Line_5.var16.bits @[systolic_array.scala 174:21]
    Line_6.var8.valid <= Line_5.var16.valid @[systolic_array.scala 174:21]
    Line_5.var16.ready <= Line_6.var8.ready @[systolic_array.scala 174:21]
    Line_7.var1.bits <= Line_6.var9.bits @[systolic_array.scala 175:21]
    Line_7.var1.valid <= Line_6.var9.valid @[systolic_array.scala 175:21]
    Line_6.var9.ready <= Line_7.var1.ready @[systolic_array.scala 175:21]
    Line_7.var2.bits <= Line_6.var10.bits @[systolic_array.scala 176:21]
    Line_7.var2.valid <= Line_6.var10.valid @[systolic_array.scala 176:21]
    Line_6.var10.ready <= Line_7.var2.ready @[systolic_array.scala 176:21]
    Line_7.var3.bits <= Line_6.var11.bits @[systolic_array.scala 177:21]
    Line_7.var3.valid <= Line_6.var11.valid @[systolic_array.scala 177:21]
    Line_6.var11.ready <= Line_7.var3.ready @[systolic_array.scala 177:21]
    Line_7.var4.bits <= Line_6.var12.bits @[systolic_array.scala 178:21]
    Line_7.var4.valid <= Line_6.var12.valid @[systolic_array.scala 178:21]
    Line_6.var12.ready <= Line_7.var4.ready @[systolic_array.scala 178:21]
    Line_7.var5.bits <= Line_6.var13.bits @[systolic_array.scala 179:21]
    Line_7.var5.valid <= Line_6.var13.valid @[systolic_array.scala 179:21]
    Line_6.var13.ready <= Line_7.var5.ready @[systolic_array.scala 179:21]
    Line_7.var6.bits <= Line_6.var14.bits @[systolic_array.scala 180:21]
    Line_7.var6.valid <= Line_6.var14.valid @[systolic_array.scala 180:21]
    Line_6.var14.ready <= Line_7.var6.ready @[systolic_array.scala 180:21]
    Line_7.var7.bits <= Line_6.var15.bits @[systolic_array.scala 181:21]
    Line_7.var7.valid <= Line_6.var15.valid @[systolic_array.scala 181:21]
    Line_6.var15.ready <= Line_7.var7.ready @[systolic_array.scala 181:21]
    Line_7.var8.bits <= Line_6.var16.bits @[systolic_array.scala 182:21]
    Line_7.var8.valid <= Line_6.var16.valid @[systolic_array.scala 182:21]
    Line_6.var16.ready <= Line_7.var8.ready @[systolic_array.scala 182:21]
    var33.bits <= Line_7.var9.bits @[systolic_array.scala 183:15]
    var33.valid <= Line_7.var9.valid @[systolic_array.scala 183:15]
    Line_7.var9.ready <= var33.ready @[systolic_array.scala 183:15]
    var34.bits <= Line_7.var10.bits @[systolic_array.scala 184:15]
    var34.valid <= Line_7.var10.valid @[systolic_array.scala 184:15]
    Line_7.var10.ready <= var34.ready @[systolic_array.scala 184:15]
    var35.bits <= Line_7.var11.bits @[systolic_array.scala 185:15]
    var35.valid <= Line_7.var11.valid @[systolic_array.scala 185:15]
    Line_7.var11.ready <= var35.ready @[systolic_array.scala 185:15]
    var36.bits <= Line_7.var12.bits @[systolic_array.scala 186:15]
    var36.valid <= Line_7.var12.valid @[systolic_array.scala 186:15]
    Line_7.var12.ready <= var36.ready @[systolic_array.scala 186:15]
    var37.bits <= Line_7.var13.bits @[systolic_array.scala 187:15]
    var37.valid <= Line_7.var13.valid @[systolic_array.scala 187:15]
    Line_7.var13.ready <= var37.ready @[systolic_array.scala 187:15]
    var38.bits <= Line_7.var14.bits @[systolic_array.scala 188:15]
    var38.valid <= Line_7.var14.valid @[systolic_array.scala 188:15]
    Line_7.var14.ready <= var38.ready @[systolic_array.scala 188:15]
    var39.bits <= Line_7.var15.bits @[systolic_array.scala 189:15]
    var39.valid <= Line_7.var15.valid @[systolic_array.scala 189:15]
    Line_7.var15.ready <= var39.ready @[systolic_array.scala 189:15]
    var40.bits <= Line_7.var16.bits @[systolic_array.scala 190:15]
    var40.valid <= Line_7.var16.valid @[systolic_array.scala 190:15]
    Line_7.var16.ready <= var40.ready @[systolic_array.scala 190:15]
    
  module systolic_array : 
    input clock : Clock
    input reset : UInt<1>
    input var17 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var18 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var19 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var20 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var21 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var22 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var23 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var24 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var25 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var26 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var27 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var28 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var29 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var30 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var31 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input var32 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var33 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var34 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var35 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var36 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var37 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var38 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var39 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    output var40 : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}
    input finish : UInt<1>
    
    inst main of main @[systolic_array.scala 192:26]
    main.clock <= clock
    main.reset <= reset
    main.var17.bits <= var17.bits @[systolic_array.scala 194:20]
    main.var17.valid <= var17.valid @[systolic_array.scala 194:20]
    var17.ready <= main.var17.ready @[systolic_array.scala 194:20]
    main.var18.bits <= var18.bits @[systolic_array.scala 196:20]
    main.var18.valid <= var18.valid @[systolic_array.scala 196:20]
    var18.ready <= main.var18.ready @[systolic_array.scala 196:20]
    main.var19.bits <= var19.bits @[systolic_array.scala 198:20]
    main.var19.valid <= var19.valid @[systolic_array.scala 198:20]
    var19.ready <= main.var19.ready @[systolic_array.scala 198:20]
    main.var20.bits <= var20.bits @[systolic_array.scala 200:20]
    main.var20.valid <= var20.valid @[systolic_array.scala 200:20]
    var20.ready <= main.var20.ready @[systolic_array.scala 200:20]
    main.var21.bits <= var21.bits @[systolic_array.scala 202:20]
    main.var21.valid <= var21.valid @[systolic_array.scala 202:20]
    var21.ready <= main.var21.ready @[systolic_array.scala 202:20]
    main.var22.bits <= var22.bits @[systolic_array.scala 204:20]
    main.var22.valid <= var22.valid @[systolic_array.scala 204:20]
    var22.ready <= main.var22.ready @[systolic_array.scala 204:20]
    main.var23.bits <= var23.bits @[systolic_array.scala 206:20]
    main.var23.valid <= var23.valid @[systolic_array.scala 206:20]
    var23.ready <= main.var23.ready @[systolic_array.scala 206:20]
    main.var24.bits <= var24.bits @[systolic_array.scala 208:20]
    main.var24.valid <= var24.valid @[systolic_array.scala 208:20]
    var24.ready <= main.var24.ready @[systolic_array.scala 208:20]
    main.var25.bits <= var25.bits @[systolic_array.scala 210:20]
    main.var25.valid <= var25.valid @[systolic_array.scala 210:20]
    var25.ready <= main.var25.ready @[systolic_array.scala 210:20]
    main.var26.bits <= var26.bits @[systolic_array.scala 212:20]
    main.var26.valid <= var26.valid @[systolic_array.scala 212:20]
    var26.ready <= main.var26.ready @[systolic_array.scala 212:20]
    main.var27.bits <= var27.bits @[systolic_array.scala 214:20]
    main.var27.valid <= var27.valid @[systolic_array.scala 214:20]
    var27.ready <= main.var27.ready @[systolic_array.scala 214:20]
    main.var28.bits <= var28.bits @[systolic_array.scala 216:20]
    main.var28.valid <= var28.valid @[systolic_array.scala 216:20]
    var28.ready <= main.var28.ready @[systolic_array.scala 216:20]
    main.var29.bits <= var29.bits @[systolic_array.scala 218:20]
    main.var29.valid <= var29.valid @[systolic_array.scala 218:20]
    var29.ready <= main.var29.ready @[systolic_array.scala 218:20]
    main.var30.bits <= var30.bits @[systolic_array.scala 220:20]
    main.var30.valid <= var30.valid @[systolic_array.scala 220:20]
    var30.ready <= main.var30.ready @[systolic_array.scala 220:20]
    main.var31.bits <= var31.bits @[systolic_array.scala 222:20]
    main.var31.valid <= var31.valid @[systolic_array.scala 222:20]
    var31.ready <= main.var31.ready @[systolic_array.scala 222:20]
    main.var32.bits <= var32.bits @[systolic_array.scala 224:20]
    main.var32.valid <= var32.valid @[systolic_array.scala 224:20]
    var32.ready <= main.var32.ready @[systolic_array.scala 224:20]
    var33.bits <= main.var33.bits @[systolic_array.scala 226:15]
    var33.valid <= main.var33.valid @[systolic_array.scala 226:15]
    main.var33.ready <= var33.ready @[systolic_array.scala 226:15]
    var34.bits <= main.var34.bits @[systolic_array.scala 228:15]
    var34.valid <= main.var34.valid @[systolic_array.scala 228:15]
    main.var34.ready <= var34.ready @[systolic_array.scala 228:15]
    var35.bits <= main.var35.bits @[systolic_array.scala 230:15]
    var35.valid <= main.var35.valid @[systolic_array.scala 230:15]
    main.var35.ready <= var35.ready @[systolic_array.scala 230:15]
    var36.bits <= main.var36.bits @[systolic_array.scala 232:15]
    var36.valid <= main.var36.valid @[systolic_array.scala 232:15]
    main.var36.ready <= var36.ready @[systolic_array.scala 232:15]
    var37.bits <= main.var37.bits @[systolic_array.scala 234:15]
    var37.valid <= main.var37.valid @[systolic_array.scala 234:15]
    main.var37.ready <= var37.ready @[systolic_array.scala 234:15]
    var38.bits <= main.var38.bits @[systolic_array.scala 236:15]
    var38.valid <= main.var38.valid @[systolic_array.scala 236:15]
    main.var38.ready <= var38.ready @[systolic_array.scala 236:15]
    var39.bits <= main.var39.bits @[systolic_array.scala 238:15]
    var39.valid <= main.var39.valid @[systolic_array.scala 238:15]
    main.var39.ready <= var39.ready @[systolic_array.scala 238:15]
    var40.bits <= main.var40.bits @[systolic_array.scala 240:15]
    var40.valid <= main.var40.valid @[systolic_array.scala 240:15]
    main.var40.ready <= var40.ready @[systolic_array.scala 240:15]
    
