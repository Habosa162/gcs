const mysql = require("mysql2");

const connection  = mysql.createConnection({
    host :"127.0.0.1",
    user:"root",
    password:"toor",
    database:"gcs"
})


connection.connect((err)=>{
    if(err){throw err}else{
        console.log("___________________THE CONNECTION WITH DATABASE WORKS____________________");
    }
})
module.exports =  connection ;   