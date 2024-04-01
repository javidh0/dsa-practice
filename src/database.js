const mongoose = require('mongoose');

// schema 
const shema_enroled = {
    'questions_data' : [{
        'sheet_id' : String,
        'question_id' : String,
        'status' : String,
    }],
    'sheets_data' : [{
        'sheets_id' : String,
        'progress' : Number
    }]
};

// collections
const users = mongoose.model(
    'users',
    {
        'user_id' : String,
        'auth' : {
            'email' : String,
            'password' : String,
        },
        'name' : String,
        'age' : Number,
        'enrolled' : shema_enroled
    }
);

const sheets = mongoose.model(
    'sheets',
    {
        'name' : String,
        'question' : {
            'name' : String,
            'link' : String, 
        },
    }
);

const access_token = mongoose.model(
    'access_tokens',
    {
        'user_id' : String,
        'time' : Date,
    }
);

// users.create({
//     'user_id' : 'javidh@gmail.com',
//     'auth' : {
//         'email' : 'javidh@gmail.com',
//         'password' : 'pass1'
//     },
//     'name' : 'Javidh',
//     'age' : 20,
// })

module.exports = {
    users, access_token, sheets
}