module writeBack(memToRegW,
                 RegWriteW,
                 readDataW,
                 ALUOutW,
                 ResultW,
                 clk);
    input memToRegW,clk,RegWriteW;
    input [31:0] ALUOutW,readDataW;
    input [4:0] WriteRegW;
    output [31:0] ResultW;
    reg  [31:0] ResultW_reg;
    
    registerFile regFile(
    .clk(clk),
    .index(WriteRegW),
    .valueInput(ResultW),
    .writeEnable(RegWriteW)
    );
    
    always@(posedge clk) begin
        if (memToRegW)begin
            ResultW_reg <= readDataW;
        end
        else begin
            ResultW_reg <= ALUOutW;
        end
    end
    assign ResultW = ResultW_reg;
    
    
endmodule
