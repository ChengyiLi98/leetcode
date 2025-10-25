# Write your MySQL query statement below
WITH first_order_table AS (
  SELECT
    customer_id,
    MIN(order_date) AS first_order_date
  FROM Delivery
  GROUP BY customer_id
)
# join the first-order info back to Delivery to know the customer_pref_delivery_date for that earliest order
SELECT
  ROUND(
    100.0 * COUNT(
      CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 END
    ) / COUNT(DISTINCT d.customer_id),
    2
  ) AS immediate_percentage
FROM Delivery d
JOIN first_order_table f
  ON d.customer_id = f.customer_id
 AND d.order_date = f.first_order_date;

