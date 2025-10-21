@echo off

ghdl -a registrador8b_enable.vhd
ghdl -a tb_registrador8b_enable.vhd
ghdl -e tb_registrador8b_enable
ghdl -r tb_registrador8b_enable --vcd=registrador.vcd --stop-time=200ns

gtkwave registrador.vcd

del *.cf
pause