@echo off
ghdl -a contador_binario.vhd
ghdl -a tb_contador_binario.vhd
ghdl -e tb_contador_binario
ghdl -r tb_contador_binario --vcd=contador_binario.vcd
gtkwave contador_binario.vcd

del *.cf
pause