# Write your MySQL query statement below
select query_name,
round(avg(rating/position),2) as quality,
ROUND(
    SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2
  ) AS poor_query_percentage
# wrong：round(count(select 1 from Queries where rating/position <3)/ count(*), 2) as poor_query_percentage
# COUNT() 不能直接包 SELECT 子查询，要在 SUM() 里做条件判断
from Queries
group by query_name;
