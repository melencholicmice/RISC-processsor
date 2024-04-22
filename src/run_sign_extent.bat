rem Building the program
C:\iverilog\bin\iverilog.exe -o sign_extend_build Sign_Extend_tb.v

rem Running the build
C:\iverilog\bin\vvp.exe sign_extend_build

rem Running GTKWave
C:\iverilog\gtkwave\bin\gtkwave.exe Sign_Extend_tb.vcd
