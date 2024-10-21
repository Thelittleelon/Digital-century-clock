module divide_by_100_10bit (
    input [9:0] dividend,       
    output reg [3:0] quotient    
);

reg [3:0] counter;        
reg [9:0] temp_dividend;  
integer i;
reg loop_condition;

always @(dividend) begin
    temp_dividend = dividend;
    counter = 0;

    // Biến điều kiện để kiểm tra xem có nên tiếp tục vòng lặp hay không
    loop_condition = 1'b1;

    for (i = 0; i < 10 && loop_condition; i = i + 1) begin
        // Kiểm tra xem temp_dividend có nhỏ hơn 10000 không
        if (temp_dividend < 100) begin
            // Nếu nhỏ hơn, thiết lập biến điều kiện thành 0 để kết thúc vòng lặp
            loop_condition = 1'b0;
        end else begin
            // Nếu lớn hơn hoặc bằng 10, tiếp tục vòng lặp và trừ temp_dividend đi 10
            temp_dividend = temp_dividend - 100;
            counter = counter + 1;
        end
    end

    // Gán kết quả cho remainder
    quotient = counter;
end

endmodule