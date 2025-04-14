-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		TrieuTraMy
-- Create date: 2025-04-14
-- Description:	baitapvenha4
-- =============================================
ALTER PROCEDURE bai_tap_ve_nha_4 
    @fromDate DATE,
    @toDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    WITH TietHoc AS (
        SELECT * FROM (VALUES
            (1, '06:30', '07:45'),
            (2, '07:55', '09:10'),
            (3, '09:20', '10:35'),
            (4, '10:45', '12:00'),
            (5, '12:30', '13:45'),
            (6, '13:55', '15:10'),
            (7, '15:20', '16:35'),
            (8, '16:45', '18:00'),
            (9, '18:10', '19:25'),
            (10,'19:35', '20:50')
        ) AS T(tiet, tietbatdau, tietketthuc)
    )

    SELECT 
        tkb.magv,
        gv.tengv AS HoTenGV,
        tkb.mamon AS MonDay,
        giovao.tietbatdau AS GioVao,
        giora.tietketthuc AS GioRa,
        tkb.ngay AS NgayDay
    FROM dbo.TKB tkb
    JOIN dbo.GiaoVien gv ON tkb.magv = gv.magv
    JOIN TietHoc giovao ON tkb.tietbatdau = giovao.tiet
    JOIN TietHoc giora ON tkb.tietketthuc = giora.tiet
    WHERE tkb.ngay BETWEEN @fromDate AND @toDate;
END
GO
EXEC bai_tap_ve_nha_4 '2025-03-24', '2025-03-28';
