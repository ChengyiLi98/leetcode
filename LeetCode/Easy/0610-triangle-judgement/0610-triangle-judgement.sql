# Write your MySQL query statement below
# GREATEST() 是标量函数（scalar function），作用在 一行里的多个列 上
# MAX() 是聚合函数（aggregate function），只能用在 多行数据 上
SELECT *,
(CASE WHEN GREATEST(x, y, z) < (x + y + z - GREATEST(x, y, z)) THEN 'Yes'
    ELSE 'No' END) AS triangle
FROM Triangle;