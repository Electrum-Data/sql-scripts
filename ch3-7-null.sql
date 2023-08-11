/*
Ch3.7
Write a SELECT statement that determines whether the PaymentDate column of the Invoices table has any invalid values. 
To be valid, PaymentDate must be a null value if there’s a balance due and a non-null value if there’s no balance due. 
Code a compound condition in the WHERE clause that tests for these conditions.
*/

USE AP;

SELECT *
FROM Invoices
WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) 
         AND PaymentDate IS NULL) 
         OR
     (InvoiceTotal - PaymentTotal - CreditTotal > 0) 
         AND PaymentDate IS NOT NULL;