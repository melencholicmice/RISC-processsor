rem building the program
C:\iverilog\bin\iverilog.exe -o main_decoder_build .\Main_decoder_tb.v

rem running build
C:\iverilog\bin\vvp.exe .\main_decoder_build

rem running gtk wavee
C:\iverilog\gtkwave\bin\gtkwave.exe .\Main_Decoder_dump.vcd