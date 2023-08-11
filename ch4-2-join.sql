/*
Ch4.2
Write a SELECT statement that returns four columns: VendorName InvoiceNumber InvoiceDate Balance
From the Vendors table 
From the Invoices table 
From the Invoices table
InvoiceTotal minus the sum of PaymentTotal and CreditTotal
The result set should have one row for each invoice with a non-zero balance. Sort the result set by VendorName in ascending order.
*/

select v.VendorName , i.InvoiceNumber, i.InvoiceDate, InvoiceTotal - PaymentTotal + CreditTotal as Balance
from Vendors v
join Invoices i
on v.VendorID = i.InvoiceID
where i.InvoiceTotal - i.PaymentTotal - i.CreditTotal > 0.00
order by v.VendorName;