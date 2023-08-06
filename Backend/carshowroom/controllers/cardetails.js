// Import models
var CarDetails = require("../models/cardetails");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId } = require('mongoose');
var jwt = require("jsonwebtoken");

// Add car details function
exports.addCar = (req, res) => {
    let newCar = new CarDetails(req.body);
        newCar.save().then((newCar) => {
            if (newCar) {
                return res.status(201).json({ 'msg': 'Car added successfully' });
            }
        })
            .catch((err) => {
                console.log(err)
                return res.status(401).json({ 'msg2': 'Adding car failed' })
            });
};

// Get Car Details function
exports.getCarDetails = (req, res) => {
    CarDetails.find({ Showroom: req.body.Showroom }).populate({path:"Showroom", select: "Name Email Phone ShowroomName Address City District"}).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Get Car details Failed' })
    });
}