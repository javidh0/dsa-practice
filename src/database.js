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
        'user_id' : {
            type: String,
            required: true,
            unique: true,
        },
        'auth' : {
            'email' : {
                type: String,
                required: true,
            },
            'password' : {
                type: String,
                required: true,
            },
        },
        'name' : {
            type: String,
            required: true,
        },
        'age' : {
            type: String,
            required: true,
        },
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

users.create({
    'user_id' : 'faizaan@gmail.com',
    'auth' : {
        'email' : 'faizaan@gmail.com',
        'password' : 'pass1'
    },
    'name' : 'Faizaan',
    'age' : 22,
})

module.exports = {
    users, access_token, sheets
}