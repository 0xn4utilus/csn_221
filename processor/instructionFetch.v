module instructionFetch(clk, PC, newPC, branchPresent, branchOffset, instruction,write);
    input clk,branchPresent,write;
    wire reset;
    input [31:0] PC,branchOffset;
    output [31:0] newPC,instruction,PCreg;
    reg [31:0] newPCReg;
    
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

    always @(posedge clk) begin
        if (write)
            case(branchPresent)     //if branchPresent == 1, then newPC = PC + branchOffset
                1'b0: newPCReg = PC+32'b00000000000000000000000000000100;
                1'b1: newPCReg = PC+branchOffset;
            endcase
        else
            newPCReg = PC;
            $display("%0b",newPCReg);
            $display("%0b",newPC);
    end    

    // always @(negedge clk ) begin
    //     assign PC = newPCReg;
    // end
    assign newPC = newPCReg;
    assign PCreg = PC;    
endmodule
