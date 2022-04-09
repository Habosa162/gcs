const jwt = require("jsonwebtoken") ; 

module.exports =(req,res,next)=>{
    const token = req.header("token") ; 
    
    if(token){
        jwt.verify(token,"fucktheduck",(err,decoded)=>{
            if(!err){
                if(decoded.isloggedin){
                    next() ; 
                }else{
                    res.json({
                        message : "login first to get access"
                    })
                }
            }else{
                res.json({
                    message:"invalid token",
                    error:err
                })
            }
        })
    }else{
        res.json({
            message:"token is not exist !"
        })
    }
}