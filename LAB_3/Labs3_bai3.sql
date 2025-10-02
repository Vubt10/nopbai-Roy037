SELECT 
    UPPER(NV.HONV) AS HONV,
    LOWER(NV.TENLOT) AS TENLOT,
    LOWER(LEFT(NV.TENNV,1)) 
      + UPPER(SUBSTRING(NV.TENNV,2,1)) 
      + LOWER(SUBSTRING(NV.TENNV,3,LEN(NV.TENNV)-2)) AS TENNV,
    -- Cắt tên đường: lấy từ sau khoảng trắng đầu tiên đến dấu phẩy đầu tiên
    LTRIM(RTRIM(
      SUBSTRING(NV.DCHI,
        CHARINDEX(' ', NV.DCHI)+1,
        CHARINDEX(',', NV.DCHI+',') - CHARINDEX(' ', NV.DCHI) - 1)
    )) AS DCHI
FROM NHANVIEN NV
JOIN THANNHAN TN ON NV.MANV = TN.MA_NVIEN
GROUP BY NV.HONV, NV.TENLOT, NV.TENNV, NV.DCHI
HAVING COUNT(TN.MA_NVIEN) > 2;
------
SELECT TOP 1 
    PB.TENPHG AS TenPhongBan,
    -- Họ tên trưởng phòng
    NVTP.HONV + ' ' + NVTP.TENLOT + ' ' + NVTP.TENNV AS TruongPhong,
    -- Cột thay thế tên trưởng phòng bằng "Fpoly"
    'Fpoly' AS TenThayThe
FROM PHONGBAN PB
JOIN NHANVIEN NVTP ON PB.TRPHG = NVTP.MANV   -- Lấy thông tin trưởng phòng
JOIN NHANVIEN NV ON PB.MAPHG = NV.PHG        -- Lấy nhân viên để đếm
GROUP BY PB.TENPHG, NVTP.HONV, NVTP.TENLOT, NVTP.TENNV
ORDER BY COUNT(NV.MANV) DESC;

