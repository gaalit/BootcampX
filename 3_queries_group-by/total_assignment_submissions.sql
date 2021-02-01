SELECT cohorts.name AS cohort, COUNT(assignment_submissions.*) AS total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON student_id = students.id
GROUP BY cohort
ORDER BY total_submissions DESC;
