-- 1 Nhăc lai các loại kiẻu dữ liệu:
--  nvarchar, varchar,int, date, bit....
-- 2. Hướng dẫn cách khai báo biến
-- DECLARE @var_name data type 
--    + @var_name : là tên biến, luôn luôn bắt đầu bằng ký tự @ 
--    + data_type : kiểu dữ liệu của biến 
-- Bài 1: Tạo biến bằng lệnh Declare trong SQL 
--  1.1: Cách tạo biến
DECLARE @year INT
-- 1.2: Gán giá trị cho biến
SET @year = 2022
-- 1.3: Truy xuất giá trị của biến
--  Cú pháp: SELECT @ten_bien 
SELECT @year

-- Bài tập: Tính tổng của 3 số nguyên
DECLARE @b1 INT, @b2 INT, @b3 INT
SET @b1 = 1
SET @b2 = 1
SET @b3 = 1
SELECT (@b1 + @b2 + @b3)

-- 1.3: Lữu trữ câu truy vấn vào biến 
DECLARE @soLuongTonKhoLonNhat INT 
SET @soLuongTonKhoLonNhat = (SELECT MAX(soLuongTon)
FROM ChiTietSP)
-- SELECT @soLuongTonKhoLonNhat
PRINT N'Số lượng max = '+ CONVERT(VARCHAR,@soLuongTonKhoLonNhat)

-- 1.4: Biến bảng
DECLARE @TB_NhanVien TABLE
(id INT , maNV VARCHAR(50),tenNV NVARCHAR(50))

INSERT INTO @TB_NhanVien 
VALUES(1,'HE130461',N'Hằng');

SELECT * FROM @TB_NhanVien

-- T-SQL : Structured Query Langular : 
-- Ngôn ngữ truy vấn có cấu trúc SQL 
-- cho phép các bạn tạo CSDL hoặc là thao tác trên csdl
-- Cú pháp:
-- Begin

-- END
-- Có thể chia thành 4 nhóm lệnh SQL:
--  + Nhóm truy vấn dữ liệu (DQL):  
--      Gồm các lệnh truy vấn để lấy lựa chọn (SELECT)
--        => Không thay đổi dữ liệu của bảng
--  + Nhóm định nghĩa dữ liệu (DDL): 
--       Gồm các lệnh tạo, thay đổi dữ liệu của bảng 
--        (CREATE,ALTER,DROP ....)
--  + Nhóm thao tác dữ liệu (DML): Gồm các lệnh làm thay đổi dữ liệu
--        (INSERT, UPDATE,DELETE...) lưu trong các bảng
--  + Nhóm điều khiẻn dữ liệu (DCL): Gồm các lệnh quản lý quyền truy cập
--        vào dữ liệu và các bảng(Grant, Revoke...)

-- 1.7: Begin và end 
-- T-SQL tổ chức theo từng khối lệnh
-- Một khối lệnh có thể lồng bên trong 1 khối lệnh khác
-- Khối lệnh bắt đầu bằng BEGIN và kết thúc bởi END
-- Bên trong khối lệnh có nhiều lệnh và các lệnh 
-- sẽ ngăn cách nhau bởi dấu chấm phẩy 
-- BEGIN
--  {sql_statement | statement_block}
-- END

--  In ra số dòng của soLuongTon >900 
BEGIN 
    SELECT * 
    FROM ChiTietSP
    WHERE soLuongTon >90

    -- @@ROWCOUNT : Lấy ra số dòng của bản ghi
    PRINT @@ROWCOUNT
END

BEGIN 
DECLARE @soThuNhat FLOAT = 1, @soThuHai FLOAT = 2
PRINT N'TỔNG: ' + CONVERT(VARCHAR,@soThuNhat + @soThuHai)
PRINT N'HIỆU: ' + CONVERT(VARCHAR,@soThuNhat - @soThuHai)
PRINT N'TÍCH: ' + CONVERT(VARCHAR,@soThuNhat * @soThuHai)
PRINT N'THƯƠNG: ' + CONVERT(VARCHAR,@soThuNhat / @soThuHai)
END 

