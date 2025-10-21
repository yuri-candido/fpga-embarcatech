@echo off

ghdl -a --std=08 contador_updown.vhd
ghdl -a --std=08 tb_contador_updown.vhd
ghdl -e --std=08 tb_contador_updown
ghdl -r --std=08 tb_contador_updown --wave=contador.ghw --stop-time=200ns

gtkwave contador.ghw

del *.cf
pause