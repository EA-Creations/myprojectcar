// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var LoginController = require("../controllers/login");

// Set routes for respective controller function
routes.post('/login', LoginController.login)

// Export routes
module.exports = routes;