// array of 512 elements each of 32 bit named mem[n]

module dataMemory(clk,
                  active,
                  rw,
                  index,
                  outputMem,
                  inputMem);
    input clk, rw, active;
    input [31:0] index, inputMem;
    output [31:0] outputMem;
    reg [31:0] outputMemReg;
    
    reg[31:0] memData[511:0];
    
    integer i;
    
    initial begin
        // Note that ++ operator does not exist in Verilog !
        for (i = 0; i < 512; i = i + 1) begin
            memData[i] <= 32'b0;
        end
    end
    
    always @(posedge clk) begin
        if (active)                          //decides if read write instruction is received
            case(rw)                         //decides read or write
                1'b0: begin
                    outputMemReg = memData[index];
                end
                1'b1: begin
                    memData[index] <= inputMem;
                    outputMemReg = 32'b0;
                end
                
            endcase
            end
        
        assign outputMem = outputMemReg;           //we will need a mux to decide if we don't want data to be returnrd in case of input
        
        endmodule
