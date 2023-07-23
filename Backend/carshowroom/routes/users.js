// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var UsersContoller = require("../controllers/users");

// Set routes for respective controller function
routes.post('/userreg', UsersContoller.Registration)
routes.get('/getAllUsers', UsersContoller.getAllUsers)
routes.get('/getUser', UsersContoller.getUser)

// Export routes
module.exports = routes;