@echo off

ghdl -a xor_gate.vhd
ghdl -a nor3.vhd
ghdl -a comparador3.vhd
ghdl -a tb_comparador3.vhd

ghdl -e tb_comparador3
ghdl -r tb_comparador3 --wave=comparador3.ghw --stop-time=100ns

gtkwave comparador3.ghw

del *.cf

pause