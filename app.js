const express = require('express');
const app = express();
// const http = require('http');
// const server = http.createServer(app);
// const { Server } = require("socket.io");
// const io = new Server(server)

const PORT = process.env.PORT || 6500 ; 
const cors  = require("cors");
const logger = require("morgan") ;
const moment  = require("moment") ;  





app.use(express.urlencoded({extended:false}));
app.use(express.json());
app.use(cors());





app.get('/', (req, res) => res.send('Hello World!')) ;


if (process.env.NODE_ENV === 'development') {
    app.use(logger('dev'))
} else if (process.env.NODE_ENV === 'production') {
    app.use(compress())
}


app.use(require("./routes/user.routes")) ; 



app.listen(PORT, () => console.log(`Example app listening on port ${PORT}!`)) ; 

// const io = require("socket.io")(server) ; 
// let interval;

// io.on('connection', (socket) => {
    
//     console.log("New client connected");
//   if (interval) {
//     clearInterval(interval);
//   }
//   interval = setInterval(() => getApiAndEmit(socket), 1000);
//   socket.on("disconnect", () => {
//     console.log("Client disconnected");
//     clearInterval(interval);
//   });

//   });

//   const getApiAndEmit = socket => {
//     const response = new Date();
//     // Emitting a new message. Will be consumed by the client
//     socket.emit("FromAPI", response);
//   };