/*
 * Multiplexer (Mux)
 * 
 * This module implements a 32-bit multiplexer.
 * 
 * Module Inputs:
 *   a, b: Input data
 *   s: Select line
 * 
 * Module Output:
 *   c: Output data
 */
module Mux(
    input [31:0] a, b,  // Input data
    input s,            // Select line
    output [31:0] c     // Output data
);

    // Multiplexer functionality
    assign c = (~s) ? a : b;

endmodule
