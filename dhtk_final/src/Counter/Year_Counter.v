module Year_Counter (
    //input clk,
	input clk_1Hz,
    //input clk_5Hz,
	input rst_n,
    input [5:0]	sec,
    input [5:0]	min,
    input [4:0]	hour,
    input [4:0]	day,
    input [3:0] mont,
    input btn_up,
    input btn_down,
    input [2:0] mode,
	output reg [12:0] year
);

    always @(posedge clk_1Hz or negedge rst_n) begin
        if(~rst_n) year <= 2001;
        else begin 
            if (mode==3'b101) begin
                //if (clk_5Hz) begin
                    if (~btn_up)        year <= year + 1;
                    else if (~btn_down) year <= year - 1;
                //end
            end
            else begin    
                if (sec==59 && min==59 && hour==23 && day==31 && mont==12) year<=year+1;
                else year<=year;
            end
        end
    end

endmodule