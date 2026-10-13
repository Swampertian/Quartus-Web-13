vlib work
vcom b.vhdl
vcom tb_extra_logic.vhdl
vsim -c work.tb_extra_logic
vcd file b.vcd
vcd add -r /*
run 90 ns
quit -f
