/*
Ch3.6
Modify the solution to exercise 3 to filter for contacts whose last name begins with the letter A, B, C, or E (not D).
*/

select concat(VendorContactFName,',',VendorContactLName)
from Vendors
where VendorContactLName like '[A-C]%' or VendorContactLName like 'E%'