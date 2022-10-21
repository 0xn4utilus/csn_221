module topLevel(input clk,
                     input rst);
    wire clk, rw, active;
    wire rst;
    wire[31:0] input1, input2,alu_out,instruction,instructionD,inputMem,outputMem,value1;
    wire [31:0] outPC,outputMemReg,ALUOut, writeDataE,ALUOutM, writeDataM,signExtendedValue,data1,data2,signExtendedValue1,data11,data22,data2_temp,signExtended,PCbranchD,PCReg,valueInput,valueOutput,indexData;
    wire [31:0]inpPC,SrcAE,SrcBE,AluOutE,value2,signImmE,PC,newPCreg,address_reg,readDataM,address,readDataW,ALUOutW,resultW_reg,resultW;
    wire PCSrcD, branchD,flag,branchPresent,regWriteD,memToRegD,regWriteW,memToRegW,flagOutput;
    wire memWriteD,ALUSrcD,regDstD,regWriteE, memToRegE, memWriteE,regWriteM, memToRegM, memWriteM,ALUSrcE,regDstE,hazardDetected,flag1,flag2,writeEnable,readEnable,BNEType;
    wire [3:0] ex_cmd,ALUControlD,ALUControlE;
    wire [1:0] ALUOp,ALUOpE;
    wire [4:0]writeRegE,writeRegM,RsD,RtD,RdD,RsE,RtE,RdE,writeRegW,index;
    assign hazardDetected=0;
    instructionFetch instructionFetch_top(
    .clk(clk),
    .PC(PC),
    .instruction(instruction),
    .write(write),
    .PCbranchD(PCbranchD),
    .PCSrcD(PCSrcD),
    .hazardDetected(hazardDetected)
    );
    
    instructionMem instructionMem_top(
    .PC(PC),
    .instruction(instruction)
    );
    
    IFtoIDReg IFtoIDReg_top(
        .instruction(instruction),
        .instructionD(instructionD),
        .clk(clk),
        .outPC(PC),
        .reset(rst),
        .PCReg(PCReg)
    );
    
    // instructionDecode instructionDecode_p(
    // .clk(clk),
    // .instruction(instructionD),
    // .data1(data1),
    // .data2(data2),
    // .RsD(RsD),
    // .RtD(RtD),
    // .RdD(RdD),
    // .PCbranchD(PCbranchD),
    // .branchD(branchD),
    // .hazardDetected(hazardDetected),
    // .PCSrcD(PCSrcD),
    // .PCReg(PCReg),
    // .equalD(equalD),
    // .ALUSrcD(ALUSrcD),
    // .BNEType(BNEType)
    // );
    
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
    
    
    // IDtoExe IDtoExe_top (
    // .clk(clk),
    // .regWriteD(regWriteD),
    // .memToRegD(memToRegD),
    // .memWriteD(memWriteD),
    // .ALUControlD(ALUControlD),
    // .ALUSrcD(ALUSrcD),
    // .regDstD(regDstD),
    // .data1(data1),
    // .data2(data2),
    // .data11(data11),
    // .data22(data22),
    // .regWriteE(regWriteE),
    // .memToRegE(memToRegE),
    // .memWriteE(memWriteE),
    // .ALUControlE(ALUControlE),
    // .ALUSrcE(ALUSrcE),
    // .regDstE(regDstE),
    // .RsD(RsD),
    // .RtD(RtD),
    // .RdD(RdD),
    // .signExtendedValue(signExtendedValue),
    // .RsE(RsE),
    // .RtE(RtE),
    // .RdE(RdE),
    // .signExtendedValue1(signExtendedValue1)
    // );
    

    // instructionExecution instructionExecution_top(
    // .clk(clk),
    // .regWriteE(regWriteE),
    // .memToRegE(memToRegE),
    // .memWriteE(memWriteE),
    // .ALUControlE(ALUControlE),
    // .ALUOpE(ALUOpE),
    // .regDstE(regDstE),
    // .ALUSrcE(ALUSrcE),
    // .signImmE(signImmE),
    // .RsE(RsE),
    // .RtE(RtE),
    // .RdE(RdE),
    // .writeRegE(writeRegE),
    // .AluOutE(AluOutE),
    // .value1(value1),
    // .value2(value2),
    // .SrcAE(SrcAE),
    // .SrcBE(SrcBE)
    // );

    // ALU ALU(
    // .input1(SrcAE),
    // .input2(SrcBE),
    // .flag(flag),
    // .ex_cmd(ALUControlE),
    // .alu_out(AluOutE),
    // .ALUOp(ALUOpE),
    // .branchD(branchD)
    // );

    // controlUnit controlUnit_top(
    // .clk(clk),
    // .instruction(instruction),
    // .regWriteD(regWriteD),
    // .memToRegD(memToRegD),
    // .memWriteD(memWriteD),
    // .ALUControlD(ALUControlD),
    // .ALUSrcD(ALUSrcD),
    // .regDstD(regDstD),
    // .branchD(branchD),
    // .ALUOp(ALUOp)
    
    // );
    
    
    // dataMemory dataMemory_top(
    // .clk(clk),
    // .active(active),
    // .rw(rw),
    // .indexData(indexData),
    // .outputMem(outputMem),
    // .inputMem(inputMem)
    // );
    
    // exeToMemReg exeToMemReg_top(
    // .regWriteE(regWriteE),
    // .memToRegE(memToRegE),
    // .memWriteE(memWriteE),
    // .ALUOut(ALUOut),
    // .writeDataE(writeDataE),
    // .writeRegE(writeRegE),
    // .regWriteM(regWriteM),
    // .memToRegM(memToRegM),
    // .memWriteM(memWriteM),
    // .ALUOutM(ALUOutM),
    // .writeDataM(writeDataM),
    // .writeRegM(writeRegM),
    // .clk(clk)
    // );
    
    
    
    // memory memory_top(
    // .clk(clk),
    // .regWriteM(regWriteM),
    // .memToRegM(memToRegM),
    // .memWriteM(memWriteM),
    // .ALUOutM(ALUOutM),
    // .writeDataM(writeDataM),
    // .writeRegM(writeRegM),
    // .active(active),
    // .readDataM(readDataM)
    // );
    
    // memToWBReg memToWBReg_top(
    // .regWriteM(regWriteM),
    // .memToRegM(memToRegM),
    // .readDataM(readDataM),
    // .ALUOut(ALUOut),
    // .writeRegM(writeRegM),
    // .regWriteW(regWriteW),
    // .memToRegW(memToRegW),
    // .readDataW(readDataW),
    // .ALUOutW(ALUOutW),
    // .writeRegW(writeRegW),
    // .clk(clk)
    // );
    
    // programCounter programCounter_top(
    // .inpPC(inpPC),
    // .outPC(outPC),
    // .writeEnable(writeEnable)
    // );
    
    // registerFile registerFile_top(
    // .clk(clk),
    // .index(index),
    // .valueInput(valueInput),
    // .valueOutput(valueOutput),
    // .readEnable(readEnable),
    // .writeEnable(writeEnable),
    // .regWriteW(regWriteW),
    // .flagOutput(flagOutput)
    // );
    
    
    // writeBack writeBack_top(
    // .memToRegW(memToRegW),
    // .regWriteW(regWriteW),
    // .readDataW(readDataW),
    // .ALUOutW(ALUOutW),
    // .resultW(resultW),
    // .clk(clk)
    // );
endmodule
    //
