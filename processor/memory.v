module memory (           clk,
                          regWriteM,
                          memToRegM,
                          memWriteM,
                          ALUOutM,
                          writeDataM,
                          writeRegM,
                          active,
                          readDataM);
    input clk,regWriteM, memToRegM,  memWriteM;
    input [31:0] writeDataM;
    output reg active = 1'b1;
    output reg [31:0] address_reg;
    output[31:0] readDataM;
    output [31:0] address;
    inout [31:0] ALUOutM;
    input [4:0] writeRegM;
    dataMemory dataMem(
    .clk(clk),
    .active(active),
    .rw(memWriteM),
    .inputMem(writeDataM),
    .indexData(address),
    .outputMem(readDataM)
    );
    
    always @(posedge clk) begin
        
        case(memWriteM)
            1'b0: address_reg <= 31'b0;
            1'b1: address_reg <= ALUOutM;
        endcase
        
    end
    assign address = address_reg;
    
endmodule
