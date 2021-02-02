SELECT DISTINCT teachers.name, cohorts.name
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students on students.id = student_id
JOIN cohorts on cohorts.id = cohort_id

WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name