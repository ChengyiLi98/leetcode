# Write your MySQL query statement below
select product_id,product_name, description
from products
where CAST(description AS BINARY) REGEXP BINARY '(^| )SN[0-9]{4}-[0-9]{4}([^0-9]|$)' 
# deal with case sensitive
# (^| ) space before SN or start with SN
# ([^0-9]|$) ensures the serial number is not immediately followed by a digit， or is at the end ($).
order by product_id asc;
