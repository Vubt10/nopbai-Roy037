---Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của tất cả các nhân viên
---tham dự đề án đó. 

-----CAST
SELECT 
	d.TENDEAN,
	CAST(SUM(p.THOIGIAN) AS DECIMAL(18,2)) AS TONGGIO_DECIMAL,
	CAST(SUM(p.THOIGIAN) AS VARCHAR(20)) AS TONGGIO_VARCHAR

FROM DEAN d
JOIN PHANCONG p ON d.MADA =  p.MADA
GROUP BY d.TENDEAN;
-----CONVERT
SELECT 
	d.TENDEAN,
	CONVERT(DECIMAL(18,2),SUM(P.THOIGIAN)) AS TONGGIO_DECIMAL,
	CONVERT(VARCHAR(20),SUM(P.THOIGIAN)) AS TONGGIO_VARCHAR
FROM DEAN d
JOIN PHANCONG p ON d.MADA =  p.MADA
GROUP BY d.TENDEAN;
----CAST(A -> B) . CHUYEN KIEU DULIEU A->B

-------**************************************_______

---Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của những nhân viên làm
---việc cho phòng ban đó
-----CAST
SELECT 
	p.TENPHG,
	CAST(AVG(n.LUONG) AS DECIMAL(18,2)) AS LUONGTB_DECIMAL,
	REPLACE(CONVERT(VARCHAR,CAST(AVG(n.LUONG) AS MONEY),1),'.00','') AS LUONGTB_VARCHAR
FROM PHONGBAN p
JOIN NHANVIEN n on p.MAPHG  =  n.PHG
GROUP BY p.TENPHG;
---REPLACE(string_expression, string_to_replace, replacement_string)
---string_expression: chuỗi gốc.
---string_to_replace: phần chuỗi bạn muốn tìm trong chuỗi gốc.
---replacement_string: phần chuỗi mới thay thế vào.
---EX:SELECT REPLACE('Xin chao ban', 'ban', 'bạn');
-- Kết quả: 'Xin chao bạn'
---EX:SELECT REPLACE('123.00', '.00', '');
-- Kết quả: '123'
---MONEY DINH DANG KIEU TIEN TE SQL, 1 SE AUTO CHEN DAU PHAY MOI 3 SO


---CONVERT
SELECT 
	p.TENPHG,
	CONVERT(DECIMAL(18,2),AVG(n.LUONG)) AS LUONGTB_DECIMAL,
	REPLACE(CONVERT(VARCHAR,CONVERT( MONEY,AVG(n.LUONG)),1),'.00','') AS LUONGTB_VARCHAR
	
FROM PHONGBAN p
JOIN NHANVIEN n on p.MAPHG  =  n.PHG
GROUP BY p.TENPHG;

