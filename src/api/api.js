const express = require('express');
const {users} = require('../database.js');
const {authenticateUser, validateAuthentication} = require('../authentication/authenticate.js');

async function createUser(data){
    let tr = await users.create(data);
    return tr;
}

async function getUser(req, res) {
    let auth = req.body.auth;
    console.log(auth.user_id);
    validateAuthentication(
        auth.user_id, auth.access_token, 
        async val => {
            if(val != -1)  {
                let user_id = req.params.user_id;
                let tr = await users.findOne({user_id: user_id});
                res.send(tr);
            } else {
                res.send({'error' : 'sign_in required'});
            }
        }    
    )
}

async function signIn(req, res) {
    console.log("signIn");
    let authData = req.body;
    authenticateUser(
        authData,
        (val) => {
            console.log(val);
            res.send({'access_token':val});
        }
    )
}

module.exports = {
    createUser, getUser, signIn
}