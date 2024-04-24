/**
 * Register_File module
 *
 * This module implements a register file that contains 32 32-bit registers. It supports read and write operations.
 *
 * Inputs:
 *   clk (input): Clock signal
 *   rst (input): Reset signal
 *   WE3 (input): Write enable signal for register A3
 *   A1 (input [4:0]): Address for register read operation 1
 *   A2 (input [4:0]): Address for register read operation 2
 *   A3 (input [4:0]): Address for register write operation
 *   WD3 (input [31:0]): Data to be written into register A3
 *
 * Outputs:
 *   RD1 (output [31:0]): Data read from register A1
 *   RD2 (output [31:0]): Data read from register A2
 */
module Register_File (
    input clk,       // Clock signal
    input rst,       // Reset signal
    input WE3,       // Write enable signal for register A3
    input [4:0] A1,  // Address for register read operation 1
    input [4:0] A2,  // Address for register read operation 2
    input [4:0] A3,  // Address for register write operation
    input [31:0] WD3,  // Data to be written into register A3
    output [31:0] RD1, // Data read from register A1
    output [31:0] RD2  // Data read from register A2
);

    // Declare 32 32-bit registers
    reg [31:0] Register [31:0];

    // Write operation
    always @ (posedge clk) begin
        if (WE3)
            Register[A3] <= WD3;
    end

    // Read operations
    assign RD1 = (~rst) ? 32'd0 : Register[A1];
    assign RD2 = (~rst) ? 32'd0 : Register[A2];

    // Initialize some registers with values
    initial begin
        // for first
        Register[9] = 32'h00000020;
        // for 0062E233 and
        Register[6] = 32'h00000002;
        Register[5] = 32'h00000003;


    end

endmodule
