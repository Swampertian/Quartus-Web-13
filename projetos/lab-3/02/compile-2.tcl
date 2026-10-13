# compile-2.tcl — ITEM (b): roda com: quartus_sh -t compile-2.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "extra_logic"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE b.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY extra_logic

# SW0..SW3 = w0..w3, SW4..SW7 = y0..y3  |  LEDR0 = f
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
