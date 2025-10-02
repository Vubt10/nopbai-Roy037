--Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên
--tham dự đề án đó.
SELECT 
	d.TENDEAN,
	CAST(CEILING(SUM(p.THOIGIAN)) AS DECIMAL(18,2)) AS TONGGIO_CEILING,
	CAST(FLOOR(SUM(p.THOIGIAN)) AS DECIMAL(18,2)) AS TONGGIO_FLOOR,
	ROUND(SUM(p.THOIGIAN),2) AS TONGGIO_2

FROM DEAN d
JOIN PHANCONG p ON d.MADA =  p.MADA
GROUP BY d.TENDEAN;
--Cho biết họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương
--trung bình (làm tròn đến 2 số thập phân) của phòng "Nghiên cứu"
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV 
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG ---join bảng nv và pb lại on( điều kiện) tìm nv có mã phòng = pb có mã phòng trung với nv
WHERE NV.LUONG > (
    SELECT ROUND(AVG(NV2.LUONG),2) ----avg tính lương tb, tên nv2 như nv chỉ dùng để phân biệt nhiệm vụ khác nhau, thằng nv2 nhiệm vụ tính lương
    FROM NHANVIEN NV2 
	JOIN PHONGBAN PB2 ON NV2.PHG = PB2.MAPHG
    WHERE PB2.TENPHG = N'Nghiên Cứu'
);