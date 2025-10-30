# Write your MySQL query statement below
SELECT
  ua.user_id,
  ROUND(AVG(CASE WHEN ua.activity_type = 'free_trial' THEN ua.activity_duration END), 2) AS trial_avg_duration,
  ROUND(AVG(CASE WHEN ua.activity_type = 'paid' THEN ua.activity_duration END), 2) AS paid_avg_duration
FROM UserActivity ua
WHERE EXISTS (SELECT 1 FROM UserActivity x WHERE x.user_id = ua.user_id AND x.activity_type = 'free_trial')
AND EXISTS (SELECT 1 FROM UserActivity y WHERE y.user_id = ua.user_id AND y.activity_type = 'paid')
GROUP BY ua.user_id
ORDER BY ua.user_id;
/*
SELECT
  user_id,
  ROUND(AVG(CASE WHEN activity_type = 'free_trial'
                 THEN activity_duration END), 2) AS trial_avg_duration,
  ROUND(AVG(CASE WHEN activity_type = 'paid'
                 THEN activity_duration END), 2) AS paid_avg_duration
FROM UserActivity
GROUP BY user_id
HAVING COUNT(CASE WHEN activity_type = 'free_trial' THEN 1 END) > 0
   AND COUNT(CASE WHEN activity_type = 'paid'       THEN 1 END) > 0
ORDER BY user_id ASC;
*/
/*
with trial as
(SELECT user_id, AVG(activity_duration) AS trial_avg
  FROM UserActivity
  WHERE activity_type = 'free_trial'
  GROUP BY user_id),
  paid as 
  (SELECT user_id, AVG(activity_duration) AS paid_avg
  FROM UserActivity
  WHERE activity_type = 'paid'
  GROUP BY user_id)

SELECT
  t.user_id,
  ROUND(t.trial_avg, 2) AS trial_avg_duration,
  ROUND(p.paid_avg, 2)  AS paid_avg_duration
FROM trial t
JOIN paid p
  ON t.user_id = p.user_id
ORDER BY t.user_id;
*/