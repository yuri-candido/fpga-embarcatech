@echo off

ghdl -a uart_tx.vhd
ghdl -a tb_uart_tx.vhd
ghdl -e tb_uart_tx
ghdl -r tb_uart_tx --vcd=uart_tx.vcd --stop-time=200ns

gtkwave uart_tx.vcd

del *.cf
pause