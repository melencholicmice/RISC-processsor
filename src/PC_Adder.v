/**
 * PC_Adder module
 * 
 * This module adds two 32-bit input values to produce a 32-bit sum.
 * 
 * Inputs:
 *   a (input [31:0]): First input value
 *   b (input [31:0]): Second input value
 * 
 * Outputs:
 *   c (output [31:0]): Sum of the two input values
 */
module PC_Adder (
    input [31:0] a,  // First input value
    input [31:0] b,  // Second input value
    output [31:0] c  // Sum of the two input values
);

    // Adding two 32-bit input values
    assign c = a + b;
    
endmodule
