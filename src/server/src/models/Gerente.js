const dbc = require("../services/databaseConnection");
const { randomInt } = require("../utils");

module.exports = {
  async findAll() {
    const connection = await dbc();
    const [gerentes] = await connection.execute("SELECT * FROM Gerente");

    return gerentes;
  },

  async create(matricula_funcionario) {
    const connection = await dbc();
    const sequencial = randomInt();

    await connection.execute(
      "INSERT INTO Gerente (Funcionario_matricula_funcionario, sequencial_gerente) VALUES (?, ?)",
      [matricula_funcionario, sequencial]
    );
  },

  async delete(matricula_funcionario) {
    const connection = await dbc();

    await connection.execute(
      "DELETE FROM Gerente WHERE Funcionario_matricula_funcionario = ?",
      [matricula_funcionario]
    );
  },
};
