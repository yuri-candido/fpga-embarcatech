@echo off

ghdl -a shift_register_siso.vhd
ghdl -a tb_shift_register_siso.vhd
ghdl -e tb_shift_register_siso
ghdl -r tb_shift_register_siso --vcd=shift_register.vcd --stop-time=100ns

gtkwave shift_register.vcd

del *.cf
pause
