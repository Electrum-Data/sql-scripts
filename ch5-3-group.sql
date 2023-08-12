
/*
Ch5.3
Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. InvoiceCount is the count of the number of invoices, and InvoiceSum is the sum of the InvoiceTotal column. Group the result set by vendor. Sort the result set so the vendor with the highest number of invoices appears first.
*/

select v.VendorName, COUNT(i.InvoiceNumber) InvoiceCount, SUM(i.InvoiceTotal) InvoiceTotal
from Vendors v
join Invoices i
    on v.VendorID = i.VendorID
group by v.VendorName
order by InvoiceCount desc