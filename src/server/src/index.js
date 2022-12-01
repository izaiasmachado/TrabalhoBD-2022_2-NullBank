require("dotenv").config();

const app = require("./app");
const port = process.env.PORT || 3000;
const dbc = require("./services/databaseConnection");

async function main() {
  await dbc();
  console.log("Connected to database");

  app.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });
}

main();
