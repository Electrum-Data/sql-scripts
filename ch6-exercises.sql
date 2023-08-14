
/*
Ch6.1
Write a SELECT statement that returns the same result set as this SELECT
statement. Substitute a subquery in a WHERE clause for the inner join. 
*/

-- select distinct VendorName
-- from Vendors v 
-- where v.VendorID in (
--     select distinct VendorID
--     from Invoices)
-- order by VendorName


/*
Ch6.2
Which invoices have a PaymentTotal that’s greater than the average 
PaymentTotal for all paid invoices? Return the InvoiceNumber and InvoiceTotal for each invoice.
*/

-- select *
-- from invoices
-- where PaymentTotal > (
--     select AVG(PaymentTotal)
--     from Invoices
--     where InvoiceTotal - PaymentTotal - CreditTotal <= 0);


/*
Ch6.3
Which invoices have a PaymentTotal that’s greater than the median 
PaymentTotal for all paid invoices?
*/

-- select InvoiceNumber, InvoiceTotal 
-- from Invoices
-- where PaymentTotal > ALL 
--     (select top 50 percent PaymentTotal
--     from Invoices
--     where PaymentTotal <> 0
--     order by PaymentTotal);
