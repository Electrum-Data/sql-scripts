/*
Ch4.4
Generate the same result set described in exercise 2, but use the implicit join syntax.
*/

select v.VendorName , i.InvoiceNumber, i.InvoiceDate, i.InvoiceTotal - i.PaymentTotal - i.CreditTotal as Balance
from Vendors v, Invoices i
where v.VendorID = i.InvoiceID and i.InvoiceTotal - i.PaymentTotal - i.CreditTotal > 0.00
order by v.VendorName;