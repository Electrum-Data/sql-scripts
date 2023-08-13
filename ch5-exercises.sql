
/*
Ch5.1
Write a SELECT statement that returns two columns from the Invoices table: VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. 
Group the result set by VendorID.
*/

-- select i.VendorID, SUM(i.PaymentTotal) PaymentSum
-- from Invoices i
-- group by i.VendorID


/*
Ch5.2
Write a SELECT statement that returns two columns: VendorName and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. 
Group the result set by VendorName. Return only 10 rows, corresponding to the 10 vendors who’ve been paid the most. 
Hint: Use the TOP clause and join the Vendors table to the Invoices table.
*/

-- select top 5 v.VendorName, SUM(i.PaymentTotal) PaymentSum
-- from Vendors v
-- join Invoices i
--     on v.VendorID = i.VendorID
-- group by v.VendorName
-- order by SUM(i.PaymentTotal) desc


/*
Ch5.3
Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. 
InvoiceCount is the count of the number of invoices, and InvoiceSum is the sum of the InvoiceTotal column. Group the result set by vendor. 
Sort the result set so the vendor with the highest number of invoices appears first.
*/

-- select v.VendorName, COUNT(i.InvoiceNumber) InvoiceCount, SUM(i.InvoiceTotal) InvoiceTotal
-- from Vendors v
-- join Invoices i
--     on v.VendorID = i.VendorID
-- group by v.VendorName
-- order by InvoiceCount desc


/*
Ch5.4
Write a SELECT statement that returns three columns: AccountDescription, LineItemCount, and LineItemSum. 
LineItemCount is the number of entries in the InvoiceLineItems table that have that AccountNo. 
LineItemSum is the sum of the InvoiceLineItemAmount column for that AccountNo. 
Filter the result set to include only those rows with LineItemCount greater than 1. 
Group the result set by account description, and sort it by descending LineItemCount. 
Hint: Join the GLAccounts table to the InvoiceLineItems table.
*/

-- select g.AccountDescription, count(g.AccountNo) LineItemCount, sum(il.InvoiceLineItemAmount) LineItemSum
-- from invoiceLineItems il
-- join GLAccounts g
-- on g.AccountNo = il.AccountNo
-- group by g.AccountDescription


/*
Ch5.5
Modify the solution to exercise 4 to filter for invoices dated from October 1, 2022 to December 31, 2022.
*/

select g.AccountDescription, count(g.AccountNo) LineItemCount, sum(il.InvoiceLineItemAmount) LineItemSum
from invoiceLineItems il
join GLAccounts g
on g.AccountNo = il.AccountNo
group by g.AccountDescription
