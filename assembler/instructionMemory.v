module instructionMem (rst, PC, instruction);
	input rst;
	input [31:0] PC;
	output [31:0] instruction;

	reg[7:0] instMem[511:0];

	initial begin
		instMem[0] <= 8'b00100100;
		instMem[1] <= 8'b00000001;
		instMem[2] <= 8'b00000000;
		instMem[3] <= 8'b00000101;
		instMem[4] <= 8'b00100100;
		instMem[5] <= 8'b00011111;
		instMem[6] <= 8'b00000000;
		instMem[7] <= 8'b00000000;
		instMem[8] <= 8'b00100100;
		instMem[9] <= 8'b00011110;
		instMem[10] <= 8'b00000000;
		instMem[11] <= 8'b00000000;
		instMem[12] <= 8'b00100100;
		instMem[13] <= 8'b00011101;
		instMem[14] <= 8'b00000000;
		instMem[15] <= 8'b00000000;
		instMem[16] <= 8'b00000000;
		instMem[17] <= 8'b00100001;
		instMem[18] <= 8'b00001000;
		instMem[19] <= 8'b00100000;
		instMem[20] <= 8'b00100100;
		instMem[21] <= 8'b00011111;
		instMem[22] <= 8'b00000000;
		instMem[23] <= 8'b00000000;
		instMem[24] <= 8'b00100100;
		instMem[25] <= 8'b00011110;
		instMem[26] <= 8'b00000000;
		instMem[27] <= 8'b00000000;
		instMem[28] <= 8'b00100100;
		instMem[29] <= 8'b00011101;
		instMem[30] <= 8'b00000000;
		instMem[31] <= 8'b00000000;
		instMem[32] <= 8'b00100100;
		instMem[33] <= 8'b01000010;
		instMem[34] <= 8'b00000000;
		instMem[35] <= 8'b00000010;
		instMem[36] <= 8'b00100100;
		instMem[37] <= 8'b00011111;
		instMem[38] <= 8'b00000000;
		instMem[39] <= 8'b00000000;
		instMem[40] <= 8'b00100100;
		instMem[41] <= 8'b00011110;
		instMem[42] <= 8'b00000000;
		instMem[43] <= 8'b00000000;
		instMem[44] <= 8'b00100100;
		instMem[45] <= 8'b00011101;
		instMem[46] <= 8'b00000000;
		instMem[47] <= 8'b00000000;
		instMem[48] <= 8'b00000000;
		instMem[49] <= 8'b00100010;
		instMem[50] <= 8'b00011000;
		instMem[51] <= 8'b00011000;
		instMem[52] <= 8'b00100100;
		instMem[53] <= 8'b00011111;
		instMem[54] <= 8'b00000000;
		instMem[55] <= 8'b00000000;
		instMem[56] <= 8'b00100100;
		instMem[57] <= 8'b00011110;
		instMem[58] <= 8'b00000000;
		instMem[59] <= 8'b00000000;
		instMem[60] <= 8'b00100100;
		instMem[61] <= 8'b00011101;
		instMem[62] <= 8'b00000000;
		instMem[63] <= 8'b00000000;
	end

	assign instruction = {instMem[PC], instMem[PC + 1], instMem[PC + 2], instMem[PC+ 3]};

endmodule