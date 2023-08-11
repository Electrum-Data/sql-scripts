/*
Ch4.3
Write a SELECT statement that returns three columns: 
VendorName
DefaultAccountNo AccountDescription
From the Vendors table From the Vendors table
From the GLAccounts table
The result set should have one row for each vendor, with the account number and account description for that vendor’s default account number
*/

select v.VendorName , v.DefaultAccountNo, g.AccountDescription
from Vendors v
join GLAccounts g
on v.DefaultAccountNo = g.AccountNo
order by g.AccountDescription, v.VendorName;