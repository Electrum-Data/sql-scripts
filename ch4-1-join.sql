/*
Ch4.1
Write a SELECT statement that returns all columns from the Vendors table inner-joined with the Invoices table.
*/

SELECT *
from Vendors v
join Invoices i
on v.VendorID = i.VendorID;