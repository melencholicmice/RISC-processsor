rem Building the program
C:\iverilog\bin\iverilog.exe -o pc_adder_build PC_Adder_tb.v

rem Running the build
C:\iverilog\bin\vvp.exe pc_adder_build

rem Running GTKWave
C:\iverilog\gtkwave\bin\gtkwave.exe PC_Adder_dump.vcd
