module topLevel(input clk,
                     input rst);
    wire clk, rw, active;
    wire rst;
    wire[31:0] input1, input2,alu_out,instruction,instructionD,inputMem,outputMem,value1;
    wire [31:0] outPC,outputMemReg,ALUOut, writeDataE,ALUOutM, writeDataM,data1,data2,data11,data22,data2_temp,signImmD,PCbranchD,PCReg,valueInput,valueOutput1R,valueOutput2R,indexData;
    wire [31:0]inpPC,SrcAE,SrcBE,AluOutE,value2,signImmE,PC,newPCreg,address_reg,readDataM,address,readDataW,ALUOutW,resultW_reg,resultW;
    wire PCSrcD, branchD,flag,branchPresent,regWriteD,memToRegD,regWriteW,memToRegW,flagOutput1,flagOutput2;
    wire memWriteD,ALUSrcD,regDstD,regWriteE, memToRegE, memWriteE,regWriteM, memToRegM, memWriteM,ALUSrcE,regDstE,hazardDetected,flag1,flag2,writeEnable,readEnable,BNEType;
    wire [3:0] ex_cmd,ALUControlD,ALUControlE;
    wire [1:0] ALUOp,ALUOpE;
    wire [4:0]writeRegE,writeRegM,RsD,RtD,RdD,RsE,RtE,RdE,writeRegW,index1,index2;
    assign hazardDetected=0;
    
    instructionFetch instructionFetch_top(
    .clk(clk),
    .PC(PC),
    .instruction(instruction),
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

    controlUnit cu(
    .clk(clk),
    .instruction(instructionD),
    .regWriteD(regWriteD),
    .memToRegD(memToRegD),
    .memWriteD(memWriteD),
    .ALUControlD(ALUControlD),
    .ALUSrcD(ALUSrcD),
    .regDstD(regDstD),
    .branchD(branchD),
    .ALUOp(ALUOp),
    .BNEType(BNEType)
    );
    
    ALU ALU(
    .input1(SrcAE),
    .input2(SrcBE),
    .flag(flag),
    .ex_cmd(ALUControlE),
    .alu_out(AluOutE),
    .ALUOp(ALUOpE),
    .branchD(branchD)
    );
    
    
    registerFile regFile(
    .clk(clk),
    .index1(index1),
    .index2(index2),
    .valueInput(valueInput),
    .valueOutput1(valueOutput1R),
    .valueOutput2(valueOutput2R),
    .readEnable(readEnable),
    .writeEnable(writeEnable),
    .flagOutput1(flag1),
    .flagOutput2(flag2)
    // registers[instruction[25:21]] //wrong syntax for data1
    // registers[instruction[20:16]] //this is data2_temp
    );


    instructionDecode instructionDecode_p(
    .clk(clk),
    .instruction(instructionD),
    .data1(data1),
    .data2(data2),
    .RsD(RsD),
    .RtD(RtD),
    .RdD(RdD),
    .PCbranchD(PCbranchD),
    .branchD(branchD),
    .hazardDetected(hazardDetected),
    .PCSrcD(PCSrcD),
    .PCReg(PCReg),
    .equalD(equalD),
    .ALUSrcD(ALUSrcD),
    .BNEType(BNEType),
    .index1(index1),
    .index2(index2),
    .flag1(flag1),
    .flag2(flag2),
    .flagALU(flag),
    .valueOutput1(valueOutput1R),
    .valueOutput2(valueOutput2R),
    .signImmD(signImmD)
    );
    
    
    
    IDtoExe IDtoExe_top (
    .clk(clk),
    .regWriteD(regWriteD),
    .memToRegD(memToRegD),
    .memWriteD(memWriteD),
    .ALUControlD(ALUControlD),
    .ALUSrcD(ALUSrcD),
    .regDstD(regDstD),
    .data1(data1),
    .data2(data2),
    .data11(data11),
    .data22(data22),
    .regWriteE(regWriteE),
    .memToRegE(memToRegE),
    .memWriteE(memWriteE),
    .ALUControlE(ALUControlE),
    .ALUSrcE(ALUSrcE),
    .regDstE(regDstE),
    .RsD(RsD),
    .RtD(RtD),
    .RdD(RdD),
    .signImmD(signImmD),
    .RsE(RsE),
    .RtE(RtE),
    .RdE(RdE),
    .signImmE(signImmE),
    .ALUOp(ALUOp),
    .ALUOpE(ALUOpE)
    );
    

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
    // .index1(index1),
    // .index2(index2),
    // .valueInput(valueInput),
    // .valueOutput1(valueOutput1),
    // .valueOutput2(valueOutput2),
    // .readEnable(readEnable),
    // .writeEnable(writeEnable),
    // .flagOutput1(flagOutput1),
    // .flagOutput2(flagOutput2)
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
