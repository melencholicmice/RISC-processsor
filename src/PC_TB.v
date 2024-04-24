`timescale 1ns / 1ps
`include "PC.v"

module PC_Module_tb;

    // Inputs
    reg clk = 0;               // Clock signal
    reg rst = 0;               // Reset signal
    reg [31:0] PC_Next = 0;   // Next value of the Program Counter

    // Outputs
    wire [31:0] PC;           // Current value of the Program Counter

    // Instantiate the PC_Module
    PC_Module uut (
        .clk(clk),            // Connect clock signal
        .rst(rst),            // Connect reset signal
        .PC_Next(PC_Next),   // Connect next value of PC
        .PC(PC)              // Output current PC value
    );

    // Clock generation
    always #5 clk = ~clk;     // Toggle clock every 5 time units

    // Initial block
    initial begin
        // Reset PC
        rst = 0;
        #10;                  // Wait for 10 time units
        rst = 1;              // De-assert reset

        // Test case 1: PC is incremented by 4
        PC_Next = 32'h0000_0004;
        #10;                  // Wait for 10 time units

        // Test case 2: PC is set to a specific address
        PC_Next = 32'h0000_0010;
        #10;                  // Wait for 10 time units

        // Add more test cases here

        $finish;              // Finish simulation
    end

    // Output file setup
    initial begin
        $dumpfile("PC_TB.vcd");  // Specify VCD file name
        $dumpvars(0, PC_Module_tb);       // Dump variables for waveform
    end

endmodule
