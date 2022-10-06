-- Tổng quan về store procedure 
-- Là nơi lữu trữ 1 tập hợp các câu lệnh  đi kèm 
-- trong CSDL cho phép tái sử dụng khi cần 
-- Hỗ trợ các ứng dụng tương tác nhanh và chính xác hơn
-- Cho phép thực thi nhanh hơn
-- Có thể làm giảm bớt vấn đề kẹt đường truyền mạng 
-- Có thể dử dụng trong đề bảo mật và phân quyền 
-- Có 2 loại Store Procedure :
--     + System store procedure 
--     + User stored procedure 
-- Cấu trúc của store procedure bao gồm:
--    + inputs : nhận vào các tham số đầu vào 
--    + excution : kết hợp các yêu cầu nghiệp: 
--         => Nội dung các bạn code cho phần đấy là gì 
--         => Chứa if else, while....
--    + Outpút: trả ra kết quả có thể là 1 message hoặc table 
-- Cú pháp
-- Create 
-- CREATE PROC 
-- CREATE PROCEDURE tenProcedure (Tham số đầu vào nếu có)
-- AS 
-- BEGIN 
--     // body code 
-- END 
--  Chạy lại khi đã tồn tại DB: ALTER 
-- ALTER PROCEDURE tenProcedure (Tham số đầu vào nếu có)
-- AS 
-- BEGIN 
--     // body code 
-- END 

--  Dùng để gọi procedure : 
-- EXEC tenProcedure
-- EXECUTE tenProcedure

--  Tao 1 procedure dùng để lấy danh sách của nhân viên 
-- có giới tính là Nữ
ALTER PROC DanhSachNhanVienNu 
AS 
BEGIN 
    SELECT * FROM NhanVien WHERE GioiTinh = N'Nam'
END 

EXEC DanhSachNhanVienNu

CREATE PROCEDURE danhSachNV (@gioiTinh NVARCHAR(20))
AS 
BEGIN 
    SELECT * FROM NhanVien WHERE GioiTinh = @gioiTinh
END 
EXEC danhSachNV @gioiTinh = 'Nam'

-- Tạo 1 procedure truyền vào năm bảo hành 
-- và số lượng tồn. 
-- Lấy ra ds chi tiết SP có 
-- năm bảo hành = tham số truỳen vào 
-- và số lương tồn >= số lượng tồn truyền vào

CREATE PROCEDURE danhSachSP(@namBaoHanh int, @soLuongTon int)
AS 
BEGIN 
    SELECT * FROM ChiTietSP 
    WHERE NamBH = @namBaoHanh
    AND SoLuongTon >= @soLuongTon
END 

EXEC danhSachSP @namBaoHanh = 1, @soLuongTon = 200