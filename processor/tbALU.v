`timescale 1ns/1ns

module testbench ();
    wire flag, branchD;
    wire [31:0] input1, input2, alu_out;
    wire [4:0] ex_cmd;
    wire [1:0] ALUOp;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
    end

    assign flag = 1'b1;
    assign branchD = 1'b1;
    assign input1 = 32'b00000000000000000000000000000001;
    assign input2 = 32'b00000000000000000000000000000100;
    assign ex_cmd = 4'b0010;
    assign ALUOp = 2'd2;

    ALU ALU(input1, input2, flag, ex_cmd, alu_out, ALUOp, branchD);
endmodule