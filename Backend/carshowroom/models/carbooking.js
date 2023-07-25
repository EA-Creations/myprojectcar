// Import packages
var mongoose = require("mongoose");
const {ObjectId} = mongoose.Schema;

// Create model schema
var CarBookingSchema = new mongoose.Schema({

    ShowroomId : {
        type : ObjectId,
        ref : "Showrooms"
    },
    CustomerId : {
        type : ObjectId,
        ref : "Users"
    },
    CarId : {
        type : ObjectId,
        ref : "CarDetails"
    },
    BookingStatus : {
        type : Boolean,
        required : true,
        default : false
    },
})

// Export model schema
module.exports = mongoose.model("CarBookings", CarBookingSchema);