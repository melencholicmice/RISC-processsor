`timescale 1ns / 1ps
`include "PC_Adder.v"
module PC_Adder_tb;

    // Inputs
    reg [31:0] a, b;  // Input operands

    // Output
    wire [31:0] c;    // Result

    // Instantiate the PC_Adder module
    PC_Adder uut (
        .a(a),         // Connect input a
        .b(b),         // Connect input b
        .c(c)          // Output result c
    );

    // Initial block
    initial begin
        // Test case 1: Addition of positive numbers
        a = 32'h0000_0004;
        b = 32'h0000_0008;
        #10;  // Wait for 10 time units

        // Test case 2: Addition of negative numbers
        a = 32'hFFFF_FFF0;
        b = 32'hFFFF_FFF5;
        #10;  // Wait for 10 time units

        // Add more test cases here

        $finish;  // Finish simulation
    end

    // Output file setup
    initial begin
        $dumpfile("PC_Adder_dump.vcd");  // Specify VCD file name
        $dumpvars(0, PC_Adder_tb);       // Dump variables for waveform
    end

endmodule
