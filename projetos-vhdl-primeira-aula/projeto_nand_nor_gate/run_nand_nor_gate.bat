@echo off
rem Simulação do projeto nand_nor_gate
ghdl -a nand_nor_gate.vhd
ghdl -a tb_nand_nor_gate.vhd
ghdl -e tb_nand_nor_gate
ghdl -r tb_nand_nor_gate --vcd=nand_nor.vcd
gtkwave nand_nor.vcd
del *.cf
pause
