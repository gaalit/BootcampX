SELECT day, count(assignments.day) number_of_assignments, SUM(assignments.duration)
FROM assignments
GROUP BY day
ORDER BY day;