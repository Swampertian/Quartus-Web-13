# compile.tcl — roda com: quartus_sh -t compile.tcl
package require ::quartus::project
package require ::quartus::flow

set project_name "demo_setup"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE a.vhdl
set_global_assignment -name VHDL_FILE demo_setup.vhd
set_global_assignment -name TOP_LEVEL_ENTITY demo_setup

# SW0-3 e LEDR0 conferidos com os outros projetos deste repo (lab-4/02).
set_location_assignment PIN_L22 -to SW[0]
set_location_assignment PIN_L21 -to SW[1]
set_location_assignment PIN_M22 -to SW[2]
set_location_assignment PIN_V12 -to SW[3]
set_location_assignment PIN_R20 -to LEDR0

# SW4-8 e LEDR1-4 segundo o manual da DE1 -- conferir antes de gravar.
set_location_assignment PIN_W12 -to SW[4]
set_location_assignment PIN_U12 -to SW[5]
set_location_assignment PIN_U11 -to SW[6]
set_location_assignment PIN_M2  -to SW[7]
set_location_assignment PIN_M1  -to SW[8]
set_location_assignment PIN_R19 -to LEDR1
set_location_assignment PIN_U19 -to LEDR2
set_location_assignment PIN_Y19 -to LEDR3
set_location_assignment PIN_T18 -to LEDR4

export_assignments
execute_flow -compile

project_close
