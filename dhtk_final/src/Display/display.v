module display (
    input [5:0]	sec,
	input [5:0]	min,
	input [4:0]	hour,
	input [4:0]	day,
	input [3:0]	mont,
	input [12:0] year,
    output [6:0] secout_1,secout_10,minout_1,minout_10,hourout_1,hourout_10,dayout_1,dayout_10,montout_1,montout_10,yearout_1,yearout_10,yearout_100,yearout_1000
);  
    wire [3:0] secin_1,secin_10,minin_1,minin_10,hourin_1,hourin_10,dayin_1,dayin_10,montin_1,montin_10,yearin_1,yearin_10,yearin_100,yearin_1000;
    wire [9:0] year_hundr;
    wire [6:0] year_tens;

    assign year_hundr = year - yearin_1000 * 1000;
    assign year_tens = year_hundr - yearin_100 * 100;
    assign yearin_1 = year_tens - yearin_10 * 10;

    module_by_10_6bit s1 (.dividend(sec),.remainder(secin_1));
    divide_by_10_6bit s10 (.dividend(sec),.quotient(secin_10));
    module_by_10_6bit mi1 (.dividend(min),.remainder(minin_1));
    divide_by_10_6bit mi10 (.dividend(min),.quotient(minin_10));
    module_by_10_5bit h1 (.dividend(hour),.remainder(hourin_1));
    divide_by_10_5bit h10 (.dividend(hour),.quotient(hourin_10));
    module_by_10_5bit d1 (.dividend(day),.remainder(dayin_1));
    divide_by_10_5bit d10 (.dividend(day),.quotient(dayin_10));
    module_by_10_4bit m1 (.dividend(mont),.remainder(montin_1));
    divide_by_10_4bit m10 (.dividend(mont),.quotient(montin_10));
    divide_by_10_7bit y10 (.dividend(year_tens),.quotient(yearin_10));
    divide_by_100_10bit y100 (.dividend(year_hundr),.quotient(yearin_100));
    divide_by_1000_13bit y1000 (.dividend(year),.quotient(yearin_1000));
    
    //assign secin_1=sec%10;
    //assign secin_10=sec/10;
    //assign minin_1=min%10;
    //assign minin_10=min/10;
    //assign hourin_1=hour%10;
    //assign hourin_10=hour/10;
    //assign dayin_1=day%10;
    //assign dayin_10=day/10;
    //assign montin_1=mont%10;
    //assign montin_10=mont/10;
    //assign yearin_1=year%10;
    //assign yearin_10=((year-yearin_1)/10)%10;
    //assign yearin_100=((year-yearin_1-yearin_10*10)/100)%10;
    //assign yearin_1000=year/1000;
    
    seg_decoder m_0    (.x(secin_1),.seg(secout_1));
    seg_decoder m_1    (.x(secin_10),.seg(secout_10));
    seg_decoder m_2    (.x(minin_1),.seg(minout_1));
    seg_decoder m_3    (.x(minin_10),.seg(minout_10));
    seg_decoder m_4    (.x(hourin_1),.seg(hourout_1));
    seg_decoder m_5    (.x(hourin_10),.seg(hourout_10));
    seg_decoder m_6    (.x(dayin_1),.seg(dayout_1));
    seg_decoder m_7    (.x(dayin_10),.seg(dayout_10));
    seg_decoder m_8    (.x(montin_1),.seg(montout_1));
    seg_decoder m_9    (.x(montin_10),.seg(montout_10));
    seg_decoder m_10   (.x(yearin_1),.seg(yearout_1));
    seg_decoder m_11   (.x(yearin_10),.seg(yearout_10));
    seg_decoder m_12   (.x(yearin_100),.seg(yearout_100));
    seg_decoder m_13   (.x(yearin_1000),.seg(yearout_1000));
endmodule
