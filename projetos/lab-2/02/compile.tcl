# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "demo_setup"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE a.vhd
set_global_assignment -name VHDL_FILE ../01/conv_7seg.vhd
set_global_assignment -name VHDL_FILE demo_setup.vhd
set_global_assignment -name TOP_LEVEL_ENTITY demo_setup

set_location_assignment PIN_L22 -to SW[0]
set_location_assignment PIN_L21 -to SW[1]
set_location_assignment PIN_M22 -to SW[2]
set_location_assignment PIN_V12 -to SW[3]

set_location_assignment PIN_F4 -to HEX3[0]
set_location_assignment PIN_D5 -to HEX3[1]
set_location_assignment PIN_D6 -to HEX3[2]
set_location_assignment PIN_J4 -to HEX3[3]
set_location_assignment PIN_L8 -to HEX3[4]
set_location_assignment PIN_F3 -to HEX3[5]
set_location_assignment PIN_D4 -to HEX3[6]

export_assignments
execute_flow -compile

project_close
