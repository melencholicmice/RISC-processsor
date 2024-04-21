rem building the program
C:\iverilog\bin\iverilog.exe -o ALU_build .\ALU_tb.v

rem running build
C:\iverilog\bin\vvp.exe .\ALU_build

rem running gtk wavee

C:\iverilog\gtkwave\bin\gtkwave.exe .\ALU_dump.vcd