rem Building the program
C:\iverilog\bin\iverilog.exe -o register_file_build Register_File_tb.v

rem Running the build
C:\iverilog\bin\vvp.exe register_file_build

rem Running GTKWave
C:\iverilog\gtkwave\bin\gtkwave.exe Register_File_tb.vcd
