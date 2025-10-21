# Write your MySQL query statement below
/*
SELECT 
  st.student_id,
  st.student_name,
  sj.subject_name,
  (
    SELECT COUNT(*)
    FROM Examinations e
    WHERE e.student_id = st.student_id
      AND e.subject_name = sj.subject_name
  ) AS attended_exams
FROM Students st,
     Subjects sj
ORDER BY st.student_id, sj.subject_name;
*/
# CROSS JOIN produces the Cartesian product of two tables

SELECT
  s.student_id,
  s.student_name,
  sub.subject_name,
  COUNT(e.subject_name) AS attended_exams # 如果COUNT(*) 会把“无考试记录”的那一行也计成 1。
FROM Students AS s
CROSS JOIN Subjects AS sub # 需要列出“每个学生 × 每门科目”的组合，所以要用 CROSS JOIN Students × Subjects
LEFT JOIN Examinations AS e
  ON e.student_id = s.student_id
  AND e.subject_name = sub.subject_name
GROUP BY s.student_id, sub.subject_name
ORDER BY s.student_id, sub.subject_name;