use prs;
go

/* ------------ VARIABLES ------------ */
-- declare @name varchar(30) =  'Tony' + ' ' + 'Rawlins';
-- select @name Name

-- declare @color VARCHAR(10) = 'red';
-- IF @color = 'red'
--     BEGIN
--     PRINT 'The color is red!';
--     PRINT 'The color is a deep red!';
--     PRINT 'The color is a very deep red!';
--     END
-- PRINT 'This should always display';

/* ------------ WHILE ------------ */
-- DECLARE @counter int = 0;
-- WHILE @counter < 10
--     BEGIN
--         PRINT 'The value of counter is ' + str(@counter);
--         SET @counter = @counter + 1;
--         IF @counter = 7
--             BREAK;
--     END

/* ------------ IF ELSE - BEGIN / END ------------ */
-- declare @counter int = 1, @sum int = 0;
-- WHILE @counter <= 20
-- BEGIN
--     IF @counter % 2 != 0
--     BEGIN
--     SET @counter = @counter + 1;
--         CONTINUE;
--     END
--     SET @sum = @sum + @counter;
--     SET @counter = @counter + 1;
-- END
-- PRINT 'The sum is ' + str(@sum);


/* ------------ CURSOR pg 416 ------------ */
-- declare cur CURSOR for 
--     select id, [Description] from requests;

-- declare @Id int, @Description varchar(80), @Total decimal(9,2);

-- open cur;

-- fetch next from cur into @Id, @Description;
-- while @@FETCH_STATUS = 0
-- BEGIN
--     PRINT 'Request id is ' + str(@Id)

--     select @Total = sum(rl.Quantity * p.Price)
--         from RequestLines rl
--         join products p on p.id = rl.ProductId
--         where rl.RequestId = @Id
--         group by rl.requestId;

--     UPDATE Requests Set 
--         Total = @Total
--         where Id = @Id

--     fetch next from cur into @Id, @Description;
-- END

-- close cur;
-- DEALLOCATE cur;


/* ------------ ERROR HANDLING pg 419 ------------ */
-- BEGIN TRY
--     DECLARE @index int = 1;
--     SET @index = @index + 5;
--     THROW 50001, 'Invalid ID', 1
-- END TRY
-- BEGIN CATCH
    
-- END CATCH


/* ------------ STORED PROCEDURES ------------ */
-- CREATE OR ALTER PROC DisplayRequestAndLinesForTotal
--     @RequestId INT = NULL
-- AS 
-- BEGIN
--     IF @RequestID is NULL
--     BEGIN
--         PRINT '@RequestId must be an integer'
--         RETURN -- if no id, exit procedure
--     END
--     select r.id, r.userid, r.[Description], r.Total, rl.Quantity, p.Price, 
--         (rl.Quantity * p.Price) LineTotal
--     from requests r
--     join requestLines rl on r.Id = rl.Id
--     join Products p on p.id = rl.ProductId
--     where r.id = @RequestID;
-- END
-- GO

-- EXEC DisplayRequestAndLinesForTotal @RequestID = 2
-- GO

-- CREATE OR ALTER PROC DisplayRequestsAndTotalsById
--     @UserId INT NULL
-- AS
-- BEGIN
--     IF @UserId IS NULL
--     BEGIN
--     PRINT 'Invalid UserId'
--     RETURN
--     END
-- SELECT r.id, r.UserId, r.[Description], r.Total, rl.Quantity, p.Name, p.Price, (rl.Quantity * p.Price) LineTotal
-- FROM requests r
--     JOIN RequestLines rl 
--         ON r.Id = rl.Id
--     JOIN Products p 
--         ON p.id = rl.ProductId
-- WHERE r.UserId = @UserId
-- END
-- GO

-- EXEC DisplayRequestsAndTotalsById @UserId = 1
-- GO

-- create or alter proc  spListRequestsForUser
--     @Username VARCHAR(30) = NULL
-- AS
-- BEGIN
--     IF @Username is NULL
--     BEGIN
--         -- PRINT '@Username must be a string'
--         RETURN -1;
--     END

--     SELECT r.*
--         FROM users u
--         JOIN requests r
--             ON u.Id = r.UserId
--         WHERE u.Username = @Username;

--     RETURN 0;
-- END
-- GO
-- DECLARE @rc int;
-- exec @rc = spListRequestsForUser @username = 'jdoe'
-- IF @rc = 0
--     PRINT 'Everything is good!';
-- IF @rc = -1
--     PRINT '@Username must be a string';


-- create or alter proc spCustomerListBySales
--     @LowSales decimal(7,2) = 0,
--     @HighSales decimal(9,2) = 1000000
-- AS
-- BEGIN
--     IF @LowSales is NULL or @HighSales is NULL -- If user doesn't enter a positive number for either
--     BEGIN
--         RETURN -1
--     END
--     IF @LowSales > @HighSales -- If user puts the high number in the low number and visa versa
--     BEGIN 
--         DECLARE @Sales decimal(9,2) = @LowSales;
--         SET @LowSales = @HighSales
--         SET @HighSales = @Sales
--     END

--     select * 
--         from Customers
--         where Sales >= @LowSales and Sales <= @HighSales
--         order by Sales DESC
--         return 0
-- END
-- GO
-- DECLARE @rc INT
-- EXEC @rc = spCustomerListBySales @LowSales = 70000, @HighSales = 30000
-- IF @rc = 0
--     PRINT 'Everything is good!';
-- IF @rc = -1
--     PRINT '@LowSales and @HighSales must be positive numbers.';