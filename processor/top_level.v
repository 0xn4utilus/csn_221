module final_process(input clk,
                      input rst);
    wire clk, rw, active;
    wire rst;
    wire[31:0] input1, input2,alu_out,instruction,inputMem,outputMem,value1;
    wire [31:0] outPC,outputMemReg,ALUOut, writeDataE,ALUOutM, writeDataM,signExtendedValue,data1,data2,signExtendedValue1,data11,data22,data2_temp,signExtended,PCBranchD,PCReg,valueInput,valueOutput,indexData;
    wire [31:0]inpPC,SrcAE,SrcBE,AluOutE,value2,SignImmE,PC,newPCreg,address_reg,readDataM,address,readDataW,ALUOutW,ResultW_reg,ResultW;
    wire PCSrcD, branchD,flag,branchPresent,regWriteD,MemToRegD,regWriteW,memToRegW,flagOutput;
    wire MemWriteD,ALUSrcD,RegDstD,BranchD,regWriteE, memToRegE, memWriteE,regWriteM, memToRegM, memWriteM,ALUSrcE,RegDstE,hazardDetected,flag1,flag2,writeEnable,readEnable;
    wire [3:0] ex_cmd,ALUControlD,ALUControlE;
    wire [1:0] ALUOp,ALUOpE;
    wire [4:0]writeRegE,writeRegM,RsD,RtD,RdD,RsE,RtE,RdE,writeRegW,index;
    ALU alutop  (
    .input1(input1),
    .input2(input2),
    .flag(flag),
    .ex_cmd(ex_cmd),
    .alu_out(alu_out),
    .ALUOp(ALUOp),
    .branchD(branchD)
    );
    controlUnit controlUnit_top(
    .clk(clk),
    .instruction(instruction),
    .regWriteD(regWriteD),
    .MemToRegD(MemToRegD),
    .MemWriteD(MemWriteD),
    .ALUControlD(ALUControlD),
    .ALUSrcD(ALUSrcD),
    .RegDstD(RegDstD),
    .BranchD(BranchD),
    .ALUOp(ALUOp)
    
    );
    dataMemory dataMemory_top(
    .clk(clk),
    .active(active),
    .rw(rw),
    .indexData(indexData),
    .outputMem(outputMem),
    .inputMem(inputMem)
    );
    exeToMemReg exeToMemReg_top(
    .regWriteE(regWriteE),
    .memToRegE(memToRegE),
    .memWriteE(memWriteE),
    .ALUOut(ALUOut),
    .writeDataE(writeDataE),
    .writeRegE(writeRegE),
    .regWriteM(regWriteM),
    .memToRegM(memToRegM),
    .memWriteM(memWriteM),
    .ALUOutM(ALUOutM),
    .writeDataM(writeDataM),
    .writeRegM(writeRegM),
    .clk(clk)
    );
    IDtoExe IDtoExe_top (
        .clk(clk),
        .regWriteD(regWriteD),
        .MemToRegD(MemToRegD),
        .MemWriteD(MemWriteD),
        .ALUControlD(ALUControlD),
        .ALUSrcD( ALUSrcD),
        .RegDstD( RegDstD),
        .data1( data1),
        .data2(data2),
        .data11(data11),
        .data22(data22),
        .regWriteE(regWriteE),
        .MemToRegE(MemToRegE),
        .MemWriteE(MemWriteE),
        .ALUControlE(ALUControlE),
        .ALUSrcE(ALUSrcE),
        .RegDstE(RegDstE),
        .RsD(RsD),
        .RtD(RtD),
        .RdD(RdD),
        .signExtendedValue(signExtendedValue),
        .RsE(RsE),
        .RtE(RtE),
        .RdE(RdE),
        .signExtendedValue1(signExtendedValue1)
    );
    instructionDecode instructionDecode_p(
        .clk(clk),
        .instruction(instruction),
        .data1(data1),
        .data2(data2),
        .RsD(RsD),
        .RtD(RtD),
        .RdD(RdD),
        .PCBranchD(PCBranchD),
        .hazardDetected(hazardDetected),
        .PCSrcD(PCSrcD),
        .equalD(equalD)
);
instructionExecution instructionExecution_top(
    .clk(clk),
    .RegWriteE(RegWriteE),
    .MemToRegE(MemToRegE),
    .MemWriteE(MemWriteE),
    .ALUControlE(ALUControlE),
    .ALUOpE(ALUOpE),
    .RegDstE(RegDstE),
    .ALUSrcE(ALUSrcE),
    .SignImmE(SignImmE),
    .RsE(RsE),
    .RtE(RtE),
    .RdE(RdE),
    .writeRegE(writeRegE),
    .AluOutE(AluOutE),
    .value1(value1),
    .value2(value2)
);
instructionFetch instructionFetch_top(
.clk(clk),
.PC(PC),
.instruction(instruction),
.write(write),
.PCBranchD(PCBranchD),
.PCSrcD(PCSrcD),
.hazardDetected(hazardDetected)
);
instructionMem instructionMem_top(
.PC(PC),
.instruction(instruction)
);
memory memory_top(
.clk(clk),
.RegWriteM(RegWriteM),
.MemToRegM(MemToRegM),
.MemWriteM(MemWriteM),
.ALUOutM(ALUOutM),
.writeDataM(writeDataM),
.WriteRegM(WriteRegM),
.active(active),
.readDataM(readDataM)
);
memToWBReg memToWBReg_top(
.regWriteM(regWriteM),
.memToRegM(memToRegM),
.readDataM(readDataM),
.ALUOut(ALUOut),
.writeRegM(writeRegM),
.regWriteW(regWriteW),
.memToRegW(memToRegW),
.readDataW(readDataW),
.ALUOutW(ALUOutW),
.writeRegW(writeRegW),
.clk(clk)
);
programCounter programCounter_top(
.inpPC(inpPC),
.outPC(outPC),
.writeEnable(writeEnable)
);
registerFile registerFile_top(
.clk(clk),
.index(index),
.valueInput(valueInput),
.valueOutput(valueOutput),
.readEnable(readEnable),
.writeEnable(writeEnable),
.regWriteW(regWriteW),
.flagOutput(flagOutput)
);
writeBack writeBack_top(
.memToRegW(memToRegW),
.RegWriteW(RegWriteW),
.readDataW(readDataW),
.ALUOutW(ALUOutW),
.ResultW(ResultW),
.clk(clk)
);
endmodule
//