SELECT s.full_name AS student, d.name AS discipline
FROM grades g 
LEFT JOIN disciplines d ON d.id = g.disciplines_id  
LEFT JOIN students s ON s.id = g.student_id  
WHERE s.id = 50
GROUP BY d.name  
ORDER BY d.name;