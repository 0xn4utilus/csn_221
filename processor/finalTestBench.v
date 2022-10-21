module finalTestBench();
    reg clk;
    wire rst;
    
    initial begin
        $dumpfile("testbenchfinal.vcd");
        $dumpvars(0,finalTestBench);
        clk               = 1;
        repeat(50) #50 clk = ~clk;
    end
    assign rst = 1'b0;
    always@(*)begin
        $display("%0d",rst);
    end
    topLevel topLevel(
    .clk(clk),
    .rst(rst)
    );
endmodule
