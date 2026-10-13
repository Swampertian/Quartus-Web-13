# compile-2.tcl — ITEM (e): roda com: quartus_sh -t compile-2.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "demo_setup_5"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE a.vhdl
set_global_assignment -name VHDL_FILE d.vhd
set_global_assignment -name VHDL_FILE e.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY demo_setup

# SW0..SW4 = S0..S4
set_location_assignment PIN_L22 -to SWITCH_PINS[0]
set_location_assignment PIN_L21 -to SWITCH_PINS[1]
set_location_assignment PIN_M22 -to SWITCH_PINS[2]
set_location_assignment PIN_V12 -to SWITCH_PINS[3]
set_location_assignment PIN_W12 -to SWITCH_PINS[4]

set_location_assignment PIN_R20 -to LEDR0

export_assignments
execute_flow -compile

project_close
