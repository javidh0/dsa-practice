const mongoose = require('mongoose');
const {authenticateUser, validateAuthentication} = require('./authentication/authenticate');
const {signIn, getUser, signUp, updateUser} = require('./api/api.js');
const express = require('express');
const bodyParser = require('body-parser');

mongoose.connect("mongodb://127.0.0.1:27017/dsa_practice_project");

// authenticateUser(
//     {
//         'user_id' : 'javidh@gmail.com',
//         'password' : 'pass1' 
//     },
//     (val) => {
//         console.log(val);
//     }
// )

// validateAuthentication(
//     "javidh@gmai.com",
//     '660ae0018e84b8d0180780dd',
//     (val) => {
//         console.log(val);
//     }
// )


// const data = {
//         'user_id' : 'javidh10@gmail.com',
//         'auth' : {
//             'email' : 'javidh10@gmail.com',
//             'password' : 'pass1'
//         },
//         'name' : 'Javidh',
//         'age' : 21,
//     };

const app = express();
app.listen(1729, () => {console.log('1729')});
app.use(express.json())

app.get('/users/:user_id', getUser); 
app.get('/sign_in', signIn);
app.post('/sign_up', signUp);
app.patch('/users/update', updateUser);

