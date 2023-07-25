// Import Packages
var mongoose = require("mongoose");
const {ObjectId} = mongoose.Schema;

// Create model schema
var ShowroomSchema = new mongoose.Schema({
    Name : {
        type : String,
        required : true
    },
    Email : {
        type : String,
        required : true,
        unique : true
    },
    Phone : {
        type : Number,
        required : true,
        unique : true
    },
    Address : {
        type : String,
        required : true,
    },
    City : {
        type : String,
        required : true,      
    },
    District : {
        type : String,
        required : true,
    },
    State : {
        type : String,
        required : true,
    },
    Pincode : {
        type : Number,
        required : true,
    },
    Password : {
        type : String,
        required : true,
    },
    UserType : {
        type : String,
        required : true,
        default : "Showroom"
    },
    ShowroomName: {
        type : String,
        required : true,
    },
    License : {
        type : String,
    //  required : true,
    },
    Verification : {
        type : Boolean,
        default : false
    } 
})

// Export model schema
module.exports = mongoose.model("Showrooms", ShowroomSchema);