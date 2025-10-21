@echo off
rem Simulação do projeto expressao_logica
ghdl -a expressao_logica.vhd
ghdl -a tb_expressao_logica.vhd
ghdl -e tb_expressao_logica
ghdl -r tb_expressao_logica --vcd=expressao.vcd
gtkwave expressao.vcd
del *.cf
pause
