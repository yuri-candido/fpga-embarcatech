@echo off

ghdl -a detector_seq101_mealy.vhd
ghdl -a tb_detector_seq101_mealy.vhd
ghdl -e tb_detector_seq101_mealy
ghdl -r tb_detector_seq101_mealy --vcd=seq101.vcd --stop-time=100ns

gtkwave seq101.vcd

del *.cf
pause