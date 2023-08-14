
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

-- select top 10 v.VendorName, SUM(i.PaymentTotal) PaymentSum
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

-- select v.VendorName, COUNT(*) InvoiceCount, SUM(i.InvoiceTotal) InvoiceTotal
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

-- select g.AccountDescription, count(*) LineItemCount, sum(il.InvoiceLineItemAmount) LineItemSum
-- from invoiceLineItems il
-- join GLAccounts g
-- on g.AccountNo = il.AccountNo
-- group by g.AccountDescription
-- having count(*) > 1
-- order by LineItemCount desc;


/*
Ch5.5
Modify the solution to exercise 4 to filter for invoices dated from October 1, 2022 to December 31, 2022.
*/

-- select g.AccountDescription, count(*) LineItemCount, sum(il.InvoiceLineItemAmount) LineItemSum
-- from invoiceLineItems il
-- join GLAccounts g
-- on g.AccountNo = il.AccountNo
-- join Invoices i
-- on il.InvoiceID = i.InvoiceID
-- where i.InvoiceDate >= '2022-10-1' and i.InvoiceDate <= '2022-12-31'
-- group by g.AccountDescription
-- having count(*) > 1
-- order by LineItemCount desc;


/*
Ch5.6
SKIP PER GREG
*/


/*
Ch5.7
Write a SELECT statement that returns four columns: VendorName, Account-Description, LineItemCount, and LineItemSum. 
LineItemCount is the row count, and LineItemSum is the sum of the InvoiceLineItemAmount column. 
For each vendor and account, return the number and sum of line items, sorted first by vendor, then by account description. 
Hint: Use a four-table join.
*/

-- select v.VendorName, g.AccountDescription 'Account-Description' ,count(*) LineItemCount, sum(li.InvoiceLineItemAmount) LineItemSum
-- from Vendors v
-- join Invoices i
-- on v.VendorID = i.VendorID
-- join InvoiceLineItems li 
-- on i.InvoiceID = li.InvoiceID
-- join GLAccounts g 
-- on li.AccountNo = g.AccountNo
-- group by v.VendorName, g.AccountDescription
-- order by v.VendorName, g.AccountDescription


/*
Ch5.8
Write a SELECT statement that answers this question: Which vendors are being paid from more than one account? 
Return two columns: the vendor name and the total number of accounts that apply to that vendor’s invoices. 
Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountNo
*/

-- select v.VendorName, count(distinct il.AccountNo) "Number of Accounts"
-- from Vendors v
-- join Invoices i
-- on v.VendorID = i.VendorID 
-- join InvoiceLineItems il
-- on i.InvoiceID = il.InvoiceID
-- group by v.VendorName
-- having count(distinct il.AccountNo) > 1
-- order by VendorName;


/*
Ch5.9
SKIP PER GREG
*/