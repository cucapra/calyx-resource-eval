set_part "xc7z020clg484" 
read_verilog kernel.v
generate_target all [get_ips] 
synth_ip [get_ips]
synth_design -top aeloss_push -part xc7z020clg484
create_clock -name clkin -period 6.00 -add [get_ports clock]
opt_design
place_design
route_design
report_timing_summary -file timing_summary.rpt
report_utilization -file util_summary.rpt