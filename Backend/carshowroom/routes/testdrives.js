// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var TestDriveController = require("../controllers/testdrives");

// Set routes for respective controller function
routes.post('/AddTestDrive', TestDriveController.AddTestDrive)
routes.get('/ShowroomPendingTestDrives', TestDriveController.ShowroomPendingTestDrives)
routes.get('/getUserTestDrivesPending', TestDriveController.getUserTestDrivesPending)
routes.get('/getUserTestDrivesAccepted', TestDriveController.getUserTestDrivesAccepted)
routes.get('/ShowroomAcceptedTestDrives', TestDriveController.ShowroomAcceptedTestDrives)
routes.post('/UpdateTestDrive', TestDriveController.UpdateTestDrive)

// Export routes
module.exports = routes;




