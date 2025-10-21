@echo off
ghdl -a registrador_enable.vhd
ghdl -a tb_registrador_enable.vhd
ghdl -e tb_registrador_enable
ghdl -r tb_registrador_enable --vcd=registrador_enable.vcd
gtkwave registrador_enable.vcd

del *.cf
pause