module ProgramCounter(clk,inpPC,
                      outPC,
                      writeEnable);
    input writeEnable,clk;
    input [31:0] inpPC;
    output wire [31:0] outPC;
    
    reg[31:0] outPCReg;
    always @(negedge clk) begin
        case(writeEnable)
            1'b1: outPCReg = inpPC;
        endcase
    end
    assign outPC = outPCReg;
    
endmodule
