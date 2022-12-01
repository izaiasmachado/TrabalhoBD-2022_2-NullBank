const express = require("express");
const cors = require("cors");
const app = express();
const routes = require("./routes");

app.use(express.json());
app.use(cors());

app.get("/", (req, res) => {
  res.json({ message: "Hello World!" });
});
app.use("/api", routes);

module.exports = app;
