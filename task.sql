

SELECT w.name, w.places
FROM wards AS w
JOIN departments AS d ON w.department_id = d.id
WHERE w.department_id IN (SELECT id FROM departments WHERE building = 5)
and w.places > 15;