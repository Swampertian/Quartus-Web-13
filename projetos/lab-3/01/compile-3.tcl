# compile-3.tcl — ITEM (f): roda com: quartus_sh -t compile-3.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "demo_setup_8"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE a.vhdl
set_global_assignment -name VHDL_FILE d.vhd
set_global_assignment -name VHDL_FILE f.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY demo_setup

# SW0..SW7 = S0..S7
set_location_assignment PIN_L22 -to SWITCH_PINS[0]
set_location_assignment PIN_L21 -to SWITCH_PINS[1]
set_location_assignment PIN_M22 -to SWITCH_PINS[2]
set_location_assignment PIN_V12 -to SWITCH_PINS[3]
set_location_assignment PIN_W12 -to SWITCH_PINS[4]
set_location_assignment PIN_U12 -to SWITCH_PINS[5]
set_location_assignment PIN_U11 -to SWITCH_PINS[6]
# SW7: PIN_M2 segundo o manual da DE1 -- conferir na placa.
set_location_assignment PIN_M2  -to SWITCH_PINS[7]

set_location_assignment PIN_R20 -to LEDR0

export_assignments
execute_flow -compile

project_close
