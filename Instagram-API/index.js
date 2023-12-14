const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
require("./db/connect");

const user = require("./models/user");
const post = require("./models/post");
const auth = require("./middleware/auth");
const authMiddleware = require("./middleware/auth");

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
    if (findUser) {
      const token = jwt.sign(findUser.id, "SECRET");
      res.header("Authorization", token);
      res.status(200).json({ Success: "OK" });
    } else {
      res.status(400).json({ error: "check username or password" });
    }
  } catch (error) {
    console.log(error);
  }
});

app.get("/api/islogged", async (req, res) => {
  const headers = req.headers["authorization"];
  if (headers) {
    const id = jwt.verify(headers, "SECRET");
    const isUser = await user.findOne({
      id,
    });
    if (isUser) {
      res.status(200).json({ success: 1 });
    } else {
      res.status(400).json({ success: 0 });
    }
  }
});

app.get("/api/users/:userId", authMiddleware, async (req, res) => {
  try {
    if (req.params.userId !== req.user) {
      return res
        .status(403)
        .json({ message: "Forbidden: You can only access your own details" });
    }

    const findUser = await user.findById(req.params.userId);

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    res.json({ findUser });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Internal Server Error" });
  }
});

//End of user authentication

app.listen(3000);
