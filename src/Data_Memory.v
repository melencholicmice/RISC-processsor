/**
 * Data Memory module
 *
 * This module represents the data memory in the CPU. It is used to store and retrieve data.
 *
 * Inputs:
 *   clk (input): Clock signal
 *   rst (input): Reset signal
 *   WE (input): Write enable signal
 *   A (input [31:0]): Address for memory access
 *   WD (input [31:0]): Data to be written to memory
 *
 * Outputs:
 *   RD (output [31:0]): Data read from memory
 */
module Data_Memory(
    input clk,      // Clock signal
    input rst,      // Reset signal
    input WE,       // Write enable signal
    input [31:0] A, // Address for memory access
    input [31:0] WD, // Data to be written to memory
    output reg [31:0] RD // Data read from memory
);

    reg [31:0] mem [1023:0]; // Memory array to store data

    // Memory write process
    always @(posedge clk) begin
        if (WE)
            mem[A] <= WD;
    end

    // Memory read process
    always @* begin
        if (~rst)
            RD = 32'd0;
        else
            RD = mem[A];
    end

    // Initialize memory with some data
    initial begin
        mem[28] = 32'h00000020;
    end

endmodule
