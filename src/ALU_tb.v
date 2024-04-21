`timescale 1ns / 1ps
`include "ALU.v" // Include the ALU module

// Testbench for ALU module
module ALU_Testbench;

    // Parameters
    parameter WIDTH = 32; // Parameter for specifying width of input and output

    // Inputs
    reg [WIDTH-1:0] A, B; // Input A and B, each 32 bits wide
    reg [2:0] ALUControl; // 3-bit control signal for selecting ALU operation

    // Outputs
    wire Carry, OverFlow, Zero, Negative; // Output flags
    wire [WIDTH-1:0] Result; // Output of ALU operation

    // Instantiate the ALU module
    ALU ALU_inst(
        .A(A), // Connect input A to ALU
        .B(B), // Connect input B to ALU
        .ALUControl(ALUControl), // Connect control signal to ALU
        .Carry(Carry), // Connect Carry flag output
        .OverFlow(OverFlow), // Connect Overflow flag output
        .Zero(Zero), // Connect Zero flag output
        .Negative(Negative), // Connect Negative flag output
        .Result(Result) // Connect result output
    );

    // Clock generation
    reg clk = 0; // Clock signal initialized to 0
    always #5 clk = ~clk; // Toggle clock every 5 time units

    // Output file setup
    initial begin
        $dumpfile("ALU_dump.vcd"); // Specify VCD file name
        $dumpvars(0, ALU_Testbench); // Dump variables for waveform
    end

    // Testbench stimuli
    initial begin
        // Test values
        A = 32'h0000_0001; // Set input A to 1
        B = 32'h0000_0002; // Set input B to 2
        ALUControl = 3'b000; // Set ALU control to Addition operation
        #10; // Wait for 10 time units
        ALUControl = 3'b001; // Set ALU control to Subtraction operation
        #10; // Wait for 10 time units
        ALUControl = 3'b010; // Set ALU control to Bitwise AND operation
        #10; // Wait for 10 time units
        ALUControl = 3'b011; // Set ALU control to Bitwise OR operation
        #10; // Wait for 10 time units
        ALUControl = 3'b100; // Set ALU control to Bitwise XOR operation
        #10; // Wait for 10 time units
        ALUControl = 3'b101; // Set ALU control to Sign extension operation
        #10; // Wait for 10 time units
        // Add more tests here
        $finish; // Finish simulation
    end

endmodule
