// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var CarBookingController = require("../controllers/carbooking");

// Set routes for respective controller function
routes.post('/bookCar', CarBookingController.bookCar)
routes.post('/getMyShowroom', CarBookingController.getMyShowroom)
routes.post('/getMyCar', CarBookingController.getMyCar)
routes.get('/getPendingBookings', CarBookingController.getPendingBookings)
routes.post('/UpdateBooking', CarBookingController.UpdateBooking)

// Export routes
module.exports = routes;
