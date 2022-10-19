`timescale 1ns/1ns

module testbench ();
    reg clk;
    wire RegWriteD,MemToRegD,MemWriteD,ALUSrcD,RegDstD,BranchD;
    wire [1:0] ALUOp;
    wire [3:0] ALUControlD;
    wire [31:0] instruction;
    
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk                  = 1;
        repeat(5000) #50 clk = ~clk;
    end
    
    assign instruction = 32'b00000000010000110000100000100000;

    controlUnit controlUnit(clk, instruction, RegWriteD, MemToRegD, MemWriteD, ALUControlD, ALUSrcD, RegDstD, BranchD, ALUOp);
    
endmodule
