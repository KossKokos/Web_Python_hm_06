SELECT s.full_name, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
GROUP BY s.full_name 
ORDER BY average_grade DESC 
LIMIT 5;