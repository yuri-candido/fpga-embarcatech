@echo off
rem Simulação do projeto comparador_4bits
ghdl -a comparador_4bits.vhd
ghdl -a tb_comparador_4bits.vhd
ghdl -e tb_comparador_4bits
ghdl -r tb_comparador_4bits --vcd=comparador.vcd
gtkwave comparador.vcd
del *.cf
pause
