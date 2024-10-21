module Month_Counter (
	input clk_1Hz,
	input rst_n,
    input [5:0]	sec,
    input [5:0]	min,
    input [4:0]	hour,
    input [4:0]	day,
    input [12:0] year,
    input btn_up,
    input btn_down,
    input [2:0] mode,
	output reg [3:0] mont
);
    always @(posedge clk_1Hz or negedge rst_n) begin
        if(!rst_n) mont <= 1;
        else begin 
            if (mode==3'b100) begin
                if (!btn_up) begin
                    if(mont == 12) mont <= 1;
                    else mont <= mont + 1;         
                end
                else if (!btn_down) begin
                    if(mont == 1) mont <= 12;
                    else mont <= mont - 1;
                end
            end   
            else begin    
                if (sec==59 && min==59 && hour==23) begin
                    if (day==31 && mont==12) mont<=1;
                    else if ( day==31 && (mont==1||mont==3||mont==5||mont==7||mont==8||mont==10) ) mont<=mont+1;
                    else if ( day==30 && (mont==4||mont==6||mont==9||mont==11) ) mont<=mont+1;
                    else if ( day==28 && mont==2 && ({year[0],year[1]}!=2'b00 || year==2100) ) mont<=mont+1;
                    else if ( day==29 && mont==2 && {year[0],year[1]}==2'b00 && year!=2100 ) mont<=mont+1;
                    else mont<=mont;
                end
                    else mont<=mont;
            end
        end
    end
endmodule