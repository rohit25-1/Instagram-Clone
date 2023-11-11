const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
require("./db/connect");

const user = require("./models/user");
const post = require("./models/post");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

//User Authentication

app.post("/api/register", async (req, res) => {
  const { username, name, email, password, bio } = req.body;
  try {
    const registerUser = await new user(req.body).save();
    res.status(200).json(registerUser);
  } catch (error) {
    if (error.keyPattern.username == 1) {
      res.status(400).json({ error: "username already taken" });
    } else if (error.keyPattern.email == 1) {
      res.status(400).json({ error: "email already in use. try logging in" });
    }
  }
});

app.post("/api/login", async (req, res) => {
  const { username, email, password } = req.body;
  try {
    const findUser =
      (await user.findOne({ username, password })) ||
      (await user.findOne({ email, password }));
    if (findUser) res.status(200).json(findUser);
    else {
      res.status(400).json({ error: "check username or password" });
    }
  } catch (error) {
    console.log(error);
  }
});

//End of user authentication

app.listen(3000);
