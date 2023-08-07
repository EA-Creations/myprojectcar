// Import packages
var mongoose = require("mongoose");
const {ObjectId} = mongoose.Schema;

// Create model schema
var TestDrivesSchema = new mongoose.Schema({

    ShowroomId : {
        type : ObjectId,
        required : true,
        ref : "Showrooms"
    },
    CustomerId : {
        type : ObjectId,
        required : true,
        ref : "Users"
    },
    CarId : {
        type : ObjectId,
        required : true,
        ref : "CarDetails"
    },
    Date : {
        type : String,
        required : true
    },
    TestDriveStatus : {
        type : Boolean,
        required : true,
        default : false
    },
})

// Export model schema
module.exports = mongoose.model("TestDrives", TestDrivesSchema);