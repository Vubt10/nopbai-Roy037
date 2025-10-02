SELECT MANV, HONV, TENLOT, TENNV, NGSINH, DCHI
FROM NHANVIEN
WHERE YEAR(NGSINH) BETWEEN 1960 AND 1965;
-------------------
SELECT MANV,
       HONV + ' ' + TENLOT + ' ' + TENNV AS HoTen,
       NGSINH,
       -- Cách tính tuổi chính xác hơn
       DATEDIFF(YEAR, NGSINH, GETDATE()) 
         - CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, NGSINH, GETDATE()), NGSINH) > GETDATE() THEN 1 ELSE 0 END 
       AS Tuoi
FROM NHANVIEN;
-------------------
SELECT MANV,
       HONV + ' ' + TENLOT + ' ' + TENNV AS HoTen,
       NGSINH,
       DATENAME(WEEKDAY, NGSINH) AS ThuSinh
FROM NHANVIEN;
-------------------
SELECT 
    PB.TENPHG AS TenPhongBan,
    NVTP.HONV + ' ' + NVTP.TENLOT + ' ' + NVTP.TENNV AS TruongPhong,
    CONVERT(VARCHAR(10), PB.NG_NHANCHUC, 105) AS NgayNhanChuc, -- định dạng dd-mm-yy
    COUNT(NV.MANV) AS SoLuongNhanVien
FROM PHONGBAN PB
JOIN NHANVIEN NVTP ON PB.TRPHG = NVTP.MANV  -- trưởng phòng
JOIN NHANVIEN NV ON PB.MAPHG = NV.PHG       -- nhân viên trong phòng
GROUP BY PB.TENPHG, NVTP.HONV, NVTP.TENLOT, NVTP.TENNV, PB.NG_NHANCHUC;
-------------------
