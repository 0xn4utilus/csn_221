module instructionMemory (rst, PC, instruction);
	input rst;
	input [31:0] PC;
	output [31:0] instruction;

	reg[31:0] instMem[511:0];

	always @ (*) begin
		if (rst) begin
		instMem[0] <= 8'b00000000;
		instMem[1] <= 8'b01000011;
		instMem[2] <= 8'b00001000;
		instMem[3] <= 8'b00100000;
		instMem[4] <= 8'b00000000;
		instMem[5] <= 8'b01000011;
		instMem[6] <= 8'b00001000;
		instMem[7] <= 8'b00100010;
		instMem[8] <= 8'b00000000;
		instMem[9] <= 8'b01100010;
		instMem[10] <= 8'b00001000;
		instMem[11] <= 8'b00100000;

		end

	end

	assign instruction = {instMem[PC], instMem[PC + 1], instMem[PC + 2], instMem[PC+ 3]};

endmodule