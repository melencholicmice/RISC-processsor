rem Building the program
C:\iverilog\bin\iverilog.exe -o processor_build Single_Cycle_Top_tb.v

rem Running the build
C:\iverilog\bin\vvp.exe processor_build

rem Running GTKWave
C:\iverilog\gtkwave\bin\gtkwave.exe Single_Cycle_Top_tb.vcd
