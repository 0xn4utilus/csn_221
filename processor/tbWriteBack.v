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
        clk                  = 1;
        repeat(5000) #50 clk = ~clk;
    end
    assign memToRegW = 1'b0;
    assign RegWriteW = 1'b1;
    assign ALUOutW   = 32'b00000000000000000000000000000011;
    assign readDataW = 32'b00000000000000000000000000000001;
    assign WriteRegW = 5'b00101;
    writeBack writeBack(memToRegW,RegWriteW, readDataW, ALUOutW,ResultW,clk);
    always @(*) begin
        $display("%0d",WriteRegW);
    end
    
endmodule
//test passed