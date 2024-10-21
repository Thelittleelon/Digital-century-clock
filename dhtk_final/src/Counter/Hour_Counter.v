module Hour_Counter (
    //input clk,
	input clk_1Hz,
    //input clk_5Hz,
	input rst_n,
    input [5:0] sec,
    input [5:0] min,
    input btn_up,
    input btn_down,
    input [2:0] mode,
	output reg [4:0] hour
);

    always @(posedge clk_1Hz or negedge rst_n) begin
        if(~rst_n) hour <= 0;
        else begin 
            if (mode==3'b111) begin
                //if (clk_5Hz) begin
                    if (~btn_up) begin
                        if(hour == 23) hour <= 0;
                        else hour <= hour + 1;         
                    end
                    else if (~btn_down) begin
                        if(hour == 0) hour <= 23;
                        else hour <= hour - 1;
                    end
                //end
            end
            else begin    
                if (sec==59 && min==59 && hour==23) hour<=0;
                else if (sec==59 && min ==59 && hour!=23) hour<=hour+1;
                else hour<=hour;
            end
        end
    end  

endmodule