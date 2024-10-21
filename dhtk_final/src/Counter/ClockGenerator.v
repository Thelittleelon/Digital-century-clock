module ClockGenerator (
    input clk,            // 50 MHz Clock input
    output reg clk_1Hz    // 1 Hz Clock output  
);

reg [24:0] count;       

always @(posedge clk) begin
    count <= count + 1;

    if (count == 25000000) begin
        clk_1Hz <= ~clk_1Hz;   
        count <= 0;           
    end
end

endmodule