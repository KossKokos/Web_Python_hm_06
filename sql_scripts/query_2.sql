SELECT s.full_name, d.name, ROUND(AVG(g.grade), 2) AS average_grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN disciplines d ON d.id = g.disciplines_id 
WHERE d.id = 3
GROUP BY s.full_name 
ORDER BY average_grade DESC 
LIMIT 1;