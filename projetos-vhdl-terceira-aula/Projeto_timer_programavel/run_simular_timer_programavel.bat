@echo off

ghdl -a timer_programavel.vhd
ghdl -a tb_timer_programavel.vhd
ghdl -e tb_timer_programavel
ghdl -r tb_timer_programavel --vcd=timer.vcd --stop-time=100ns

gtkwave timer.vcd

del *.cf
pause
