# Write your MySQL query statement below
select score,
# rank is a reserved keyword in MySQL
DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
from Scores
# order by score desc
