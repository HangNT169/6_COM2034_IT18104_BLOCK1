-- 1. Vòng lăp while được sử dụng để lặp nếu
-- muốn lặp đi lặp lại 1 đoạn mã .
-- Cú pháp:
    -- WHILE DK 
    --     BEGIN 
    --         // code gi thi code
    --     END
-- Tao 1 bien dem.
--  Nen dem <5 => in ra ahihihi + dem 
-- => In tu 0-4
DECLARE @dem INT = 0
WHILE @dem < 5 
    BEGIN
        PRINT 'hihihi' + CONVERT(VARCHAR,@dem)
        SET @dem = @dem +1
        -- SET @dem +=1
    END

-- Lệnh break (Ngắt vòng lặp)
-- Lệnh continue : Thực hiện bước lặp tiếp theo 
-- bỏ qua các lệnh trong

--  1. In ra cac phan tu 0 - 10 va bo qua 5
--  2. In ra cac phan tu tu 0 - 10 . Neu gap 9 thi dung lai

DECLARE @dem INT = 0 
WHILE @dem < 11 
    BEGIN
        IF @dem = 5 
           BEGIN
                SET @dem = @dem + 1
                CONTINUE
           END
        PRINT 'Lan chay thu ' +CONVERT(VARCHAR , @dem)
        SET @dem = @dem + 1
    END

DECLARE @dem INT = 0 
WHILE @dem < 11 
    BEGIN
        IF @dem = 9 
           BEGIN
                BREAK
           END
        PRINT 'Lan chay thu ' +CONVERT(VARCHAR , @dem)
        SET @dem = @dem + 1
    END
--  Những điểm cần lưu ý khi làm vòng lặp
--  XĐ được điểm bắt đầu 
--  XĐ được đk ngắt vòng lặp ( nếu có )
--  XĐ bước nhảy là bn

-- 2. Try... catch 
-- SQL cung cấp cơ chế kiểm soát lỗi bằng TRY.... CATCH
-- Hiện nay nó khá phổ biến trong Java, C# ,...
-- Một số hàm ERROR hay dùng
--  ERROR_NUMBER(): Trả về mã số của lỗi dưới dạng số
--  ERROR_MESSAGE():Trả về bằng cách thông báo lỗi dưới
--  hình thức văn bản
--  ERROR_SERVERITY(): Trả về mức độ nghiêm trọng của lỗi
--  theo kiểu INT 
--  ERROR_LINE(): Trả về vị trí dòng lệnh phát sinh ra lỗi
--  ERROR_STATE(): Trả về trạng thái của lỗi dưới dạng số
--  ERROR_PROCEDURE(): Trả về thủ tục hoặc trigger gây lỗi

BEGIN TRY 
-- Chứa những dòng nghi ngờ xảy ra lỗi
    SELECT 1 + 'hihihi'
END TRY 
BEGIN CATCH 
--  Chứa cách xử lý lỗi 
    SELECT ERROR_NUMBER() AS N'Mã lỗi dưới dạng số',
            ERROR_MESSAGE() AS N'Thông báo lỗi'
END CATCH

/* 3.3 RAISERROR
*/
-- CÓ dùng RAISERROR
BEGIN TRY
    INSERT INTO ChucVu VALUES ('NVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',N'Nhân Viên')
END TRY
BEGIN CATCH
    DECLARE @erERROR_SEVERITY INT,@erERROR_MESSAGE VARCHAR(MAX),@erERROR_STATE INT
    SELECT
        @erERROR_SEVERITY = ERROR_SEVERITY(),
        @erERROR_MESSAGE = ERROR_MESSAGE(),
        @erERROR_STATE = ERROR_STATE()
    RAISERROR(@erERROR_MESSAGE,@erERROR_SEVERITY,@erERROR_STATE)
END CATCH
-- Không dùng
BEGIN TRY
    INSERT INTO ChucVu VALUES ('NVaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',N'Nhân Viên')
END TRY
BEGIN CATCH
    DECLARE @erERROR_SEVERITY INT,@erERROR_MESSAGE VARCHAR(MAX),@erERROR_STATE INT
    SELECT
        @erERROR_SEVERITY = ERROR_SEVERITY(),
        @erERROR_MESSAGE = ERROR_MESSAGE(),
        @erERROR_STATE = ERROR_STATE()
    PRINT N'Thông Báo: ' +  ERROR_MESSAGE() + ' | ' + CONVERT(VARCHAR,ERROR_SEVERITY()) + ' | ' + CONVERT(VARCHAR,ERROR_STATE())
END CATCH
-- 3.4 Ý nghĩa của Replicate
DECLARE @ten1234 NVARCHAR(50)
SET @ten1234 = REPLICATE(N'Á',5)--Lặp lại số lần với String truyền vào
PRINT @ten1234

