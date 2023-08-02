// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var ServiceController = require("../controllers/service");

// Set routes for respective controller function
routes.post('/serviceRequest', ServiceController.ServiceRequest)


// Export routes
module.exports = routes;
