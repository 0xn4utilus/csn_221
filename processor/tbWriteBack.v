`timescale 1ns/1ns

module testbench();
    reg clk;
    wire  memToRegW,RegWriteW;
    wire [31:0] ALUOutW,readDataW;
    wire [4:0] WriteRegW;
    wire [31:0] ResultW;
    // wire  [31:0] ResultW_reg;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk  = 1;
        repeat(5000) #50 clk = ~clk;
    end
   assign memToRegw =1'b0;
   assign RegWriteW=1'b0;
   assign ALUOutW=32'b00000000000000000000000000000000;
    assign readDataW=32'b00000000000000000000000000000000;
    assign WriteRegW = 4'b0000;
     assign ResultW=32'b00000000000000000000000000000000;
writeBack writeBack(memToRegW,RegWriteW, readDataW, ALUOutW,ResultW,clk);


endmodule
