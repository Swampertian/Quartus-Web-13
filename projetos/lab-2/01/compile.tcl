# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "display"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE display.vhd
set_global_assignment -name TOP_LEVEL_ENTITY display

set_location_assignment PIN_L22 -to SWITCH_PINS[0]
set_location_assignment PIN_L21 -to SWITCH_PINS[1]
set_location_assignment PIN_M22 -to SWITCH_PINS[2]
set_location_assignment PIN_V12 -to SWITCH_PINS[3]

set_location_assignment PIN_J1 -to HEX_PINS[0]
set_location_assignment PIN_H2 -to HEX_PINS[1]
set_location_assignment PIN_H1 -to HEX_PINS[2]
set_location_assignment PIN_F2 -to HEX_PINS[3]
set_location_assignment PIN_F1 -to HEX_PINS[4]
set_location_assignment PIN_E2 -to HEX_PINS[5]

export_assignments
execute_flow -compile

project_close
