SELECT s.full_name AS student, t.full_name AS teacher, d.name AS discipline
FROM grades g 
LEFT JOIN disciplines d ON d.id = g.disciplines_id  
LEFT JOIN students s ON s.id = g.student_id
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE s.id = 4 AND t.id = 3
GROUP BY d.name  
ORDER BY d.name;