`timescale 1ns/1ns

module testbench ();
    reg clk;
    wire write,branchPresent;
    wire [31:0] PC,branchOffset;
    wire [31:0] newPC,instruction;
    
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk                  = 1;
        repeat(5) #50 clk = ~clk ;
    end


    assign branchOffset=32'b0;
    assign branchPresent=1'b0;
    assign write=1'b1;
    instructionFetch instructionFetch(clk,PC,branchPresent,branchOffset,instruction,write);
endmodule 

// test -> FAIL