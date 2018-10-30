set projDir "E:/Documents/mojo/alu16copy/work/planAhead"
set projName "alu16"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "E:/Documents/mojo/alu16copy/work/verilog/mojo_top_0.v" "E:/Documents/mojo/alu16copy/work/verilog/alu_1.v" "E:/Documents/mojo/alu16copy/work/verilog/booleanTester_2.v" "E:/Documents/mojo/alu16copy/work/verilog/adderTester_3.v" "E:/Documents/mojo/alu16copy/work/verilog/compareTester_4.v" "E:/Documents/mojo/alu16copy/work/verilog/shifterTester_5.v" "E:/Documents/mojo/alu16copy/work/verilog/multi_seven_seg_6.v" "E:/Documents/mojo/alu16copy/work/verilog/errorTester_7.v" "E:/Documents/mojo/alu16copy/work/verilog/reset_conditioner_8.v" "E:/Documents/mojo/alu16copy/work/verilog/adder_9.v" "E:/Documents/mojo/alu16copy/work/verilog/boolean_10.v" "E:/Documents/mojo/alu16copy/work/verilog/compare_11.v" "E:/Documents/mojo/alu16copy/work/verilog/shifter_12.v" "E:/Documents/mojo/alu16copy/work/verilog/boolean_10.v" "E:/Documents/mojo/alu16copy/work/verilog/adder_9.v" "E:/Documents/mojo/alu16copy/work/verilog/compare_11.v" "E:/Documents/mojo/alu16copy/work/verilog/shifter_12.v" "E:/Documents/mojo/alu16copy/work/verilog/counter_17.v" "E:/Documents/mojo/alu16copy/work/verilog/seven_seg_18.v" "E:/Documents/mojo/alu16copy/work/verilog/decoder_19.v" "E:/Documents/mojo/alu16copy/work/verilog/adder_9.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "E:/Programs/Mojo\ IDE/library/components/io_shield.ucf" "E:/Programs/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
