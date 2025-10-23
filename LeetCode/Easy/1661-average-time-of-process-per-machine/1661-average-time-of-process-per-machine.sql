# Write your MySQL query statement below
select machine_id, 
round(sum(case when activity_type = 'end' THEN timestamp  
               when activity_type = 'start' THEN -timestamp
             ELSE 0 END)
 / count(distinct process_id), 3) as processing_time
from Activity
group by machine_id

/*
SELECT s.machine_id,
       ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity s
JOIN Activity e
  ON s.machine_id = e.machine_id
 AND s.process_id = e.process_id
 AND s.activity_type = 'start'
 AND e.activity_type = 'end'
GROUP BY s.machine_id;
*/