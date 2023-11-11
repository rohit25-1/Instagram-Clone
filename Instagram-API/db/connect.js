const mongoose = require("mongoose");

mongoose
  .connect("mongodb://localhost:27017/Instagram-API")
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(`Error: ${e}`);
  });
