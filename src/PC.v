/**
 * PC_Module module
 * 
 * This module represents the Program Counter (PC) in a processor. It updates the PC value based on the input PC_Next.
 * 
 * Inputs:
 *   clk (input): Clock signal
 *   rst (input): Reset signal
 *   PC_Next (input [31:0]): Next value of the Program Counter
 * 
 * Outputs:
 *   PC (output [31:0]): Current value of the Program Counter
 */
module PC_Module(
    input clk,              // Clock signal
    input rst,              // Reset signal
    input [31:0] PC_Next,  // Next value of the Program Counter
    output reg [31:0] PC   // Current value of the Program Counter
);

    always @(posedge clk) begin
        if (~rst)
            PC <= 32'b0;
        else
            PC <= PC_Next;
    end

endmodule
