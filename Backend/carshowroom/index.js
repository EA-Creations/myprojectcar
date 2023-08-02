// Import dotenv file
require("dotenv").config();

// Importing packages
const mongoose = require("mongoose")
const bodyParser = require("body-parser")
const cookieParser = require("cookie-parser")
const cors = require("cors")
const express = require('express')
const app = express()

// Setting up port
const port = 3000

// Adding routes 
var userroute = require('./routes/users')
var showroomroute = require('./routes/showroom')
var loginroute = require('./routes/login')
var carrouter = require('./routes/cardetails')
var carbookingrouter = require('./routes/carbooking')
var servicerouter = require('./routes/service')

// Connect to Database -MongoDB
mongoose.set('strictQuery', true);
mongoose.connect(process.env.DATABASE,{
  useNewUrlParser: true, 
  useUnifiedTopology: true
})
.then(() => {
  console.log("DB CONNECTED");
  });

// app.use(bodyParser.urlencoded({extended:false}))
// app.use(bodyParser.json())
app.use(bodyParser.json({limit:'10mb'}))
app.use(cookieParser())
app.use(cors())

// Use routes in index.js 
app.use('/api', userroute)
app.use('/api', showroomroute)
app.use('/api', loginroute)
app.use('/api', carrouter)
app.use('/api', carbookingrouter)
app.use('/api', servicerouter)

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})

app.post('/home', (req,res)=> {
  res.send("Home page")
})