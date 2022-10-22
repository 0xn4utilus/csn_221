module instructionMem (rst, PC, instruction);
	input rst;
	input [31:0] PC;
	output [31:0] instruction;

	reg[7:0] instMem[511:0];

	initial begin
		instMem[0] <= 8'b00100100;
		instMem[1] <= 8'b00000010;
		instMem[2] <= 8'b00000000;
		instMem[3] <= 8'b00000110;
		instMem[4] <= 8'b00100100;
		instMem[5] <= 8'b00000001;
		instMem[6] <= 8'b00000000;
		instMem[7] <= 8'b00000101;
		instMem[8] <= 8'b00100100;
		instMem[9] <= 8'b00000001;
		instMem[10] <= 8'b00000000;
		instMem[11] <= 8'b00000101;
		instMem[12] <= 8'b00100100;
		instMem[13] <= 8'b00000001;
		instMem[14] <= 8'b00000000;
		instMem[15] <= 8'b00000101;
		instMem[16] <= 8'b00000000;
		instMem[17] <= 8'b01000001;
		instMem[18] <= 8'b00011000;
		instMem[19] <= 8'b00100010;
	end

	assign instruction = {instMem[PC], instMem[PC + 1], instMem[PC + 2], instMem[PC+ 3]};

endmodule