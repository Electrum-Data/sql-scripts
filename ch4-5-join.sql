/*
Ch4.5
Write a SELECT statement that returns five columns from three tables, all using the following column aliases: Vendor
Date
Number #
VendorName column InvoiceDate column InvoiceNumber column
InvoiceSequence column LineItem InvoiceLineItemAmount column
Assign the following aliases to the tables: v i
Vendors table Invoices table
li InvoiceLineItems table Sort the final result set by Vendor, Date, Number, and #.
*/

select VendorName Vendor, InvoiceDate Date, InvoiceNumber Number, InvoiceSequence #, InvoiceLineItemAmount LineItem
from Vendors
join Invoices
    on Vendors.VendorID = Invoices.VendorID
join InvoiceLineItems
    on Invoices.InvoiceID = InvoiceLineItems.InvoiceID
order by Vendor, Date, Number, #;