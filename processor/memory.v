module instructionMemory (clk,
                          RegWriteM,
                          MemToRegM,
                          MemWriteM,
                          AluOutM,
                          WriteDataM,
                          WriteRegM,
                          active);
    inout clk,RegWriteM, MemToRegM, WriteRegM;
    input MemWriteM;
    input [31:0] WriteDataM;
    output reg active = 1'b1;
    output reg [31:0] address_reg;
    output [31:0] address,AluOutM;
    
    dataMemory dataMem(
    .clk(clk),
    .active(active),
    .rw(MemWriteM),
    .inputMem(WriteDataM),
    .index(address)
    );
    
    always @(posedge clk) begin
        
        case(MemWriteM)
            1'b0: address_reg <= 31'b0;
            1'b1: address_reg <= AluOutM;
        endcase
        
    end
    assign address = address_reg;
    
endmodule
