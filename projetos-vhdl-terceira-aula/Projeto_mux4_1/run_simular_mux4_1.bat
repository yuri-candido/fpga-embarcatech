@echo off

ghdl -a mux4_1.vhd
ghdl -a tb_mux4_1.vhd
ghdl -e tb_mux4_1
ghdl -r tb_mux4_1 --vcd=mux4.vcd

gtkwave mux4.vcd

del *.cf
pause