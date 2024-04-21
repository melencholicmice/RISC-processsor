`timescale 1ns / 1ps
`include "Main_decoder.v"

module Main_Decoder_Testbench;

    // Parameters
    parameter WIDTH = 7;

    // Inputs
    reg [WIDTH-1:0] Op;

    // Outputs
    wire RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
    wire [1:0] ImmSrc, ALUOp;

    // Instantiate the Main_Decoder module
    Main_Decoder Main_Decoder_inst(
        .Op(Op),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Output file setup
    initial begin
        $dumpfile("Main_Decoder_dump.vcd");
        $dumpvars(0, Main_Decoder_Testbench);
    end

    // Test cases
    initial begin
        // Test case 1: Load instruction (Op = 0000011)
        Op = 7'b0000011;
        #10;

        // Test case 2: Store instruction (Op = 0100011)
        Op = 7'b0100011;
        #10;

        // Test case 3: R-type instruction (Op = 0110011)
        Op = 7'b0110011;
        #10;

        // Test case 4: Branch instruction (Op = 1100011)
        Op = 7'b1100011;
        #10;

        // Test case 5: I-type instruction - ADDI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 6: I-type instruction - SLTI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 7: I-type instruction - ANDI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 8: I-type instruction - ORI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 9: I-type instruction - XORI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 10: I-type instruction - SLLI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 11: I-type instruction - SRLI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 12: I-type instruction - SRAI (Op = 0010011)
        Op = 7'b0010011;
        #10;

        // Test case 13: S-type instruction - SB (Op = 0100011)
        Op = 7'b0100011;
        #10;

        // Test case 14: S-type instruction - SH (Op = 0100011)
        Op = 7'b0100011;
        #10;

        // Test case 15: S-type instruction - SW (Op = 0100011)
        Op = 7'b0100011;
        #10;

        // Test case 16: U-type instruction - LUI (Op = 0110111)
        Op = 7'b0110111;
        #10;

        // Test case 17: U-type instruction - AUIPC (Op = 0010111)
        Op = 7'b0010111;
        #10;

        // Test case 18: J-type instruction - JAL (Op = 1101111)
        Op = 7'b1101111;
        #10;

        // Test case 19: J-type instruction - JALR (Op = 1100111)
        Op = 7'b1100111;
        #10;

        $finish;
    end

endmodule
