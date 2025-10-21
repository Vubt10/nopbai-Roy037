Use QLNHATRO_NGUYENHOANGMINH;
go
--------------------------------------------------------- Y1---------------------------------------------------
CREATE TABLE LOAINHA (
    LoaiNhaID INT IDENTITY(1,1) PRIMARY KEY,
    TenLoai NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE NGUOIDUNG (
    NguoiDungID INT IDENTITY(1,1) PRIMARY KEY,
    TenNguoiDung NVARCHAR(100) NOT NULL,
    GioiTinh NVARCHAR(10),
    DienThoai VARCHAR(15),
    SoNha NVARCHAR(50),
    TenDuong NVARCHAR(100),
    TenPhuong NVARCHAR(100),
    Quan NVARCHAR(100),
    Email NVARCHAR(100)
);
GO
CREATE TABLE NHATRO (
    NhaTroID INT IDENTITY(1,1) PRIMARY KEY,
    LoaiNhaID INT NOT NULL FOREIGN KEY REFERENCES LOAINHA(LoaiNhaID),
    DienTich FLOAT,
    GiaPhong DECIMAL(15,2),
    SoNha NVARCHAR(50),
    TenDuong NVARCHAR(100),
    TenPhuong NVARCHAR(100),
    Quan NVARCHAR(100),
    MoTa NVARCHAR(MAX),
    NgayDangTin DATE,
    NguoiLienHeID INT NOT NULL FOREIGN KEY REFERENCES NGUOIDUNG(NguoiDungID)
);
GO
CREATE TABLE DANHGIA (
    DanhGiaID INT IDENTITY(1,1) PRIMARY KEY,
    NguoiDanhGiaID INT NOT NULL FOREIGN KEY REFERENCES NGUOIDUNG(NguoiDungID),
    NhaTroID INT NOT NULL FOREIGN KEY REFERENCES NHATRO(NhaTroID),
    LikeDislike BIT NOT NULL,
    NoiDung NVARCHAR(MAX),
    NgayDanhGia DATE
);
----------------------------------------------------Y2-------------------------------------------------------
INSERT INTO LOAINHA (TenLoai) VALUES
(N'Nhà nguyên căn'),
(N'Căn hộ mini'),
(N'Phòng trọ cao cấp'),
(N'Chung cư mini');

INSERT INTO NGUOIDUNG (TenNguoiDung, GioiTinh, DienThoai, SoNha, TenDuong, TenPhuong, Quan, Email) VALUES
(N'Ngô Văn Bình', N'Nam', '0911111001', N'45', N'Lê Lai', N'Phường Bến Thành', N'Quận 1', 'binh.ngo@gmail.com'),
(N'Phạm Thị Hồng', N'Nữ', '0911111002', N'12', N'Nguyễn Văn Cừ', N'Phường 2', N'Quận 5', 'hong.pham@gmail.com'),
(N'Lý Quốc Dũng', N'Nam', '0911111003', N'78', N'Trần Phú', N'Phường 9', N'Quận 4', 'dung.ly@gmail.com'),
(N'Trần Thu Trang', N'Nữ', '0911111004', N'33', N'Lý Chính Thắng', N'Phường 8', N'Quận 3', 'trang.tran@gmail.com'),
(N'Vũ Minh Hoàng', N'Nam', '0911111005', N'120', N'Phan Đăng Lưu', N'Phường 7', N'Phú Nhuận', 'hoang.vu@gmail.com'),
(N'Nguyễn Thị Mỹ Linh', N'Nữ', '0911111006', N'67', N'Nguyễn Kiệm', N'Phường 4', N'Gò Vấp', 'linh.nguyen@gmail.com'),
(N'Đặng Văn Phúc', N'Nam', '0911111007', N'22', N'Trường Chinh', N'Phường 15', N'Tân Bình', 'phuc.dang@gmail.com'),
(N'Lê Hồng Nhung', N'Nữ', '0911111008', N'98', N'Thích Quảng Đức', N'Phường 5', N'Bình Thạnh', 'nhung.le@gmail.com'),
(N'Tô Quang Huy', N'Nam', '0911111009', N'145', N'Cách Mạng Tháng 8', N'Phường 10', N'Quận 10', 'huy.to@gmail.com'),
(N'Hoàng Lan Phương', N'Nữ', '0911111010', N'32', N'Hoàng Diệu 2', N'Phường Linh Trung', N'Thủ Đức', 'phuong.hoang@gmail.com');

INSERT INTO NHATRO (LoaiNhaID, DienTich, GiaPhong, SoNha, TenDuong, TenPhuong, Quan, MoTa, NgayDangTin, NguoiLienHeID) VALUES
(1, 60, 8000000, N'12', N'Tôn Thất Tùng', N'Phường 1', N'Quận 1', N'Nhà nguyên căn 2 tầng, có sân thượng', '2022-01-15', 1),
(2, 25, 3500000, N'56', N'Trần Hưng Đạo', N'Phường 14', N'Quận 5', N'Căn hộ mini đầy đủ nội thất', '2022-02-10', 2),
(3, 40, 4500000, N'78', N'Lê Quang Định', N'Phường 11', N'Bình Thạnh', N'Phòng trọ cao cấp, mới xây', '2022-03-08', 3),
(4, 30, 3200000, N'99', N'Nguyễn Thái Sơn', N'Phường 4', N'Gò Vấp', N'Chung cư mini, có thang máy', '2022-04-12', 4),
(1, 75, 9500000, N'23', N'Hoàng Văn Thụ', N'Phường 2', N'Tân Bình', N'Nhà nguyên căn, tiện kinh doanh', '2022-05-20', 5),
(2, 28, 3800000, N'88', N'Nguyễn Văn Đậu', N'Phường 7', N'Bình Thạnh', N'Căn hộ mini, gần chợ', '2022-06-11', 6),
(3, 45, 5000000, N'15', N'Cách Mạng Tháng 8', N'Phường 10', N'Quận 10', N'Phòng rộng rãi, thoáng mát', '2022-07-09', 7),
(4, 35, 4000000, N'67', N'Đinh Bộ Lĩnh', N'Phường 26', N'Bình Thạnh', N'Chung cư mini, có hầm gửi xe', '2022-08-02', 8),
(1, 90, 12000000, N'145', N'Lý Thường Kiệt', N'Phường 6', N'Quận 10', N'Nhà nguyên căn 3 tầng, nội thất cao cấp', '2022-09-18', 9),
(2, 32, 4200000, N'200', N'Tô Hiến Thành', N'Phường 15', N'Quận 10', N'Căn hộ mini, an ninh 24/24', '2022-10-05', 10);

INSERT INTO DANHGIA (NguoiDanhGiaID, NhaTroID, LikeDislike, NoiDung, NgayDanhGia) VALUES
(2, 1, 1, N'Nhà sạch sẽ, rộng rãi', '2022-01-20'),
(3, 2, 0, N'Phòng nhỏ, giá hơi cao', '2022-02-15'),
(4, 3, 1, N'Thích vì gần trung tâm', '2022-03-12'),
(5, 4, 0, N'Thang máy hay bị hỏng', '2022-04-18'),
(6, 5, 1, N'Nhà nguyên căn phù hợp nhóm bạn', '2022-05-25'),
(7, 6, 1, N'Phòng đẹp, gần chợ tiện lợi', '2022-06-14'),
(8, 7, 0, N'Buổi tối hơi ồn', '2022-07-10'),
(9, 8, 1, N'Có hầm xe rất tiện', '2022-08-05'),
(10, 9, 1, N'Nội thất sang trọng, rất thích', '2022-09-20'),
(1, 10, 0, N'Giá cao so với diện tích', '2022-10-08');

select * from LOAINHA 
select * from NHATRO 
select * from NGUOIDUNG 
select * from DANHGIA
---------------------------------------------------Y3---------------------------------------------
--1.1. SP chèn dữ liệu vào bảng NGUOIDUNG
-- SP thứ nhất: Chèn dữ liệu vào bảng NGUOIDUNG
Use QLNHATRO_NGUYENHOANGMINH;
go
GO
CREATE PROCEDURE sp_Insert_NGUOIDUNG
    @TenNguoiDung NVARCHAR(100),
    @GioiTinh NVARCHAR(10) = NULL,
    @DienThoai VARCHAR(15) = NULL,
    @SoNha NVARCHAR(50) = NULL,
    @TenDuong NVARCHAR(100) = NULL,
    @TenPhuong NVARCHAR(100) = NULL,
    @Quan NVARCHAR(100) = NULL,
    @Email NVARCHAR(100) = NULL
AS
BEGIN
    -- Kiểm tra tham số NOT NULL (TenNguoiDung)
    IF @TenNguoiDung IS NULL OR @TenNguoiDung = ''
    BEGIN
        -- In thông báo lỗi
        RAISERROR(N'Lỗi: Tên người dùng không được để trống.', 16, 1);
        RETURN;
    END
    
    -- Thực hiện chèn
    INSERT INTO NGUOIDUNG (TenNguoiDung, GioiTinh, DienThoai, SoNha, TenDuong, TenPhuong, Quan, Email)
    VALUES (@TenNguoiDung, @GioiTinh, @DienThoai, @SoNha, @TenDuong, @TenPhuong, @Quan, @Email);
    
    SELECT N'Thêm người dùng thành công. ID: ' + CAST(SCOPE_IDENTITY() AS NVARCHAR(10)) AS KetQua;
END
GO

-- Lời gọi 1: Chèn thành công
EXEC sp_Insert_NGUOIDUNG 
    @TenNguoiDung = N'Nguyễn Hoàng Minh', 
    @GioiTinh = N'Nam', 
    @DienThoai = '0987654321', 
    @Quan = N'Cầu Giấy', 
    @Email = 'minh.nguyen@example.com';

-- Lời gọi 2: Trả về thông báo lỗi (Bỏ trống TenNguoiDung)
EXEC sp_Insert_NGUOIDUNG 
    @TenNguoiDung = NULL, 
    @GioiTinh = N'Nữ';

-- 
SELECT * FROM NGUOIDUNG; -- Kiểm tra
--===================================
--===================================
--===================================
--===================================
--1.2. SP chèn dữ liệu vào bảng NHATRO
-- SP thứ hai: Chèn dữ liệu vào bảng NHATRO
Use QLNHATRO_NGUYENHOANGMINH;
go
GO
CREATE PROCEDURE sp_Insert_NHATRO
    @LoaiNhaID INT,
    @DienTich FLOAT,
    @GiaPhong DECIMAL(15,2),
    @Quan NVARCHAR(100),
    @MoTa NVARCHAR(MAX) = NULL,
    @NgayDangTin DATE,
    @NguoiLienHeID INT,
    @SoNha NVARCHAR(50) = NULL,
    @TenDuong NVARCHAR(100) = NULL,
    @TenPhuong NVARCHAR(100) = NULL
AS
BEGIN
    -- Kiểm tra tham số NOT NULL (LoaiNhaID, DienTich, GiaPhong, Quan, NgayDangTin, NguoiLienHeID)
    IF @LoaiNhaID IS NULL OR @DienTich IS NULL OR @GiaPhong IS NULL OR 
       @Quan IS NULL OR @Quan = '' OR @NgayDangTin IS NULL OR @NguoiLienHeID IS NULL
    BEGIN
        RAISERROR(N'Lỗi: Vui lòng nhập đầy đủ các thông tin bắt buộc: Loại nhà, Diện tích, Giá phòng, Quận, Ngày đăng, Người liên hệ.', 16, 1);
        RETURN;
    END
    
    -- Kiểm tra sự tồn tại của LoaiNhaID và NguoiLienHeID (tăng tính toàn vẹn)
    IF NOT EXISTS (SELECT 1 FROM LOAINHA WHERE LoaiNhaID = @LoaiNhaID)
    BEGIN
        RAISERROR(N'Lỗi: Loại nhà ID không tồn tại.', 16, 1);
        RETURN;
    END
    
    IF NOT EXISTS (SELECT 1 FROM NGUOIDUNG WHERE NguoiDungID = @NguoiLienHeID)
    BEGIN
        RAISERROR(N'Lỗi: Người liên hệ ID không tồn tại.', 16, 1);
        RETURN;
    END

    -- Thực hiện chèn
    INSERT INTO NHATRO (LoaiNhaID, DienTich, GiaPhong, SoNha, TenDuong, TenPhuong, Quan, MoTa, NgayDangTin, NguoiLienHeID)
    VALUES (@LoaiNhaID, @DienTich, @GiaPhong, @SoNha, @TenDuong, @TenPhuong, @Quan, @MoTa, @NgayDangTin, @NguoiLienHeID);
    
    SELECT N'Thêm nhà trọ thành công. ID: ' + CAST(SCOPE_IDENTITY() AS NVARCHAR(10)) AS KetQua;
END
GO

-- Lời gọi 1: Chèn thành công (Sử dụng ID mẫu)
EXEC sp_Insert_NHATRO 
    @LoaiNhaID = 4, 
    @DienTich = 20.5, 
    @GiaPhong = 2500000, 
    @Quan = N'Đống Đa', 
    @MoTa = N'Phòng trọ mới xây, có ban công', 
    @NgayDangTin = '2025-10-21', 
    @NguoiLienHeID = 1;

-- Lời gọi 2: Trả về thông báo lỗi (Bỏ trống GiaPhong)
EXEC sp_Insert_NHATRO 
    @LoaiNhaID = 1, 
    @DienTich = 50, 
    @GiaPhong = NULL, 
    @Quan = N'Hoàn Kiếm', 
    @NgayDangTin = '2025-10-21', 
    @NguoiLienHeID = 2;

-- 
SELECT * FROM NHATRO; -- Kiểm tra
--===================================
--===================================
--===================================
--===================================
--1.3. SP chèn dữ liệu vào bảng DANHGIA
-- SP thứ ba: Chèn dữ liệu vào bảng DANHGIA
Use QLNHATRO_NGUYENHOANGMINH;
go
GO
CREATE PROCEDURE sp_Insert_DANHGIA
    @NguoiDanhGiaID INT,
    @NhaTroID INT,
    @LikeDislike BIT, -- 1: LIKE, 0: DISLIKE
    @NoiDung NVARCHAR(MAX) = NULL,
    @NgayDanhGia DATE
AS
BEGIN
    -- Kiểm tra tham số NOT NULL (NguoiDanhGiaID, NhaTroID, LikeDislike, NgayDanhGia)
    IF @NguoiDanhGiaID IS NULL OR @NhaTroID IS NULL OR @LikeDislike IS NULL OR @NgayDanhGia IS NULL
    BEGIN
        RAISERROR(N'Lỗi: Vui lòng nhập đầy đủ các thông tin bắt buộc: Người đánh giá, Nhà trọ, LIKE/DISLIKE, Ngày đánh giá.', 16, 1);
        RETURN;
    END

    -- Kiểm tra sự tồn tại của ID (tăng tính toàn vẹn)
    IF NOT EXISTS (SELECT 1 FROM NGUOIDUNG WHERE NguoiDungID = @NguoiDanhGiaID)
    BEGIN
        RAISERROR(N'Lỗi: Người đánh giá ID không tồn tại.', 16, 1);
        RETURN;
    END
    
    IF NOT EXISTS (SELECT 1 FROM NHATRO WHERE NhaTroID = @NhaTroID)
    BEGIN
        RAISERROR(N'Lỗi: Nhà trọ ID không tồn tại.', 16, 1);
        RETURN;
    END

    -- Thực hiện chèn
    INSERT INTO DANHGIA (NguoiDanhGiaID, NhaTroID, LikeDislike, NoiDung, NgayDanhGia)
    VALUES (@NguoiDanhGiaID, @NhaTroID, @LikeDislike, @NoiDung, @NgayDanhGia);
    
    SELECT N'Thêm đánh giá thành công. ID: ' + CAST(SCOPE_IDENTITY() AS NVARCHAR(10)) AS KetQua;
END
GO

-- Lời gọi 1: Chèn thành công (LIKE cho nhà trọ 1)
EXEC sp_Insert_DANHGIA 
    @NguoiDanhGiaID = 10, 
    @NhaTroID = 1, 
    @LikeDislike = 1, 
    @NoiDung = N'Nhà rất tuyệt vời, rất đáng tiền!', 
    @NgayDanhGia = '2025-10-21';

-- Lời gọi 2: Trả về thông báo lỗi (Bỏ trống LikeDislike)
EXEC sp_Insert_DANHGIA 
    @NguoiDanhGiaID = 1, 
    @NhaTroID = 1, 
    @LikeDislike = NULL, 
    @NgayDanhGia = '2025-10-21';

-- 
SELECT * FROM DANHGIA; -- Kiểm tra


--2. Truy vấn thông tin



-- 2.a. SP tìm kiếm nhà trọ theo nhiều tiêu chí
GO
CREATE PROCEDURE sp_TimKiemNhaTro
    @Quan NVARCHAR(100) = NULL,
    @MinDienTich FLOAT = NULL,
    @MaxDienTich FLOAT = NULL,
    @NgayDangTu DATE = NULL,
    @NgayDangDen DATE = NULL,
    @MinGiaPhong DECIMAL(15,2) = NULL,
    @MaxGiaPhong DECIMAL(15,2) = NULL,
    @LoaiNhaID INT = NULL
AS
BEGIN
    SELECT 
        -- Cột 1: Địa chỉ phòng trọ (Định dạng: 'Cho thuê phòng trọ tại' + <Địa chỉ>)
        N'Cho thuê phòng trọ tại ' + 
        ISNULL(NT.SoNha + N', ', '') + ISNULL(NT.TenDuong + N', ', '') + 
        NT.TenPhuong + N', ' + NT.Quan AS N'Thông Tin Phòng Trọ',
        
        -- Cột 2: Diện tích (Định dạng số chuẩn VN + m2)
        REPLACE(CAST(CAST(NT.DienTich AS DECIMAL(10,1)) AS NVARCHAR(20)), '.', ',') + N' m2' AS N'Diện Tích',
        
        -- Cột 3: Giá phòng (Định dạng số chuẩn VN. Ví dụ 1.700.000)
        FORMAT(NT.GiaPhong, '#,0', 'vi-VN') AS N'Giá Phòng',
        
        -- Cột 4: Mô tả phòng trọ
        NT.MoTa AS N'Mô Tả',
        
        -- Cột 5: Ngày đăng tin (Định dạng chuẩn Việt Nam: dd-MM-yyyy)
        FORMAT(NT.NgayDangTin, 'dd-MM-yyyy') AS N'Ngày Đăng Tin',
        
        -- Cột 6: Thông tin người liên hệ (A. <Tên> nếu Nam, C. <Tên> nếu Nữ)
        CASE 
            WHEN ND.GioiTinh = N'Nam' THEN N'A. ' + ND.TenNguoiDung
            WHEN ND.GioiTinh = N'Nữ' THEN N'C. ' + ND.TenNguoiDung
            ELSE ND.TenNguoiDung -- Trường hợp khác
        END AS N'Người Liên Hệ',
        
        -- Cột 7: Số điện thoại liên hệ
        ND.DienThoai AS N'Điện Thoại',
        
        -- Cột 8: Địa chỉ người liên hệ
        ISNULL(ND.SoNha + N', ', '') + ISNULL(ND.TenDuong + N', ', '') + 
        ND.TenPhuong + N', ' + ND.Quan AS N'Địa Chỉ Người Liên Hệ'
    FROM 
        NHATRO NT
    JOIN 
        NGUOIDUNG ND ON NT.NguoiLienHeID = ND.NguoiDungID
    WHERE 
        (@Quan IS NULL OR NT.Quan = @Quan)
        AND (@MinDienTich IS NULL OR NT.DienTich >= @MinDienTich)
        AND (@MaxDienTich IS NULL OR NT.DienTich <= @MaxDienTich)
        AND (@NgayDangTu IS NULL OR NT.NgayDangTin >= @NgayDangTu)
        AND (@NgayDangDen IS NULL OR NT.NgayDangTin <= @NgayDangDen)
        AND (@MinGiaPhong IS NULL OR NT.GiaPhong >= @MinGiaPhong)
        AND (@MaxGiaPhong IS NULL OR NT.GiaPhong <= @MaxGiaPhong)
        AND (@LoaiNhaID IS NULL OR NT.LoaiNhaID = @LoaiNhaID)
    ORDER BY NT.GiaPhong DESC;
END
GO

-- Lời gọi 1: Tìm kiếm nhà trọ ở Quận 10, giá từ 4 triệu đến 10 triệu
EXEC sp_TimKiemNhaTro 
    @Quan = N'Quận 10', 
    @MinGiaPhong = 4000000, 
    @MaxGiaPhong = 10000000;

-- Lời gọi 2: Tìm kiếm nhà trọ Loại 2 (Căn hộ mini), diện tích từ 25m2 trở lên, đăng tin trong năm 2022
EXEC sp_TimKiemNhaTro 
    @LoaiNhaID = 2, 
    @MinDienTich = 25, 
    @NgayDangTu = '2022-01-01', 
    @NgayDangDen = '2022-12-31';







-- 2.b. Hàm trả về Mã người dùng
GO
CREATE FUNCTION fn_GetNguoiDungID
(
    @TenNguoiDung NVARCHAR(100),
    @GioiTinh NVARCHAR(10) = NULL,
    @DienThoai VARCHAR(15) = NULL,
    @SoNha NVARCHAR(50) = NULL,
    @TenDuong NVARCHAR(100) = NULL,
    @TenPhuong NVARCHAR(100) = NULL,
    @Quan NVARCHAR(100) = NULL,
    @Email NVARCHAR(100) = NULL
)
RETURNS INT
AS
BEGIN
    DECLARE @NguoiDungID INT;

    SELECT TOP 1 @NguoiDungID = NguoiDungID
    FROM NGUOIDUNG
    WHERE 
        TenNguoiDung = @TenNguoiDung
        AND (@GioiTinh IS NULL OR GioiTinh = @GioiTinh)
        AND (@DienThoai IS NULL OR DienThoai = @DienThoai)
        AND (@SoNha IS NULL OR SoNha = @SoNha)
        AND (@TenDuong IS NULL OR TenDuong = @TenDuong)
        AND (@TenPhuong IS NULL OR TenPhuong = @TenPhuong)
        AND (@Quan IS NULL OR Quan = @Quan)
        AND (@Email IS NULL OR Email = @Email);

    RETURN @NguoiDungID;
END
GO

-- Lời gọi hàm:
-- Tìm người dùng có tên 'Ngô Văn Bình' và điện thoại '0911111001'
SELECT dbo.fn_GetNguoiDungID(N'Ngô Văn Bình', NULL, '0911111001', NULL, NULL, NULL, NULL, NULL) AS MaNguoiDung;

-- Tìm người dùng có tên 'Trần Thu Trang'
SELECT dbo.fn_GetNguoiDungID(N'Trần Thu Trang', NULL, NULL, NULL, NULL, NULL, NULL, NULL) AS MaNguoiDung;



-- 2.c. Hàm trả về tổng LIKE và DISLIKE của nhà trọ
GO
CREATE FUNCTION fn_GetTotalLikeDislike
(
    @NhaTroID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        NhaTroID,
        SUM(CASE WHEN LikeDislike = 1 THEN 1 ELSE 0 END) AS TotalLIKE,
        SUM(CASE WHEN LikeDislike = 0 THEN 1 ELSE 0 END) AS TotalDISLIKE
    FROM 
        DANHGIA
    WHERE 
        NhaTroID = @NhaTroID
    GROUP BY
        NhaTroID
);
GO

-- Lời gọi hàm:
-- Xem tổng LIKE/DISLIKE của Nhà trọ ID = 1
SELECT * FROM dbo.fn_GetTotalLikeDislike(1);

-- Xem tổng LIKE/DISLIKE của Nhà trọ ID = 2
SELECT * FROM dbo.fn_GetTotalLikeDislike(2);




-- 2.d. View TOP 10 nhà trọ LIKE nhiều nhất
GO
CREATE VIEW vw_Top10NhaTroNhieuLIKE
AS
SELECT TOP 10
    NT.DienTich,
    NT.GiaPhong,
    NT.MoTa,
    NT.NgayDangTin,
    ND.TenNguoiDung AS N'Tên Người Liên Hệ',
    ISNULL(ND.SoNha + N', ', '') + ISNULL(ND.TenDuong + N', ', '') + ND.TenPhuong + N', ' + ND.Quan AS N'Địa Chỉ Người Liên Hệ',
    ND.DienThoai,
    ND.Email
FROM 
    NHATRO NT
JOIN 
    NGUOIDUNG ND ON NT.NguoiLienHeID = ND.NguoiDungID
LEFT JOIN (
    SELECT 
        NhaTroID, 
        SUM(CASE WHEN LikeDislike = 1 THEN 1 ELSE 0 END) AS TotalLIKE
    FROM DANHGIA 
    GROUP BY NhaTroID
) AS DG ON NT.NhaTroID = DG.NhaTroID
ORDER BY 
    ISNULL(DG.TotalLIKE, 0) DESC, -- Sắp xếp theo số LIKE giảm dần
    NT.NgayDangTin DESC; -- Trường hợp bằng LIKE thì ưu tiên tin mới hơn
GO

-- Lời gọi View:
SELECT * FROM vw_Top10NhaTroNhieuLIKE;




-- 2.e. SP trả về thông tin đánh giá của một nhà trọ
GO
CREATE PROCEDURE sp_GetDanhGiaByNhaTroID
    @NhaTroID INT
AS
BEGIN
    SELECT 
        DG.NhaTroID AS N'Mã Nhà Trọ',
        ND.TenNguoiDung AS N'Tên Người Đánh Giá',
        CASE 
            WHEN DG.LikeDislike = 1 THEN N'LIKE'
            ELSE N'DISLIKE'
        END AS N'Trạng Thái',
        DG.NoiDung AS N'Nội Dung Đánh Giá',
        DG.NgayDanhGia
    FROM 
        DANHGIA DG
    JOIN 
        NGUOIDUNG ND ON DG.NguoiDanhGiaID = ND.NguoiDungID
    WHERE 
        DG.NhaTroID = @NhaTroID
    ORDER BY DG.NgayDanhGia DESC;
END
GO

-- Lời gọi SP:
-- Xem đánh giá của Nhà trọ ID = 1
EXEC sp_GetDanhGiaByNhaTroID 1;

-- Xem đánh giá của Nhà trọ ID = 4
EXEC sp_GetDanhGiaByNhaTroID 4;




--------------------------------
--3. Xóa thông tin
-- 3.1. SP xóa nhà trọ có tổng DISLIKE lớn hơn tham số
GO
CREATE PROCEDURE sp_DeleteNhaTroByDislike
    @MinDislikes INT
AS
BEGIN
    -- Kiểm tra tham số
    IF @MinDislikes IS NULL OR @MinDislikes < 0
    BEGIN
        RAISERROR(N'Lỗi: Số lượng DISLIKE phải là số nguyên dương.', 16, 1);
        RETURN;
    END

    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Bảng tạm lưu ID các nhà trọ cần xóa
        CREATE TABLE #NhaTroCanXoa (NhaTroID INT);
        
        INSERT INTO #NhaTroCanXoa (NhaTroID)
        SELECT 
            DG.NhaTroID
        FROM 
            DANHGIA DG
        WHERE 
            DG.LikeDislike = 0 -- Chỉ đếm DISLIKE
        GROUP BY 
            DG.NhaTroID
        HAVING 
            COUNT(DG.DanhGiaID) > @MinDislikes;

        -- 1. Xóa thông tin đánh giá liên quan
        DELETE FROM DANHGIA
        WHERE NhaTroID IN (SELECT NhaTroID FROM #NhaTroCanXoa);

        -- 2. Xóa thông tin nhà trọ
        DELETE FROM NHATRO
        WHERE NhaTroID IN (SELECT NhaTroID FROM #NhaTroCanXoa);

        -- Nếu không có lỗi, hoàn tất giao dịch
        COMMIT TRANSACTION;
        SELECT N'Đã xóa thành công ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + N' nhà trọ và các đánh giá liên quan.' AS KetQua;
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, hoàn tác giao dịch
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        
        -- Ném lại lỗi để người dùng biết
        THROW;
    END CATCH

    DROP TABLE IF EXISTS #NhaTroCanXoa;
END
GO

-- Lời gọi SP:
-- Xóa các nhà trọ có TỔNG DISLIKE > 1
-- (Dựa trên dữ liệu mẫu: Nhà trọ ID 2, 4, 7, 10 đều có 1 DISLIKE. Nếu set @MinDislikes=0 thì sẽ xóa các nhà trọ có 1 DISLIKE trở lên)
EXEC sp_DeleteNhaTroByDislike 0; -- Ví dụ: Xóa các nhà trọ có hơn 0 (tức là 1 trở lên) DISLIKE.
-- SELECT * FROM NHATRO; -- Kiểm tra
-- SELECT * FROM DANHGIA; -- Kiểm tra

-- 3.2. SP xóa nhà trọ theo khoảng thời gian đăng tin
GO
CREATE PROCEDURE sp_DeleteNhaTroByDateRange
    @NgayBatDau DATE,
    @NgayKetThuc DATE
AS
BEGIN
    -- Kiểm tra tham số
    IF @NgayBatDau IS NULL OR @NgayKetThuc IS NULL OR @NgayBatDau > @NgayKetThuc
    BEGIN
        RAISERROR(N'Lỗi: Vui lòng nhập khoảng thời gian hợp lệ.', 16, 1);
        RETURN;
    END

    -- Bắt đầu giao dịch
    BEGIN TRANSACTION;
    
    BEGIN TRY
        -- Bảng tạm lưu ID các nhà trọ cần xóa
        CREATE TABLE #NhaTroCanXoa_Date (NhaTroID INT);
        
        INSERT INTO #NhaTroCanXoa_Date (NhaTroID)
        SELECT NhaTroID
        FROM NHATRO
        WHERE NgayDangTin BETWEEN @NgayBatDau AND @NgayKetThuc;

        -- 1. Xóa thông tin đánh giá liên quan
        DELETE FROM DANHGIA
        WHERE NhaTroID IN (SELECT NhaTroID FROM #NhaTroCanXoa_Date);

        -- 2. Xóa thông tin nhà trọ
        DELETE FROM NHATRO
        WHERE NhaTroID IN (SELECT NhaTroID FROM #NhaTroCanXoa_Date);

        -- Nếu không có lỗi, hoàn tất giao dịch
        COMMIT TRANSACTION;
        SELECT N'Đã xóa thành công ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + N' nhà trọ đăng trong khoảng thời gian và các đánh giá liên quan.' AS KetQua;
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, hoàn tác giao dịch
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        
        -- Ném lại lỗi
        THROW;
    END CATCH

    DROP TABLE IF EXISTS #NhaTroCanXoa_Date;
END
GO

-- Lời gọi SP:
-- Xóa các nhà trọ được đăng trong Q1 năm 2022 (từ 2022-01-01 đến 2022-03-31)
EXEC sp_DeleteNhaTroByDateRange '2022-01-01', '2022-03-31';
-- SELECT * FROM NHATRO; -- Kiểm tra
----------------------------------------------------Y4----------------------------------------------------------------------
