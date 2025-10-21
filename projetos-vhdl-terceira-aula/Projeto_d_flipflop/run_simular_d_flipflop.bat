@echo off

ghdl -a d_flipflop.vhd
ghdl -a tb_d_flipflop.vhd
ghdl -e tb_d_flipflop
ghdl -r tb_d_flipflop --wave=flipflop.ghw --stop-time=120ns
gtkwave flipflop.ghw

del *.cf
pause