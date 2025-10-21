@echo off

ghdl -a divisor_clock.vhd
ghdl -a tb_divisor_clock.vhd
ghdl -e tb_divisor_clock
ghdl -r tb_divisor_clock --vcd=divisor.vcd --stop-time=200ns

gtkwave divisor.vcd

del *.cf
pause