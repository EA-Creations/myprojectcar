// Import packages
var mongoose = require("mongoose");
const {ObjectId} = mongoose.Schema;

// Create model schema
var CarReviewSchema = new mongoose.Schema({

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
    Feedbacks : {
        type : String,
        required : true
    },
    Rating : {
        type : Number,
        required : true
    }
})

// Export model schema
module.exports = mongoose.model("CarReviews", CarReviewSchema);