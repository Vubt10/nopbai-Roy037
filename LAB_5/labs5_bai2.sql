-- bai 2
--c1 
USE QLDA
CREATE PROCEDURE sp_TT_NhanVien
    @MaNV CHAR(9)
AS
BEGIN
    SELECT * FROM NhanVien WHERE MaNV = @MaNV
END
GO

EXEC sp_TT_NhanVien @Manv = '003';
--c2
CREATE OR ALTER PROCEDURE sp_SoLuongNV_TheoDeAn
    @MaDa INT
AS
BEGIN
    SELECT COUNT(DISTINCT MA_NVIEN) AS SoLuongNV
    FROM PHANCONG
    WHERE MADA = @MaDa;
END;
GO
EXEC sp_SoLuongNV_TheoDeAn @MaDa = 10;
    

--c3
CREATE OR ALTER PROCEDURE sp_SoLuongNV_TheoDeAn_DiaDiem
    @MaDa INT,
    @Ddiem_DA NVARCHAR(15)
AS
BEGIN
    SELECT COUNT(DISTINCT pc.MA_NVIEN) AS SoLuongNV
    FROM PHANCONG pc
    JOIN DEAN da ON pc.MADA = da.MADA
    WHERE da.MADA = @MaDa
      AND da.DDIEM_DA = @Ddiem_DA;
END;
GO

EXEC sp_SoLuongNV_TheoDeAn_DiaDiem @MaDa = 1, @Ddiem_DA = N'Vũng Tàu'
-- c4
CREATE OR ALTER PROCEDURE sp_NV_KhongThanNhan_TheoTrPhong
    @Trphg NVARCHAR(9)
AS
BEGIN
    SELECT nv.*
    FROM NHANVIEN nv
    JOIN PHONGBAN pb ON nv.PHG = pb.MAPHG
    WHERE pb.TRPHG = @Trphg
      AND nv.MANV NOT IN (SELECT DISTINCT MA_NVIEN FROM THANNHAN);
END;
GO

EXEC sp_NV_KhongThanNhan_TheoTrPhong @Trphg = '005';
--c5
CREATE OR ALTER PROCEDURE sp_KiemTraNV_ThuocPhong
    @Manv NVARCHAR(9),
    @Mapb INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM NHANVIEN WHERE MANV = @Manv AND PHG = @Mapb)
        PRINT N'Nhân viên có mã ' + @Manv + N' thuộc phòng ban ' + CAST(@Mapb AS NVARCHAR);
    ELSE
        PRINT N'Nhân viên có mã ' + @Manv + N' KHÔNG thuộc phòng ban ' + CAST(@Mapb AS NVARCHAR);
END;
GO

EXEC sp_KiemTraNV_ThuocPhong @Manv = '001', @Mapb = 4;

