SELECT t.full_name AS teacher, d.name AS discipline
FROM grades g 
LEFT JOIN disciplines d ON d.id = g.disciplines_id  
LEFT JOIN teachers t  ON t.id = d.teacher_id  
WHERE t.id = 3
GROUP BY discipline  
ORDER BY discipline;