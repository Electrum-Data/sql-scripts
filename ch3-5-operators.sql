/*
Ch3.5
Modify the solution to exercise 2 to filter for invoices with an InvoiceTotal that’s greater than or equal to $500 but less than or equal to $10,000.
*/

select 
InvoiceNumber as Number, 
InvoiceTotal as Total, 
(PaymentTotal + CreditTotal) as Credits, 
InvoiceTotal - (PaymentTotal + CreditTotal) as balance
from Invoices
where InvoiceTotal >= 500 and InvoiceTotal <= 10000