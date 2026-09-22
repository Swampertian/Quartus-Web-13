# measure_delay.tcl — roda com: quartus_sta -t measure_delay.tcl <projeto>
#   ex: quartus_sta -t measure_delay.tcl adder8
#       quartus_sta -t measure_delay.tcl adder32
#       quartus_sta -t measure_delay.tcl adder64
#
# ITEM (i): mede o atraso combinacional (pino de entrada -> pino de
# saida) do projeto ja compilado (precisa rodar compile_adderN.tcl
# antes). Como o circuito nao tem clock, usamos "report_datasheet",
# que da a tabela de "Propagation Delay" -- o equivalente ao antigo
# relatorio "tpd" do Classic Timing Analyzer.
#
# O resultado fica em <projeto>_delay.rpt. O ATRASO DO CIRCUITO
# INTEIRO e o MAIOR valor da tabela (pior caminho: normalmente
# x[0] ou y[0] ate "overflow", pois esse e o bit que precisa
# esperar o carry passar por TODOS os full adders da cadeia).
package require ::quartus::project
package require ::quartus::sta

set project_name [lindex $argv 0]

project_open $project_name

create_timing_netlist
update_timing_netlist
report_datasheet -file "${project_name}_delay.rpt"
delete_timing_netlist

project_close
