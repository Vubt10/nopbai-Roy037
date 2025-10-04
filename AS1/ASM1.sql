Use QLNHATRO_NGUYENHOANGMINH;
go

CREATE TABLE LOAINHA (
    LoaiNhaID INT IDENTITY(1,1) PRIMARY KEY,
    TenLoai NVARCHAR(100) NOT NULL
);

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

CREATE TABLE DANHGIA (
    DanhGiaID INT IDENTITY(1,1) PRIMARY KEY,
    NguoiDanhGiaID INT NOT NULL FOREIGN KEY REFERENCES NGUOIDUNG(NguoiDungID),
    NhaTroID INT NOT NULL FOREIGN KEY REFERENCES NHATRO(NhaTroID),
    LikeDislike BIT NOT NULL,
    NoiDung NVARCHAR(MAX),
    NgayDanhGia DATE
);
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