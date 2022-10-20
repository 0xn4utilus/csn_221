`timescale 1ns/1ns

module testbench();
    reg clk;
    wire RegWriteM, MemToRegM, WriteRegM;
    wire MemWriteM;
    wire [31:0] writeDataM,readDataM;
    wire  active ;
    wire  [31:0] address_reg;
    wire[31:0] address,ALUOutM;
    
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk                  = 1;
        repeat(5000) #50 clk = ~clk;
    end
    assign RegWriteM   = 1'b1;
    assign MemToRegM   = 1'b1;
    assign WriteRegM   = 1'b0;
    assign MemWriteM   = 1'b0;
    assign writeDataM  = 32'b00000000000000000000000000000001;
    assign address_reg = 32'b0000000000000000000000000000000;
    assign ALUOutM     = 32'b00000000000000000000000000000001;
    
    // always @(*) begin
    //     $display("%0b",readDataM);
    // end
    
    memory  memory(clk,
    RegWriteM,
    MemToRegM,
    MemWriteM,
    ALUOutM,
    writeDataM,
    WriteRegM,
    active,
    readDataM);
    
endmodule

//test pass but we are not accessing memory right now