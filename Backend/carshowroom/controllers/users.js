// Import models
var Users = require("../models/users");

// Import Packages
var jwt = require("jsonwebtoken");
const expressJwt = require("express-jwt");
const { ObjectId } = require("mongodb");
const { body } = require("express-validator");

// Export Registration of Users function
exports.Registration = (req,res) => {
    console.log(req.body)
    Users.findOne({$or : [{Email : req.body.Email}, {Phone : req.body.Phone}]}).then((result) => {

        if(result) {
            return res.status(404).json({'msg':'User already exist'});
        }

        let newUser = Users(req.body);
        if(req.body.userType == "User") {
            newUser.save().then((newUsr) => {
                if (req.body.userType == "User") {
                    return res.status(201).json({'msg': 'User Successfully Added'});
                }})
                .catch((err) => {
                    console.log(err)
                     return res.status(401).json({'msg3': "User Registration failed"})
                })
        }
        
        if(req.body.userType == "Admin") {
            newUser.save().then((newUsr) => {
                if (req.body.userType == "Admin") {
                    return res.status(201).json({'msg': 'Admin Successfully Added'});
                }})
                .catch((err) => {
                    console.log(err)
                     return res.status(401).json({'msg3': "Admin Registration failed"})
                })
        }  
    })
};

// Export all user details function
exports.getAllUsers =  (req, res) => {
    console.log(req.body)
    Users.find().then((result) => {
        if(result) {
            return res.status(201).json({ 'msg': result });
        }
    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching All User Details Failed' })
    });
}

// Export a specific user function
exports.getUser =  (req, res) => {
    console.log(req.body)
    Users.find({_id: req.body.UserId}).then((result) => {
        if(result) {
            return res.status(201).json({ 'msg': result });
        }
    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching User Details Failed' })
    });
}