const mysql2 = require("mysql2/promise");

let connectionInstance = null;

async function connect() {
  if (!connectionInstance) {
    connectionInstance = await getConnection();
  }

  return connectionInstance;
}

async function getConnection() {
  const connection = await mysql2.createConnection({
    host: process.env.MYSQL_HOST,
    port: process.env.MYSQL_PORT,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
  });
  return connection;
}

module.exports = connect;
