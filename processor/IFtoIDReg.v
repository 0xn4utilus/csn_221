module IFtoIDReg(instruction,
                 instructionReg,
                 clk,
                 reset,
                 PCReg,
                 outPC);
    input [31:0] instruction;
    input [31:0] outPC;
    input clk;
    output reg [31:0] instructionReg;
    input reset;
    output reg [31:0] PCReg;
    
    
    instructionFetch instructionFetch(
    .instruction(instruction),
    .PC(outPC)
    );
    
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
        instructionReg <= IFtoIDReg_in;
        PCReg          <= PC_in;
    end
    // assign instructionReg = instruction;
    
endmodule
