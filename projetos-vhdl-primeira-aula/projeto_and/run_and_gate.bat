@echo off
rem Simulação do projeto and_gate
ghdl -a and_gate.vhd
ghdl -a tb_and_gate.vhd
ghdl -e tb_and_gate
ghdl -r tb_and_gate --vcd=and_gate.vcd
gtkwave and_gate.vcd
del *.cf
pause
