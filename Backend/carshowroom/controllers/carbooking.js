// Import models
var CarBooking = require("../models/carbooking");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId, Error } = require('mongoose');
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

//Get My Showroom user
exports.getMyShowroom = (req, res) => {
    CarBooking.find({ CustomerId: req.body.CustomerId, BookingStatus: true }).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching details failed' })
    });
}

//Get My Car user
exports.getMyCar = (req, res) => {
    CarBooking.find({ CustomerId: req.body.CustomerId, ShowroomId: req.body.ShowroomId }).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching details failed' })
    });
}