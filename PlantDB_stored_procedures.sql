/* ===== GET TOTAL GALS WK/MTH/YR FOR SPECIFIED ZONE AND ALL PLANTS IN SAID ZONE ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spTotalGalsForZone
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;
-- SELECT z.Name, SUM(GalsPerWeek * Quantity) GalsPerWeek, SUM(GalsPerWeek * Quantity * 4) GalsPerMonth, SUM(GalsPerWeek * Quantity * 52) GalsPerYear
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY z.Name
-- UNION
-- SELECT p.Name, SUM(GalsPerWeek * Quantity) GalsPerWeek, SUM(GalsPerWeek * Quantity * 4) GalsPerMonth, SUM(GalsPerWeek * Quantity * 52) GalsPerYear
-- FROM Zones z
-- JOIN Plants p
--     ON z.Id = p.ZoneId
-- where z.Id = @ZoneId
-- GROUP BY p.Name
-- ORDER BY GalsPerWeek DESC
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetWeeklyMonthlyYearlyGrandTotal @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET TOTAL GALS WK/MTH/YR FOR SPECIFIED ZONE ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER  PROC spGetWeeklyMonthlyYearlyGrandTotal
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;
--     SELECT z.Name, SUM(GalsPerWeek * Quantity) GalsPerWeek, SUM(GalsPerWeek * Quantity * 4) GalsPerMonth, SUM(GalsPerWeek * Quantity * 52) GalsPerYear
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY z.Name
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetWeeklyMonthlyYearlyGrandTotal @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET TOTAL GALS WK/MTH/YR FOR SPECIFIED ZONE PER PLANT ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spGetWeeklyMonthlyYearly
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;
--     SELECT p.Name, SUM(GalsPerWeek * Quantity) GalsPerWeek, SUM(GalsPerWeek * Quantity * 4) GalsPerMonth, SUM(GalsPerWeek * Quantity * 52) GalsPerYear
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY p.Name
--     ORDER BY GalsPerWeek
--      DESC
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetWeeklyMonthlyYearly @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET TOTAL GALS WK/MTH/YR FOR ALL ZONES ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spGetAllZoneTotals
-- AS
-- BEGIN
-- SELECT z.Name, SUM(GalsPerWeek * Quantity) ZonesGalsPerWeek, SUM(GalsPerWeek * Quantity * 4) ZonesGalsPerMonth, SUM(GalsPerWeek * Quantity * 52) ZonesGalsPerYear
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     WHERE z.Name LIKE 'Zone%'
--     GROUP BY z.Name
-- UNION
-- SELECT 'All Zones', SUM(GalsPerWeek * Quantity) ZonesGalsPerWeek, SUM(GalsPerWeek * Quantity * 4) ZonesGalsPerMonth, SUM(GalsPerWeek * Quantity * 52)
-- FROM Plants p
-- JOIN Zones z
--     ON z.Id = p.ZoneId
-- END
-- GO



/* ===== GET JUST WEEKLY GALS FOR SPECIFIED ZONE PER PLANT ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spGetWeekly
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;

--     SELECT p.Name, SUM(GalsPerWeek * Quantity) Weekly
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY p.Name
--     ORDER BY Weekly DESC
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetWeekly @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET JUST WEEKLY GALS FOR SPECIFIED ZONE  ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER   PROC spGetWeeklyGrandTotal
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;

--     SELECT z.Name, SUM(GalsPerWeek * Quantity) Weekly
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = 1
--     GROUP BY z.Name
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetWeeklyGrandTotal @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET JUST MONTHLY GALS FOR SPECIFIED ZONE PER PLANT ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spGetMonthly
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;

--     SELECT p.Name, SUM(GalsPerWeek * Quantity * 4) Monthly
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY p.Name
--     ORDER BY Monthly DESC
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetMonthly @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET JUST MONTHLY GALS FOR SPECIFIED ZONE ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- ALTER   PROC spGetMonthlyGrandTotal
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;

--     SELECT z.Name, SUM(GalsPerWeek * Quantity * 4) Monthly
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY z.Name
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetMonthlyGrandTotal @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET JUST YEARLY GALS FOR SPECIFIED ZONE PER PLANT ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spGetYearly
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;

--     SELECT p.Name, SUM(GalsPerWeek * Quantity * 52) Yearly
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY p.Name
--     ORDER BY Yearly DESC
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetYearly @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== GET JUST YEARLY GALS FOR SPECIFIED ZONE ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spGetYearlyGrandTotal
--     @ZoneId INT = NULL
-- AS
-- BEGIN
--     IF @ZoneId IS NULL
--     RETURN -1;

--     SELECT z.Name, SUM(GalsPerWeek * Quantity * 52) Yearly
--     FROM Zones z
--     JOIN Plants p
--         ON z.Id = p.ZoneId
--     where z.Id = @ZoneId
--     GROUP BY z.Name
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetYearlyGrandTotal @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'



/* ===== INSERT NEW PLANT ===== */
-- USE PlantsDB;
-- GO
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE OR ALTER PROC spInsertNewPlant
--     @PlantType BIT,
--     @Name VARCHAR(30),
--     @GalsPerWeek FLOAT,
--     @Quantity INT,
--     @EmittersPerPlant INT,
--     @EmitterGPH FLOAT,
--     @ZoneId INT
-- AS
-- BEGIN
--     IF @PlantType IS NULL
--         OR @Name IS NULL
--         OR @GalsPerWeek  IS NULL
--         OR @Quantity  IS NULL
--         OR @EmittersPerPlant  IS NULL
--         OR @EmitterGPH IS NULL
--         OR @ZoneId IS NULL
--         RETURN -1;

--     INSERT Plants (PlantType, Name, GalsPerWeek, Quantity, EmittersPerPlant, EmitterGPH, ZoneId) 
--     VALUES (@PlantType, @Name, @GalsPerWeek, @Quantity, @EmittersPerPlant, @EmitterGPH, @ZoneId);
--     RETURN 0;
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spGetYearlyGrandTotal @ZoneId = 1
-- IF @rc != 0
--     PRINT '@ZoneId must be an integer.'