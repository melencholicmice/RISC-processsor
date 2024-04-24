/**
 * ALU (Arithmetic Logic Unit) module
 *
 * This module performs various arithmetic and logical operations based on the control signal:
 *   - Addition
 *   - Subtraction
 *   - Bitwise AND
 *   - Bitwise OR
 *   - Bitwise XOR
 *   - Zero extension
 *
 * Inputs:
 *   A, B (input [31:0]): Input operands, each 32 bits wide
 *   ALUControl (input [2:0]): 3-bit control signal for selecting ALU operation
 *
 * Outputs:
 *   Result (output reg [31:0]): Result of the ALU operation
 *   Carry (output wire): Carry flag
 *   OverFlow (output wire): Overflow flag
 *   Zero (output wire): Zero flag
 *   Negative (output wire): Negative flag
 *
 * Control Signal (ALUControl):
 *   ALUControl[2:0] | Operation
 *   ----------------|-----------------------------
 *          000      | Addition
 *          001      | Subtraction
 *          010      | Bitwise AND
 *          011      | Bitwise OR
 *          100      | Bitwise XOR
 *          101      | Zero extension
 *
 */

module ALU(
    input [31:0] A, B, // Inputs A and B, each 32 bits wide
    input [2:0] ALUControl, // 3-bit control signal for selecting ALU operation
    output wire Carry, OverFlow, Zero, Negative, // Output flags
    output reg [31:0] Result // Output of ALU operation
);

    wire Cout; // Carry out wire
    wire [31:0] Sum; // Wire for holding the sum of A and B


    // Carry out and sum calculation
    assign {Cout, Sum} = (ALUControl[0] == 1'b0) ? A + B : A + (~B) + 1;

    // ALU operation based on ALUControl
    always @(*) begin
        case (ALUControl)
            3'b000: Result = A + B; // Addition
            3'b001: Result = A - B; // Subtraction
            3'b010: Result = A & B; // Bitwise AND
            3'b011: Result = A | B; // Bitwise OR
            3'b100: Result = A ^ B; // Bitwise XOR
            3'b101: Result = {{31{Sum[31]}}, Sum}; // Zero extension
            default: Result = 32'b0; // Default to 0 if control is not recognized
        endcase
    end
    // Overflow calculation
    assign OverFlow = ((Sum[31] ^ A[31]) & (~((ALUControl[0] ^ B[31] ^ A[31]) & ~ALUControl[1])));

    // Carry calculation
    assign Carry = (~ALUControl[1]) & Cout;

    // Zero flag calculation
    assign Zero = &(~Result);

    // Negative flag calculation
    assign Negative = Result[31];

endmodule
