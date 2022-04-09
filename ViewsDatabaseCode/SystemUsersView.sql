SELECT user.id,
	   user.name,
	   user.username,
       department.name AS department,
       role.name as role
 FROM gcs.user
 inner join department on department.id = user.dep_id
 inner join role on role.id = user.role_id