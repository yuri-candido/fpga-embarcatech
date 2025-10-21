@echo off

ghdl -a contador_bidirecional.vhd
ghdl -a tb_contador_bidirecional.vhd
ghdl -e tb_contador_bidirecional
ghdl -r tb_contador_bidirecional --vcd=contador.vcd --stop-time=200ns

gtkwave contador.vcd

del *.cf
pause