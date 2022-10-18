module IFtoIDReg(instruction,
                 instructionReg,
                 clk,
                 reset,PCreg,outPC);
    input [31:0] instruction;
    input [31:0] outPC;
    input clk;
    output reg [31:0] instructionReg;
    input reset;
    output reg [31:0] PCreg;
    
    
    instructionFetch instructionFetch(
    .instruction(instruction)
    
    );
    ProgramCounter ProgramCounter (
       .outPC(outPC) 
    );
    
    reg [31:0]IFtoIDReg_in;
    reg[31:0] PC_in;
    always@(negedge clk) begin
        if (reset) begin 
         IFtoIDReg_in <= 0;
         PC_in<=0;
        end 
        else begin 
          IFtoIDReg_in      <= instruction;
          PC_in<=outPC+32'd4;
        end 
    end
    always @(posedge clk) begin
        instructionReg <= IFtoIDReg_in;
        PCreg<=PC_in;
    end
    // assign instructionReg = instruction;
    
endmodule
