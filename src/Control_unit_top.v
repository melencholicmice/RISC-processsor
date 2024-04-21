/**
 * Control_Unit_Top module
 *
 * This module integrates Main_Decoder and ALU_Decoder to generate control signals
 * for different parts of the CPU based on the opcode and function codes.
 *
 * Inputs:
 *   Op (input [6:0]): 7-bit opcode
 *   funct3 (input [2:0]): 3-bit function code
 *   funct7 (input [6:0]): 7-bit function code
 *
 * Outputs:
 *   RegWrite (output): Register write control signal
 *   ImmSrc (output [1:0]): Immediate source control signal
 *   ALUSrc (output): ALU source control signal
 *   MemWrite (output): Memory write control signal
 *   ResultSrc (output): Result source control signal
 *   Branch (output): Branch control signal
 *   ALUControl (output [2:0]): ALU control signal
 *
 * Submodules:
 *   Main_Decoder: Decodes the opcode to generate control signals.
 *   ALU_Decoder: Decodes ALU operation based on ALUOp and function codes.
 */

`include "Main_decoder.v"
`include "ALU_decoder.v"

module Control_Unit_Top(
    input [6:0] Op,         // Input opcode
    input [2:0] funct3,     // Input function code
    input [6:0] funct7,     // Input function code
    output RegWrite,        // Register write control signal
    output [1:0] ImmSrc,    // Immediate source control signal
    output ALUSrc,          // ALU source control signal
    output MemWrite,        // Memory write control signal
    output ResultSrc,       // Result source control signal
    output Branch,          // Branch control signal
    output [2:0] ALUControl // ALU control signal
);

    wire [1:0] ALUOp;

    // Instantiate Main_Decoder submodule
    Main_Decoder Main_Decoder_inst(
        .Op(Op),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp)
    );

    // Instantiate ALU_Decoder submodule
    ALU_Decoder ALU_Decoder_inst(
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7(funct7),
        .op(Op),
        .ALUControl(ALUControl)
    );

endmodule
