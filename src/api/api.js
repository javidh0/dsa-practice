const express = require('express');
const {users} = require('../database.js');
const {authenticateUser, validateAuthentication} = require('../authentication/authenticate.js');

async function createUser(data){
    let tr = await users.create(data);
    return tr;
}
async function getUser(req, res) {
    let auth = req.body.auth;
    if(auth == null) return res.send({'error' : 'sign_in required'});

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
async function signUp(req, res){
    let data = req.body;
    users.create(data)
    .then(val => {res.send(val)})
    .catch(val => {res.send({"error": val.toString()})})
}
async function updateUser(req, res){
    let data = req.body; 
    let auth = req.body.auth;

    if(auth == null || auth.user_id != data.user_id) 
        return res.send({'error' : 'sign_in required'});

    validateAuthentication(
        auth.user_id, auth.access_token,
        (val) => {
            if(val == -1) return res.send({'error' : 'sign_in required'});
            users.updateOne(
                {"user_id": data.user_id},
                data.data,
            ).then(val => res.send(val))
            .catch(val => res.send({'error': val.toString()}))
        }
    )
}

async function getSheets(req, res){
    
}

module.exports = {
    createUser, getUser, signIn, signUp, updateUser
}