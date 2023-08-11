/*
Ch4.7
Write a SELECT statement that returns two columns from the GLAccounts table: AccountNo and AccountDescription. 
The result set should have one row for each account number that has never been used. Sort the final result set by AccountNo. 
Hint: Use an outer join to the InvoiceLineItems table


*/

select g.AccountNo, g.AccountDescription
from GLAccounts g
left join InvoiceLineItems il
    on il.AccountNo = g.AccountNo
where il.AccountNo is NULL
order by AccountNo

-- select *
-- from InvoiceLineItems
-- where AccountNo in (100,110,120);
