module test_clock (
    input clk_1Hz, rst_n,
    output [5:0] sec,
	output [5:0] min,
	output [4:0] hour,
	output [4:0] day,
	output [3:0] mont,
	output [12:0] year
);

Second_Counter IC2 (
	.clk_1Hz(clk_1Hz),
	.rst_n(rst_n),
	.sec(sec)
);

Minute_Counter IC3 (
	.clk_1Hz(clk_1Hz),
	.rst_n(rst_n),
    .sec(sec),
	.min (min)
);

Hour_Counter IC4 (
	.clk_1Hz(clk_1Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
	.hour (hour)
);

Day_Counter IC5 (
	.clk_1Hz(clk_1Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
	.hour (hour),
    .mont (mont),
    .year (year),
    .day (day)
);

Month_Counter IC6 (
	.clk_1Hz(clk_1Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
	.hour (hour),
	.day (day),
    .year (year),
    .mont (mont)
);

Year_Counter IC7 (
	.clk_1Hz(clk_1Hz),
	.rst_n(rst_n),
    .sec(sec),
    .min (min),
	.hour (hour),
	.day (day),
    .mont (mont),
    .year (year)
);

endmodule