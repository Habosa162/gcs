const userRouter = require("express").Router() ; 
const tokenVerify = require("../middlewares/token") ;




const user = require("../contollers/user.controller") ;
const task = require("../contollers/task.controller") ;


userRouter.post("/api/login",user.login) ;
// ______________________________________________________________________________________

userRouter.get("/api/department/tasks",tokenVerify,task.getTasksBydepartment)

userRouter.get("/api/list/departments/gettasks",tokenVerify,task.listdepartmentstasks)

userRouter.get("/api/list/requestedtasks",tokenVerify,task.listRequestedTasks)

userRouter.get("/api/singletask/:taskID",tokenVerify,task.getSingleTask)

userRouter.post("/api/accept/:taskID",tokenVerify,task.acceptask);

userRouter.get("/api/list/acceptedtasks",tokenVerify,task.listAcceptedtasks)

userRouter.post("/api/close/task",tokenVerify,task.closeTask);

userRouter.post("/api/problem",tokenVerify,user.createProblem);

userRouter.get("/api/list/closedtasks",tokenVerify,task.listClosedtasks) ;

userRouter.post("/api/create/room",tokenVerify,user.createRoom);

userRouter.get("/api/listrooms",tokenVerify,user.listrooms) ; 

userRouter.post("/api/confirm/task",tokenVerify,task.confirmTask);

userRouter.post("/api/reopen/task",tokenVerify,task.reopenTask)





// ____________________________________________________________________________________

userRouter.get("/api/list/problems",tokenVerify,user.listproblems)

userRouter.get("/api/list/openedtasks",tokenVerify,task.listOpenedtasks)

// ______________________________________________________________________________________


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
userRouter.get("/api/list/departments",tokenVerify,user.listdepartments)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
userRouter.get("/api/list/roles",tokenVerify,user.listroles)


// ______________________________________________________________________________________

userRouter.post("/api/create/task",tokenVerify,task.createTask) ; 

// ______________________________________________________________________________________


userRouter.post("/api/post/user",tokenVerify,user.createUser) ; 

//_______________________________________________________________________________________



// userRouter.get("/api/getallusers",tokenVerify) ;

userRouter.get("/api/getWorkers",user.getWorkers)

userRouter.get("/api/getsystemusers",user.getSystemUsers)


userRouter.post("/api/createWorker" ,user.createWorker) ; 



module.exports = userRouter  ;




