rem Building the program
C:\iverilog\bin\iverilog.exe -o pc_build PC_TB.v

rem Running the build
C:\iverilog\bin\vvp.exe pc_build

rem Running GTKWave
C:\iverilog\gtkwave\bin\gtkwave.exe PC_TB.vcd
