# Write your MySQL query statement below
select sp.name
from SalesPerson sp
where sp.sales_id
not in
(
select o.sales_id
from Orders o
join Company com
on o.com_id = com.com_id
where com.name = 'RED'
)