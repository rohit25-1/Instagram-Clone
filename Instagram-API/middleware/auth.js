const jwt = require("jsonwebtoken");

const authMiddleware = async function (req, res, next) {
  const token = req.header("Authorization");

  if (!token) {
    return res.status(401).json({ message: "Unauthorized: Missing token" });
  }

  jwt.verify(token, "SECRET", (err, decoded) => {
    if (err) {
      return res.status(401).json({ message: "Unauthorized: Invalid token" });
    }
    console.log(decoded);
    req.user = decoded;
    next();
  });
};

module.exports = authMiddleware;
