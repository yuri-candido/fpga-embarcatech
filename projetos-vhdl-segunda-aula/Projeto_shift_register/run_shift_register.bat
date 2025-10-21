@echo off
ghdl -a shift_register.vhd
ghdl -a tb_shift_register.vhd
ghdl -e tb_shift_register
ghdl -r tb_shift_register --vcd=shift_register.vcd
gtkwave shift_register.vcd

del *.cf
pause