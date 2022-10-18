// 32 registers are implemented using array of 32 bits variable name will be reg[n]
// mux as ternary operators.
// flag involved in hazard for each register will be named as regFlag[n] and will be implemented as a single bit element array
// variables -> input-> clk, index(index of register), reset, val_to_write,


module registerFile (clk,
                     index,
                     valueInput,
                     valueOutput,
                     readEnable,
                     writeEnable,regWriteW);
    reg [31:0] registers[31:0];
    input regWriteW;
    input[31:0]  valueInput;
    input[4:0] index;
    input writeEnable,readEnable,clk;
    output reg [31:0] valueOutput;
    always @(posedge clk) begin
        registers[0] <= 32'b0;
        if (readEnable)
        begin
            valueOutput <= registers[index];
        end
            if (writeEnable)
            begin
                registers[index] <= valueInput;
            end
    end
    
endmodule
