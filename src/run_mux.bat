rem Building the program
C:\iverilog\bin\iverilog.exe -o mux_build Mux_tb.v

rem Running the build
C:\iverilog\bin\vvp.exe mux_build

rem Running GTKWave
C:\iverilog\gtkwave\bin\gtkwave.exe Mux_TB.vcd
