SELECT teachers.name, cohorts.name, COUNT(assistance_requests.*) as total_assistance
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
JOIN students on students.id = student_id
JOIN cohorts on cohorts.id = cohort_id

WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;
