# Write your MySQL query statement below

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'      -- 开头即 DIAB1...
   OR conditions LIKE '% DIAB1%';   -- 或空格后紧跟 DIAB1...

/*
SELECT *
FROM Patients
WHERE conditions REGEXP '(^| )DIAB1';
*/

