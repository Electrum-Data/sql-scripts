/*
Ch4.8
Use the UNION operator to generate a result set consisting of two columns from the Vendors table: VendorName and VendorState. 
If the vendor is in California, the VendorState value should be “CA”; otherwise, the VendorState value should be “Outside CA.” 
Sort the final result set by VendorName.
*/

select VendorName, VendorState
from Vendors
where VendorState = 'CA'

UNION

select VendorName, 'Outside CA'
from Vendors
where VendorState != 'CA'
order by VendorName;

/*
-- EASIER WAY - IF Statement (if this, then that, otherwise) Like Ternery Operator
select VendorName, IIF(VendorState = 'CA', 'CA', 'Outside CA')
from Vendors
order by VendorName
*/