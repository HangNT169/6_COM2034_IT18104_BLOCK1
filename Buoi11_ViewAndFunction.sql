-- 1.Hàm 
-- Là 1 đối tượng trong CSDL
-- chứa các câu lệnh SQL 
-- được biên dịch sẵn và lưu
-- trữ trong CSDL
-- Giá trị trả về của hàm 
--  + Giá trị vô hướng
--  + 1 bảng 
-- So sánh : Hàm vs Thủ tục 
-- Tương tự như Stored procedure 
-- Khác với stored procedure 
-- Các hàm luôn phải trả về 1 giá trị,
-- sử dụng câu lệnh RETURN 
-- Hàm k có tham số đầu ra 
-- => Hàm thì k chứa được các câu lệnh
-- Insert,update, delete trong các bảng,
-- bảng tạm 
-- Ví dụ 1: Viết 1 hàm tính tuổi người dùng
-- khi nhập vào năm sinh
ALTER FUNCTION tinhTuoi(@namSinh INT)
RETURNS INT 
-- phải sử dụng returns để định nghĩa kiểu 
-- dữ liệu trả về của hàm 
AS 
BEGIN 
    RETURN YEAR(GETDATE())-@namSinh
END 

-- Cach goi 
PRINT dbo.tinhTuoi(2004)

SELECT  ma,ten,dbo.tinhTuoi(YEAR(NgaySinh))
FROM NhanVien

-- VD2: Viết Hàm đếm số lượng nhân viên 
-- theo giới tính 
CREATE FUNCTION demSoLuongNhanVien(@gioiTinh NVARCHAR(10))
RETURNS INT
AS 
BEGIN 
    RETURN (SELECT COUNT(GioiTinh)
    FROM NhanVien 
    WHERE GioiTinh = @gioiTinh)
END 

PRINT dbo.demSoLuongNhanVien('Nam')

-- VD3: Viết hàm đếm số lượng nhân viên 
-- theo giới tính và theo từng cửa hàng
CREATE FUNCTION demSoLuongNhanVienTheoCuaHang
(@gioiTinh NVARCHAR(10),@maCuaHang VARCHAR(20))
RETURNS INT
AS 
BEGIN 
    RETURN (SELECT COUNT(GioiTinh)
    FROM NhanVien JOIN CuaHang
    ON NhanVien.IdCH = CuaHang.id 
    WHERE GioiTinh = @gioiTinh
    AND CuaHang.id = @maCuaHang
    )
END 
