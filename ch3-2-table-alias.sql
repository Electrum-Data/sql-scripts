/*
Ch3.2
Write a SELECT statement that returns four columns from the Invoices table, named Number, Total, Credits, and Balance: Number Total
Column alias for the InvoiceNumber column Column alias for the InvoiceTotal column
Credits Balance
Sum of the PaymentTotal and CreditTotal columns
InvoiceTotal minus the sum of PaymentTotal and CreditTotal
Use the AS keyword to assign column aliases
*/


select 
InvoiceNumber as Number, 
InvoiceTotal as Total, 
(PaymentTotal + CreditTotal) as Credits, 
InvoiceTotal - (PaymentTotal + CreditTotal) as balance
from Invoices;