# Write your MySQL query statement below
SELECT w1.id
FROM Weather AS w1
JOIN Weather AS w2
  ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;


/*
WITH t AS (
  SELECT
    id, recordDate, temperature,
    LAG(temperature) OVER (ORDER BY recordDate) AS prev_temp,
    LAG(recordDate)  OVER (ORDER BY recordDate) AS prev_date
  FROM Weather
)
SELECT id
FROM t
WHERE DATEDIFF(recordDate, prev_date) = 1
  AND temperature > prev_temp;
*/