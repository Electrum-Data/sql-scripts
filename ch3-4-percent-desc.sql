/*
Ch3.4
Write a SELECT statement that returns three columns: InvoiceTotal
From the Invoices table 10% Plus 10%
10% of the value of InvoiceTotal The value of InvoiceTotal plus 10%
(For example, if InvoiceTotal is 100, 10% is 10, and Plus 10% is 110.) Only return those rows with a balance due greater than 1000. Sort the result set by InvoiceTotal, with the largest invoice first.
*/

select InvoiceTotal, (10/InvoiceTotal*100) as '10%', InvoiceTotal + (10/InvoiceTotal*100) as 'Plus 10%'
from Invoices
order by InvoiceTotal desc;