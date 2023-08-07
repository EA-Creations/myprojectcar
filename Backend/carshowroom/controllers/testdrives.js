// Import models
var TestDrives = require("../models/testdrives");

// Import packages
const expressJwt = require('express-jwt');
const { ObjectId, Error } = require('mongoose');
var jwt = require("jsonwebtoken");

// Add car details function
exports.AddTestDrive = (req, res) => {
    let newTestDrive  = new TestDrives(req.body);
        newTestDrive.save().then((newRecord) => {
            if (newRecord) {
                return res.status(201).json({ 'msg': 'TestDrive Request Added' });
            }
        })
            .catch((err) => {
                console.log(err)
                return res.status(401).json({ 'msg2': 'TestDrive Request failed' })
            });
};

//Get My Showroom user
/*
exports.getMyShowroom = (req, res) => {
    TestDrives.find({ CustomerId: req.body.CustomerId, TestDriveStatus: true }).populate([ {path:"ShowroomId", select: "Name Email Phone ShowroomName Address City District"}, {path:"CarId", select: "Carmodel Manufacturer Price Loan CarImage"}]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching details failed' })
    });
}*/

//Get My test drive request pending
exports.getUserTestDrivesPending = (req, res) => {
    TestDrives.find({ CustomerId: req.body.CustomerId, TestDriveStatus: false }).populate(["CarId",{path:"ShowroomId", select: "Name Email Phone ShowroomName Address City District"}]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Test drive details failed' })
    });
}

//Get My test drive request Accepted
exports.getUserTestDrivesAccepted = (req, res) => {
    TestDrives.find({ CustomerId: req.body.CustomerId, TestDriveStatus: true }).populate(["CarId",{path:"ShowroomId", select: "Name Email Phone ShowroomName Address City District"}]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Test drive details failed' })
    });
}

// Get TestDrive Request which are pending from Showroom
exports.ShowroomPendingTestDrives = (req, res) => {
    TestDrives.find({ ShowroomId: req.body.ShowroomId, TestDriveStatus: false }).populate([{path:"CustomerId", select: "Name Phone Email"}, {path:"CarId", select: "Carmodel Manufacturer Price Loan CarImage"}]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching TestDrive Details Failed' })
    });
}

// Get TestDrive Request which are Accepted from Showroom
exports.ShowroomAcceptedTestDrives = (req, res) => {
    TestDrives.find({ ShowroomId: req.body.ShowroomId, TestDriveStatus: true }).populate([{path:"CustomerId", select: "Name Phone Email"}, {path:"CarId", select: "Carmodel Manufacturer Price Loan CarImage"}]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching TestDrive Details Failed' })
    });
}

// Update Car TestDrive status
exports.UpdateTestDrive = (req, res) => {
    TestDrives.updateOne({ _id: req.body.TestDriveId}, { $set: {TestDriveStatus: true}}).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': 'TestDrive Accepted' });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Accepting TestDrive Failed' })
    });
}


// Get Accepted car TestDrives - My Customers
/*
exports.getAcceptedTestDrives = (req, res) => {
    TestDrives.find({ ShowroomId: req.body.ShowroomId, TestDriveStatus: true }).populate([{path:"CustomerId", select: "Name Phone Email"}, {path:"CarId", select: "Carmodel Manufacturer Price Loan CarImage"}]).then((result) => {

        if (result) {
            return res.status(201).json({ 'msg': result });
        }

    })
    .catch((err) => {
        console.log(err)
        return res.status(401).json({ 'msg2': 'Fetching Accepted TestDrive Details Failed' })
    });
}*/