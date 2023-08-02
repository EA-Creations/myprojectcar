// Import models
var Service = require("../models/service");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId, Error } = require('mongoose');
var jwt = require("jsonwebtoken");

// Add Service request
exports.ServiceRequest = (req, res) => {
    let newRequest = new Service(req.body);
        newRequest.save().then((newRecord) => {
            if (newRecord) {
                return res.status(201).json({ 'msg': 'Service Request Successful' });
            }
        })
            .catch((err) => {
                console.log(err)
                return res.status(401).json({ 'msg2': 'Service Request failed' })
            });
};