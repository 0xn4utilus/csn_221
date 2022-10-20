module IDtoExe(clk,
               regWriteD,
               MemToRegD,
               MemWriteD,
               ALUControlD,
               ALUSrcD,
               RegDstD,
               data1,
               data2,
               data11,
               data22,
               regWriteE,
               MemToRegE,
               MemWriteE,
               ALUControlE,
               ALUSrcE,
               RegDstE,
               RsD,
               RtD,
               RdD,
               signExtendedValue,
               RsE,
               RtE,
               RdE,
               signExtendedValue1);
    input  regWriteD,MemToRegD,MemWriteD,ALUSrcD,RegDstD,clk;
    input [3:0] ALUControlD;
    input [4:0] RsD,RtD,RdD;
    input [31:0]signExtendedValue,data1,data2;
    output reg regWriteE,MemToRegE,MemWriteE,ALUSrcE,RegDstE;
    output reg[3:0] ALUControlE;
    output reg [4:0] RsE,RtE,RdE;
    output reg [31:0]signExtendedValue1,data11,data22;
    
    always@(posedge clk) begin
        regWriteE          = regWriteD;
        MemToRegE          = MemToRegD;
        MemWriteE          = MemWriteD;
        ALUControlE        = ALUControlD;
        ALUSrcE            = ALUSrcD;
        RegDstE            = RegDstD;
        RsE                = RsD;
        RtE                = RtD;
        RdE                = RdD;
        data11             = data1;
        data22             = data2;
        signExtendedValue1 = signExtendedValue;
    end
    
endmodule
