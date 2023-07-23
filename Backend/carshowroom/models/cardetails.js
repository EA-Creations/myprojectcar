// Import packages
var mongoose = require("mongoose");
const {ObjectId} = mongoose.Schema;

// Create model schema
var CarDetailsSchema = new mongoose.Schema({

    Showroom : {
        type : ObjectId,
        ref : "Showrooms"
    },
    Carmodel : {
        type : String,
        required : true
    },
    Manufacturer : {
        type : String,
        required : true,
    },
    Carspecs : {
        type : String,
        required : true,
    },
    Price : {
        type : String,
        required : true,
    },
    Milleage : {
        type : String,
        required : true,      
    },
    Features : {
        type : String,
        required : true,
    },
    Colors : {
        type : String,
        required : true,
    },
    Availability : {
        type : String,
        required : true,
    },
    Warranty : {
        type : String,
        required : true,
    },
    Loan: {
        type : String,
        required : true,
    },
    CarImage : {
        type : String,
        required : true
    }
})

// Export model schema
module.exports = mongoose.model("CarDetails", CarDetailsSchema);