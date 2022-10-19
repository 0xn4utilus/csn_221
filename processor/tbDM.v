`timescale 1ns/1ns

module testbench ();
    reg clk;
    wire active,rw;
    wire [31:0] index,inputMem,outputMem;
    
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk                  = 1;
        repeat(5000) #50 clk = ~clk;
    end
    
    assign active    = 1'b1;
    assign rw        = 1'b1;
    assign index     = 32'b00000000000000000000000000000001;
    assign inputMem  = 32'b00000000000000000000000000000100;
    
    dataMemory dataMemory(clk, active, rw, index, outputMem, inputMem);
endmodule
