`timescale 1ns / 1ps
`include "Single_Cycle_Top.v"

module Single_Cycle_Top_Tb ();

    reg clk = 1'b0;
    reg rst = 1'b1;

    Single_Cycle_Top Single_Cycle_Top (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        $dumpfile("Single_Cycle_Top_tb.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #450;
        $finish;
    end

endmodule
