# Write your MySQL query statement below

SELECT customer_id
FROM Customer c
join Product p
using (product_key)
GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM Product)
#ORDER BY customer_id;
