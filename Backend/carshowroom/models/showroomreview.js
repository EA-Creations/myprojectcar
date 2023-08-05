// Import packages
var mongoose = require("mongoose");
const {ObjectId} = mongoose.Schema;

// Create model schema
var ShowroomReviewSchema = new mongoose.Schema({

    CustomerId : {
        type : ObjectId,
        required : true,
        ref : "Users"
    },
    ShowroomId : {
        type : ObjectId,
        required : true,
        ref : "Showrooms"
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
module.exports = mongoose.model("ShowroomReviews", ShowroomReviewSchema);