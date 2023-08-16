/* 
stop using vendor
move products from that vendror to different existing vendor 
this vendor code to this vendor code
do not delete vendors
*/

CREATE or ALTER Proc SwitchProductsToNewVendor
    @FromVendorCode varchar(30) = NULL,
    @ToVendorCode varchar(30) = NULL,
    @DeleteFromVendor bit = 0
AS
BEGIN
    -- Read From Vendor
    DECLARE @FromVendorId int = 0;
    SELECT @FromVendorId = Id 
        from Vendors 
        Where Code = @FromVendorCode;
 
    IF @FromVendorId = 0 -- didn't find the vendor
        return -1;
 
    -- Read To Vendor
    DECLARE @ToVendorId int = 0;
    SELECT @ToVendorId = Id 
        from Vendors 
        Where Code = @ToVendorCode;
 
    IF @ToVendorId = 0 -- didn't find the vendor
        return -2;
 
    -- If we get here, we found both vendors
 
    UPDATE Products SET
        VendorId = @ToVendorId
        Where VendorId = @FromVendorId;
 
    IF @DeleteFromVendor = 1 
    BEGIN
        DELETE Vendors
            Where Id = @FromVendorId;
        -- @@ROWCOUNT is a system variable that automcatically
        -- contains the number of rows affected by the last SQL
        -- INSERT, UPDATE, or DELETE
        IF @@ROWCOUNT != 1
            return -100;
    END
 
    return 0
 
END
GO
 
DECLARE @RC int;
 
EXEC @RC = SwitchProductsToNewVendor    @FromVendorCode = 'NASA', 
                                        @ToVendorCode = 'CTL',
                                        @DeleteFromVendor = 1;
PRINT 'RC = ' + str(@RC)

select * from products