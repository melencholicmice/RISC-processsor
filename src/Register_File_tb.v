`timescale 1ns / 1ps
`include "Register_File.v"

module Register_File_tb;

    // Parameters
    parameter WIDTH = 32;     // Width of the data bus
    parameter NUM_REGS = 32;  // Number of registers

    // Inputs
    reg clk = 0;              // Clock signal
    reg rst = 1;              // Reset signal
    reg WE3 = 0;                  // Write enable signal for register A3
    reg [4:0] A1, A2, A3;    // Address for register read/write operation
    reg [WIDTH-1:0] WD3;     // Data to be written into register A3

    // Outputs
    wire [WIDTH-1:0] RD1, RD2;  // Data read from registers A1 and A2

    // Instantiate the Register_File module
    Register_File dut (
        .clk(clk),      // Connect clock signal
        .rst(rst),      // Connect reset signal
        .WE3(WE3),      // Connect write enable signal for register A3
        .A1(A1),        // Connect address for register read operation 1
        .A2(A2),        // Connect address for register read operation 2
        .A3(A3),        // Connect address for register write operation
        .WD3(WD3),      // Connect data to be written into register A3
        .RD1(RD1),      // Connect data read from register A1
        .RD2(RD2)       // Connect data read from register A2
    );

    // Clock generation
    always #5 clk = ~clk;  // Toggle clock every 5 time units

    // Test cases
    initial begin
        // Test case 1: Write to register 3
        rst = 1;
        WE3 = 1;
        A3 = 3;
        WD3 = 32'h0000000F;  // Write data 15 to register 3
        #10;

        // Test case 2: Read from register 3
        WE3 = 0;
        A3 = 3;
        #10;

        // Test case 3: Write to register 5
        WE3 = 1;
        A3 = 5;
        WD3 = 32'h0000FFFF;  // Write data 65535 to register 5
        #10;

        // Test case 4: Read from register 5
        WE3 = 0;
        A3 = 5;
        #10;

        // Test case 5: Write to register 6
        WE3 = 1;
        A3 = 6;
        WD3 = 32'h00000001;  // Write data 1 to register 6
        #10;

        // Test case 6: Read from register 6
        WE3 = 0;
        A3 = 6;
        #10;

        // Test case 7: Write to register 1
        WE3 = 1;
        A3 = 1;
        WD3 = 32'h0000ABCD;  // Write data 43981 to register 1
        #10;

        // Test case 8: Read from register 1
        WE3 = 0;
        A3 = 1;
        #10;

        rst = 0;
        WE3 = 1;
        A3 = 6;
        WD3 = 32'h00000001;  // Write data 1 to register 6
        #10;

        WE3 = 0;
        A3 = 6;
        #10;

        WE3 = 1;
        A3 = 1;
        WD3 = 32'h0000ABCD;  // Write data 43981 to register 1
        #10;

        // Test case 8: Read from register 1
        WE3 = 0;
        A3 = 1;
        #10;

        // Add more test cases here

        // Finish simulation
        $dumpfile("Register_File_tb.vcd");  // Dump VCD file
        $dumpvars(0, Register_File_tb);     // Dump variables
        #100;
        $finish;
    end

endmodule
