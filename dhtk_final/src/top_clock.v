module top_clock (
    input clk, rst_n, 
    input sw, 
    input [2:0] mode, 
    input btn_up, btn_down,
    output [6:0] led1, led2, led3, led4, led5, led6, led7, led8
);
wire clk_1Hz; //clk_5Hz;
wire [5:0] sec;
wire [5:0] min;
wire [4:0] hour;
wire [4:0] day;
wire [3:0] mont;
wire [12:0] year;
wire [6:0] sec_1,sec_10,min_1,min_10,hour_1,hour_10,day_1,day_10,mont_1,mont_10,year_1,year_10,year_100,year_1000;


ClockGenerator IC1 (
    .clk(clk),
    .clk_1Hz(clk_1Hz),
    //.clk_5Hz(clk_5Hz)
);

Second_Counter IC2 (
    //.clk(clk),
    .clk_1Hz(clk_1Hz),
    //.clk_5Hz(clk_5Hz),
	.rst_n(rst_n),
    .mode(mode),
    .btn_up(btn_up),
    .btn_down(btn_down),
	.sec(sec)
);

Minute_Counter IC3 (
    //.clk(clk),
    .clk_1Hz(clk_1Hz),
    //.clk_5Hz(clk_5Hz),
	.rst_n(rst_n),
    .sec(sec),
    .mode(mode),
    .btn_up(btn_up),
    .btn_down(btn_down),
	.min (min)
);

Hour_Counter IC4 (
    //.clk(clk),
    .clk_1Hz(clk_1Hz),
    //.clk_5Hz(clk_5Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
    .mode(mode),
    .btn_up(btn_up),
    .btn_down(btn_down),
	.hour (hour)
);

Day_Counter IC5 (
    //.clk(clk),
    .clk_1Hz(clk_1Hz),
    //.clk_5Hz(clk_5Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
	.hour (hour),
    .mont (mont),
    .year (year),
    .mode(mode),
    .btn_up(btn_up),
    .btn_down(btn_down),
    .day (day)
);

Month_Counter IC6 (
    //.clk(clk),
    .clk_1Hz(clk_1Hz),
    //.clk_5Hz(clk_5Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
	.hour (hour),
	.day (day),
    .year (year),
    .mode(mode),
    .btn_up(btn_up),
    .btn_down(btn_down),
    .mont (mont)
);

Year_Counter IC7 (
    //.clk(clk),
    .clk_1Hz(clk_1Hz),
    //.clk_5Hz(clk_5Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
	.hour (hour),
	.day (day),
    .mont (mont),
    .mode(mode),
    .btn_up(btn_up),
    .btn_down(btn_down),
    .year (year)
);

display IC8 (
    .sec(sec),
    .min (min),
	.hour (hour),
	.day (day),
    .mont (mont),
    .year (year),
    .secout_1(sec_1),
    .secout_10(sec_10),
    .minout_1(min_1),
    .minout_10(min_10),
    .hourout_1(hour_1),
    .hourout_10(hour_10),
    .dayout_1(day_1),
    .dayout_10(day_10),
    .montout_1(mont_1),
    .montout_10(mont_10),
    .yearout_1(year_1),
    .yearout_10(year_10),
    .yearout_100(year_100),
    .yearout_1000(year_1000) 
);

display_custom IC9 (
    .sw(sw),
    .sec_1 (sec_1),
    .sec_10 (sec_10),
    .min_1 (min_1),
    .min_10 (min_10),
	.hour_1 (hour_1),
    .hour_10 (hour_10),
	.day_1 (day_1),
    .day_10 (day_10),
    .mont_1 (mont_1),
    .mont_10 (mont_10),
    .year_1 (year_1),
    .year_10 (year_10),
    .year_100 (year_100),
    .year_1000 (year_1000),
    .led1 (led1),
    .led2 (led2),
    .led3 (led3),
    .led4 (led4),
    .led5 (led5),
    .led6 (led6),
    .led7 (led7),
    .led8 (led8)
);

endmodule