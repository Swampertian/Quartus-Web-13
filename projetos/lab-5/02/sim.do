vlib work
vcom a.vhdl
vcom tb_cla_adder_4bit.vhdl
vsim -c work.tb_cla_adder_4bit
vcd file cla_adder_4bit.vcd
vcd add -r /*
run 6000 ns
quit -f
