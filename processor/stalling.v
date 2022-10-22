module stalling(clk,
                RsD,
                RdD,
                RtD,
                writeRegW,
                writeRegM,
                writeRegE,
                hazardDetected);
    input clk;
    input [4:0] RsD,RdD,RtD,writeRegW,writeRegM,writeRegE;
    output reg hazardDetected;
    
    always @(*) begin
        // $display("e %0d",writeRegE);
        // $display("m %0d",writeRegM);
        // $display("w %0d",writeRegW);
        // $display("rd %0d",RdD);
        // $display("rs %0d",RsD);
        // $display("rt %0d",RtD);
        if (RsD == writeRegE || RdD == writeRegE || RsD == writeRegM || RdD == writeRegM  ||  RsD == writeRegW|| RdD == writeRegW) begin
            hazardDetected <= 1;
        end
        else begin
            hazardDetected <= 0;
        end
        
    end
    
endmodule
    
