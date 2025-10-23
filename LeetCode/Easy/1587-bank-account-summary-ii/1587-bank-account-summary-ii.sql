# Write your MySQL query statement below
/*
# first attempt
with sum_table as(
select u.name, 
sum(t.amount) balance
from Users u
join Transactions t
where u.account = t.account
group by u.account)
select name, balance
from sum_table
where balance> 10000
;
*/



SELECT u.name, SUM(amount) AS balance 
FROM Users u
JOIN Transactions using (account)
GROUP BY u.name
HAVING balance > 10000