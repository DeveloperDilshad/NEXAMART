//IMPORT FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");

//INIT
const app = express();
const DB =
  "mongodb+srv://Dilshad:dilshad1041@cluster0.mcgvrw2.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

//MIDDLEWARE
app.use(authRouter);

//CONNECTIONS
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

const PORT = 3000;

app.listen(PORT, () => {
  console.log("connected at port " + PORT);
});
