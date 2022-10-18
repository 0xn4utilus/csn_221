module ProgramCounter(inpPC,outPC,writeEnable);
    input writeEnable;
    input [31:0] inpPC;
    output reg [31:0] outPC=0;
        
  always @(*) begin
    case(writeEnable)
        1'b1: outPC <= inpPC;
    endcase
  end



endmodule