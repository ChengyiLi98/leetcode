CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
SET N = N - 1;
  RETURN (
      # Write your MySQL query statement below.
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    #LIMIT 的 OFFSET 部分不支持直接写表达式（如 N-1），除非它是一个常量或变量。
    LIMIT 1 OFFSET N
  );
END