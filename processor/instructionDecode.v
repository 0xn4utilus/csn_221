module instructionDecode(clk,
                         instruction,
                         data1,
                         data2,
                         RsD,
                         RtD,
                         RdD,
                         PCbranchD,
                         branchD,
                         hazardDetected,
                         PCSrcD,
                         PCReg,
                         equalD,
                         notEqualD,
                         ALUSrcD,
                         BNEType,
                         index1,
                         index2,
                         flag1,
                         flag2,
                         flagALU,
                         valueOutput1,
                         valueOutput2,
                         signImmD,
                         );
    input [31:0]instruction;
    input flagALU;
    output reg[4:0] RsD,RtD,RdD;
    input clk,ALUSrcD,BNEType;
    output reg [31:0] data1,data2,data2_temp,signImmD,PCbranchD;//signImmD wil store the 32 bit sign extension of instruction[15:0]
    input [31:0] PCReg;
    output [3:0] ALUControlD;
    output [1:0] ALUOp;
    output reg hazardDetected,PCSrcD,equalD,notEqualD;
    input flag1,flag2,branchD;
    initial begin
        hazardDetected=1;
    end
    // controlUnit cu(
    // .clk(clk),
    // .instruction(instruction),
    // .regWriteD(regWriteD),
    // .memToRegD(memToRegD),
    // .memWriteD(memWriteD),
    // .ALUControlD(ALUControlD),
    // .ALUSrcD(ALUSrcD),
    // .regDstD(regDstD),
    // .branchD(branchD),
    // .ALUOp(ALUOp),
    // .BNEType(BNEType)
    // );
    
    input[31:0] valueInput;
    output reg [4:0] index1,index2;
    
    input [31:0] valueOutput1,valueOutput2;

    // IFtoIDReg IFtoID(
    // .instructionReg(instruction),
    // .PCReg(PCReg)
    // );
    
    // registerFile regFile(
    // .clk(clk),
    // .index1(index1),
    // .index2(index2),
    // .valueInput(valueInput),
    // .valueOutput1(valueOutput1),
    // .valueOutput2(valueOutput2),
    // .readEnable(readEnable),
    // .writeEnable(writeEnable),
    // .flagOutput1(flagOutput1),
    // .flagOutput2(flagOutput2)
    // // registers[instruction[25:21]] //wrong syntax for data1
    // // registers[instruction[20:16]] //this is data2_temp
    // );
    always @(*) begin
        index1          <= instruction[25:21];
        index2          <= instruction[20:16];
        data1       <= valueOutput1;
        // flag1        <= flagOutput1;
        // flag2        <= flagOutput2;
        data2 <= valueOutput2;
    end
    
    always@(posedge clk) begin
        
        // if (regWriteD) begin
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
            default : hazardDetected <= 0;
        endcase
        signImmD = {instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15:0]};
        PCbranchD <= PCReg+4*signImmD-32'd4; //-4 is done bea
        if (ALUSrcD) data2 = {instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15],instruction[15:0]};
        else data2         = valueOutput2;
        RsD                = instruction[25:21];
        RtD                = instruction[20:16];
        RdD                = instruction[15:11];

        //beq
        equalD=(valueOutput1-valueOutput2)==0;
        notEqualD=(valueOutput1-valueOutput2) !=0;
        if(instruction[31:26] == 6'b000100 )PCSrcD= branchD & ((valueOutput1-valueOutput2) ==0);
        if(instruction[31:26] == 6'b001000) PCSrcD= BNEType & ((valueOutput1-valueOutput2) !=0);
        if(flagALU) PCSrcD = flagALU & branchD;
        else PCSrcD=0;
        // end
        
    end
endmodule
