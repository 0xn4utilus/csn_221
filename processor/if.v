module instructionFetch(clk,
                        PC,
                        branchPresent,
                        branchOffset,
                        instruction,
                        write);
    input clk,branchPresent,write;
    wire start;
    output [31:0] PC;
    input [31:0] branchOffset;
    output [31:0] instruction;
    reg [31:0] PCReg,newPCreg=32'd0;
    
    assign start = 1'b1;
    
    assign PC = newPCreg;
    
    instructionMem instructionMem(
    .PC(PC),
    .instruction(instruction)
    );
    
    always @(posedge clk) begin
        if (write)
            case(branchPresent)     //if branchPresent == 1, then newPC = PC + branchOffset
                1'b0: PCReg = PC+32'b00000000000000000000000000000100;
                1'b1: PCReg = PC+branchOffset;
            endcase
        else
            PCReg = PC;


            $display("%0d",newPCreg);
            $display("%0d",PC);
            #2 $display("%0b",instruction);
    end
    
    always @(negedge clk) begin
        newPCreg = PCReg;
    end
    
endmodule
