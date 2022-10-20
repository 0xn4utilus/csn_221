`timescale 1ns/1ns

module testbench ();
    reg clk;
    wire writeEnable,readEnable,regWriteW,flagOutput;
    wire [31:0] valueInput,valueOutput;
    wire [4:0] index;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk                  = 1;
        repeat(5000) #50 clk = ~clk;
    end
    
    assign regWriteW   = 1'b0;
    assign writeEnable = 1'b0;
    assign readEnable  = 1'b1;
    assign valueInput  = 32'b00000000000000000000000000000010;
    assign index       = 5'b00001;
    //   always @(*) begin
    //     $display("%0d",valueOutput);
    // end
    registerFile registerFile(clk, index, valueInput, valueOutput, readEnable, writeEnable, regWriteW, flagOutput);
endmodule

//unable to read register file other things passed test