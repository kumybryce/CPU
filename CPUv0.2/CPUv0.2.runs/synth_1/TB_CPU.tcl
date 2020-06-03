# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache D:/2_/1_/1/ours/CPUv0.2/.Xil/Vivado-16268-DESKTOP-F841VHB/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.cache/wt [current_project]
set_property parent.project_path D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/2_/1_/1/ours/CPUv0.2/CPUv0.2.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/ip/RAM_init.coe
add_files D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/ip/CM_data.coe
read_verilog -library xil_defaultlib {
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/AC.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/ALU.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/BR.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/CAR.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/CU.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/DIVIDER.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/IR.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/MAR.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/MBR.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/PC.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/cpu.v
  D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/new/TB_CPU.v
}
read_ip -quiet D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/ip/RAM/RAM.xci
set_property used_in_implementation false [get_files -all d:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/ip/RAM/RAM_ooc.xdc]

read_ip -quiet D:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/ip/CM/CM.xci
set_property used_in_implementation false [get_files -all d:/2_/1_/1/ours/CPUv0.2/CPUv0.2.srcs/sources_1/ip/CM/CM_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}

synth_design -top TB_CPU -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TB_CPU.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TB_CPU_utilization_synth.rpt -pb TB_CPU_utilization_synth.pb"
