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
    CarBooking.find({ CustomerId: req.body.CustomerId, BookingStatus: true }).populate([ {path:"ShowroomId", select: "Name Email Phone ShowroomName Address City District"}, {path:"CarId", select: "Carmodel Manufacturer Price Loan CarImage"}]).then((result) => {

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
    CarBooking.find({ CustomerId: req.body.CustomerId, ShowroomId: req.body.ShowroomId }).populate(["CarId"]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching details failed' })
    });
}

// Get Booking Request which are pending
exports.getPendingBookings = (req, res) => {
    CarBooking.find({ ShowroomId: req.body.ShowroomId, BookingStatus: false }).populate([{path:"CustomerId", select: "Name Phone Email"}, {path:"CarId", select: "Carmodel Manufacturer Price Loan CarImage"}]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Booking Details Failed' })
    });
}

// Update Car booking status
exports.UpdateBooking = (req, res) => {
    CarBooking.updateOne({ _id: req.body.BookingId}, { $set: {BookingStatus: true}}).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': 'Booking Accepted' });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Accepting Booking Failed' })
    });
}