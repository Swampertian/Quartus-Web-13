# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "demo_setup"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE a.vhdl
set_global_assignment -name VHDL_FILE b.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY demo_setup


set_location_assignment PIN_L22 -to SW[0]
set_location_assignment PIN_L21 -to SW[1]
set_location_assignment PIN_M22 -to SW[2]
set_location_assignment PIN_V12 -to SW[3]
set_location_assignment PIN_R20 -to LEDR0

set_location_assignment PIN_W12 -to SW[4]
set_location_assignment PIN_U12 -to SW[5]
set_location_assignment PIN_R19 -to LEDR1
set_location_assignment PIN_U19 -to LEDR2
set_location_assignment PIN_Y19 -to LEDR3

export_assignments
execute_flow -compile

project_close
