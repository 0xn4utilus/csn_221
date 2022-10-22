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
    
    // reg [31:0]IFtoIDReg_in;
    // reg[31:0] PC_in;
    always @(negedge clk) begin
        
        //    begin
        //         IFtoIDReg_in <= instruction;
        //         PC_in        <= outPC+32'd4;
        //     end
        #0.01 instructionD <= instruction;
        PCReg        <= outPC+32'd4;
    end
    // assign instructionD = instruction;
    
endmodule
