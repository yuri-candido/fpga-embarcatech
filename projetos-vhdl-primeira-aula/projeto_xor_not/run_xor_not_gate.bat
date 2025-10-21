@echo off
rem Simulação do projeto xor_not_gate
ghdl -a xor_not_gate.vhd
ghdl -a tb_xor_not_gate.vhd
ghdl -e tb_xor_not_gate
ghdl -r tb_xor_not_gate --vcd=xor_not.vcd
gtkwave xor_not.vcd
del *.cf
pause
