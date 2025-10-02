SELECT TOP 1 *
FROM NhanVien
ORDER BY Luong DESC;
------  
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV 
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG ---join bảng nv và pb lại on( điều kiện) tìm nv có mã phòng = pb có mã phòng trung với nv
WHERE NV.LUONG > (
    SELECT AVG(NV2.LUONG) ----avg tính lương tb, tên nv2 như nv chỉ dùng để phân biệt nhiệm vụ khác nhau, thằng nv2 nhiệm vụ tính lương
    FROM NHANVIEN NV2 JOIN PHONGBAN PB2 ON NV2.PHG = PB2.MAPHG
    WHERE PB2.TENPHG = N'Nghiên cứu'
)
AND PB.TENPHG = N'Nghiên cứu';
------
SELECT PB.TENPHG ,COUNT(NV.MANV) as soluongnhanvien ----đếm số nv rồi sán= soluongnhanvien
FROM PHONGBAN PB  
JOIN NHANVIEN NV on PB.MAPHG = NV.PHG
GROUP BY PB.TENPHG ----groupby la dếm cái gì theo+ cái đó, vd đếm soluongnhanvien +theo tên phòng(tenphg)
HAVING AVG(NV.LUONG) > 30000;
-----
SELECT PB.TENPHG, COUNT(DA.MADA) AS SoLuongDeAn
FROM PHONGBAN PB
LEFT JOIN DEAN DA ON PB.MAPHG = DA.PHONG
GROUP BY PB.TENPHG;
----

--FROM Bang1 alias1
--JOIN Bang2 alias2 ON alias1.cot = alias2.cot

---JOIN = nối 2 bảng.
---ON alias1.cot = alias2.cot = điều kiện nối (cột nào của 2 bảng phải bằng nhau).
---alias1, alias2 = bí danh (viết tắt tên bảng cho gọn).