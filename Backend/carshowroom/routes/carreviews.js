// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var CarReviewController = require("../controllers/carreviews");

// Set routes for respective controller function
routes.post('/AddReview', CarReviewController.AddReview)
routes.get('/getReviewOneCar', CarReviewController.getReviewOneCar)

// Export routes
module.exports = routes;
