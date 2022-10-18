module instructionDecode(clk,
                         instruction,
                         data1,
                         data2,
                         RsD,
                         RtD,
                         RdD,
                         PCBranchD,
                         );
    input [31:0]instruction;
    output reg[4:0] RsD,RtD,RdD;
    input clk;
    output reg [31:0] data1,data2,data2_temp,signExtended,PCBranchD;//signExtended wil store the 32 bit sign extension of instruction[15:0]
    output [3:0]ALUControlD;
    output [1:0] ALUOp;
    controlUnit cu(
    .clk(clk),
    .instruction(instruction),
    .RegWriteD(RegWriteD),
    .MemToRegD(MemToRegD),
    .MemWriteD(MemWriteD),
    .ALUControlD(ALUControlD),
    .ALUSrcD(ALUSrcD),
    .RegDstD(RegDstD),
    .BranchD(BranchD),
    .ALUOp(ALUOp)
    );
    input[31:0] valueInput;
    reg [4:0] index;
    
    output [31:0] valueOutput;
    registerFile regFile(
    .clk(clk),
    .index(index),
    .valueInput(valueInput),
    .valueOutput(valueOutput),
    .readEnable(readEnable),
    .writeEnable(writeEnable)
    // registers[instruction[25:21]] //wrong syntax for data1
    // registers[instruction[20:16]] //this is data2_temp
    );
    always@(posedge clk) begin
        index         <= instruction[25:21];
        #2 data1      <= valueOutput;
        #4 index      <= instruction[20:16];
        #6 data2_temp <= valueOutput;
        
        
        // if (RegWriteD) begin
            signExtended       = {instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15:0]};
            PCBranchD<=PCreg+4*signExtended;
            if (ALUSrcD) data2 = signExtended;
            else data2         = data2_temp;
            RsD                = instruction[25:21];
            RtD                = instruction[20:16];
            RdD                = instruction[15:11];
        // end
        
    end
endmodule
