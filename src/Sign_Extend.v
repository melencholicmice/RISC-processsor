/**
 * Sign_Extend module
 * 
 * This module extends the immediate value to 32 bits based on the ImmSrc control signal.
 * 
 * Inputs:
 *   In (input [31:0]): Immediate value to be extended
 *   ImmSrc (input): Immediate source control signal
 * 
 * Outputs:
 *   Imm_Ext (output [31:0]): Extended immediate value
 */
module Sign_Extend (
    input [31:0] In,    // Immediate value to be extended
    input ImmSrc,       // Immediate source control signal
    output [31:0] Imm_Ext  // Extended immediate value
);

    // Sign extension based on ImmSrc control signal
    assign Imm_Ext = (ImmSrc == 1'b1) ? {{20{In[31]}}, In[31:25], In[11:7]} : {{20{In[31]}}, In[31:20]};

endmodule
