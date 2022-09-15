﻿@@ -0,0 +1,87 @@
﻿--1.	TẠO CSDL LUYENTAPTRENLOPBUOI2
--LOP(MALOP,TENLOP)
--HOCSINH(MAHS,MALOP,TENHS,DIEM,DIACHI,NGAYSINH)
CREATE DATABASE LUYENTAPTRENLOPBUOI2
GO
USE LUYENTAPTRENLOPBUOI2
CREATE TABLE LOP 
	(
		MALOP VARCHAR(10) PRIMARY KEY,
		TENLOP NVARCHAR(25)
	)
CREATE TABLE HOCSINH
	(
		MAHS VARCHAR(10) PRIMARY KEY,
		MALOP VARCHAR(10),
		TENHS NVARCHAR(100),
		DIEM FLOAT,
		DIACHI NVARCHAR(150),
		NGAYSINH DATE
	)

--2.	INSERT DATA
--LOP
INSERT INTO LOP (MALOP, TENLOP) VALUES
	('M01','IT17301')
INSERT INTO LOP (MALOP, TENLOP) VALUES
	('M02','IT17302')
INSERT INTO LOP (MALOP, TENLOP) VALUES
	('M03','IT17303')
INSERT INTO LOP (MALOP, TENLOP) VALUES
	('M04','IT17304')
--HOCSINH 
INSERT INTO HOCSINH (MAHS,MALOP,TENHS,DIEM,DIACHI,NGAYSINH) VALUES
	('HS01','M01',N'NGUYỄN THÚY HẰNG',10,N'NAM ĐỊNH','2003-02-02')
INSERT INTO HOCSINH (MAHS,MALOP,TENHS,DIEM,DIACHI,NGAYSINH) VALUES
	('HS02','M01',N'VŨ VĂN NGUYÊN',9,N'THÁI BÌNH','2003-01-01')
INSERT INTO HOCSINH (MAHS,MALOP,TENHS,DIEM,DIACHI,NGAYSINH) VALUES
	('HS03','M03',N'NGUYỄN ANH DŨNG',8,N'HÀ NỘI','2004-10-10')
INSERT INTO HOCSINH (MAHS,MALOP,TENHS,DIEM,DIACHI,NGAYSINH) VALUES
	('HS04','M04',N'PHẠM GIA KHÁNH',9,N'HÀ NỘI','2005-10-04')
INSERT INTO HOCSINH (MAHS,MALOP,TENHS,DIEM,DIACHI,NGAYSINH) VALUES
	('HS05','M0',N'NGUYỄN HOÀNG TIẾN',6,N'NAM ĐỊNH','2003-10-09')
--
SELECT * FROM LOP
SELECT * FROM HOCSINH
--3.	VIẾT CÂU QUERY THỰC HIỆN CÁC YÊU CẦU SAU:
---	THÊM CỘT TRUONGHOC NVARCHAR(30)
ALTER TABLE HocSinh
ADD TruongHoc NVARCHAR(30)

---	XOÁ THUỘC TÍNH TRUONGHOC VỪA THÊM Ở TRONG BẢNG SINHVIEN
ALTER TABLE HocSinh
DROP COLUMN TruongHoc

---	THÊM KHOÁ NGOẠI CHO BẢNG SINHVIEN
ALTER TABLE HocSinh
ADD CONSTRAINT fk_malop FOREIGN KEY (malop) 
REFERENCES LOP(maLop)
---	LIỆT KÊ MÃ HỌC SINH, TÊN LỚP, TÊN HỌC SINH, ĐIỂM, ĐỊA CHỈ,
--  NGÀY SINH CỦA 
--TẤT CẢ SINH VIÊN CÓ MÃ LỚP = M01 VÀ SẮP XẾP THEO CHIỀU GIẢM DẦN 
-- CỦA ĐIỂM

SELECT h.MAHS,l.TENLOP,h.TENHS,h.DIEM,h.DIACHI
FROM HOCSINH AS h INNER JOIN LOP as l
ON h.MALOP = l.MALOP
WHERE l.MALOP = 'M01'
ORDER BY h.DIEM DESC

---	LIÊT KỂ MÃ HỌC SINH, TÊN HỌC SINH,TÊN LỚP CỦA TẤT CẢ SINH VIÊN CÓ NGÀY 
--SINH TRONG KHOẢNG 2003-01-01 ĐẾN 2003-12-31


---	LIỆT KÊ MÃ HỌC SINH, TÊN HỌC SINH, TÊN LỚP, ĐIỂM, ĐIỂM TRUNG BÌNH CỦA TẤT
--CẢ SINH VIÊN CÓ ĐIỂM >= ĐIỂM TRUNG BÌNH

SELECT MAHS,TENHS,TENLOP,DIEM
FROM HOCSINH INNER JOIN LOP ON HOCSINH.MALOP = LOP.MALOP
GROUP BY MAHS,TENHS,TENLOP,DIEM
HAVING DIEM >= (SELECT (SUM(HOCSINH.DIEM)/(COUNT(HOCSINH.MAHS))) FROM HOCSINH )

---	LIỆT KÊ MÃ HỌC SINH, TÊN HỌC SINH,ĐIỂM , ĐỊA CHỈ CỦA TẤT CẢ SINH VIÊN CÓ 
--TEN LỚP = IT17302 VÀ ĐIỂM >= 8 VÀ ĐƯỢC HIỂN THỊ THEO
--CHIỀU TĂNG DẦN THEO TÊN HỌC SINH VÀ GIẢM DẦN THEO TUỔI 

---	LIỆT KÊ TOP 5 SINH VIÊN CÓ TÊN LỚP = IT17301 VÀ ĐIỂM >= ĐIỂM TRUNG BÌNH 
