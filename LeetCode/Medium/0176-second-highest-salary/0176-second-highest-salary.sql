# Write your MySQL query statement below

-- 返回第二高薪资；若不存在则返回 NULL
SELECT (
  SELECT DISTINCT salary
  FROM Employee
  ORDER BY salary DESC
  LIMIT 1 OFFSET 1   -- 或写成 LIMIT 1, 1
) AS SecondHighestSalary;

/*
# first try
WITH first_two AS (
  SELECT DISTINCT salary
  FROM Employee
  ORDER BY salary DESC
  LIMIT 2
)
SELECT
  CASE WHEN COUNT(*) = 2 THEN MIN(salary) ELSE NULL END AS SecondHighestSalary
FROM first_two;
*/