module memory (           clk,
                          ALUOutM,
                          active,
                          address,
                          memWriteM);
    input clk,memWriteM;

    output reg active = 1'b1;
    reg [31:0] address_reg;

    output [31:0] address;
    input [31:0] ALUOutM;

    // dataMemory dataMem(
    // .clk(clk),
    // .active(active),
    // .rw(memWriteM),
    // .inputMem(writeDataM),
    // .indexData(address),
    // .outputMem(readDataM)
    // );
    
    always @(posedge clk) begin
        
        case(memWriteM)
            1'b0: address_reg <= 31'b0;
            1'b1: address_reg <= ALUOutM;
        endcase
        
    end
    assign address = address_reg;
    
endmodule
