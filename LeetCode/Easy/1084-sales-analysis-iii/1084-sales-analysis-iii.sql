# Write your MySQL query statement below

select distinct p.product_id,
p.product_name
from Product p
join Sales s
using (product_id)
where sale_date between '2019-01-01' and '2019-03-31'
and (p.product_id) 
not in(select product_id from Sales where sale_date>'2019-03-31' or sale_date<'2019-01-01') ;

/*
SELECT p.product_id, p.product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01'
   AND MAX(s.sale_date) <= '2019-03-31';
   */


