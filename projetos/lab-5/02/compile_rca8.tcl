# compile_rca8.tcl — roda com: quartus_sh -t compile_rca8.tcl
#
# Ripple-carry de 8 bits do lab-4 (lido de ../../lab-4/01, sem alterar nada la).
# Depois: quartus_sta -t measure_delay.tcl adder8
package require ::quartus::project
package require ::quartus::flow

set project_name "adder8"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE ../../lab-4/01/basic_gates.vhdl
set_global_assignment -name VHDL_FILE ../../lab-4/01/full_adder.vhdl
set_global_assignment -name VHDL_FILE ../../lab-4/01/adder8.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY adder8

export_assignments
execute_flow -compile

project_close
