# compile_cla8_puro.tcl — roda com: quartus_sh -t compile_cla8_puro.tcl
#
# ITEM (c): CLA puro de 8 bits (carries totalmente expandidos).
# Depois: quartus_sta -t measure_delay.tcl cla_adder_8bit
package require ::quartus::project
package require ::quartus::flow

set project_name "cla_adder_8bit"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE c.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY cla_adder_8bit

export_assignments
execute_flow -compile

project_close
