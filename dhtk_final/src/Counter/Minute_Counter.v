module Minute_Counter (
	input clk_1Hz,
	input rst_n,
    input [5:0] sec,
    input btn_up,
    input btn_down,
    input [2:0] mode,
	output reg [5:0] min
);

    always @(posedge clk_1Hz or negedge rst_n) begin
        if(!rst_n) min <= 0;
        else begin 
            if (mode==3'b011) begin
                if (!btn_up) begin
                    if(min == 59) min <= 0;
                    else min <= min + 1;         
                end
                else if (!btn_down) begin
                    if(min == 0) min <= 59;
                    else min <= min - 1;
                end
            end
            else begin    
                if (sec==59 && min==59) min<=0;
                else if (sec==59 && min!=59) min<=min+1;
                else min<=min;
            end
        end
    end  

endmodule