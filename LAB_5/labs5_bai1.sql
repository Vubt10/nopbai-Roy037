--c1
CREATE PROCEDURE sp_XinChao
    @ten NVARCHAR(50)
AS
BEGIN
    PRINT N'Xin chào ' + @ten
END
GO

-- Thực thi:
EXEC sp_XinChao @ten = N'Nguyễn Văn A'



-- c2
CREATE PROCEDURE sp_TinhTong
    @s1 INT,
    @s2 INT
AS
BEGIN
    DECLARE @tg INT
    SET @tg = @s1 + @s2
    PRINT N'Tổng là: ' + CAST(@tg AS NVARCHAR(10))
END
GO

-- Thực thi:
EXEC sp_TinhTong @s1 = 5, @s2 = 7

--c3
CREATE PROCEDURE sp_TongChan
    @n INT
AS
BEGIN
    DECLARE @tong INT = 0
    DECLARE @i INT = 2
    WHILE @i <= @n
    BEGIN
        SET @tong = @tong + @i
        SET @i = @i + 2
    END
    PRINT N'Tổng các số chẵn từ 1 đến ' + CAST(@n AS NVARCHAR(10)) + N' là: ' + CAST(@tong AS NVARCHAR(10))
END
GO


-- Thực thi:
EXEC sp_TongChan @n = 10

--c4
CREATE OR ALTER PROCEDURE sp_UCLN
    @a INT,
    @b INT
AS
BEGIN
    DECLARE @temp INT

    WHILE @a <> @b
    BEGIN
        IF @a > @b
            SET @a = @a - @b
        ELSE
            SET @b = @b - @a
    END

    PRINT N'Ước chung lớn nhất là: ' + CAST(@a AS NVARCHAR(10))
END
GO

-- Thực thi:
EXEC sp_UCLN 24, 18

-- Thực thi:
EXEC sp_UCLN @a = 24, @b = 36

