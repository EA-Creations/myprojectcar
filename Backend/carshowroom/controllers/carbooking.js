// Import models
var CarBooking = require("../models/carbooking");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId } = require('mongoose');
var jwt = require("jsonwebtoken");

// Add car details function
exports.bookCar = (req, res) => {
    let newBooking = new CarBooking(req.body);
        newBooking.save().then((newRecord) => {
            if (newRecord) {
                return res.status(201).json({ 'msg': 'Booking Request Added' });
            }
        })
            .catch((err) => {
                console.log(err)
                return res.status(401).json({ 'msg2': 'Booking Request failed' })
            });
};

// Get Car Details function
/*
exports.getBookings = (req, res) => {
    CarDetails.find({ Showroom: req.body.Showroom }).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log("err")
        return res.status(401).json({ 'msg2': 'Showroom Registration Failed' })
    });
}*/