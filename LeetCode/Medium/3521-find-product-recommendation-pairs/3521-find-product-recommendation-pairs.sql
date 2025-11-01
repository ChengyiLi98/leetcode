
SELECT
  p1.product_id                          AS product1_id,
  p2.product_id                          AS product2_id,
  i1.category                            AS product1_category,
  i2.category                            AS product2_category,
  COUNT(DISTINCT p1.user_id)             AS customer_count
FROM ProductPurchases AS p1
JOIN ProductPurchases AS p2
  ON p1.user_id   = p2.user_id
 AND p1.product_id < p2.product_id              -- avoid duplicates & self-pairs
LEFT JOIN ProductInfo AS i1
  ON i1.product_id = p1.product_id
LEFT JOIN ProductInfo AS i2
  ON i2.product_id = p2.product_id
GROUP BY
  p1.product_id, p2.product_id, i1.category, i2.category
HAVING COUNT(DISTINCT p1.user_id) >= 3
ORDER BY customer_count DESC, product1_id ASC, product2_id ASC;
