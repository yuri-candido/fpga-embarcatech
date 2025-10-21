@echo off
ghdl -a acumulador.vhd
ghdl -a tb_acumulador.vhd
ghdl -e tb_acumulador
ghdl -r tb_acumulador --vcd=acumulador.vcd
gtkwave acumulador.vcd

del *.cf
pause
