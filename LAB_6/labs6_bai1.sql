-----------c1
USE QLDA
go
CREATE TRIGGER trg_CheckLuong_Insert
ON NHANVIEN
FOR INSERT
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE LUONG <= 15000)
    BEGIN
        RAISERROR(N'Lương phải > 15000', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-- Test sai (lương < 15000)
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Nguyễn', N'Văn', N'B', 'NV200', '1990-01-01', N'Hà Nội', N'Nam', 12000, NULL, 1);

-- Test đúng (lương > 15000)
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Lê', N'Thị', N'C', 'NV201', '1995-05-05', N'Hà Nội', N'Nữ', 20000, NULL, 1);

-------------c2
CREATE TRIGGER trg_CheckTuoi_Insert
ON NHANVIEN
FOR INSERT
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM inserted
        WHERE DATEDIFF(YEAR, NGSINH, GETDATE()) NOT BETWEEN 18 AND 65
    )
    BEGIN
        RAISERROR(N'Độ tuổi phải nằm trong khoảng 18–65', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-- Test sai (tuổi nhỏ hơn 18)
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Phạm', N'Văn', N'D', 'NV202', '2010-06-01', N'Hà Nội', N'Nam', 18000, NULL, 1);

-- Test đúng (tuổi trong khoảng 18–65)
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Đỗ', N'Thị', N'E', 'NV203', '1985-06-01', N'Hà Nội', N'Nữ', 25000, NULL, 1);

---------c3
CREATE TRIGGER trg_BlockUpdate_HCM
ON NHANVIEN
FOR UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM deleted d 
        JOIN inserted i ON d.MANV = i.MANV
        WHERE d.DCHI LIKE N'%TP HCM%' OR d.DCHI LIKE N'%Hồ Chí Minh%'
    )
    BEGIN
        RAISERROR(N'Không được cập nhật nhân viên ở TP HCM', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
-- Cập nhật nhân viên ở TP HCM → lỗi
UPDATE NHANVIEN
SET LUONG = LUONG + 1000
WHERE DCHI LIKE N'%TP HCM%';

-- Cập nhật nhân viên ở Hà Nội → được phép
UPDATE NHANVIEN
SET LUONG = LUONG + 1000
WHERE DCHI LIKE N'%Hà Nội%';


