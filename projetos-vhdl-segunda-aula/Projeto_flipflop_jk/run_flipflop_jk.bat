@echo off
ghdl -a flipflop_jk.vhd
ghdl -a tb_flipflop_jk.vhd
ghdl -e tb_flipflop_jk
ghdl -r tb_flipflop_jk --vcd=flipflop_jk.vcd
gtkwave flipflop_jk.vcd

del *.cf
pause