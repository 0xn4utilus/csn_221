module instructionFetch(clk,
                        PC,
                        instruction,
                        PCbranchD,
                        PCSrcD,
                        hazardDetected);
    input clk;
    
    output [31:0] PC;
    output [31:0] instruction;
    reg [31:0] PCReg = 32'd0,newPCreg = 32'd0;
    input hazardDetected,PCSrcD;
    input [31:0] PCbranchD;
    
    assign PC = newPCreg;
    
    // instructionMem instructionMem(
    // .PC(PC),
    // .instruction(instruction)
    // );
    
    
    always @(*) begin
        $display("%0d",hazardDetected);
        
    end
    always @(posedge clk) begin
        
        // if (!hazardDetected)
        //     case(PCSrcD)     //if branchPresent == 1, then newPC = PC + branchOffset
        //         1'b0: PCReg = PC+32'b00000000000000000000000000000100;
        //         1'b1: PCReg = PCbranchD;
        //     endcase
        // else
        //     begin
        //     PCReg = PC-32'b00000000000000000000000000000100;
        //     end
        
        case (hazardDetected)
            1'b1:begin
                PCReg = PC-32'b00000000000000000000000000000100;
            end
            1'b0:begin
                case(PCSrcD)     //if branchPresent == 1, then newPC = PC + branchOffset
                    1'b0: PCReg <= PC+32'b00000000000000000000000000000100;
                    1'b1: PCReg <= PCbranchD;
                endcase
                #48 newPCreg = PCReg;
            end
        endcase
        
        
        // $display("%0d",newPCreg);
        // $display("%0d",PC);
        // #2 $display("%0b",instruction);
    end
    
    // always @(negedge clk) begin
    //     newPCreg = PCReg;
    // end
    
endmodule
