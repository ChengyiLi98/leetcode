# Write your MySQL query statement below
with res_list as
(select num, 
CASE
      WHEN num = LAG(num, 1) OVER (ORDER BY id)
       AND num = LAG(num, 2) OVER (ORDER BY id)
      THEN 1 ELSE 0
    END AS temp
from Logs)

select distinct num as ConsecutiveNums
from res_list
where temp = 1;
/*
SELECT DISTINCT num AS ConsecutiveNums
FROM (
  SELECT
    num,
    CASE
      WHEN num = LAG(num, 1) OVER (ORDER BY id)
       AND num = LAG(num, 2) OVER (ORDER BY id)
      THEN 1 ELSE 0
    END AS is_triplet
  FROM Logs
) t
WHERE is_triplet = 1;
*/
