@echo off

ghdl -a xor_gate.vhd         
ghdl -a nor3.vhd            
ghdl -a comparador3.vhd      
ghdl -a tb_comparador3.vhd   
ghdl -e tb_comparador3       
ghdl -r tb_comparador3 --vcd=comparador3.vcd  

gtkwave comparador3.vcd

del *.cf
pause