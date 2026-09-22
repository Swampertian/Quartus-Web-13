# compile_adder8.tcl — roda com: quartus_sh -t compile_adder8.tcl
#
# ITEM (e): compila o adder8. Depois de compilar, meça o atraso
# rodando: quartus_sta -t measure_delay.tcl adder8
# (o pacote ::quartus::sta, usado pro TimeQuest, so existe dentro
# do executavel quartus_sta -- por isso a medicao de atraso fica
# num script separado, em vez de dentro deste compile.tcl que roda
# com quartus_sh).
package require ::quartus::project
package require ::quartus::flow

set project_name "adder8"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE basic_gates.vhdl
set_global_assignment -name VHDL_FILE full_adder.vhdl
set_global_assignment -name VHDL_FILE adder8.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY adder8

export_assignments
execute_flow -compile

project_close
