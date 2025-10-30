# Write your MySQL query statement below
-- 用窗口函数分别取“最新一次(按日期降序)”和“最早一次(按日期升序)”
WITH t1 AS (  -- latest per (student_id, subject)
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY student_id, subject
      ORDER BY exam_date DESC
    ) AS rn
  FROM Scores
),
t2 AS (  -- first per (student_id, subject)
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY student_id, subject
      ORDER BY exam_date ASC
    ) AS rn
  FROM Scores
)
SELECT
  t1.student_id,
  t1.subject,
  t2.score  AS first_score,
  t1.score  AS latest_score
FROM t1
JOIN t2 USING (student_id, subject)
WHERE t1.rn = 1
  AND t2.rn = 1
  AND t1.score > t2.score
ORDER BY t1.student_id, t1.subject;
