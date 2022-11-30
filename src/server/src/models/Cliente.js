const dbc = require("../services/databaseConnection");

module.exports = {
  async findAll() {
    const connection = await dbc();
    const [rows] = await connection.execute("SELECT * FROM Cliente");
    return rows;
  },
  // async findById(id) {
  //     const [rows] = await connection.execute("SELECT * FROM Agencia_Cliente WHERE id = ?", [id]);
  //     res.json(rows);
  // }
};
