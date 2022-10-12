//variables-->input two wires.one directly from register file and other from a mux(deciding which to take from reg file and offset).
//input->wire from ALU control.
//output->1.a zero flag (for branching)2.output of the arithmatic operation.

module ALU (input1, input2, flag, ex_cmd, alu_out);
  input [31:0] input1, input2;
  input [3:0] ex_cmd;
  output reg [31:0] alu_out;

  always @(*) begin
    case (ex_cmd)
        4'b0000: alu_out <= input1 + input2;
        4'b0001: alu_out <= input1 - input2;
        4'b0010: alu_out <= input1 & input2;
        4'b0011: alu_out <= input1 | input2;
        4'b0100: alu_out <= ~(input1 | input2);
        4'b0101: alu_out <= input1 ^ input2;
        4'b0110: alu_out <= input1 << input2;
        4'b0111: alu_out <= input1 <<< input2;
        4'b1000: alu_out <= input1 >> input2;
        4'b1001: alu_out <= input1 >>> input2;
      default: alu_out <= 0;
    endcase
  end
endmodule 