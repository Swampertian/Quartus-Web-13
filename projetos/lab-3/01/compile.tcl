package require ::quartus::project
package require ::quartus::flow

set project_name "crossbar_switch"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE a.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY crossbar_switch

set_location_assignment PIN_L22 -to SWITCH_PINS[0]
set_location_assignment PIN_L21 -to SWITCH_PINS[1]
set_location_assignment PIN_M22 -to SWITCH_PINS[2]


set_location_assignment PIN_R20 -to LEDR0
set_location_assignment PIN_R19 -to LEDR1

export_assignments
execute_flow -compile

project_close
