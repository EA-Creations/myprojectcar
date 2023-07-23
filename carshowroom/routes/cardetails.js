// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var CarController = require("../controllers/cardetails");

// Set routes for respective controller function
routes.post('/addCar', CarController.addCar)
routes.get('/getCar', CarController.getCarDetails)

// Export routes
module.exports = routes;
