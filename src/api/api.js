const express = require('express');
const {users, sheets} = require('../database.js');
const {authenticateUser, validateAuthentication} = require('../authentication/authenticate.js');

async function createUser(data){
    let tr = await users.create(data);
    return tr;
}
async function getUser(req, res) {
    let auth = req.body.auth;
    if(auth == null) return res.send({'error' : 'sign_in required'});
    
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
    let authData = req.body.auth;
    authenticateUser(
        authData,
        (val) => {
            console.log(val);
            res.send({"auth":{
                'user_id':req.body.auth.user_id,
                'access_token':val
            }});
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
    let data = req.body.data; 
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

async function getAllSheets(req, res){
    let auth = req.body.auth;
    if(auth == null) return res.send({'error' : 'sign_in required'});
    
    validateAuthentication(
        auth.user_id, auth.access_token, 
        async val => {
            if(val != -1)  {
                const tr = await sheets.find().select('name')
                res.send(tr);
            } else {
                res.send({'error' : 'sign_in required'});
            }
        }    
    )
}

async function getSheet(req, res){
    let sheet_id = req.query.sheet
    let auth = req.body.auth;
    if(auth == null) return res.send({'error' : 'sign_in required'});
    
    validateAuthentication(
        auth.user_id, auth.access_token, 
        val => {
            if(val != -1)  {
                sheets.findOne({"_id" : new Object(sheet_id)})
                .then(
                    (val) => res.send(val)
                ).catch(err => res.send({"error" : "not found"}))
            } else {
                res.send({'error' : 'sign_in required'});
            }
        }    
    )
}

async function sheetEnrolled(req, res){
    let auth = req.body.auth;
    if(auth == null) return res.send({'error' : 'sign_in required'});
    
    validateAuthentication(
        auth.user_id, auth.access_token, 
        val => {
            if(val != -1)  {
                users.findOne({"user_id" : auth.user_id}).select('enrolled')
                .then(
                    (val) => res.send(val)
                ).catch(err => res.send({"error" : "not found"}))
            } else {
                res.send({'error' : 'sign_in required'});
            }
        }    
    )   
}

module.exports = {
    createUser, getUser, signIn, signUp, updateUser, getAllSheets,
    getSheet, sheetEnrolled
}