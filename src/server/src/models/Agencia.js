const dbc = require("../services/databaseConnection");

module.exports = {
  async findAll() {
    const connection = await dbc();
    const [agencias] = await connection.execute("SELECT * FROM Agencia");
    return agencias;
  },

  async find(numero_agencia) {
    const connection = await dbc();
    const [agencias] = await connection.execute(
      "SELECT * FROM Agencia WHERE numero_agencia = ?",
      [numero_agencia]
    );

    if (agencias.length === 0) {
      throw new Error("Agência não encontrada");
    }

    const agencia = agencias[0];
    return agencia;
  },

  async create(agencia) {
    const connection = await dbc();
    await connection.execute(
      "INSERT INTO Agencia (numero_agencia, nome_agencia, cidade_agencia, salario_montante_total) VALUES (?, ?, ?, 0)",
      [agencia.numero_agencia, agencia.nome_agencia, agencia.cidade_agencia]
    );

    return agencia;
  },

  async update(agencia) {
    const connection = await dbc();
    await connection.execute(
      "UPDATE Agencia SET nome_agencia = ?, cidade_agencia = ? WHERE numero_agencia = ?",
      [agencia.nome_agencia, agencia.cidade_agencia, agencia.numero_agencia]
    );

    return agencia;
  },

  async delete(numero_agencia) {
    const connection = await dbc();
    await connection.execute("DELETE FROM Agencia WHERE numero_agencia = ?", [
      numero_agencia,
    ]);
  },
};
