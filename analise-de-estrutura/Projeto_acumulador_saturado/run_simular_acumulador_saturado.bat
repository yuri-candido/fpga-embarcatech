@echo off

ghdl -a acumulador_saturado.vhd
ghdl -a tb_acumulador_saturado.vhd
ghdl -e tb_acumulador_saturado
ghdl -r tb_acumulador_saturado --wave=acumulador.ghw --stop-time=120ns

gtkwave acumulador.ghw

del *.cf
pause