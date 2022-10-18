module idToExe(clk,regWriteD,MemToRegD,MemWriteD,ALUcontrolID,ALUSrcD,RegDstD,data1,data2,data11,data22,
   regWriteE,MemToRegE,MemWriteE,ALUcontrolIE,ALUSrcE,RegDstE,
   RsD,RtD,RdD,signExtendedValue,RsE,RtE,RdE,signExtendedValue1
             );
  input  RegWriteD,MemToRegD,MemWriteD,ALUSrcD,RegDstD,clk;
input [4:0] RsE,RtE,RdE;
input [31:0]signExtendedValue,data1,data2;
output reg regWriteE,MemToRegE,MemWriteE,ALUcontrolIE,ALUsrcE,RegDstE;
output reg [4:0] RsE,RtE,RdE;
output [31:0]signExtendedValue1,data11,data22;

  always@(posedge clk) begin
        regWriteE= regWriteD;MemToRegE=MemToRegD;MemWriteE=MemWriteD;ALUcontrolIE=ALUcontrolID;ALUSrcE=ALUSrcD;RegDstE=RegDstD;
       RsE=RsD;RtE=RtD;RdE=RdD;data11=data1;data22=data2;
        signExtendedValue1=signExtendedValue;
  end

endmodule
