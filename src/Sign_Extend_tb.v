`timescale 1ns / 1ps
`include "Sign_Extend.v"

module Sign_Extend_tb;

    // Parameters
    parameter WIDTH = 32;

    // Inputs
    reg [31:0] In;
    reg ImmSrc;

    // Outputs
    wire [31:0] Imm_Ext;

    // Instantiate the Sign_Extend module
    Sign_Extend sign_extend(
        .In(In),        // Input immediate value to be extended
        .ImmSrc(ImmSrc),// Immediate source control signal
        .Imm_Ext(Imm_Ext)  // Extended immediate value
    );

    // Clock generation
    reg clk = 0;

    // Testbench
    initial begin
        // Open VCD file
        $dumpfile("Sign_Extend_tb.vcd");
        $dumpvars(0, Sign_Extend_tb);

        // Case 1: Positive number with ImmSrc = 0
        In = 32'h00000005;
        ImmSrc = 0;
        #10;

        // Case 2: Negative number with ImmSrc = 0
        In = 32'hFFFFFFFA;
        ImmSrc = 0;
        #10;

        // Case 3: Positive number with ImmSrc = 1
        In = 32'h00000005;
        ImmSrc = 1;
        #10;

        // Case 4: Negative number with ImmSrc = 1
        In = 32'hFFFFFFFA;
        ImmSrc = 1;
        #10;

        // Case 5: Zero with ImmSrc = 0
        In = 32'h00000000;
        ImmSrc = 0;
        #10;

        // Case 6: Zero with ImmSrc = 1
        In = 32'h00000000;
        ImmSrc = 1;
        #10;

        // Case 7: Positive number with ImmSrc = 1 (largest positive value)
        In = 32'h7FFFFFFF;
        ImmSrc = 1;
        #10;

        // Case 8: Negative number with ImmSrc = 1 (largest negative value)
        In = 32'h80000000;
        ImmSrc = 1;
        #10;

        // Add more test cases here

        $finish;
    end

endmodule
