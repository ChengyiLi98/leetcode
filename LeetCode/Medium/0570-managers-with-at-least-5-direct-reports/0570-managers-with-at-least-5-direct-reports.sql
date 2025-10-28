# cte
with manager_5 as (select managerId
from Employee
group by managerId
having count(managerId)>=5)
select name
from Employee
where id in 
(select managerId FROM manager_5);

/*

# 子查询subquery + IN
SELECT name
FROM Employee
WHERE id IN (
  SELECT managerId
  FROM Employee
  GROUP BY managerId
  HAVING COUNT(*) >= 5
);
*/

/*
# join
SELECT m.name
FROM Employee e
JOIN Employee m ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(*) >= 5;
*/