@echo off
rem Simulação do projeto fazendeiro_regras
ghdl -a fazendeiro_regras.vhd
ghdl -a tb_fazendeiro_regras.vhd
ghdl -e tb_fazendeiro_regras
ghdl -r tb_fazendeiro_regras --vcd=fazendeiro.vcd
gtkwave fazendeiro.vcd
del *.cf
pause
