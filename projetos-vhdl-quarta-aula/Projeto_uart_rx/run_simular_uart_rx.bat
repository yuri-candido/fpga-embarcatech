@echo off

ghdl -a uart_rx.vhd
ghdl -a tb_uart_rx.vhd
ghdl -e tb_uart_rx
ghdl -r tb_uart_rx --vcd=uart_rx.vcd --stop-time=200ns

gtkwave uart_rx.vcd

del *.cdf
pause