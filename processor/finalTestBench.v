module finalTestBench();
    reg clk;
    wire rst;
    
    
    initial begin
        
        $dumpfile("testbenchfinal.vcd");
        $dumpvars(0,finalTestBench);
        clk               = 1;
        repeat(500) #50 clk = ~clk;
    end
    assign rst = 1'b0;

    topLevel topLevel(
    .clk(clk),
    .rst(rst)
    );
endmodule
