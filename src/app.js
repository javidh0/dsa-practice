const mongoose = require('mongoose');
const {authenticateUser, validateAuthentication} = require('./authentication/authenticate');

mongoose.connect("mongodb://127.0.0.1:27017/dsa_practice_project");

authenticateUser(
    {
        'user_id' : 'javidh@gmail.com',
        'password' : 'pass1' 
    },
    (val) => {
        console.log(val);
    }
)