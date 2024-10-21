module Second_Counter (
	input clk_1Hz,
	input rst_n,
    input btn_up,
    input btn_down,
    input [2:0] mode,
	output reg [5:0] sec
);
	
    always @(posedge clk_1Hz or negedge rst_n) begin
        if(!rst_n) sec <= 0;
        else begin 
            if (mode==3'b001) begin
                if (!btn_up) begin
                    if(sec == 59) sec <= 0;
                    else sec <= sec + 1;         
                end
                else if (!btn_down) begin                       
                    if(sec == 0) sec <= 59;
                    else sec <= sec - 1;
                end
            end
            else begin    
                if(sec == 59) sec <= 0;
                else sec <= sec + 1;
            end
        end
    end

endmodule