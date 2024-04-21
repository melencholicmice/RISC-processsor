rem building the program
C:\iverilog\bin\iverilog.exe -o ALU_decoder_build ..\src\ALU_decoder_tb.v

rem running build
C:\iverilog\bin\vvp.exe .\ALU_decoder_build

rem running gtk wavee
C:\iverilog\gtkwave\bin\gtkwave.exe .\ALU_decoder_dump.vcd