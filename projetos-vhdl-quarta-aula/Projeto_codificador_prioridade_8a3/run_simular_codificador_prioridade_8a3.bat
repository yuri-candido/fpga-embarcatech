@echo off

ghdl -a codificador_prioridade_8a3.vhd
ghdl -a tb_codificador_prioridade_8a3.vhd
ghdl -e tb_codificador_prioridade_8a3
ghdl -r tb_codificador_prioridade_8a3 --vcd=codificador.vcd

gtkwave codificador.vcd

del *.cf
pause