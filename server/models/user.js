const mongoose = require('mongoose');


/// Schema For user Model
const userSchema = mongoose.Schema(
    {
        name: {
            type: String,
            required: true,
        },
        email: {
            type: String,
            required: true,
        },
        profilePic: {
            type: String,
            required: true,
        }
    }
);


/// But we want to store the data 
// So we create a model where user can store the data


const User = mongoose.model('User', userSchema); /// name of the model and Schema

module.exports = User;