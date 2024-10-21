module module_by_10_6bit (
    input [5:0] dividend,       // Đầu vào số bị chia có kích thước 5 bit
    output reg [3:0] remainder  // Đầu ra phần nguyên của kết quả chia cho 10
);

// Khai báo biến nội bộ
reg [5:0] temp_dividend;  // Biến tạm thời lưu giữ số bị chia
integer i;
reg loop_condition;

always @(dividend) begin
    temp_dividend = dividend;

    // Biến điều kiện để kiểm tra xem có nên tiếp tục vòng lặp hay không
    loop_condition = 1'b1;

    // Đảm bảo rằng vòng lặp không vượt quá 5 lần (vì dividend chỉ có 6 bit)
    for (i = 0; i < 5 && loop_condition; i = i + 1) begin
        // Kiểm tra xem temp_dividend có nhỏ hơn 10 không
        if (temp_dividend < 10) begin
            // Nếu nhỏ hơn, thiết lập biến điều kiện thành 0 để kết thúc vòng lặp
            loop_condition = 1'b0;
        end else begin
            // Nếu lớn hơn hoặc bằng 10, tiếp tục vòng lặp và trừ temp_dividend đi 10
            temp_dividend = temp_dividend - 10;
        end
    end

    // Gán kết quả cho remainder
    remainder = temp_dividend;
end

endmodule