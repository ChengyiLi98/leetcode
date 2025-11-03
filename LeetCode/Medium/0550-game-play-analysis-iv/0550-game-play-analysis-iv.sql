# Write your MySQL query statement below

with first_login as (
SELECT player_id, 
min(event_date) AS first_day 
FROM Activity 
GROUP BY player_id),

next_day as (
SELECT DISTINCT f.player_id
FROM first_login f
JOIN Activity a
ON a.player_id = f.player_id AND DATEDIFF(a.event_date, f.first_day) = 1
)
SELECT
    ROUND(IFNULL(
            (SELECT COUNT(*) FROM next_day) / (SELECT COUNT(*) FROM first_login),0)
    , 2) AS fraction;