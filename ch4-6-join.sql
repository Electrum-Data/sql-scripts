/*
Ch4.6
Write a SELECT statement that returns three columns: VendorID
VendorName Name
From the Vendors table From the Vendors table
A concatenation of VendorContactFName and VendorContactLName, with a space in between
The result set should have one row for each vendor whose contact has the same first name as another vendor’s contact. Sort the final result set by Name. Hint: Use a self-join.
*/

-- this goes through the Vendors table twice
select v1.VendorID, v1.VendorName, v2.VendorName Name
from Vendors v1
join Vendors v2
    on v1.VendorContactFName = v2.VendorContactFName
        and v1.VendorID != v2.VendorID