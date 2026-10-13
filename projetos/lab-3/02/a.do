vlib work
vcom a.vhdl
vcom tb_dec2_4.vhdl
vsim -c work.tb_dec2_4
vcd file a.vcd
vcd add -r /*
run 80 ns
quit -f
