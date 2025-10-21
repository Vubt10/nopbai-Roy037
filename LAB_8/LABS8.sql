USE AP;
GO
CREATE TABLE Test (
    TestID INT PRIMARY KEY,
    TestName NVARCHAR(50)
);
GO
-- Kiểm tra bảng đã được tạo
SELECT * FROM sys.tables WHERE name = 'Test';


-- ngat ket noi den database

-- Bước 1: Ngắt tất cả các kết nối khác (từ các user/ứng dụng khác)
-- DÙNG LỆNH NÀY để đảm bảo không còn kết nối nào đang giữ CSDL AP
ALTER DATABASE AP SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Bước 2: CHUYỂN PHIÊN LÀM VIỆC sang CSDL master
-- Đây là bước giải quyết lỗi Msg 3102
USE master;
GO

-- Bước 3: Thực hiện lệnh Restore
RESTORE DATABASE AP 
FROM DISK = N'D:\Study\2025\SQL 2025\LABS\labs8\APFULL.bak' 
WITH FILE = 1, REPLACE, NOUNLOAD, STATS = 5; -- Sửa đổi các tùy chọn RESTORE theo yêu cầu bài tập
GO

-- Bước 4: Đưa CSDL về lại chế độ Multi-User (nếu cần)
ALTER DATABASE AP SET MULTI_USER;
GO

USE AP;
GO
SELECT * FROM sys.tables WHERE name = 'Test';
-----------------------------------------------------bai2-----------------------------------
USE AP;
GO
CREATE TABLE Test1 (
    Test1ID INT PRIMARY KEY,
    Test1Name NVARCHAR(50)
);
GO


USE AP;
GO
CREATE TABLE Test2 (
    Test2ID INT PRIMARY KEY,
    Test2Name NVARCHAR(50)
);
GO