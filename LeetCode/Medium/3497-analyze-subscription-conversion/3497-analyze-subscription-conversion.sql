# Write your MySQL query statement below
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
