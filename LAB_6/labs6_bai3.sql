--c1
GO
CREATE OR ALTER TRIGGER trg_InsteadOfDelete_NhanVien
ON NHANVIEN
INSTEAD OF DELETE
AS
BEGIN
    -- Xóa thân nhân của nhân viên bị xóa
    DELETE FROM THANNHAN
    WHERE MA_NVIEN IN (SELECT MANV FROM DELETED);

    -- Sau đó xóa nhân viên
    DELETE FROM NHANVIEN
    WHERE MANV IN (SELECT MANV FROM DELETED);

    PRINT N'Đã xóa nhân viên và các thân nhân liên quan.';
END;
GO
--
-- Giả sử có nhân viên mã 'NV301'
DELETE FROM NHANVIEN WHERE MANV = 'NV301';

--c2
GO
CREATE OR ALTER TRIGGER trg_InsteadOfInsert_NhanVien
ON NHANVIEN
INSTEAD OF INSERT
AS
BEGIN
    -- Thêm nhân viên mới vào bảng NHANVIEN
    INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
    SELECT HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG
    FROM INSERTED;

    -- Tự động phân công nhân viên vào đề án MADA = 1
    INSERT INTO PHANCONG (MA_NVIEN, MADA, THOIGIAN)
    SELECT MANV, 1, 10
    FROM INSERTED;

    PRINT N'Đã thêm nhân viên và tự động phân công vào đề án MADA = 1.';
END;
GO
--
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Lê', N'Văn', N'Hiếu', 'NV500', '1996-05-01', N'Hà Nội', N'Nam', 20000, NULL, 1);
