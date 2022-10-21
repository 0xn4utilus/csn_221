module writeBack(memToRegW,
                 regWriteW,
                 readDataW,
                 ALUOutW,
                 resultW,
                 clk);
    input memToRegW,clk,regWriteW;
    input [31:0] ALUOutW,readDataW;
    input [4:0] WriteRegW;
    output [31:0] resultW;
    reg  [31:0] resultW_reg;
    
    registerFile regFile(
    .clk(clk),
    .index(WriteRegW),
    .valueInput(resultW),
    .writeEnable(regWriteW)
    );
    
    always@(posedge clk) begin
        if (memToRegW)begin
            resultW_reg <= readDataW;
        end
        else begin
            resultW_reg <= ALUOutW;
        end
    end
    assign resultW = resultW_reg;
    
endmodule
