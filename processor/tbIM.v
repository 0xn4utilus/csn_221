`timescale 1ns/1ns

module testbench ();
    wire [31:0] PC;
    wire instruction;
    // instructionFetch instructionFetch(clk,PC,newPC,branchPresent,branchOffset,instruction);
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        // clk                  = 1;
        // repeat(5000) #50 clk = ~clk ;
    end
    
    assign inpPC=32'b00000000000000100000000000000000;
    assign writeEnable = 1'b1;
    ProgramCounter pc(inpPC,outPC,writeEnable);
endmodule 

// test-> 