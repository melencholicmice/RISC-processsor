/*
 * Multiplexer Test Bench
 * 
 * This test bench verifies the functionality of the Mux module.
 * 
 * Module Inputs:
 *   a, b: Input data
 *   s: Select line
 * 
 * Module Output:
 *   c: Output data
 * 
 * Test Cases:
 *   1. Test with s = 0.
 *   2. Test with s = 1.
 * 
 * The waveform information is dumped into a VCD file named "Mux_TB.vcd".
 */

`timescale 1ns / 1ps
`include "Mux.v"

module Mux_TB;

    // Signals
    reg [31:0] a, b;
    reg s;
    wire [31:0] c;

    // Instantiate the Mux module
    Mux dut (
        .a(a),
        .b(b),
        .s(s),
        .c(c)
    );

    // Test cases
    initial begin
        // Test case 1: s = 0
        a = 32'h12345678;
        b = 32'h87654321;
        s = 0;
        #10;

        // Test case 2: s = 1
        s = 1;
        #10;

        // Finish the simulation
        $finish;
    end

    // Output file setup
    initial begin
        $dumpfile("Mux_TB.vcd");
        $dumpvars(0, Mux_TB);
    end

endmodule
