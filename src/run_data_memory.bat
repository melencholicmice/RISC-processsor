rem building the program
C:\iverilog\bin\iverilog.exe -o data_memory_build .\Data_Memory_tb.v

rem running build
C:\iverilog\bin\vvp.exe .\data_memory_build

rem running gtk wavee
C:\iverilog\gtkwave\bin\gtkwave.exe .\Data_Memory_TB.vcd