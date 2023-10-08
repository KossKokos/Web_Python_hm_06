SELECT gr.name AS 'group', s.full_name AS 'students'
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN groups gr ON gr.id = s.group_id  
WHERE gr.id = 1
GROUP BY s.full_name 
ORDER BY s.full_name;