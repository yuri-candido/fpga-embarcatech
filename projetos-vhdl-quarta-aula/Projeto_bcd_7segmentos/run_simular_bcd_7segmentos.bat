@echo off

ghdl -a bcd_7segmentos.vhd
ghdl -a tb_bcd_7segmentos.vhd
ghdl -e tb_bcd_7segmentos
ghdl -r tb_bcd_7segmentos --vcd=bcd_display.vcd --stop-time=200ns

gtkwave bcd_display.vcd

del *.cf
pause