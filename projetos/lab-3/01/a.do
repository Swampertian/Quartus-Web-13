vlib work
vcom a.vhdl
vcom tb_crossbar_switch.vhdl
vsim -c work.tb_crossbar_switch
vcd file a.vcd
vcd add -r /*
run 80 ns
quit -f
