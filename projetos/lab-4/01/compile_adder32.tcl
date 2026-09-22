# compile_adder32.tcl — roda com: quartus_sh -t compile_adder32.tcl
#
# ITEM (f): compila o adder32. Depois, meça o atraso rodando:
# quartus_sta -t measure_delay.tcl adder32
package require ::quartus::project
package require ::quartus::flow

set project_name "adder32"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE basic_gates.vhdl
set_global_assignment -name VHDL_FILE full_adder.vhdl
set_global_assignment -name VHDL_FILE adder32.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY adder32

export_assignments
execute_flow -compile

project_close
