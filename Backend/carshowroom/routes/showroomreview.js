// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var ShowroomReviewController = require("../controllers/showroomreview");

// Set routes for respective controller function
routes.post('/AddReviewShowroom', ShowroomReviewController.AddReview)
routes.get('/getReviewOneShowroom', ShowroomReviewController.getReviewOneShowroom)

// Export routes
module.exports = routes;
