SELECT t.full_name AS teacher, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
LEFT JOIN disciplines d ON d.id = g.disciplines_id  
LEFT JOIN teachers t  ON t.id = d.teacher_id  
WHERE t.id = 3
GROUP BY t.full_name 
ORDER BY average_grade DESC;