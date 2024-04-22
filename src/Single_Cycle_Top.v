/**
 * Single Cycle Processor Top Module
 *
 * This module integrates all components of a single-cycle processor
 * including PC, Instruction Memory, Register File, Sign Extend, ALU,
 * Data Memory, Multiplexers, and Control Unit.
 *
 * Inputs:
 *   clk (input): Clock signal
 *   rst (input): Reset signal
 *
 * Outputs:
 *   None
 *
 * Components Used:
 *   - PC_Module: Program Counter (PC) module
 *   - PC_Adder: Adds 4 to the PC value
 *   - Instruction_Memory: Instruction Memory module
 *   - Register_File: Register File module
 *   - Sign_Extend: Sign Extend module
 *   - Mux: Multiplexer module
 *   - ALU: Arithmetic Logic Unit module
 *   - Control_Unit_Top: Control Unit module
 *   - Data_Memory: Data Memory module
 *
 * Details:
 *   - The PC module generates the program counter value.
 *   - The PC_Adder adds 4 to the current PC value to prepare the next PC value.
 *   - The Instruction_Memory module stores instructions.
 *   - The Register_File module provides register values.
 *   - The Sign_Extend module extends immediate values.
 *   - The Mux module selects between register value and immediate value for ALU's second operand.
 *   - The ALU module performs arithmetic and logical operations.
 *   - The Control_Unit_Top module generates control signals.
 *   - The Data_Memory module stores data.
 *   - The Mux module selects between ALU result and Data Memory output for writing into registers.
 */


`timescale 1ns / 1ps
`include "PC.v"
`include "PC_Adder.v"
`include "Instruction_Memory.v"
`include "Register_File.v"
`include "Sign_Extend.v"
`include "Mux.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_Memory.v"


module Single_Cycle_Top (
    input clk,   // Clock signal
    input rst    // Reset signal
);

    // Wires
    wire [31:0] PC_Top, RD_Instr, RD1_Top, Imm_Ext_Top, ALUResult, ReadData, PCPlus4, RD2_Top, SrcB, Result;
    wire RegWrite, MemWrite, ALUSrc, ResultSrc;
    wire [1:0] ImmSrc;
    wire [2:0] ALUControl_Top;

    // Program Counter (PC) module
    PC_Module PC (
        .clk(clk),
        .rst(rst),
        .PC(PC_Top),
        .PC_Next(PCPlus4)
    );

    // Adder to increment PC by 4
    PC_Adder PC_Adder (
        .a(PC_Top),
        .b(32'd4),
        .c(PCPlus4)
    );

    // Instruction Memory module
    Instruction_Memory Instruction_Memory (
        .rst(rst),
        .A(PC_Top),
        .RD(RD_Instr)
    );

    // Register File module
    Register_File Register_File (
        .clk(clk),
        .rst(rst),
        .WE3(RegWrite),
        .WD3(Result),
        .A1(RD_Instr[19:15]),
        .A2(RD_Instr[24:20]),
        .A3(RD_Instr[11:7]),
        .RD1(RD1_Top),
        .RD2(RD2_Top)
    );

    // Sign Extend module
    Sign_Extend Sign_Extend (
        .In(RD_Instr),
        .ImmSrc(ImmSrc[0]),
        .Imm_Ext(Imm_Ext_Top)
    );

    // Mux to select between register value and extended immediate value
    Mux Mux_Register_to_ALU (
        .a(RD2_Top),
        .b(Imm_Ext_Top),
        .s(ALUSrc),
        .c(SrcB)
    );

    // ALU module
    ALU ALU (
        .A(RD1_Top),
        .B(SrcB),
        .Result(ALUResult),
        .ALUControl(ALUControl_Top),
        .OverFlow(),
        .Carry(),
        .Zero(),
        .Negative()
    );

    // Control Unit module
    Control_Unit_Top Control_Unit_Top (
        .Op(RD_Instr[6:0]),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(),
        .funct3(RD_Instr[14:12]),
        .funct7(RD_Instr[6:0]),
        .ALUControl(ALUControl_Top)
    );

    // Data Memory module
    Data_Memory Data_Memory (
        .clk(clk),
        .rst(rst),
        .WE(MemWrite),
        .WD(RD2_Top),
        .A(ALUResult),
        .RD(ReadData)
    );

    // Mux to select between ALU result and Data Memory output
    Mux Mux_DataMemory_to_Register (
        .a(ALUResult),
        .b(ReadData),
        .s(ResultSrc),
        .c(Result)
    );

endmodule
