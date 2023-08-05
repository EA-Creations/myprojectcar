// Import models
var CarReviews = require("../models/carreviews");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId, Error } = require('mongoose');
var jwt = require("jsonwebtoken");

// Add Review
exports.AddReview = (req, res) => {
    let newFeedback = new CarReviews(req.body);
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

// Get car Review For a Particular Car
exports.getReviewOneCar = (req, res) => {
    CarReviews.find({ CarId: req.body.CarId}).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Loading Car Reviews Failed' })
    });
}