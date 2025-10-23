# Write your MySQL query statement below
select *
from Users
where cast(mail as binary) regexp BINARY'^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$';

