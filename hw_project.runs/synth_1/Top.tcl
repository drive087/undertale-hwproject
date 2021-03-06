# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
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
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/OS/Desktop/hw_project/hw_project.cache/wt [current_project]
set_property parent.project_path C:/Users/OS/Desktop/hw_project/hw_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/OS/Desktop/hw_project/hw_project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/Alien2.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/Alien1.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/Hive1.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/Bee.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/pal24bit.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/Alien3.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/greenH_pal24bit.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/hamham_pal24bit.mem
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/character/foam2.mem
  C:/Users/OS/Desktop/heart.mem
  C:/Users/OS/Desktop/heart_pal24bit.mem
  C:/Users/OS/Desktop/heart15_pal24bit.mem
  C:/Users/OS/Desktop/heart15.mem
  C:/Users/OS/Desktop/intro/press168x12_pal24bit.mem
  C:/Users/OS/Desktop/intro/press168x12.mem
  C:/Users/OS/Desktop/intro/undertale408x53.mem
  C:/Users/OS/Desktop/intro/undertale408x53_pal24bit.mem
  C:/Users/OS/Desktop/intro/foam356x12.mem
  C:/Users/OS/Desktop/intro/drive356x12.mem
  C:/Users/OS/Desktop/intro/foam356x12_pal24bit.mem
  C:/Users/OS/Desktop/intro/drive356x12_pal24bit.mem
  C:/Users/OS/Desktop/intro/porsche356x12_pal24bit.mem
  C:/Users/OS/Desktop/intro/jane356x12.mem
  C:/Users/OS/Desktop/intro/tien356x12.mem
  C:/Users/OS/Desktop/intro/porsche356x12.mem
  C:/Users/OS/Desktop/intro/jane356x12_pal24bit.mem
  C:/Users/OS/Desktop/intro/tien356x12_pal24bit.mem
}
read_verilog -library xil_defaultlib {
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/BeeRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/BorderSprite.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/BulletSprite.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/BulletSprite2.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/FnameRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/GreenBulletSprite.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/HeartRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/HeartSprite.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/JnameRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/Obstacle.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/PnameRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/TnameRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/character.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/fifo.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/hp_bar.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/hp_monster_bar.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/introRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/introSprite.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/nameRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/pangya_tab.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/pangya_tab2.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/intro/pressRom.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/timer_state.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/uart.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/uart_echo.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/new/uart_fifo.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/vga640x480.v
  C:/Users/OS/Desktop/hw_project/hw_project.srcs/sources_1/imports/Desktop/basys3/Tut4/WIP.srcs/sources_1/new/Top.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/OS/Desktop/hw_project/hw_project.srcs/constrs_1/imports/new/basys3.xdc
set_property used_in_implementation false [get_files C:/Users/OS/Desktop/hw_project/hw_project.srcs/constrs_1/imports/new/basys3.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top Top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Top_utilization_synth.rpt -pb Top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
