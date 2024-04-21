/*
 * Data Memory Test Bench
 *
 * This test bench verifies the functionality of the Data Memory module.
 *
 * The Data Memory module is responsible for storing and retrieving data from memory.
 *
 * Module Inputs:
 *   clk: Clock signal
 *   rst: Reset signal
 *   WE: Write enable signal
 *   A: Address input
 *   WD: Data input for writing to memory
 *
 * Module Outputs:
 *   RD: Data output read from memory
 *
 * Test Cases:
 *   1. Write data to memory, read it, write different data to the same memory address, and read it again.
 *
 * The waveform information is dumped into a VCD file named "Data_Memory_TB.vcd".
 */

`timescale 1ns / 1ps
`include "Data_Memory.v"

module Data_Memory_TB;

    // Parameters
    parameter MEM_DEPTH = 1024;  // Memory depth
    parameter MEM_WIDTH = 32;    // Memory width

    // Signals
    reg clk;
    reg rst;
    reg WE;
    reg [31:0] A;
    reg [31:0] WD;
    wire [31:0] RD;

    // Instantiate the Data_Memory module
    Data_Memory dut (
        .clk(clk),
        .rst(rst),
        .WE(WE),
        .WD(WD),
        .A(A),
        .RD(RD)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Reset generation
    initial begin
        rst = 1;
        #10;
        rst = 0;
    end

    // Output file setup
    initial begin
        $dumpfile("Data_Memory_TB.vcd");
        $dumpvars(0, Data_Memory_TB);
    end

    // Test cases
    initial begin
        // Write data to memory
        WE = 1;
        A = 42; // Memory address
        WD = 32'h00000020;
        #10;

        // Read data from memory
        WE = 0;
        A = 42; // Memory address
        #10;

        // Write different data to the same memory address
        WE = 1;
        A = 42; // Memory address
        WD = 32'h0000_0002;
        #10;

        // Read the updated data from memory
        WE = 0;
        A = 42; // Memory address
        #10;

        // Finish the simulation
        #10;
        $finish;
    end

endmodule
