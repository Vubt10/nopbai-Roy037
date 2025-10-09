--c1
USE QLDA
GO
CREATE OR ALTER PROCEDURE sp_ThemPhongCNTT
    @MaPHG INT,
    @TenPHG NVARCHAR(30),
    @TrPHG NVARCHAR(9),
    @NgayNhanChuc DATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM PHONGBAN WHERE MAPHG = @MaPHG)
        PRINT N'Thêm thất bại – Mã phòng ban đã tồn tại.';
    ELSE
    BEGIN
        INSERT INTO PHONGBAN (MAPHG, TENPHG, TRPHG, NG_NHANCHUC)
        VALUES (@MaPHG, @TenPHG, @TrPHG, @NgayNhanChuc);

        PRINT N'Thêm thành công phòng ban ' + @TenPHG;
    END
END;
GO
EXEC sp_ThemPhongCNTT 10, N'CNTT', '001', '2024-06-01';
--C2
GO
CREATE OR ALTER PROCEDURE sp_DoiTenPhong_CNTT_IT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM PHONGBAN WHERE TENPHG = N'CNTT')
    BEGIN
        UPDATE PHONGBAN
        SET TENPHG = N'IT'
        WHERE TENPHG = N'CNTT';

        PRINT N'Đã đổi tên phòng ban CNTT thành IT.';
    END
    ELSE
        PRINT N'Không tìm thấy phòng ban CNTT để đổi tên.';
END;
GO
EXEC sp_DoiTenPhong_CNTT_IT;
--C3
CREATE OR ALTER PROCEDURE sp_ThemNhanVien_IT
    @MaNV NVARCHAR(9),
    @Ho NVARCHAR(15),
    @TenLot NVARCHAR(15),
    @Ten NVARCHAR(15),
    @NgSinh DATE,
    @DChi NVARCHAR(30),
    @Phai NVARCHAR(3),
    @Luong FLOAT,
    @MaNQL NVARCHAR(9) = NULL
AS
BEGIN
    DECLARE @Tuoi INT, @MaPHG INT;

    -- Lấy mã phòng IT
    SELECT @MaPHG = MAPHG FROM PHONGBAN WHERE TENPHG = N'IT';

    IF @MaPHG IS NULL
    BEGIN
        PRINT N'Không tồn tại phòng IT – hãy tạo phòng này trước.';
        RETURN;
    END

    -- Tính tuổi nhân viên
    SET @Tuoi = DATEDIFF(YEAR, @NgSinh, GETDATE());

    -- Kiểm tra tuổi theo giới tính
    IF ((@Phai = N'Nam' AND @Tuoi BETWEEN 18 AND 65) 
        OR (@Phai = N'Nữ' AND @Tuoi BETWEEN 18 AND 60))
    BEGIN
        -- Chọn người quản lý theo lương
        IF @Luong < 25000 
            SET @MaNQL = '009';
        ELSE 
            SET @MaNQL = '005';

        INSERT INTO NHANVIEN (MANV, HONV, TENLOT, TENNV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
        VALUES (@MaNV, @Ho, @TenLot, @Ten, @NgSinh, @DChi, @Phai, @Luong, @MaNQL, @MaPHG);

        PRINT N'Đã thêm nhân viên mới thành công.';
    END
    ELSE
        PRINT N'Thêm thất bại – tuổi không hợp lệ theo giới tính.';
END;
GO
EXEC sp_ThemNhanVien_IT
    @MaNV = '999',
    @Ho = N'Nguyễn',
    @TenLot = N'Văn',
    @Ten = N'Nam',
    @NgSinh = '1995-05-10',
    @DChi = N'Hà Nội',
    @Phai = N'Nam',
    @Luong = 22000;
