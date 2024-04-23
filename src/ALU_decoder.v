`timescale 1ns / 1ps

/**
 * ALU_Decoder module
 * 
 * This module decodes control signals for an ALU (Arithmetic Logic Unit) based on the ALUOp, funct3, 
 * funct7, and op inputs and provides the appropriate control signals for various ALU operations.
 * 
 * Inputs:
 * ----------------------------------------------------------------------------------------------
 * | Name    | Description                  | Size    | Range / Values                             |
 * |---------|------------------------------|---------|---------------------------------------------|
 * | ALUOp   | 2-bit ALU operation code     | [1:0]   |                                             |
 * | funct3  | 3-bit function code          | [2:0]   |                                             |
 * | funct7  | 7-bit function code          | [6:0]   |                                             |
 * | op      | 7-bit operation code         | [6:0]   |                                             |
 * ----------------------------------------------------------------------------------------------
 * 
 * Outputs:
 * ------------------------------------------------------------------------------------------
 * | Name        | Description                | Size    | Range / Values                        |
 * |-------------|----------------------------|---------|----------------------------------------|
 * | ALUControl  | 3-bit ALU control signal   | [2:0]   |                                        |
 * ------------------------------------------------------------------------------------------
 * 
 * ALUOp Values:
 * ----------------------------------------
 * | ALUOp Value | Description              |
 * |-------------|--------------------------|
 * | 2'b00       | R-type instruction      |
 * | 2'b01       | Load instruction        |
 * | 2'b10       | I-type instruction      |
 * ----------------------------------------
 * 
 * ALUControl Values:
 * ---------------------------------------------------------------------------------------------
 * | ALUOp     | funct3   | funct7[5]  | op[5] | ALUControl | Description                      |
 * |-----------|----------|------------|-------|------------|----------------------------------|
 * | 2'b00     | 3'b000   | 1'b1       |       | 3'b001     | ADD                              |
 * | 2'b00     | 3'b000   | 1'b0       |       | 3'b000     | AND                              |
 * | 2'b00     | 3'b010   |            |       | 3'b101     | SUB                              |
 * | 2'b00     | 3'b110   |            |       | 3'b011     | OR                               |
 * | 2'b00     | 3'b111   |            |       | 3'b010     | XOR                              |
 * | 2'b01     |          |            |       | 3'b001     | ADDI                             |
 * | 2'b10     | 3'b000   | 1'b1       |       | 3'b001     | ADD                              |
 * | 2'b10     | 3'b000   | 1'b0       |       | 3'b000     | AND                              |
 * | 2'b10     | 3'b010   |            |       | 3'b101     | SUB                              |
 * | 2'b10     | 3'b110   |            |       | 3'b011     | OR                               |
 * | 2'b10     | 3'b111   |            |       | 3'b010     | XOR                              |
 * | Default   |          |            |       | 3'b000     | Default                          |
 * ---------------------------------------------------------------------------------------------
 */
module ALU_Decoder(
    input [1:0] ALUOp,       // 2-bit ALU operation code
    input [2:0] funct3,      // 3-bit function code
    input [6:0] funct7, op,  // 7-bit function code and operation code
    output reg [2:0] ALUControl  // 3-bit ALU control signal
);

    // R-type instruction decoding
    always @* begin
        case (ALUOp)
            2'b00: begin // R-type instruction
                case (funct3)
                    3'b000: ALUControl = (({op[5], funct7[5]} == 2'b11) ? 3'b001 : 3'b000);
                    3'b010: ALUControl = 3'b101;
                    3'b110: ALUControl = 3'b011;
                    3'b111: ALUControl = 3'b010;
                    default: ALUControl = 3'b000;
                endcase
            end
            2'b01: ALUControl = 3'b001; // Load instruction
            2'b10: begin // I-type instruction
                case (funct3)
                    3'b000: ALUControl = (({op[5], funct7[5]} == 2'b11) ? 3'b001 : 3'b000);
                    3'b010: ALUControl = 3'b101;
                    3'b110: ALUControl = 3'b011;
                    3'b111: ALUControl = 3'b010;
                    default: ALUControl = 3'b000;
                endcase
            end
            default: ALUControl = 3'b000; // Default value
        endcase
    end

endmodule
