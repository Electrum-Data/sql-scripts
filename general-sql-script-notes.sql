/*
-- ORDER BY sort by state, then sort the cities within the states
select *
from Vendors
order by VendorState, VendorCity;
*/

/*
-- LIKE all with the word taxes and any character following and ending
select *
from GLAccounts
where AccountDescription like '%taxes%'
*/

/*
-- LIKE third character as a C
select *
from GLAccounts
where AccountDescription like '__c%'
*/

/*
select *
from GLAccounts
where AccountNo in (
    select AccountNo 
    from GLAccounts 
    where left(AccountDescription, 8) = 'Employer')
;
*/                   

/*
-- Invoice totals greater than 10,000 uising subquery
select * 
from invoices
where InvoiceTotal > (select AVG(InvoiceTotal)
                        from invoices);
*/


/*
-- IN clause
select *
from GLAccounts
where AccountNo not in (100,200,300);
*/

-- select CONVERT(varchar(10), GETDATE(), 1) as 'today''s date';

-- select 'Tony' + ' ' + 'Rawlins'

/*
select top 5 InvoiceID Id, InvoiceTotal, CreditTotal, PaymentTotal, CreditTotal + PaymentTotal as TotalCredits
from Invoices
order by InvoiceTotal desc;
*/

/*
select InvoiceNumber, InvoiceDate, InvoiceTotal
from invoices
order by InvoiceTotal;
*/

/*
select AccountDescription, AccountNo
from GLAccounts
where AccountNo >= 200 AND AccountNo <= 600
order by AccountDescription desc, AccountNo;
*/