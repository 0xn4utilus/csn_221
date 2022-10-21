module IFtoIDReg(instruction,
                 instructionD,
                 clk,
                 reset,
                 PCReg,
                 outPC);
    input [31:0] instruction;
    input [31:0] outPC;
    input clk;
    input reset;

    output reg [31:0] instructionD;
    output reg [31:0] PCReg;
    
    
    // instructionFetch instructionFetch(
    // .instruction(instruction),
    // .PC(outPC)
    // );
    
    reg [31:0]IFtoIDReg_in;
    reg[31:0] PC_in;
    always @(posedge clk) begin
        if (reset) begin
            IFtoIDReg_in <= 0;
            PC_in        <= 0;
        end
        else begin
            IFtoIDReg_in <= instruction;
            PC_in        <= outPC+32'd4;
        end
        instructionD <= IFtoIDReg_in;
        PCReg          <= PC_in;
    end
    // assign instructionD = instruction;
    
endmodule