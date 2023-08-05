// Import models
var Showroom = require("../models/showroom");

// Import Packages
var jwt = require("jsonwebtoken");
const expressJwt = require("express-jwt");
const { ObjectId } = require("mongodb");
const { body } = require("express-validator");

// Export Registartion of Showroom function
exports.Registration = (req, res) => {
    console.log(req.body)
    Showroom.findOne({ $or: [{ Email: req.body.Email }, { Phone: req.body.Phone }] }).then((result) => {

        if (result) {
            return res.status(404).json({ 'msg': 'Showroom already exist' });
        }

        let newShowroom = Showroom(req.body);
        newShowroom.save().then((newShwrm) => {
            if (newShwrm) {
                return res.status(201).json({ 'msg': 'Showroom Successfully Added' });
            }
        })
            .catch((err) => {
                console.log(err)
                return res.status(401).json({ 'msg2': 'Showroom Registration Failed' })
            });

    })
};

// Export All Showroom details function
exports.getAllShowroom =  (req, res) => {
    console.log(req.body)
    Showroom.find().then((result) => {
        if(result) {
            return res.status(201).json({ 'msg': result });
        }
    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching All Showroom details failed' })
    });
}

// Export a specific Showroom details function
exports.getShowroom =  (req, res) => {
    console.log(req.body)
    Showroom.find({_id: req.body.ShowroomId}).then((result) => {
        if(result) {
            return res.status(201).json({ 'msg': result });
        }
    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Showroom details failed' })
    });
}

// Export Pending Showroom details function
exports.getPending =  (req, res) => {
    console.log(req.body)
    Showroom.find({Verification: false}).then((result) => {
        if(result) {
            return res.status(201).json({ 'msg': result });
        }
    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Pending Showroom details failed' })
    });
}

// Export Accepted Showroom details function
exports.getAccepted =  (req, res) => {
    console.log(req.body)
    Showroom.find({Verification: true}).then((result) => {
        if(result) {
            return res.status(201).json({ 'msg': result });
        }
    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Accepted Showroom details failed' })
    });
}

// Update Showroom Verification status
exports.UpdateShowroom = (req, res) => {
    Showroom.updateOne({ _id: req.body.ShowroomId}, { $set: {Verification: true}}).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': 'Showroom Verification Successful' });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Accepting Showroom Verification failed Failed' })
    });
}