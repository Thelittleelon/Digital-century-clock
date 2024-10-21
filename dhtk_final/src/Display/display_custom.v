module display_custom (
    input sw,
    input [6:0] sec_1,sec_10,min_1,min_10,hour_1,hour_10,day_1,day_10,mont_1,mont_10,year_1,year_10,year_100,year_1000,
    output reg [6:0] led1, led2, led3, led4, led5, led6, led7, led8
);

always @(sw or sec_1 or sec_10 or min_1 or min_10 or hour_1 or hour_10 or day_1 or day_10 or mont_1 or mont_10 or year_1 or year_10 or year_100 or year_1000) begin
    if(sw) begin
      led1 = year_1;
      led2 = year_10;
      led3 = year_100;
      led4 = year_1000;
      led5 = mont_1;
      led6 = mont_10;
      led7 = day_1;
      led8 = day_10; 
    end
    else begin
      led1 = sec_1;
      led2 = sec_10;
      led3 = 7'b1111111;
      led4 = 7'b1111111;
      led5 = min_1;
      led6 = min_10;
      led7 = hour_1;
      led8 = hour_10;       
    end 
end

endmodule
