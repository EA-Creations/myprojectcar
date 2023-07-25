// Import models
var Users = require("../models/users");
var Showroom = require("../models/showroom");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId } = require('mongoose');
var jwt = require("jsonwebtoken");

// Export Login function
exports.login = (req, res) => {
    Users.findOne({ Email: req.body.Email,Password: req.body.Password }).then((result) => {
        if (result) {
            console.log(result);
            const token = jwt.sign({ _id:result._id }, process.env.SECRET);
            res.cookie("token",token, { expire: new Date() + 9999 } );
            return res.status(201).json({token,result});
        }
        else{
            Showroom.findOne({ Email: req.body.Email,Password: req.body.Password }).then((result) => {
                if (result) {
                    console.log(result);
                    const token = jwt.sign({ _id:result._id }, process.env.SECRET);
                    res.cookie("token",token, { expire: new Date() + 9999 } );
                    return res.status(201).json({token,result});
                }
                else{
                    return res.status(401).json({ 'msg': 'Account not found' });
                }
            })
            .catch((err) => {
                console.log(err)
                return res.status(400).json({ 'msg': "Showroom search error" });
            });
        }
    })
    .catch((err) => {
        console.log(err)
        return res.status(400).json({ 'msg': "User search error" });
    });
};

