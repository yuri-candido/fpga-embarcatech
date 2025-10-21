@echo off

ghdl -a decodificador_2por4.vhd
ghdl -a tb_decodificador_2por4.vhd
ghdl -e tb_decodificador_2por4
ghdl -r tb_decodificador_2por4 --vcd=decodificador_2por4.vcd
gtkwave decodificador_2por4.vcd

del *.cf
pause
