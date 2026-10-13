vlib work
vcom b.vhdl
vcom tb_crossbar_switch.vhdl
vsim -c work.tb_crossbar_switch
vcd file b.vcd
vcd add -r /*
run 80 ns
quit -f
