 module controlUnit(clk,
                   instruction,
                   RegWriteD,
                   MemToRegD,
                   MemWriteD,
                   ALUControlD,
                   ALUSrcD,
                   RegDstD,
                   BranchD,
                   ALUOp);
    input clk;
    input [31:0] instruction;
    output  reg RegWriteD,MemToRegD,MemWriteD,ALUSrcD,RegDstD,BranchD;//BRANCHD left for now
    output reg[3:0]ALUControlD;
    output reg[1:0] ALUOp;
    always @(posedge clk) begin
        ALUOp     <= 2'b0;// LOAD-store
        RegWriteD <= 1;// tells about write back
        MemToRegD <= 0;// write back from  ALU or data mem
        MemWriteD <= 0;// memory write
        ALUSrcD   <= 0;// r branch o
        RegDstD   <= 0;// all except r type
        BranchD<=0;//all except branch type 
        
        case(instruction[31:26])
            6'b000000:// THIS IMPLIES IT IS R TYPE
            begin
                ALUOp   <= 2'd2;
                RegDstD <= 1;
                
            end
            6'b000100://BRANCH
            begin
                ALUOp     <= 2'd1;
                RegWriteD <= 0;
                BranchD<=1;
            end
            6'b001000: //JUMP
            begin
                ALUOp <= 2'd3;
                
                RegWriteD <= 0 ;
            end
            6'd35:
            begin
                MemToRegD <= 1;//load
                ALUSrcD   <= 1;
            end
            6'd43:begin //store
                RegWriteD <= 0 ;
                MemWriteD <= 1;
                ALUSrcD   <= 1;
            end
            6'b000010: ALUSrcD=1;
            
            
        endcase
        case(ALUOp[1:0])
            2'd2:begin
                case(instruction[5:0])
                    6'b100000:ALUControlD <= 0010;//ADD R TYPE
                    6'b100010:ALUControlD <= 0110;// SUB R TYPE
                    6'b100100:ALUControlD <= 0000;// and r type
                    6'b100101:ALUControlD <= 0001;//or r type
                  //  6'b101010:ALUControlD <= 0111;// set on less than
                    6'b011000:ALUControlD <= 1111;// multipication r type
                    6'b000010:ALUControlD <=0010; //ADDI type
                endcase
            end
            2'd0:ALUControlD <= 0010;//load-store
            2'd1:ALUControlD <= 0110;// branch
            
            
        endcase
    end
endmodule
    
    
