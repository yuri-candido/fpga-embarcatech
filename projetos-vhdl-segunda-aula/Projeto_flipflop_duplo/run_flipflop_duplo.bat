@echo off

ghdl -a flipflop_duplo.vhd
ghdl -a tb_flipflop_duplo.vhd
ghdl -e tb_flipflop_duplo
ghdl -r tb_flipflop_duplo --vcd=flipflop_duplo.vcd
gtkwave flipflop_duplo.vcd

del *.cf
pause