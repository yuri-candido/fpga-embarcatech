@echo off

ghdl -a uart_rx.vhd
ghdl -a bcd_7segmentos.vhd
ghdl -a uart_display_top.vhd
ghdl -a tb_uart_display_top.vhd
ghdl -e tb_uart_display_top
ghdl -r tb_uart_display_top --vcd=uart_display.vcd --stop-time=200ns

gtkwave uart_display.vcd

del *.cf
pause