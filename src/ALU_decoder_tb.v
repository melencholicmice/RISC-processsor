`timescale 1ns / 1ps
`include "ALU_decoder.v"

module ALU_Decoder_Testbench;

    // Parameters
    parameter WIDTH = 32; // Parameter for specifying width of input and output

    // Inputs
    reg [1:0] ALUOp;       // 2-bit ALU operation code
    reg [2:0] funct3;      // 3-bit function code
    reg [6:0] funct7, op;  // 7-bit function code and operation code

    // Outputs
    wire [2:0] ALUControl; // 3-bit ALU control signal

    // Instantiate the ALU_Decoder module
    ALU_Decoder ALU_Decoder_inst(
        .ALUOp(ALUOp),         // Connect ALUOp input to ALU_Decoder
        .funct3(funct3),       // Connect funct3 input to ALU_Decoder
        .funct7(funct7),       // Connect funct7 input to ALU_Decoder
        .op(op),               // Connect op input to ALU_Decoder
        .ALUControl(ALUControl) // Connect ALUControl output from ALU_Decoder
    );

    // Clock generation
    reg clk = 0; // Clock signal initialized to 0
    always #5 clk = ~clk; // Toggle clock every 5 time units

    // Output file setup
    initial begin
        $dumpfile("ALU_decoder_dump.vcd"); // Specify VCD file name
        $dumpvars(0, ALU_Decoder_Testbench); // Dump variables for waveform
    end

    // Testbench stimuli
    initial begin
        // Test 1: R-type instruction with funct3 = 000, funct7[5] = 1, op[5] = 1
        ALUOp = 2'b00; // R-type instruction
        funct3 = 3'b000; // funct3 = 000
        funct7 = 7'b1000000; // funct7[5] = 1
        op = 7'b1000000; // op[5] = 1
        #10; // Wait for 10 time units

        // Test 2: R-type instruction with funct3 = 010
        ALUOp = 2'b00; // R-type instruction
        funct3 = 3'b010; // funct3 = 010
        #10; // Wait for 10 time units

        // Test 3: R-type instruction with funct3 = 110
        ALUOp = 2'b00; // R-type instruction
        funct3 = 3'b110; // funct3 = 110
        #10; // Wait for 10 time units

        // Test 4: R-type instruction with funct3 = 111
        ALUOp = 2'b00; // R-type instruction
        funct3 = 3'b111; // funct3 = 111
        #10; // Wait for 10 time units

        // Test 5: Load instruction
        ALUOp = 2'b01; // Load instruction
        #10; // Wait for 10 time units

        // Test 6: I-type instruction with funct3 = 000, funct7[5] = 1, op[5] = 1
        ALUOp = 2'b10; // I-type instruction
        funct3 = 3'b000; // funct3 = 000
        funct7 = 7'b1000000; // funct7[5] = 1
        op = 7'b1000000; // op[5] = 1
        #10; // Wait for 10 time units

        // Test 7: I-type instruction with funct3 = 010
        ALUOp = 2'b10; // I-type instruction
        funct3 = 3'b010; // funct3 = 010
        #10; // Wait for 10 time units

        // Test 8: I-type instruction with funct3 = 110
        ALUOp = 2'b10; // I-type instruction
        funct3 = 3'b110; // funct3 = 110
        #10; // Wait for 10 time units

        // Test 9: I-type instruction with funct3 = 111
        ALUOp = 2'b10; // I-type instruction
        funct3 = 3'b111; // funct3 = 111
        #10; // Wait for 10 time units

        $finish; // Finish simulation
    end

endmodule
