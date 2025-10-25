
SELECT ROUND(SUM(i.tiv_2016), 2) AS tiv_2016
FROM Insurance i
JOIN (
    # 第 1 步：找出“重复的 tiv_2015”：
  SELECT tiv_2015
  FROM Insurance
  GROUP BY tiv_2015
  HAVING COUNT(*) > 1
) d USING (tiv_2015)
JOIN (
    # 第 2 步：找出“唯一的坐标对 (lat, lon)
  SELECT lat, lon
  FROM Insurance
  GROUP BY lat, lon
  HAVING COUNT(*) = 1
) u USING (lat, lon);


/*
WITH w AS (
  SELECT
    tiv_2016,
    COUNT(*) OVER (PARTITION BY tiv_2015) AS c2015, # 标签 A：这一行的 tiv_2015 在全表内的出现次数。
    COUNT(*) OVER (PARTITION BY lat, lon) AS location # 标签 B：这一行的 (lat, lon) 在全表内的出现次数。
  FROM Insurance
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM w
WHERE c2015 > 1         -- same tiv_2015 as someone else
  AND location = 1;       -- unique (lat, lon)
*/