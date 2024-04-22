`timescale 1ns / 1ps
`include "Single_Cycle_Top.v"

module Single_Cycle_Top_Tb ();

    reg clk = 1'b0;
    reg rst = 1'b1;

    Single_Cycle_Top Single_Cycle_Top (
        .clk(clk),
        .rst(rst)
    );

    initial begin
        $dumpfile("Single_Cycle_Top_tb.vcd");
        $dumpvars(0);

        // Load the memory with the specified instructions
        $readmemh("memfile.hex", Single_Cycle_Top.Instruction_Memory.mem);

        // Run the clock for initialization
        repeat(10) begin
            #5 clk = ~clk;
        end

        // Reset the system
        rst = 0;
        #10;
        rst = 1;
        #10;

        // Additional test cases
        // Test Case 1
        // Add
        $display("************ Test Case 1 ************");
        $display("Test Case 1: Add");
        $display("Instruction: 0x0062E3B3 (ADD R1, R2, R3)");
        $display("Expected: R1 = R2 + R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 2
        // Addi
        $display("************ Test Case 2 ************");
        $display("Test Case 2: Add Immediate");
        $display("Instruction: 0x0062F433 (ADDI R1, R2, 19)");
        $display("Expected: R1 = R2 + 19");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 3
        // Load
        $display("************ Test Case 3 ************");
        $display("Test Case 3: Load");
        $display("Instruction: 0x0062E3B3 (LD R1, R2, 19)");
        $display("Expected: R1 = Mem[R2 + 19]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 4
        // Store
        $display("************ Test Case 4 ************");
        $display("Test Case 4: Store");
        $display("Instruction: 0x0062E3B3 (ST R1, R2, 19)");
        $display("Expected: Mem[R2 + 19] = R1");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 5
        // Branch
        $display("************ Test Case 5 ************");
        $display("Test Case 5: Branch");
        $display("Instruction: 0x0062E3B3 (BEQ R1, R2, 19)");
        $display("Expected: PC = PC + 19 (if R1 == R2)");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 6
        // Jump
        $display("************ Test Case 6 ************");
        $display("Test Case 6: Jump");
        $display("Instruction: 0x0062E3B3 (JAL 19)");
        $display("Expected: PC = PC + 19");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 7
        // Immediate Operation
        $display("************ Test Case 7 ************");
        $display("Test Case 7: Immediate Operation");
        $display("Instruction: 0x0062E3B3 (ADDI R1, R2, 19)");
        $display("Expected: R1 = R2 + 19");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 8
        // Load-Use Hazard
        $display("************ Test Case 8 ************");
        $display("Test Case 8: Load-Use Hazard");
        $display("Instructions: LD R1, R2, 19");
        $display("              ADD R3, R1, R4");
        $display("Expected: R1 = Mem[R2 + 19], R3 = R1 + R4");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 9
        // R-Type Instruction
        $display("************ Test Case 9 ************");
        $display("Test Case 9: R-Type Instruction");
        $display("Instruction: 0x0062E3B3 (ADD R1, R2, R3)");
        $display("Expected: R1 = R2 + R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 10
        // Immediate Jump
        $display("************ Test Case 10 ************");
        $display("Test Case 10: Immediate Jump");
        $display("Instruction: 0x0062E3B3 (JAL 19)");
        $display("Expected: PC = PC + 19");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 11
        // Branch Backward
        $display("************ Test Case 11 ************");
        $display("Test Case 11: Branch Backward");
        $display("Instruction: 0x0062E3B3 (BEQ R1, R2, -19)");
        $display("Expected: PC = PC - 19 (if R1 == R2)");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 12
        // Zero Immediate
        $display("************ Test Case 12 ************");
        $display("Test Case 12: Zero Immediate");
        $display("Instruction: 0x0062E3B3 (ADDI R1, R0, 0)");
        $display

("Expected: R1 = 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 13
        // Negative Immediate
        $display("************ Test Case 13 ************");
        $display("Test Case 13: Negative Immediate");
        $display("Instruction: 0x0062E3B3 (ADDI R1, R0, -10)");
        $display("Expected: R1 = -10");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 14
        // Positive Immediate
        $display("************ Test Case 14 ************");
        $display("Test Case 14: Positive Immediate");
        $display("Instruction: 0x0062E3B3 (ADDI R1, R0, 10)");
        $display("Expected: R1 = 10");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 15
        // Load Upper Immediate
        $display("************ Test Case 15 ************");
        $display("Test Case 15: Load Upper Immediate");
        $display("Instruction: 0x0062E3B3 (LUI R1, 100)");
        $display("Expected: R1 = 100 << 12");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 16
        // And Immediate
        $display("************ Test Case 16 ************");
        $display("Test Case 16: And Immediate");
        $display("Instruction: 0x0062E3B3 (ANDI R1, R2, 100)");
        $display("Expected: R1 = R2 & 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 17
        // Or Immediate
        $display("************ Test Case 17 ************");
        $display("Test Case 17: Or Immediate");
        $display("Instruction: 0x0062E3B3 (ORI R1, R2, 100)");
        $display("Expected: R1 = R2 | 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 18
        // Xor Immediate
        $display("************ Test Case 18 ************");
        $display("Test Case 18: Xor Immediate");
        $display("Instruction: 0x0062E3B3 (XORI R1, R2, 100)");
        $display("Expected: R1 = R2 ^ 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 19
        // Set Less Than Immediate
        $display("************ Test Case 19 ************");
        $display("Test Case 19: Set Less Than Immediate");
        $display("Instruction: 0x0062E3B3 (SLTI R1, R2, 100)");
        $display("Expected: R1 = (R2 < 100) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 20
        // Shift Left Logical Immediate
        $display("************ Test Case 20 ************");
        $display("Test Case 20: Shift Left Logical Immediate");
        $display("Instruction: 0x0062E3B3 (SLLI R1, R2, 2)");
        $display("Expected: R1 = R2 << 2");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 21
        // Shift Right Logical Immediate
        $display("************ Test Case 21 ************");
        $display("Test Case 21: Shift Right Logical Immediate");
        $display("Instruction: 0x0062E3B3 (SRLI R1, R2, 2)");
        $display("Expected: R1 = R2 >> 2");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 22
        // Shift Right Arithmetic Immediate
        $display("************ Test Case 22 ************");
        $display("Test Case 22: Shift Right Arithmetic Immediate");
        $display("Instruction: 0x0062E3B3 (SRAI R1, R2, 2)");
        $display("Expected: R1 = R2 >>> 2");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 23
        // NOP
        $display("************ Test Case 23 ************");
        $display("Test Case 23: NOP");
        $display("Instruction: 0x00000000 (NOP)");
        $display("Expected: No Operation Performed");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 24
        // Load Word
        $display("************ Test Case 24 ************");
        $display("Test Case 24: Load Word");
        $display("Instruction: 0x0062E3B3 (LW R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 25
        // Store Word
        $display("************ Test Case 25 ************");
        $display("Test Case 25: Store Word");
        $display("Instruction: 0x0062E3B3 (SW R1, R2, 100)");
        $display("Expected: Mem[R2 + 100] = R1");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 26
        // Set Less Than
        $display("************ Test Case 26 ************");
        $display("Test Case 26: Set Less Than");
        $display("Instruction: 0x0062E3B3 (SLT R1, R2, R3)");
        $display("Expected: R1 = (R2 < R3) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 27
        // Set Less Than Immediate Unsigned
        $display("************ Test Case 27 ************");


 $display("Test Case 27: Set Less Than Immediate Unsigned");
        $display("Instruction: 0x0062E3B3 (SLTIU R1, R2, 100)");
        $display("Expected: R1 = (R2 <U 100) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 28
        // Set Less Than Unsigned
        $display("************ Test Case 28 ************");
        $display("Test Case 28: Set Less Than Unsigned");
        $display("Instruction: 0x0062E3B3 (SLTU R1, R2, R3)");
        $display("Expected: R1 = (R2 <U R3) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 29
        // XOR
        $display("************ Test Case 29 ************");
        $display("Test Case 29: XOR");
        $display("Instruction: 0x0062E3B3 (XOR R1, R2, R3)");
        $display("Expected: R1 = R2 ^ R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 30
        // Or
        $display("************ Test Case 30 ************");
        $display("Test Case 30: OR");
        $display("Instruction: 0x0062E3B3 (OR R1, R2, R3)");
        $display("Expected: R1 = R2 | R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 31
        // AND
        $display("************ Test Case 31 ************");
        $display("Test Case 31: AND");
        $display("Instruction: 0x0062E3B3 (AND R1, R2, R3)");
        $display("Expected: R1 = R2 & R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 32
        // Shift Right Logical
        $display("************ Test Case 32 ************");
        $display("Test Case 32: Shift Right Logical");
        $display("Instruction: 0x0062E3B3 (SRL R1, R2, R3)");
        $display("Expected: R1 = R2 >> R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 33
        // Shift Right Arithmetic
        $display("************ Test Case 33 ************");
        $display("Test Case 33: Shift Right Arithmetic");
        $display("Instruction: 0x0062E3B3 (SRA R1, R2, R3)");
        $display("Expected: R1 = R2 >>> R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 34
        // Shift Left Logical
        $display("************ Test Case 34 ************");
        $display("Test Case 34: Shift Left Logical");
        $display("Instruction: 0x0062E3B3 (SLL R1, R2, R3)");
        $display("Expected: R1 = R2 << R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 35
        // Branch Not Equal
        $display("************ Test Case 35 ************");
        $display("Test Case 35: Branch Not Equal");
        $display("Instruction: 0x0062E3B3 (BNE R1, R2, 100)");
        $display("Expected: PC = PC + 100 (if R1 != R2)");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 36
        // Jump and Link
        $display("************ Test Case 36 ************");
        $display("Test Case 36: Jump and Link");
        $display("Instruction: 0x0062E3B3 (JALR R1, R2, 100)");
        $display("Expected: R1 = PC + 4, PC = R2 + 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 37
        // Jump Register
        $display("************ Test Case 37 ************");
        $display("Test Case 37: Jump Register");
        $display("Instruction: 0x0062E3B3 (JALR R1, R2, R3)");
        $display("Expected: R1 = PC + 4, PC = R2 + R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 38
        // Set Less Than Immediate
        $display("************ Test Case 38 ************");
        $display("Test Case 38: Set Less Than Immediate");
        $display("Instruction: 0x0062E3B3 (SLTI R1, R2, 100)");
        $display("Expected: R1 = (R2 < 100) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 39
        // Set Less Than Immediate Unsigned
        $display("************ Test Case 39 ************");
        $display("Test Case 39: Set Less Than Immediate Unsigned");
        $display("Instruction: 0x0062E3B3 (SLTIU R1, R2, 100)");
        $display("Expected: R1 = (R2 <U 100) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;



        // Test Case 40
        // Set Less Than Unsigned
        $display("************ Test Case 40 ************");
        $display("Test Case 40: Set Less Than Unsigned");
        $display("Instruction: 0x0062E3B3 (SLTU R1, R2, R3)");
        $display("Expected: R1 = (R2 <U R3) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 41
        // Set Less Than
        $display("************ Test Case 41 ************");
        $display("Test Case 41: Set Less Than");
        $display("Instruction: 0x0062E3B3 (SLT R1, R2, R3)");
        $display("Expected: R1 = (R2 < R3) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 42
        // Set Less Than Unsigned
        $display("************ Test Case 42 ************");
        $display("Test Case 42: Set Less Than Unsigned");
        $display("Instruction: 0x0062E3B3 (SLTU R1, R2, R3)");
        $display("Expected: R1 = (R2 <U R3) ? 1 : 0");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 43
        // Shift Left Logical
        $display("************ Test Case 43 ************");
        $display("Test Case 43: Shift Left Logical");
        $display("Instruction: 0x0062E3B3 (SLL R1, R2, R3)");
        $display("Expected: R1 = R2 << R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 44
        // Shift Right Logical
        $display("************ Test Case 44 ************");
        $display("Test Case 44: Shift Right Logical");
        $display("Instruction: 0x0062E3B3 (SRL R1, R2, R3)");
        $display("Expected: R1 = R2 >> R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 45
        // Shift Right Arithmetic
        $display("************ Test Case 45 ************");
        $display("Test Case 45: Shift Right Arithmetic");
        $display("Instruction: 0x0062E3B3 (SRA R1, R2, R3)");
        $display("Expected: R1 = R2 >>> R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 46
        // Load Word
        $display("************ Test Case 46 ************");
        $display("Test Case 46: Load Word");
        $display("Instruction: 0x0062E3B3 (LW R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 47
        // Store Word
        $display("************ Test Case 47 ************");
        $display("Test Case 47: Store Word");
        $display("Instruction: 0x0062E3B3 (SW R1, R2, 100)");
        $display("Expected: Mem[R2 + 100] = R1");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 48
        // Load Byte
        $display("************ Test Case 48 ************");
        $display("Test Case 48: Load Byte");
        $display("Instruction: 0x0062E3B3 (LB R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 49
        // Load Halfword
        $display("************ Test Case 49 ************");
        $display("Test Case 49: Load Halfword");
        $display("Instruction: 0x0062E3B3 (LH R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 50
        // Store Halfword
        $display("************ Test Case 50 ************");
        $display("Test Case 50: Store Halfword");
        $display("Instruction: 0x0062E3B3 (SH R1, R2, 100)");
        $display("Expected: Mem[R2 + 100] = R1");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 51
        // Move
        $display("************ Test Case 51 ************");
        $display("Test Case 51: Move");
        $display("Instruction: 0x0062E3B3 (MV R1, R2)");
        $display("Expected: R1 = R2");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 52
        // NOP
        $display("************ Test Case 52 ************");
        $display("Test Case 52: NOP");
        $display("Instruction: 0x00000000 (NOP)");
        $display("Expected: No Operation Performed");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 53
        // Store Byte
        $display("************ Test Case 53 ************");
        $display("Test Case 53: Store Byte");
        $display("Instruction: 0x0062E3B3 (SB R1, R2, 100)");
        $display("Expected: Mem[R2 + 100] = R1");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 54
        // Jump Register Immediate
        $display("************ Test Case 54 ************");
        $display("Test Case 54: Jump Register Immediate");
        $display("Instruction: 0x0062E3B3 (JALR R1, R2, 100)");
        $display("Expected: R1 = PC + 4, PC = R2 + 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 55
        // Jump Register Immediate
        $display("************ Test Case 55 ************");
        $display("Test Case 55: Jump Register Immediate");
        $display("Instruction: 0x0062E3B3 (JALR R1, R2, R3)");
        $display("Expected: R1 = PC + 4, PC = R2 + R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 56
        // Load Byte Unsigned
        $display("************ Test Case 56 ************");
        $display("Test Case 56: Load Byte Unsigned");
        $display("Instruction: 0x0062E3B3 (LBU R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 57
        // Load Halfword Unsigned
        $display("************ Test Case 57 ************");
        $display("Test Case 57: Load Halfword Unsigned");
        $display("Instruction: 0x0062E3B3 (LHU R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 58
        // Load Word Unsigned
        $display("************ Test Case 58 ************");
        $display("Test Case 58: Load Word Unsigned");
        $display("Instruction: 0x0062E3B3 (LWU R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 59
        // Immediate Operation
        $display("************ Test Case 59 ************");
        $display("Test Case 59: Immediate Operation");
        $display("Instruction: 0x0062E3B3 (ADDI R1, R2, 19)");
        $display("Expected: R1 = R2 + 19");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 60
        // XOR Immediate
        $display("************ Test Case 60 ************");
        $display("Test Case 60: XOR Immediate");
        $display("Instruction: 0x0062E3B3 (XORI R1, R2, 100)");
        $display("Expected: R1 = R2 ^ 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 61
        // OR Immediate
        $display("************ Test Case 61 ************");
        $display("Test Case 61: OR Immediate");
        $display("Instruction: 0x0062E3B3 (ORI R1, R2, 100)");
        $display("Expected: R1 = R2 | 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 62
        // AND Immediate
        $display("************ Test Case 62 ************");
        $display("Test Case 62: AND Immediate");
        $display("Instruction: 0x0062E3B3 (ANDI R1, R2, 100)");
        $display("Expected: R1 = R2 & 100");
        clk = 1'b1;
        #10;
        clk =

1'b0;
        #10;

        // Test Case 63
        // Shift Left Logical Immediate
        $display("************ Test Case 63 ************");
        $display("Test Case 63: Shift Left Logical Immediate");
        $display("Instruction: 0x0062E3B3 (SLLI R1, R2, 2)");
        $display("Expected: R1 = R2 << 2");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 64
        // Shift Right Logical Immediate
        $display("************ Test Case 64 ************");
        $display("Test Case 64: Shift Right Logical Immediate");
        $display("Instruction: 0x0062E3B3 (SRLI R1, R2, 2)");
        $display("Expected: R1 = R2 >> 2");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 65
        // Shift Right Arithmetic Immediate
        $display("************ Test Case 65 ************");
        $display("Test Case 65: Shift Right Arithmetic Immediate");
        $display("Instruction: 0x0062E3B3 (SRAI R1, R2, 2)");
        $display("Expected: R1 = R2 >>> 2");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 66
        // Branch Not Equal
        $display("************ Test Case 66 ************");
        $display("Test Case 66: Branch Not Equal");
        $display("Instruction: 0x0062E3B3 (BNE R1, R2, 100)");
        $display("Expected: PC = PC + 100 (if R1 != R2)");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 67
        // Jump and Link
        $display("************ Test Case 67 ************");
        $display("Test Case 67: Jump and Link");
        $display("Instruction: 0x0062E3B3 (JALR R1, R2, 100)");
        $display("Expected: R1 = PC + 4, PC = R2 + 100");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 68
        // Jump Register
        $display("************ Test Case 68 ************");
        $display("Test Case 68: Jump Register");
        $display("Instruction: 0x0062E3B3 (JALR R1, R2, R3)");
        $display("Expected: R1 = PC + 4, PC = R2 + R3");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 69
        // Load Byte Unsigned
        $display("************ Test Case 69 ************");
        $display("Test Case 69: Load Byte Unsigned");
        $display("Instruction: 0x0062E3B3 (LBU R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 70
        // Load Halfword Unsigned
        $display("************ Test Case 70 ************");
        $display("Test Case 70: Load Halfword Unsigned");
        $display("Instruction: 0x0062E3B3 (LHU R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // Test Case 71
        // Load Word Unsigned
        $display("************ Test Case 71 ************");
        $display("Test Case 71: Load Word Unsigned");
        $display("Instruction: 0x0062E3B3 (LWU R1, R2, 100)");
        $display("Expected: R1 = Mem[R2 + 100]");
        clk = 1'b1;
        #10;
        clk = 1'b0;
        #10;

        // End simulation
        $finish;
    end

endmodule
