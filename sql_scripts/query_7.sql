SELECT gr.name AS 'group', d.name AS discipline, s.full_name AS 'students', g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id
LEFT JOIN disciplines d ON d.id = g.disciplines_id 
LEFT JOIN groups gr ON gr.id = s.group_id  
WHERE gr.id = 3 AND d.id = 3
GROUP BY g.grade  
ORDER BY g.grade DESC;