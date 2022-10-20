module memory (           clk,
                          RegWriteM,
                          MemToRegM,
                          MemWriteM,
                          ALUOutM,
                          writeDataM,
                          WriteRegM,
                          active,
                          readDataM);
    input clk,RegWriteM, MemToRegM, WriteRegM, MemWriteM;
    input [31:0] writeDataM;
    output reg active = 1'b1;
    output reg [31:0] address_reg;
    output[31:0] readDataM;
    output [31:0] address;
    inout [31:0] ALUOutM;
    
    dataMemory dataMem(
    .clk(clk),
    .active(active),
    .rw(MemWriteM),
    .inputMem(writeDataM),
    .indexData(address),
    .outputMem(readDataM)
    );
    
    always @(posedge clk) begin
        
        case(MemWriteM)
            1'b0: address_reg <= 31'b0;
            1'b1: address_reg <= ALUOutM;
        endcase
        
    end
    assign address = address_reg;
    
endmodule
