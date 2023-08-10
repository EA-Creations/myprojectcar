// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var TestDriveController = require("../controllers/testdrives");

// Set routes for respective controller function
routes.post('/AddTestDrive', TestDriveController.AddTestDrive)
routes.get('/ShowroomTestDrives', TestDriveController.ShowroomTestDrives)
routes.get('/getUserTestDrives', TestDriveController.getUserTestDrives)
routes.post('/UpdateTestDrive', TestDriveController.UpdateTestDrive)

// Export routes
module.exports = routes;




