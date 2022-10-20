module instructionExecution (clk,
                             RegWriteE,
                             MemToRegE,
                             MemWriteE,
                             ALUControlE,
                             ALUOpE,
                             ALUSrcE,
                             RegDstE,
                             SignImmE,
                             RsE,
                             RtE,
                             RdE,
                             writeRegE,
                             AluOutE,
                             value1,
                             value2);

    input clk,ALUSrcE,RegDstE;
    inout RegWriteE,MemToRegE,MemWriteE;
    input [4:0] RsE,RtE,RdE;
    input [1:0] ALUOpE;
    input [3:0] ALUControlE;                                                                                        
    output reg [4:0] writeRegE;
    reg [31:0] SrcAE,SrcBE;
    output [31:0] AluOutE;
    input [31:0] value1,value2,SignImmE;
    output reg [31:0] WriteDataE;
    
    ALU ALU(
    .input1(SrcAE),
    .input2(SrcBE),
    .ex_cmd(ALUControlE),
    .alu_out(AluOutE),
    .ALUOp(ALUOpE)
    );
    
    always @(posedge clk) begin
        SrcAE      <= value1;
        WriteDataE <= value2;
        case (ALUSrcE)
            1'b0: SrcBE <= value2;
            1'b1: SrcBE <= SignImmE;
        endcase
        
        case (RegDstE)
            1'b0: writeRegE <= RtE;
            1'b1: writeRegE <= RdE;
        endcase
        
    end
endmodule
