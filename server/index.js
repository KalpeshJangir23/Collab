const express = require('express');
const mongoose = require('mongoose'); // import file and we are using mongoose to connect it with our data base

const db = "mongodb+srv://lunagok:kalpesh@cluster0.909if4q.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

const PORT = process.env.PORT | 3001; //-- why 3000 because our web is already running on port 3000 so we can any port other than 3000
//-- here process.env.port is for available port online and is in local development process we use 3001
const app = express(); // initialise the express and store it in variable app   

// this we help to connect mongoose with our database
// here.then works as a future in data 
// this working is to establish promise between code and data base
// in dart we have async then await 
// in js we have .then((data) => {print(data)})

// -- we have to create new file for all user releate route
app.post('/api/signup', (req, res) => { // (res, req) mean response and request this our the variable we can name then any thing
    // req : with the help of this we are able to get info from the client 
    //res : with the help of this we are able to send the info


});

mongoose
    .connect(db)
    .then(() => {
        console.log("connection successfull");
    }).catch((err) => {
        console.log(err);
    });






//app.listen() // this helps to start server and continuesouly listen to server and resposd it
app.listen(PORT, "0.0.0.0", () => {
    console.log("Connected to port  3001");
    console.log(`Connected to port ${PORT}`);
    console.log("we have use nodemon so that we dont have to start server again and again");
})  // -- "0.0.0.0" what is this ? => this mean that we can access this port from anywhere and any ip address


