-- 1. Cách chèn dữ liệu có sẵn vào biến bảng 
DECLARE @TB_NhanVienTam TABLE (id INT , maNV VARCHAR(50),tenNV NVARCHAR(50))
INSERT INTO @TB_NhanVienTam  
SELECT Id,ma,ten 
FROM NhanVien
WHERE Ten LIKE 'T%' 
-- T%: Bat dau bang T
SELECT * FROM @TB_NhanVienTam

-- 2. Ham
-- 2.1: CAST - EP KIEU DỮ LIỆU 
-- Hàm CAST trong SQL SERVER chuyển đổi một biểu thức từ kiểu dữ liệu này
-- qua kiểu dữ liệu khác 
--  Nếu chuyển đổi không thành công, CAST sẽ báo lỗi, ngược lại thì nó 
--  sẽ trả về giá trị chuyển đổi tương ứng
-- Cú pháp:
-- CAST(bieuThuc AS kieuDuLieu[(doDai)])
SELECT CAST(1.2 AS INT)
SELECT CAST('2022-09-22' AS DATETIME)
-- 2.2: CONVERT 
-- Hàm CONVERT trong SQL SERVER chuyển đổi một biểu thức từ kiểu dữ liệu này
-- sang kiểu dữ liệu khác 
--  Nếu chuyển đổi không thành công, CONVERT sẽ báo lỗi, ngược lại thì nó 
--  sẽ trả về giá trị chuyển đổi tương ứng
-- Cú pháp:
-- CONVERT(kieuDuLieu(doDai),bieuThuc,dinhDang)
-- dinhDang: khongBatBuoc:  là 1 con số chỉ định việc định dạng cho việc 
-- chuỷen đổi từ kiẻu dữ liẹu từ dạng ngày sang dạng chuỗi 
-- Các dạng định dạng trong convert như là: 101, 102,.....
-- https://quantrimang.com/hoc/ham-convert-trong-sql-server-161965
-- https://www.mssqltips.com/sqlservertip/1145/date-and-time-conversions-using-sql-server/
SELECT CONVERT(INT, 16.4)
SELECT CONVERT (DATE,'2022.09.22',102)

-- 2.3: Các hàm toán học Math
-- Hàm trị tuyệt đối : ABS
-- Hàm tiệm cận trên : CEILING
-- Hàm tiệm cận dưới: FLOOR 
-- Hàm luỹ thừa: POWER
-- Hàm làm tròn: ROUND
-- Hàm lấy căn: SQRT
-- Hàm bình phương: SQUARE 
-- Hàm lấy log: LOG 
-- ..... 
-- 2.4: Các hàm xử lý chuỗi 
-- Lấy độ dai: LEN(STRING)
-- Xoá hết khoảng trắng : TRIM 
-- LTRIM, RTRIM 
-- .... 