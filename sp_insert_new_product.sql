/*INSERT NEW PRODUCST INTO TABLE*/

create or alter proc spInsertProduct
    @PartNbr VARCHAR(30) = NULL,
    @Name VARCHAR(30) = NULL,
    @Price DECIMAL(9,2) = NULL,
    @Unit VARCHAR(30) = NULL,
    @VendorName varchar(50) = NULL
AS
BEGIN
    IF @PartNbr is NULL 
        or @Name is NULL 
        or @Unit is Null
        or @VendorName is NULL
        RETURN -1;

    -- Check if new PartNbr already exists

    DECLARE @VendorId INT, @count INT;

    SELECT @count = count(*)
        FROM vendors
        WHERE Name like @VendorName + '%'

    IF @count != 1
    RETURN -2


    SELECT @VendorId = Id
    FROM vendors
    WHERE Name like @VendorName + '%'

    INSERT products (PartNbr, Name, Price, Unit, VendorId) VALUES
    (@PartNbr, @Name, @Price, @Unit, @VendorId)

    RETURN 0;
END
GO
DECLARE @rc INT
EXEC @rc = spInsertProduct 'SP2', 'Space Shuttle2', 20657.00, 'Each', 'NASA'

IF @rc != 0
    PRINT 'ERROR rc = ' + @rc

select * from products
