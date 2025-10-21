@echo off
ghdl -a comparador_4bits.vhd
ghdl -a tb_comparador_4bits.vhd
ghdl -e tb_comparador_4bits
ghdl -r tb_comparador_4bits --vcd=comparador_4bits.vcd
gtkwave comparador_4bits.vcd

del *.cf
pause
