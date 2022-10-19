module instructionDecode(clk,
                         instruction,
                         data1,
                         data2,
                         RsD,
                         RtD,
                         RdD,
                         PCBranchD,
                         hazardDetected);
    input [31:0]instruction;
    output reg[4:0] RsD,RtD,RdD;
    input clk;
    output reg [31:0] data1,data2,data2_temp,signExtended,PCBranchD;//signExtended wil store the 32 bit sign extension of instruction[15:0]
    output[31:0] PCReg;
    output [3:0]ALUControlD;
    output [1:0] ALUOp;
    output reg hazardDetected;
    reg flag1,flag2;
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
    IFtoIDReg IFtoID(
    .instructionReg(instruction),
    .PCReg(PCReg)
    );
    registerFile regFile(
    .clk(clk),
    .index(index),
    .valueInput(valueInput),
    .valueOutput(valueOutput),
    .readEnable(readEnable),
    .writeEnable(writeEnable),
    .flagOutput(flagOutput)
    // registers[instruction[25:21]] //wrong syntax for data1
    // registers[instruction[20:16]] //this is data2_temp
    );
    always@(posedge clk) begin
        index          <= instruction[25:21];
        #2 data1       <= valueOutput;
        #4flag1        <= flagOutput;
        #6 index       <= instruction[20:16];
        #8flag2        <= flagOutput;
        #10 data2_temp <= valueOutput;
        
        // if (RegWriteD) begin
        hazardDetected <= 0;
        case(instruction[31:26])
            6'b000000:
            begin
                hazardDetected <= (!flag1) || (!flag2);
            end
            6'b000100:
            begin
                hazardDetected <= (!flag1);
            end
            6'd35:
            begin
                hazardDetected <= (!flag1);
            end
            6'd43:
            begin
                hazardDetected <= (!flag1);
            end
            
        endcase
        signExtended = {instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15:0]};
        PCBranchD <= PCReg+4*signExtended;
        if (ALUSrcD) data2 = signExtended;
        else data2         = data2_temp;
        RsD                = instruction[25:21];
        RtD                = instruction[20:16];
        RdD                = instruction[15:11];
        // end
        
    end
endmodule
