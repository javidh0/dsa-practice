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
        'question' : [{
            'name' : String,
            'link' : String, 
        }],
    }
);

const access_token = mongoose.model(
    'access_tokens',
    {
        'user_id' : String,
        'time' : Date,
    }
);

// sheets.create({
//     'name' : 'Faizaan Test Sheet',
//     'question' : [
//         {'name' : 'Faizaan test question 1'},
//         {'name' : 'Faizaan test question 2'},
//         {'name' : 'Faizaan test question 3'},
//         {'name' : 'Faizaan test question 4'},
//         {'name' : 'Faizaan test question 5'}
//     ] 
// })

// users.create({
//     'user_id' : 'javidh10@gmail.com',
//     'auth' : {
//         'email' : 'javidh10@gmail.com',
//         'password' : 'pass1'
//     },
//     'name' : 'Javidh',
//     'age' : 21,
//     'enrolled' : {
//         "questions_data" : [],
//         "sheets_data" : [
//             {
//                 'sheets_id' : "660eb50ec651d3798a5df75b",
//                 'progress' : 1.5
//             },
//             {
//                 "sheets_id" : "660eb54c4dfd2cb760370d4c",
//                 'progress' : 10   
//             }
//         ]
//     }
// })

// [
//     {
//       _id: ObjectId('660ae71b4e86d5ecbc3be70f'),
//       user_id: 'javidh10@gmail.com',
//       auth: { email: 'javidh10@gmail.com', password: 'pass1' },
//       name: 'Javidh',
//       age: '21',
//       enrolled: { questions_data: [], sheets_data: [] },
//       __v: 0
//     },
//     {
//       _id: ObjectId('660b9989542f6d88e7492e00'),
//       user_id: 'faizaan@gmail.com',
//       auth: { email: 'faizaan@gmail.com', password: 'pass1' },
//       name: 'Shaik Faizaan',
//       age: '21',
//       enrolled: { questions_data: [], sheets_data: [] },
//       __v: 0
//     }
// ]

module.exports = {
    users, access_token, sheets
}