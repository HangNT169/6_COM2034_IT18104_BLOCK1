CREATE DATABASE LuyenTapTrenLopBuoi1;

USE LuyenTapTrenLopBuoi1
CREATE TABLE HocSinh(
    maHS varchar(50) NOT NULL  ,
    tenHS nvarchar(50),
    diaChi nvarchar(100),
    diem int,
    ngaySinh date,
    PRIMARY KEY (maHS)
)
INSERT INTO HocSinh
VALUES
('M01',N'Nguyễn Thuý Hằng',N'Nam Đinh',10,'2003-01-01')

SELECT *
FROM HocSinh

SELECT *
FROM HocSinh
WHERE diem >=8
ORDER BY tenHS DESC
