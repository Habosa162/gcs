CREATE VIEW requestedtasks AS
SELECT 
task.id,
room.number as room,
task.department_id,
problem.name AS problem , 
department.name AS department,
status.name AS status,
task.start_time
FROM task
INNER JOIN department ON task.department_id = department.id
INNER JOIN problem ON task.problem_id = problem.id
INNER JOIN room ON room.id  = task.room_id
INNER JOIN status ON status.id = task.status_id
WHERE task.opened=1 AND task.accepted_department=0;