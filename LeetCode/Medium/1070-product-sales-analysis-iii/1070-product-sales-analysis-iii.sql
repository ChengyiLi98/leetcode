WITH min_table AS (
  SELECT 
    product_id, 
    MIN(year) AS min_year
  FROM Sales
  GROUP BY product_id
)
SELECT 
  s.product_id,
  m.min_year AS first_year,
  s.quantity,
  s.price
FROM Sales AS s
JOIN min_table AS m
  ON s.product_id = m.product_id
 AND s.year = m.min_year
ORDER BY s.product_id;
