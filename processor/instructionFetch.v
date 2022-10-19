module instructionFetch(clk,
                        PC,
                        newPC,
                        instruction,
                        write,
                        PCBranchD);
    input clk,write;
    wire reset;
    input [31:0] PC;
    output [31:0] newPC,instruction,PCreg;
    reg [31:0] newPCReg;
    output [31:0] PCBranchD;
    assign reset = 1'b1;
    
    ProgramCounter PC_register(
    .inpPC(newPC),
    .outPC(PC),
    .writeEnable(write)
    );
    
    instructionMem instructionMem(
    .PC(PCreg),
    .instruction(instruction)
    );
    
    instructionDecode instruction_Decode(
        .hazardDetected(hazardDetected),
        .PCSrcD(PCSrcD),
        .PCBranchD(PCBranchD)
    );
    always @(posedge clk) begin
        if (!hazardDetected) begin
            if (write)
                case(PCSrcD)     //if branchPresent == 1, then newPC = PC + branchOffset
                    1'b0: newPCReg = PC+32'b00000000000000000000000000000100;
                    1'b1: newPCReg = PCBranchD;
                endcase
            else
                newPCReg = PC;
                $display("%0b",newPCReg);
                $display("%0b",newPC);
        end
    end
    
    // always @(negedge clk) begin
    //     assign PC = newPCReg;
    // end
    assign newPC = newPCReg;
    assign PCreg = PC;
endmodule
