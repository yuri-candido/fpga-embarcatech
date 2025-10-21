@echo off
ghdl -a contador_variable.vhd
ghdl -a tb_contador_variable.vhd
ghdl -e tb_contador_variable
ghdl -r tb_contador_variable --vcd=contador_variable.vcd
gtkwave contador_variable.vcd

del *.cf
pause
