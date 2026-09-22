vlib work
vcom basic_gates.vhdl
vcom full_adder.vhdl
vcom tb_full_adder.vhdl
vsim -c work.tb_full_adder
vcd file full_adder.vcd
vcd add -r /*
run 100 ns
quit -f
