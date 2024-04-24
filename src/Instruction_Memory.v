/*
 * Instruction Memory
 *
 * This module is responsible for storing and retrieving instructions from memory.
 *
 * Module Inputs:
 *   rst: Reset signal
 *   A: Address input
 *
 * Module Outputs:
 *   RD: Instruction output read from memory
 */
module Instruction_Memory(
    input rst,          // Reset signal
    input [31:0] A,     // Address input
    output [31:0] RD   // Instruction output read from memory
);

    // Memory declaration
    reg [31:0] mem [1023:0];

    // Read instruction from memory
    assign RD = (~rst) ? {32{1'b0}} : mem[A[31:2]];

    // Read memory contents from file
    // initial begin
    //     $readmemh("memfile.hex", mem);
    // end

    initial begin
        // mem[0] = 32'hFFC4A303;
        // mem[1] = 32'h00832383;
        // mem[0] = 32'h0064A423;
        // mem[1] = 32'h00B62423;
        mem[0] = 32'h0062E233; // or kee instruction
        mem[0] = 32'h0062F433; // and kee instruciton
        // mem[1] = 32'h00B62423;
    end

endmodule
