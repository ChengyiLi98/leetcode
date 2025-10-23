# Write your MySQL query statement below
select user_id,
concat(upper(SUBSTRING(name,1,1)), lower(SUBSTRING(name,2))) as name
# UPPER(LEFT(name, 1))
from Users
order by user_id;