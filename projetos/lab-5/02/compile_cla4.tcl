# compile_cla4.tcl — roda com: quartus_sh -t compile_cla4.tcl
#
# Compila o cla_adder_4bit sozinho (sem pinos fixos) para medir o
# atraso. Depois: quartus_sta -t measure_delay.tcl cla_adder_4bit
package require ::quartus::project
package require ::quartus::flow

set project_name "cla_adder_4bit"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE a.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY cla_adder_4bit

export_assignments
execute_flow -compile

project_close
