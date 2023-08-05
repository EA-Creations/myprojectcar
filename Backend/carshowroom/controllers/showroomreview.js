// Import models
var ShowroomReviews = require("../models/showroomreview");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId, Error } = require('mongoose');
var jwt = require("jsonwebtoken");

// Add Review
exports.AddReview = (req, res) => {
    let newFeedback = new ShowroomReviews(req.body);
        newFeedback.save().then((newRecord) => {
            if (newRecord) {
                return res.status(201).json({ 'msg': 'Review Added Successful' });
            }
        })
            .catch((err) => {
                console.log(err)
                return res.status(401).json({ 'msg2': 'Adding Review failed' })
            });
};

// Get Showroom Review For a Particular Showroom
exports.getReviewOneShowroom = (req, res) => {
    ShowroomReviews.find({ ShowroomId: req.body.ShowroomId}).populate(["CustomerId","ShowroomId"]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Loading Showroom Reviews Failed' })
    });
}