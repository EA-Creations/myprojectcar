// Import packages
var mongoose = require("mongoose");
const {ObjectId} = mongoose.Schema;

// Create model schema
var ServiceSchema = new mongoose.Schema({

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
    IssueDescription : {
        type : String,
        required : true
    },
    Place : {
        type : String,
        required : true
    },
    ServiceStatus : {
        type : Boolean,
        required : true,
        default : false
    },
})

// Export model schema
module.exports = mongoose.model("Services", ServiceSchema);