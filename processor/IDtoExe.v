module IDtoExe(clk,
               regWriteD,
               memToRegD,
               memWriteD,
               ALUControlD,
               ALUSrcD,
               regDstD,
               data1,
               data2,
               data11,
               data22,
               regWriteE,
               memToRegE,
               memWriteE,
               ALUControlE,
               ALUSrcE,
               regDstE,
               RsD,
               RtD,
               RdD,
               signImmD,
               RsE,
               RtE,
               RdE,
               signImmE,
               ALUOp,
               ALUOpE);
    input  regWriteD,memToRegD,memWriteD,ALUSrcD,regDstD,clk;
    input [3:0] ALUControlD;
    input [1:0] ALUOp;
    input [4:0] RsD,RtD,RdD;
    input [31:0]signImmD,data1,data2;
    output reg regWriteE,memToRegE,memWriteE,ALUSrcE,regDstE;
    output reg [1:0] ALUOpE;
    output reg[3:0] ALUControlE;
    output reg [4:0] RsE,RtE,RdE;
    output reg [31:0]signImmE,data11,data22;
    
    always@(negedge clk) begin
        regWriteE   <= regWriteD;
        memToRegE   <= memToRegD;
        memWriteE   <= memWriteD;
        ALUControlE <= ALUControlD;
        ALUSrcE     <= ALUSrcD;
        regDstE     <= regDstD;
        RsE         <= RsD;
        RtE         <= RtD;
        RdE         <= RdD;
        data11      <= data1;
        data22      <= data2;
        signImmE <= signImmD;
        ALUOpE   <= ALUOp;
    end
    
endmodule
