@echo off

ghdl -a multiplicador_serial.vhd
ghdl -a tb_multiplicador_serial.vhd
ghdl -e tb_multiplicador_serial
ghdl -r tb_multiplicador_serial --wave=multiplicador.ghw --stop-time=200ns
gtkwave multiplicador.ghw


del *.cf
pause