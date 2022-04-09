CREATE VIEW closedtasksview AS

SELECT 
task.id,
room.number as room,
problem.name AS problem , 
department.name AS department,
status.name AS status,
task.start_time,
task.department_time , 
task.end_time,
worker.name AS worker,
TIMEDIFF(end_time,department_time) AS duration  
FROM task
INNER JOIN department ON task.department_id = department.id
INNER JOIN problem ON task.problem_id = problem.id
INNER JOIN taskworker on taskworker.task_id = task.id
INNER join worker ON worker.id = taskworker.worker_id
INNER JOIN room ON room.id  = task.room_id
INNER JOIN status ON status.id = task.status_id
WHERE task.opened=0 AND task.confirmed=0;