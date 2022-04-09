CREATE view openedtasks
AS
SELECT task.id , room.number as room ,  department.name as depratment , problem.name as problem , status.name as status
from task 
INNER join room on room.id =  task.room_id 
INNER JOIN department on department.id = task.department_id 
INNER JOIN problem on problem.id = task.problem_id
INNER JOIN status ON status.id = task.status_id
WHERE task.opened !=0;