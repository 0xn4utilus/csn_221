module instructionFetch(clk,
                        PC,
                        instruction,
                        PCbranchD,
                        PCSrcD,
                        hazardDetected);
    input clk;
    
    output [31:0] PC;
    output [31:0] instruction;
    reg [31:0] PCReg,newPCreg = 32'd0;
    input hazardDetected,PCSrcD;
    input [31:0] PCbranchD;
    
    assign PC = newPCreg;
    
    // instructionMem instructionMem(
    // .PC(PC),
    // .instruction(instruction)
    // );
    
    always @(posedge clk) begin
        
        if (!hazardDetected)
            case(PCSrcD)     //if branchPresent == 1, then newPC = PC + branchOffset
                1'b0: PCReg = PC+32'b00000000000000000000000000000100;
                1'b1: PCReg = PCbranchD;
            endcase
        else
            PCReg = PC;
        
        
        // $display("%0d",newPCreg);
        // $display("%0d",PC);
        // #2 $display("%0b",instruction);
    end
    
    always @(negedge clk) begin
        newPCreg = PCReg;
    end
    
endmodule
