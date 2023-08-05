// Import models
var Service = require("../models/service");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId, Error } = require('mongoose');
var jwt = require("jsonwebtoken");

// Add Service request
exports.ServiceRequest = (req, res) => {
    let newRequest = new Service(req.body);
        newRequest.save().then((newRecord) => {
            if (newRecord) {
                return res.status(201).json({ 'msg': 'Service Request Successful' });
            }
        })
            .catch((err) => {
                console.log(err)
                return res.status(401).json({ 'msg2': 'Service Request failed' })
            });
};

// Get service request Showroom Pending
exports.getPendingShowroom = (req, res) => {
    Service.find({ ShowroomId: req.body.ShowroomId, ServiceStatus: false}).populate(["CustomerId", "ShowroomId", "CarId"]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Service details failed' })
    });
}

// Get service request Showroom Pending
exports.getAcceptedShowroom = (req, res) => {
    Service.find({ ShowroomId: req.body.ShowroomId, ServiceStatus: true}).populate(["CustomerId", "ShowroomId", "CarId"]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Service details failed' })
    });
}

// Get a particular service request Showroom
exports.getServiceSingle = (req, res) => {
    Service.find({ _id: req.body.ServiceId}).populate(["CustomerId", "ShowroomId", "CarId"]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Service details failed' })
    });
}

// Update service request Showroom Service status
exports.UpdateService = (req, res) => {
    Service.updateOne({ _id: req.body.ServiceId}, { $set: {ServiceStatus: true}}).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': 'Service Accepted' });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Accepting Service Failed' })
    });
}

// Get my service request User pending
exports.getPendingService = (req, res) => {
    Service.find({ CustomerId: req.body.CustomerId, ServiceStatus: false}).populate(["CustomerId", "ShowroomId", "CarId"]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Service details failed' })
    });
}

// Get my service request User Accepted
exports.getAcceptedService = (req, res) => {
    Service.find({ CustomerId: req.body.CustomerId, ServiceStatus: true}).populate(["CustomerId", "ShowroomId", "CarId"]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Service details failed' })
    });
}