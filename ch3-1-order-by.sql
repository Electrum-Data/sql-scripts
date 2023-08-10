
/*
Ch3.1
Write a SELECT statement that returns three columns from the Vendors table: 
VendorContactFName, VendorContactLName, and VendorName. Sort the result set by last name, then by first name.
*/

select VendorContactFName, VendorContactLName, VendorName
from Vendors
order by VendorContactLName, VendorContactFName