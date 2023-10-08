SELECT gr.name AS 'group', d.name AS discipline, s.full_name AS 'student', g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id
LEFT JOIN disciplines d ON d.id = g.disciplines_id 
LEFT JOIN groups gr ON gr.id = s.group_id  
WHERE gr.id = 1 AND d.id = 6 AND g.date_of = '2023-06-09'
GROUP BY g.grade  
ORDER BY g.grade DESC;