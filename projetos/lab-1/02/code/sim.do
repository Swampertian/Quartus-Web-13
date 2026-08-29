vlib work
vcom a.vhd
vcom tb_and_gate.vhd
vsim -c work.tb_and_gate
vcd file and_gate.vcd
vcd add -r /*
run 320 ns
quit -f
