const connection = require("../DataBase/DataBaseCon");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const moment = require("moment");

const pagination  = require("../middlewares/paginationFunction")




const createTask = (req, res) => { //_______________________________FRONT OFFICE AND GUEST RELATION AND ADMIN____________________________________________________
    try {

        const { problem_id, department_id, room_id, note } = req.body;
        const start_time = moment().format("YYYY:MM:DD hh:mm:ss");
        const token = req.header("token");
        const decodedToken = jwt.verify(token, "fucktheduck");
        connection.query(`INSERT INTO task(problem_id,department_id,start_time,opened,room_id,note,status_id,fo_id)
                        VALUES('${problem_id}','${department_id}','${start_time}','${1}','${room_id}','${note}','${1}','${decodedToken.id}');`
                                  ,(err,data) => {
            if (!err) {
                res.json({
                    "inserted": true
                })
            }else{
                res.json({
                    error: err
                })
            }
        })
    } catch (error) {
        res.json({
            error: err
        })
    }

}

// ___________________________________________________________________________________________________________


const getTasksBydepartment = (req, res) => {

    try {
        const token = req.header("token");
        const decodedToken = jwt.verify(token, "fucktheduck");
        let pageNumber = req.query.page ? Number(req.query.page) : 1;
        let sql = `SELECT * FROM task WHERE task.department_id = '${decodedToken.department_id}' AND task.opened = 1 `;
        connection.execute(sql, (err, data) => {
                if (!err) {
                    const {skip , numberOfPages,limit} = pagination(pageNumber,data) ; 
                    pageNumber <= 0 ? 1 : pageNumber;
                    if(skip != undefined || skip!=null){
                      sql = `SELECT * FROM task WHERE task.department_id = '${decodedToken.department_id}' AND task.opened = 1 `
                      connection.query(sql,(err,data)=>{
                        if(err){
                            throw err
                        }else{
                            res.json({
                                pagesNumber: numberOfPages,
                               page: pageNumber,
                               departmenttasks: data
                            })
                        }
                      })
                    }
                } else {
                   throw err ;  
                }

            })
    } catch (error) {
        throw error
    }
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


const listdepartmentstasks = (req, res) => {
    try {

        connection.execute(`SELECT * FROM department WHERE department.get_task != ${0}`, (err, data) => {
            if (!err) {
                res.json({
                    status: "success",
                    departmentstasks: data
                })
            } else {
                res.json({
                    error: err
                })
            }
        })
    } catch (error) {
        res.json({
            error: err
        })
    }

}






// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

const listRequestedTasks = (req, res) => {
    try {
        const token = req.header("token");
        let pageNumber = req.query.page ? Number(req.query.page) : 1;
        const decodedToken = jwt.verify(token, "fucktheduck");
        let sql = `SELECT * FROM requestedtasks WHERE department_id =  '${decodedToken.department_id}'`;
         connection.query(sql, (err, data) => {
            if (!err) {
                 const {skip , numberOfPages,limit} = pagination(pageNumber,data) ; 
                pageNumber <= 0 ? 1 : pageNumber;
                if(skip != undefined || skip!=null){
                    sql = `SELECT * FROM requestedtasks WHERE department_id =  '${decodedToken.department_id}' LIMIT ${skip},${limit} `;
                    connection.query(sql, (err, data) => {
                       if (err) {
                           throw err;
                       } else {
                           res.json({
                               pagesNumber: numberOfPages,
                               page: pageNumber,
                               requestedtasks: data
                           });
                       }
                   });
   
                }
            } else {
                throw err;
            }
        })
    } catch (error) {
        res.json({
            error: err
        })
    }

}


const getSingleTask = (req, res) => {
    try {
        const { taskID } = req.params;
        connection.execute(`SELECT * FROM requestedtasks WHERE requestedtasks.id ='${taskID}' `, (err, [data]) => {
            if (!err) {
                res.json({
                    task: data
                })
            } else {
                res.json({
                    error: err
                })
            }
        })
    } catch (error) {
        res.json({
            error: err
        })
    }
}





const acceptask = (req, res) => {
    try {

        const { taskID } = req.params;

        const token = req.header("token");
        const decodedToken = jwt.verify(token, "fucktheduck");


        const { worker_id, comment } = req.body;
        const department_time = moment().format("YYYY:MM:DD hh:mm:ss");




        connection.execute(`UPDATE task SET task.accepted_department = '${1}' , task.department_time = '${department_time}' ,task.status_id = '${2}'
                            WHERE task.id = '${taskID}';`, (err, data) => {
            if (err) {
                throw err
            } else {
                connection.execute(` INSERT INTO taskworker(task_id,worker_id) VALUES('${taskID}' ,'${worker_id}');`, (err, data) => {
                    if (err) {
                        throw err;
                    } else {
                        connection.execute(` INSERT INTO comment(user_id,task_id,body) VALUES('${decodedToken.id}','${taskID}','${comment}') ;`, (err, data) => {
                            if (err) {
                                throw err
                            } else {
                                res.json({
                                    accepted: true
                                })
                            }
                        })
                    }
                })
            }
        })
    } catch (error) {
        res.json({
            error: err
        })
    }

}


const listAcceptedtasks = (req, res) => {
    try {
        const token = req.header("token");
        const decodedToken = jwt.verify(token, "fucktheduck");
        let pageNumber = req.query.page ? Number(req.query.page) : 1;
        let sql =`SELECT * FROM acceptedtasksview WHERE acceptedtasksview.department_id	='${decodedToken.department_id}'`
        connection.execute(sql, (err, data) => {
            if (err) {
                throw err
            } else {
                const {skip , numberOfPages,limit} = pagination(pageNumber,data) ; 
                pageNumber <= 0 ? 1 : pageNumber;
                if(skip != undefined || skip!=null){
                    sql =`SELECT * FROM acceptedtasksview WHERE acceptedtasksview.department_id	='${decodedToken.department_id}' LIMIT ${skip},${limit}`
                    connection.query(sql,(err,data)=>{
                        if(err){
                            throw err
                        }else{
                            res.json({
                                pagesNumber: numberOfPages,
                                page: pageNumber,
                                acceptedtasks:data
                            })
                        }
                    })
                }
            }
        })
    } catch (error) {
        throw error
    }

}


const closeTask = (req, res) => {
    try {
        const { taskID } = req.body;
        const endTime = moment().format("YYYY:MM:DD hh:mm:ss");

        connection.execute(`UPDATE task SET task.opened='${0}' , task.end_time = '${endTime}' , task.status_id='${3}'
        WHERE task.id = '${taskID}'`, (err, data) => {
            if (err) {
                throw err
            } else {
                res.json({
                    closed: true
                })
            }
        })

    } catch (error) {
        throw error

    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

const listClosedtasks = (req, res) => {
    try {
        const token = req.header("token");
        const decodedToken = jwt.verify(token, "fucktheduck");
        let sql  = `SELECT * FROM closedtasksview` ; 
        let pageNumber = req.query.page ? Number(req.query.page) : 1;
        connection.execute(sql, (err, data) => {
            if (err) {
                throw err
            } else {
                const {skip , numberOfPages,limit} = pagination(pageNumber,data) ; 
                pageNumber <= 0 ? 1 : pageNumber;
                if(skip != undefined || skip!=null){
                    sql  = `SELECT * FROM closedtasksview LIMIT ${skip},${limit}` ; 
                    connection.query(sql,(err,data)=>{
                        if(err){
                            throw err
                        }else{
                            res.json({
                               pagesNumber: numberOfPages,
                               page: pageNumber,
                               closedtasks: data
                            })
                        }
                    })
                }
            }
        })
    } catch (error) {
        throw error
    }

}

/////////////////////////////////////////////////////////////////////////////////////////////



const reopenTask = (req, res) => {
    try {
        const { taskID } = req.body;
        connection.execute(`UPDATE task SET task.confirmed='${0}' , task.opened='${1}', task.status_id='${5}' ,task.reopened='${1}'
        WHERE task.id = '${taskID}'`, (err, data) => {
            if (err) {
                throw err
            } else {
                res.json({
                    reopend: true
                })
            }
        })

    } catch (error) {
        throw error

    }
}




const confirmTask = (req, res) => {
    try {
        const { taskID } = req.body;
        const confirmedTime = moment().format("YYYY:MM:DD hh:mm:ss");
        connection.execute(`UPDATE task SET task.confirmed='${1}' , task.opened='${0}' , task.confirmed_time='${confirmedTime}', task.status_id='${4}'
        WHERE task.id = '${taskID}'`, (err, data) => {
            if (err) {
                throw err
            } else {
                res.json({
                    confirmed: true
                })
            }
        })

    } catch (error) {
        throw error

    }
}




// const listConfirmedtasks = (req, res) => {
//     try {
//         const token = req.header("token");
//         const decodedToken = jwt.verify(token, "fucktheduck");
//         connection.execute(`SELECT * FROM closedtasksview`, (err, data) => {
//             if (err) {
//                 throw err
//             } else {
//                 res.json({
//                     closedtasks: data
//                 })
//             }
//         })
//     } catch (error) {
//         throw error
//     }

// }




//////////////////////////////////////////////////////////////////////////////////////////
const listOpenedtasks = (req, res) => {
    try {
        let pageNumber = req.query.page ? Number(req.query.page) : 1;
        let sql = `SELECT * FROM openedtasks` ; 
        connection.execute(sql, (err, data) => {
            if (err) {
                throw err
            } else {
                const {skip , numberOfPages,limit} = pagination(pageNumber,data) ; 
                pageNumber <= 0 ? 1 : pageNumber;
                if(skip != undefined || skip!=null){
                    let sql = `SELECT * FROM openedtasks  LIMIT ${skip},${limit}` ; 
                    connection.query(sql,(err,data)=>{
                        if(err){
                            throw err
                        }else{
                            res.json({
                                pagesNumber: numberOfPages,
                                page: pageNumber,
                                openedtasks: data
                            })
                        }
                    })


                    
                }
            }

        })
    } catch (error) {
        throw error
    }

}




module.exports = {
    getTasksBydepartment,
    listdepartmentstasks,
    listRequestedTasks,
    getSingleTask,
    acceptask,
    createTask,
    listAcceptedtasks,
    closeTask,
    listClosedtasks,
    confirmTask,
    // listConfirmedtasks,
    reopenTask,
    listOpenedtasks
}