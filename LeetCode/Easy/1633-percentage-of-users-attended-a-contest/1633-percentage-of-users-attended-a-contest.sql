# Write your MySQL query statement below
select r.contest_id,
round(count(distinct u.user_id)* 100 / (select count(*) from Users), 2) as percentage
from Register r
join Users u
using (user_id)
group by r.contest_id
order by percentage desc, r.contest_id asc;