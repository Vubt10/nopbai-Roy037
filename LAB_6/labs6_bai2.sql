--c1
GO
CREATE OR ALTER TRIGGER trg_AfterInsert_ShowGenderCount
ON NHANVIEN
AFTER INSERT
AS
BEGIN
    DECLARE @SoNam INT, @SoNu INT;

    SELECT @SoNam = COUNT(*) FROM NHANVIEN WHERE PHAI = N'Nam';
    SELECT @SoNu = COUNT(*) FROM NHANVIEN WHERE PHAI = N'Nữ';

    PRINT N'Tổng số nhân viên Nam: ' + CAST(@SoNam AS NVARCHAR(10));
    PRINT N'Tổng số nhân viên Nữ: ' + CAST(@SoNu AS NVARCHAR(10));
END;
GO
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Vũ', N'Thị', N'Lan', 'NV301', '1992-01-01', N'Hà Nội', N'Nữ', 18000, NULL, 1);
--c2
GO
CREATE OR ALTER TRIGGER trg_AfterUpdate_GenderCount
ON NHANVIEN
AFTER UPDATE
AS
BEGIN
    IF UPDATE(PHAI)
    BEGIN
        DECLARE @SoNam INT, @SoNu INT;

        SELECT @SoNam = COUNT(*) FROM NHANVIEN WHERE PHAI = N'Nam';
        SELECT @SoNu = COUNT(*) FROM NHANVIEN WHERE PHAI = N'Nữ';

        PRINT N'Cập nhật giới tính nhân viên!';
        PRINT N'Tổng số nhân viên Nam: ' + CAST(@SoNam AS NVARCHAR(10));
        PRINT N'Tổng số nhân viên Nữ: ' + CAST(@SoNu AS NVARCHAR(10));
    END
END;
GO
-- 
UPDATE NHANVIEN
SET PHAI = N'Nam'
WHERE MANV = 'NV301';
--c3
GO
CREATE OR ALTER TRIGGER trg_AfterDelete_DeAn
ON DEAN
AFTER DELETE
AS
BEGIN
    PRINT N'Đã xóa một hoặc nhiều đề án. Thống kê lại số lượng đề án mà mỗi nhân viên đã tham gia:';

    SELECT PC.MA_NVIEN, COUNT(DISTINCT PC.MADA) AS SoDeAn
    FROM PHANCONG PC
    GROUP BY PC.MA_NVIEN;
END;
GO
--
-- Giả sử có đề án có mã 1
DELETE FROM DEAN WHERE MADA = 1;
