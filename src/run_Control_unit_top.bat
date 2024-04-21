rem building the program
C:\iverilog\bin\iverilog.exe -o control_unit_top_build .\Control_unit_top_tb.v

rem running build
C:\iverilog\bin\vvp.exe .\control_unit_top_build

rem running gtk wavee
C:\iverilog\gtkwave\bin\gtkwave.exe .\Control_Unit_Top_dump.vcd