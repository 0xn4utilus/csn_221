module instructionMem (rst, PC, instruction);
	input rst;
	input [31:0] PC;
	output [31:0] instruction;

	reg[7:0] instMem[511:0];

	initial begin
		instMem[0] <= 8'b00100100;
		instMem[1] <= 8'b00000001;
		instMem[2] <= 8'b00000000;
		instMem[3] <= 8'b00000001;
		instMem[4] <= 8'b00100100;
		instMem[5] <= 8'b00000010;
		instMem[6] <= 8'b00000000;
		instMem[7] <= 8'b00000101;
		instMem[8] <= 8'b00100100;
		instMem[9] <= 8'b00000011;
		instMem[10] <= 8'b00000000;
		instMem[11] <= 8'b00000010;
		instMem[12] <= 8'b00100100;
		instMem[13] <= 8'b00000100;
		instMem[14] <= 8'b00000000;
		instMem[15] <= 8'b00000001;
		instMem[16] <= 8'b00000000;
		instMem[17] <= 8'b01100100;
		instMem[18] <= 8'b00100000;
		instMem[19] <= 8'b00011000;
		instMem[20] <= 8'b00100100;
		instMem[21] <= 8'b01000010;
		instMem[22] <= 8'b11111111;
		instMem[23] <= 8'b11111111;
		instMem[24] <= 8'b00100100;
		instMem[25] <= 8'b01100011;
		instMem[26] <= 8'b00000000;
		instMem[27] <= 8'b00000001;
		instMem[28] <= 8'b00100000;
		instMem[29] <= 8'b01000001;
		instMem[30] <= 8'b00000000;
		instMem[31] <= 8'b00000000;
	end

	assign instruction = {instMem[PC], instMem[PC + 1], instMem[PC + 2], instMem[PC+ 3]};

endmodule