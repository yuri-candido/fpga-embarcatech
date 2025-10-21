@echo off

ghdl -a alu_4op.vhd
ghdl -a tb_alu_4op.vhd
ghdl -e tb_alu_4op
ghdl -r tb_alu_4op --vcd=alu.vcd

gtkwave alu.vcd

del *.cf
pause