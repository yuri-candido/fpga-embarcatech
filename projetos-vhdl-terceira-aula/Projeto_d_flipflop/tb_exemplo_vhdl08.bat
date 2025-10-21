@echo off

REM Compila o testbench com suporte VHDL-2008
ghdl -a --std=08 tb_exemplo_vhdl08.vhd

REM Elabora a entidade
ghdl -e --std=08 tb_exemplo_vhdl08

REM Roda a simulação e gera a forma de onda no formato leve GHW
ghdl -r --std=08 tb_exemplo_vhdl08 --wave=exemplo08.ghw

REM Abre o GTKWave com o arquivo gerado
gtkwave exemplo08.ghw

del *.cf
pause
