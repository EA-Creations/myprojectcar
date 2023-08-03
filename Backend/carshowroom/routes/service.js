// Import packages
var express = require("express"),

// declare routes
routes = express.Router()

// Import Controller
var ServiceController = require("../controllers/service");

// Set routes for respective controller function
routes.post('/serviceRequest', ServiceController.ServiceRequest)
routes.get('/getPendingShowroom', ServiceController.getPendingShowroom)
routes.get('/getAcceptedShowroom', ServiceController.getAcceptedShowroom)
routes.get('/getPendingService', ServiceController.getPendingService)
routes.get('/getServiceSingle', ServiceController.getServiceSingle)
routes.post('/UpdateService', ServiceController.UpdateService)
routes.get('/getAcceptedService', ServiceController.getAcceptedService)


// Export routes
module.exports = routes;
