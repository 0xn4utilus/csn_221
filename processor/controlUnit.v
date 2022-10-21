module controlUnit(clk,
                   instruction,
                   regWriteD,
                   memToRegD,
                   memWriteD,
                   ALUControlD,
                   ALUSrcD,
                   regDstD,
                   branchD,
                   BNEType, //IT IS ONE WHEN INSTRUCTION IS BNE
                   ALUOp);
    input clk;
    input [31:0] instruction;
    output  reg regWriteD,memToRegD,memWriteD,ALUSrcD,regDstD,branchD,BNEType;//BRANCHD left for now
    output reg[3:0]ALUControlD;
    output reg[1:0] ALUOp;
    always @(posedge clk) begin
        ALUOp     <= 2'b0;// LOAD-store
        regWriteD <= 1;// tells about write back
        memToRegD <= 0;// write back from  ALU or data mem
        memWriteD <= 0;// memory write
        ALUSrcD   <= 0;// r branch o
        regDstD   <= 0;// all except r type
        branchD   <= 0;//all except branch type
        BNEType<=0;
        case(instruction[31:26])
            6'b000000:// THIS IMPLIES IT IS R TYPE
            begin
                ALUOp   <= 2'd2;
                regDstD <= 1;
                
            end
            6'b000100://BRANCH
            begin
                ALUOp     <= 2'd1;
                regWriteD <= 0;
                branchD   <= 1;
            end
            6'b001000: //BNE
            begin
                ALUOp <= 2'd1;
                BNEType<=1;
                regWriteD <= 0 ;
            end
            6'd35:
            begin
                memToRegD <= 1;//load
                ALUSrcD   <= 1;
            end
            6'd43:begin //store
                regWriteD <= 0 ;
                memWriteD <= 1;
                ALUSrcD   <= 1;
            end
            6'b000010: ALUSrcD = 1;
            
            
        endcase
        case(ALUOp[1:0])
            2'd2:begin
                case(instruction[5:0])
                    6'b100000:ALUControlD     <= 4'b0010;//ADD R TYPE
                    6'b100010:ALUControlD     <= 4'b0110;// SUB R TYPE
                    6'b100100:ALUControlD     <= 4'b0000;// and r type
                    6'b100101:ALUControlD     <= 4'b0001;//or r type
                    //  6'b101010:ALUControlD <= 4'b0111;// set on less than
                    6'b011000:ALUControlD     <= 4'b1111;// multipication r type
                    6'b000010:ALUControlD     <= 4'b0010; //ADDI type
                endcase
            end
            2'd0:ALUControlD <= 4'b0010;//load-store
            2'd1:ALUControlD <= 4'b0110;// branch
            
            
        endcase
    end
endmodule
    
    
