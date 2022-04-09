CREATE VIEW acceptedtasksview AS
SELECT task.id , room.number AS room , problem.name as problem , task.department_id,
task.start_time , task.department_time , worker.name as worker,  task.note , user.username AS requested_by , status.name AS status ,
department.name AS department
FROM task  
INNER JOIN taskworker ON taskworker.task_id = task.id 
INNER JOIN worker ON taskworker.worker_id = worker.id 
INNER JOIN problem ON task.problem_id = problem.id
LEFT JOIN user ON task.fo_id = user.id
INNER JOIN room ON room.id = task.room_id
INNER JOIN status ON status.id  = task.status_id
INNER JOIN department ON department.id = task.department_id
WHERE task.accepted_department = 1 AND task.opened =1;