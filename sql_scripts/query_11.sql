SELECT t.full_name AS teacher, s.full_name AS student, ROUND(AVG(g.grade), 2) AS average_grade
FROM grades g 
LEFT JOIN disciplines d ON d.id = g.disciplines_id  
LEFT JOIN students s ON s.id = g.student_id
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE t.id = 3 AND s.id = 4
GROUP BY t.full_name  
ORDER BY average_grade;