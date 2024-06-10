// this file consist of all user Route

const express = require('express');
const User = require("../models/user");



const authRouter = express.Router();


authRouter.post('/api/signup', async (req, res) => {
    //-- here we have to  store the data on the web
    // -- When ever there is a chance of a error we can use Try - catch block
    try {
        const { name, email, profilePic } = req.body;
        // http.post('localhost3000/api/signup' ,body: {})
        /// body "{}" refer to map 


        // step 1 : Check is email already exist or not
        // if it not exist then we store the data
        let user = await User.findOne({ email: email }); // here we are finding one email similiar to email we got from the client
        if (!user) {
            // here we have create a new user

            user = new User({
                name: name,
                email: email,
                profilePic: profilePic,
            });

            // here we store the data of the new user
            user = await user.save();
        }
        // now we want to return that to our client side
        // so we do this using res.json
        // res allow as to send data

        res.json({ user: user }); // /this check if object and key is same the send respone or encode it in json format
        // if everything goes write then the status code is 200{default}
        // else it give error with code 404

    } catch (e) {

        res.status(500).json({ error: e.message }); // if there is any server error then we direct it to 500 status code


    }
})




module.exports = authRouter;