// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var ShowroomContoller = require("../controllers/showroom");

// Set routes for respective controller function
routes.post('/showroomreg', ShowroomContoller.Registration)
routes.get('/getAllShowroom', ShowroomContoller.getAllShowroom)
routes.get('/getShowroom', ShowroomContoller.getShowroom)

// Export routes
module.exports = routes;