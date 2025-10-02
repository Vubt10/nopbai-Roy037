-- Tạo Stored Procedure
CREATE PROCEDURE TinhHCN
    @ChieuDai FLOAT,
    @ChieuRong FLOAT
AS
BEGIN
    DECLARE @DienTich FLOAT, @ChuVi FLOAT;

    SET @DienTich = @ChieuDai * @ChieuRong;
    SET @ChuVi = 2 * (@ChieuDai + @ChieuRong);

    PRINT 'Diện tích: ' + CAST(@DienTich AS VARCHAR(50));
    PRINT 'Chu vi: ' + CAST(@ChuVi AS VARCHAR(50));
END;
GO

-- Gọi thủ tục
EXEC TinhHCN @ChieuDai = 5, @ChieuRong = 3;
