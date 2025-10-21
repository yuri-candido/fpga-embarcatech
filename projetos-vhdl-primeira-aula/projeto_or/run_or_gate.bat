@echo off
rem Simulação do projeto or_gate
ghdl -a or_gate.vhd
ghdl -a tb_or_gate.vhd
ghdl -e tb_or_gate
ghdl -r tb_or_gate --vcd=or_gate.vcd
gtkwave or_gate.vcd
del *.cf
pause
