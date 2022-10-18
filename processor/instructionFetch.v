module instructionFetch(clk, PC, newPC, branchPresent, branchOffset, instruction);
    input clk,branchPresent;
    reg reset=1'b1;
    input [31:0] PC,branchOffset;
    wire write = 1'b1;
    output [31:0] newPC,instruction;
    output reg [31:0] newPCReg;
    reg[31:0] instMem[511:0];
    
    ProgramCounter PC_register(
    .inpPC(PC),
    .outPC(newPC),
    .writeEnable(write)
    );

    instructionMem instructionMem(
        .rst(reset),
        .PC(PC),
        .instruction(instruction)
    );

    always @(posedge clk) begin
        if (write)
            case(branchPresent)     //if branchPresent == 1, then newPC = PC + branchOffset
                1'b0: newPCReg <= PC+32'd4;
                1'b1: newPCReg <= PC+branchOffset;
            endcase
        else
            newPCReg <= PC;
    end
    
    assign newPC = newPCReg;    
endmodule
