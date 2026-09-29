# compile_rca4.tcl — roda com: quartus_sh -t compile_rca4.tcl
#
# Compila o ripple_carry_adder4 do lab-4 (arquivos lidos de
# ../../lab-4/01, sem alterar nada la) nas mesmas condicoes do CLA,
# para comparar os atrasos. Depois:
# quartus_sta -t measure_delay.tcl ripple_carry_adder4
package require ::quartus::project
package require ::quartus::flow

set project_name "ripple_carry_adder4"

project_new $project_name -overwrite

set_global_assignment -name FAMILY "Cyclone II"
set_global_assignment -name DEVICE EP2C20F484C7
set_global_assignment -name VHDL_FILE ../../lab-4/01/basic_gates.vhdl
set_global_assignment -name VHDL_FILE ../../lab-4/01/full_adder.vhdl
set_global_assignment -name VHDL_FILE ../../lab-4/01/ripple_carry_adder4.vhdl
set_global_assignment -name TOP_LEVEL_ENTITY ripple_carry_adder4

export_assignments
execute_flow -compile

project_close
