SELECT gr.name, d.name, ROUND(AVG(g.grade), 2) AS average_grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN groups gr ON gr.id = s.group_id  
LEFT JOIN disciplines d ON d.id = g.disciplines_id 
WHERE d.id = 6 
GROUP BY gr.name 
ORDER BY average_grade DESC;