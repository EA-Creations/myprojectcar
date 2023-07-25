// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var CarBookingController = require("../controllers/carbooking");

// Set routes for respective controller function
routes.post('/bookCar', CarBookingController.bookCar)
//routes.get('/getCar', CarBookingController.getCarDetails)

// Export routes
module.exports = routes;
