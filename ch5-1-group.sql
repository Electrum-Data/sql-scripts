
/*
Ch5.1
Write a SELECT statement that returns two columns from the Invoices table: VendorID and PaymentSum, where PaymentSum is the sum of the PaymentTotal column. Group the result set by VendorID.
*/

select i.VendorID, SUM(i.PaymentTotal) PaymentSum
from Invoices i
group by i.VendorID