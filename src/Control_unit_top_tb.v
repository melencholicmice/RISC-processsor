`timescale 1ns / 1ps
`include "Control_unit_top.v"

module Control_Unit_Top_Testbench;

    // Parameters
    parameter WIDTH = 7;

    // Inputs
    reg [WIDTH-1:0] Op;
    reg [2:0] funct3;
    reg [6:0] funct7;

    // Outputs
    wire RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
    wire [1:0] ImmSrc;
    wire [2:0] ALUControl;

    // Instantiate the Control_Unit_Top module
    Control_Unit_Top Control_Unit_Top_inst(
        .Op(Op),
        .funct3(funct3),
        .funct7(funct7),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .ALUControl(ALUControl)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Output file setup
    initial begin
        $dumpfile("Control_Unit_Top_dump.vcd");
        $dumpvars(0, Control_Unit_Top_Testbench);
    end

    // Test cases
    initial begin
        // Test case 1: Load
        Op = 7'b0000011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 2: Store
        Op = 7'b0100011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 3: R-Type
        Op = 7'b0110011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 4: Branch
        Op = 7'b1100011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 5: Jalr
        Op = 7'b1100111;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 6: Jal
        Op = 7'b1101111;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 7: Lui
        Op = 7'b0110111;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 8: Auipc
        Op = 7'b0010111;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Test case 9: I-Type
        Op = 7'b0010011;
        funct3 = 3'b010;
        funct7 = 7'b0000000;
        #10;

        // Add more test cases here

        $finish;
    end

endmodule
