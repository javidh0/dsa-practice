const {users, access_token} = require('../database.js');

async function validateAuthentication(user_id, token, next){
    let token_data = await access_token.findOne({
        user_id: user_id
    });

    if(!token_data) return next(-1);
    var mins = (new Date().getTime() - token_data.time.getTime())/1000/60;
    console.log(mins)
    if(token_data._id.toString() == token && mins <= 15){ 
        access_token.updateOne({'user_id': user_id}, {$set: {'time': new Date()}}).then(
            next(token)
        );
    }
    else {
        access_token.deleteOne({'user_id': user_id})
        next(-1);
    }
}

async function generateAccessToken(user){
    await access_token.deleteOne({user_id: user});

    var token = await access_token.create({
        user_id: user,
        time: new Date(),
    });

    return token._id;
}

async function authenticateUser(data, next){
    var user_data = await users.findOne({
        user_id : data['user_id'],
    });

    if(user_data['auth']['password'] == data['password']) next(
            await generateAccessToken(data['user_id'])
        );
    else next('-1');
}

module.exports = {
    authenticateUser, 
    generateAccessToken,
    validateAuthentication,
}