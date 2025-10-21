@echo off
ghdl -a flipflop_d.vhd
ghdl -a tb_flipflop_d.vhd
ghdl -e tb_flipflop_d
ghdl -r tb_flipflop_d --vcd=flipflop_d.vcd
gtkwave flipflop_d.vcd
del *.cf
pause