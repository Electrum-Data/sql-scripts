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


/*
-- SELECT INTO - Create Test Table
select *
into InvoiceCopy
from Invoices
*/

/*
-- INSERT INTO
insert into InvoiceCopy
values (97, '456789', '2023-03-01', 8344.50, 0, 0, 1, '2023-03-31', NULL);
*/

/*
-- UPDATE
update InvoiceCopy
set InvoiceTotal = InvoiceTotal + 250.00,
    PaymentTotal = InvoiceTotal / 2
where VendorID = 122;
*/

/*
-- DELETE
delete InvoiceCopy
where InvoiceNumber = '456789';
*/


-- JOIN
/*
JOIN:
The ON clause is the most important since it links the Primary Key with the Foreign key of both tables.
Best practice to use table aliases
Best practice do these in steps.
-- SYNTAX
SELECT table_1.column1, table_2.column2, table_3.column3
FROM table_1
JOIN table_2 
ON table_2_PK = table_1_FK
[WHERE clause can be added]
JOIN table_3 
ON table_1_PK = table_3_FK
*/
-- EXAMPLE
/*
select o.Description, c.Name, ol.*
from Orders o
join Customers c
    on c.Id = o.CustomerId
join OrderLines ol
    on ol.OrdersId = o.Id;
*/

-- OUTER JOIN
/*
Joins everything from the specified table (RIGHT/LEFT)
RIGHT = FROM table
LEFT = JOIN table
-- SYNTAX
SELECT select_list 
FROM table_1 
{LEFT|RIGHT|FULL} JOIN table_2 ON join_condition_1
*/
-- EXAMPLE
/*
select c.Name, o.Description
from Orders o right join Customers c
    on c.Id = o.CustomerId
order by c.Name
*/

-- UNION
/*
Combines the results of multible select statements into one result
Without the UNION statement, the results will show as separate results tables instead of one table
WHERE clauses will be different for each SELECT statement
--SYNTAX
SELECT_statement_1
UNION
SELECT_statement_2 
UNION 
SELECT_statement_3]
*/
-- EXAMPLE
/*
select 'A' ABC, *
from Customers
where Sales >= 80000
union
select 'B' ABC, *
from Customers
where Sales >= 20000 and Sales < 80000
union
select 'C' ABC, *
from Customers
where Sales < 20000
*/


-- AGGREGATE FUNCTIONS

-- EXAMPLE
/*
select COUNT(*) 'Number of Customers', 
        MAX(Sales) 'Max Sale', 
        MIN(Sales) 'Min Sale',
        AVG(Sales) 'Average Sale',
        SUM(Sales) 'Total Sales'
from Customers
*/


-- DISTINCT
/*
Removes duplicates
*/
-- EXAMPLE
/*
select DISTINCT City from Customers;
*/

-- GROUP BY
/*
Groups values in column and gets aggregate amount for that group
SELECT column must be used in an aggregate function OR in a GROUP BY
STATEMENT ORDER:
[FROM table_source] 
[WHERE search_condition] 
[GROUP BY group_by_list] 
[HAVING search_condition] 
[ORDER BY order_by_list]
*/
-- EXAMPLE

-- select City, sum(Sales) Sales
-- from Customers
-- where City != 'Cleveland'
-- group by City
-- having sum(Sales) > 600000
-- order by Sales
