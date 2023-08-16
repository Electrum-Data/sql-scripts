-- UPDATE PRODUCT


create or alter proc spInsertProduct
    @PartNbr VARCHAR(30) = NULL,
    @Name VARCHAR(30) = NULL,
    @Price DECIMAL(9,2) = NULL,
    @Unit VARCHAR(30) = NULL,
    @VendorId INT = NULL,
    @Id INT = NULL
AS
BEGIN
    IF @Id is NULL 
        RETURN -1;

    DECLARE @OrigId INT,
            @OrigPartNbr VARCHAR(30),
            @OrigName VARCHAR(30),
            @OrigPrice DECIMAL(9,2),
            @OrigUnit VARCHAR(30),
            @OrigVendorId INT
            
    SELECT  @OrigId = Id,
            @OrigPartNbr = PartNbr,
            @OrigName = Name,
            @OrigPrice = Price,
            @OrigUnit = Unit,
            @OrigVendorId = VendorId
            From products 
            where Id = @Id

    IF @PartNbr is NULL
        SET @PartNbr = @OrigPartNbr
    IF @Name is NULL
        SET @Name = @OrigName
    IF @Price is NULL
        SET @Price = @OrigPrice
    IF @Unit is NULL
        SET @Unit = @OrigUnit
    IF @VendorId is NULL
        SET @VendorId = @OrigVendorId

    UPDATE products
        SET PartNbr = @PartNbr, Name = @Name, Price = @Price, Unit = @Unit
        WHERE PartNbr = @PartNbr
        RETURN 0;        
END
GO

DECLARE @rc INT
EXEC @rc = spInsertProduct @id = 11,
                                @Name = 'Time Watch'

IF @rc != 0
    PRINT 'ERROR rc = ' + @rc

select * from products