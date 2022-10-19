`timescale 1ns/1ns
module testbench();

wire [31:0]instruction;
    wire reg[4:0] RsD,RtD,RdD;
    wire clk;
    wire  [31:0] data1,data2,data2_temp,signExtended,PCBranchD;//signExtended wil store the 32 bit sign extension of instruction[15:0]
    wire[31:0] PCReg;
    wire [3:0]ALUControlD;
    wire [1:0] ALUOp;
    wire  hazardDetected,PCSrcD,equalD;
    