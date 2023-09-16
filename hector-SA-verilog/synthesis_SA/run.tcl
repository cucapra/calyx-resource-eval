set_part "xc7z020clg484" 
read_verilog kernel.v
create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name addsubf_true_4_8_24_ip
set_property -dict [list CONFIG.a_precision_type Single CONFIG.add_sub_value Add CONFIG.c_a_exponent_width 8 CONFIG.c_a_fraction_width 24 CONFIG.c_latency 3 CONFIG.c_rate 1 CONFIG.c_result_exponent_width 8 CONFIG.c_result_fraction_width 24 CONFIG.flow_control NonBlocking CONFIG.has_aclken true CONFIG.has_result_tready false CONFIG.maximum_latency false CONFIG.operation_type Add_Subtract CONFIG.result_precision_type Single ] -object [get_ips addsubf_true_4_8_24_ip] 
create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name mulf_3_8_24_ip
set_property -dict [list CONFIG.a_precision_type Single CONFIG.c_a_exponent_width 8 CONFIG.c_a_fraction_width 24 CONFIG.c_latency 2 CONFIG.c_rate 1 CONFIG.c_result_exponent_width 8 CONFIG.c_result_fraction_width 24 CONFIG.flow_control NonBlocking CONFIG.has_aclken true CONFIG.has_result_tready false CONFIG.maximum_latency false CONFIG.operation_type Multiply CONFIG.result_precision_type Single ] -object [get_ips mulf_3_8_24_ip] 
generate_target all [get_ips] 
synth_ip [get_ips]
synth_design -top systolic_array -part xc7z020clg484
create_clock -name clkin -period 6.00 -add [get_ports clock]
opt_design
place_design
route_design
report_timing_summary -file timing_summary.rpt
report_utilization -file util_summary.rpt