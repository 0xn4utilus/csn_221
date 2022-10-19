//variables-->input two wires.one directly from register file and other from a mux(deciding which to take from reg file and offset).
//input->wire from ALU control.
//output->1.a zero flag (for branching)2.output of the arithmatic operation.

module ALU (input1,
            input2,
            flag,
            ex_cmd,
            alu_out,
            ALUOp,
            branchD);
    input [31:0] input1, input2;
    input [3:0] ex_cmd;
    input [1:0] ALUOp;
    input branchD;
    output reg [31:0] alu_out;
    output reg flag,branchPresent;
    
    
    
    controlUnit controlUnit(
    .ALUControlD(ex_cmd),
    .ALUOp(ALUOp),
    .branchD(branchD)
    
    );
    instructionFetch instructionFetch(
    .branchPresent(branchPresent)
    
    );
    
    always @(*) begin
        flag <= 32'd0;
        case (ALUOp)
            2'd2:
            begin
                case(ex_cmd)
                    4'b0010: alu_out    <= input1 + input2;
                    4'b0110: alu_out    <= input1 - input2;
                    4'b0000: alu_out    <= input1 & input2;
                    4'b0001: alu_out    <= input1 | input2;
                    // 4'b0100: alu_out <= ~(input1 | input2);
                    // 4'b0101: alu_out <= input1 ^ input2;
                    // 4'b0110: alu_out <= input1 << input2;
                    // 4'b0111: alu_out <= input1 <<< input2;
                    // 4'b1000: alu_out <= input1 >> input2;
                    // 4'b1001: alu_out <= input1 >>> input2;
                    4'b1111: alu_out    <= input1 * input2;
                    default: alu_out    <= 0;
                endcase
            end
            2'd0: alu_out <= input1 + input2;
            2'd1:
            begin
                alu_out <= input1 - input2;
                case(alu_out)
                    32'd0:
                    flag <= 32'd1;
                endcase
                
            end
        endcase
        
        branchPresent = flag & branchD;
        
    end
endmodule
