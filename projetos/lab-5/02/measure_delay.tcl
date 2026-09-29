# measure_delay.tcl — roda com: quartus_sta -t measure_delay.tcl <projeto>
#   ex: quartus_sta -t measure_delay.tcl cla_adder_4bit
#       quartus_sta -t measure_delay.tcl ripple_carry_adder4
#
# Mede o atraso combinacional (pino -> pino) do projeto ja compilado
# via report_datasheet (tabela "Propagation Delay"). O atraso do
# circuito e o MAIOR valor da tabela. Resultado em <projeto>_delay.rpt.
package require ::quartus::project
package require ::quartus::sta

set project_name [lindex $argv 0]

project_open $project_name

create_timing_netlist
update_timing_netlist
report_datasheet -file "${project_name}_delay.rpt"
delete_timing_netlist

project_close
