`timescale 1ns/1ns

module testbench();
    reg clk;
    wire RegWriteM, MemToRegM, WriteRegM;
    wire MemWriteM;
    wire [31:0] WriteDataM;
    wire  active ;
    wire  [31:0] address_reg;
    wire[31:0] address,AluOutM;

 initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk = 1;
        repeat(5000) #50 clk = ~clk;
    end
    assign RegWriteM =1'b0;
     assign MemToRegM =1'b0;
     assign WriteRegM =1'b0;
      assign MemWriteM =1'b0;
      assign active =1'b1;
      assign WriteDataM=32'b00000000000000000000000000000001;
      assign address_reg=32'b00000000000000000000000000000001;
      assign ALUOutM=32'b00000000000000000000000000000001;
      
      memory  memory(clk,
                          RegWriteM,
                          MemToRegM,
                          MemWriteM,
                          AluOutM,
                          WriteDataM,
                          WriteRegM,
                          active);
      
endmodule