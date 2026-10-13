vlib work
vcom a.vhdl
vcom d.vhd
vcom tb_xbar_chain.vhdl
vsim -c work.tb_xbar_chain
vcd file d.vcd
vcd add -r /*
run 60 ns
quit -f
