vlib work
vcom display.vhd
vcom tb_display.vhd
vsim -c work.display
vcd file display.vcd
vcd add -r /*
run 100 ns
quit -f
