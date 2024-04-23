/**
 * Main_Decoder module
 *
 * This module decodes the opcode (Op) to generate various control signals
 * used by different parts of the CPU.
 *
 * Inputs:
 *   Op (input [6:0]): 7-bit opcode
 *
 * Outputs:
 *   RegWrite (output): Register write control signal
 *   ImmSrc (output [1:0]): Immediate source control signal
 *   ALUSrc (output): ALU source control signal
 *   MemWrite (output): Memory write control signal
 *   ResultSrc (output): Result source control signal
 *   Branch (output): Branch control signal
 *   ALUOp (output [1:0]): ALU operation control signal
 *    +---------+------------------------------------------------------------------------------------------+
 *   |  Op     |                                    Control                                                |
 *   +---------+-------------------------------------------------------------------------------------------+
 *   | 7'b0000 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b0011 | RegWrite = 1, ImmSrc = 0, ALUSrc = 1, MemWrite = 0, ResultSrc = 1, Branch = 0, ALUOp = 00 |
 *   | 7'b0100 | RegWrite = 0, ImmSrc = 1, ALUSrc = 1, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b0101 | RegWrite = 0, ImmSrc = 1, ALUSrc = 1, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b0110 | RegWrite = 1, ImmSrc = 0, ALUSrc = 1, MemWrite = 0, ResultSrc = 1, Branch = 0, ALUOp = 00 |
 *   | 7'b0111 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1000 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1001 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1010 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1011 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1100 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1101 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1110 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b1111 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b0001 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b0010 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b0110 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   | 7'b0111 | RegWrite = 0, ImmSrc = 0, ALUSrc = 0, MemWrite = 0, ResultSrc = 0, Branch = 0, ALUOp = 00 |
 *   +---------+-------------------------------------------------------------------------------------------+
 *
 */
module Main_Decoder(
    input [6:0] Op,          // Input opcode
    output RegWrite,         // Register write control signal
    output [1:0] ImmSrc,     // Immediate source control signal
    output ALUSrc,           // ALU source control signal
    output MemWrite,         // Memory write control signal
    output ResultSrc,        // Result source control signal
    output Branch,           // Branch control signal
    output [1:0] ALUOp       // ALU operation control signal
);

    // Register write control signal
    assign RegWrite = (Op == 7'b0000011 | Op == 7'b0110011) ? 1'b1 : 1'b0;

    // Immediate source control signal
    assign ImmSrc = (Op == 7'b0100011) ? 2'b01 :
                    (Op == 7'b1100011) ? 2'b10 :
                                         2'b00 ;

    // ALU source control signal
    assign ALUSrc = (Op == 7'b0000011 | Op == 7'b0100011) ? 1'b1 : 1'b0;

    // Memory write control signal
    assign MemWrite = (Op == 7'b0100011) ? 1'b1 : 1'b0;

    // Result source control signal
    assign ResultSrc = (Op == 7'b0000011) ? 1'b1 : 1'b0;

    // Branch control signal
    assign Branch = (Op == 7'b1100011) ? 1'b1 : 1'b0;

    // ALU operation control signal
    assign ALUOp = (Op == 7'b0110011) ? 2'b10 :
                   (Op == 7'b1100011) ? 2'b01 :
                                        2'b00 ;

endmodule
