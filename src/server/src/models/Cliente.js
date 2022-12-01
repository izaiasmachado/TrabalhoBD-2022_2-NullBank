const dbc = require("../services/databaseConnection");

module.exports = {
  async findAll() {
    const connection = await dbc();
    const [clientes] = await connection.execute("SELECT * FROM Cliente");
    return clientes;
  },

  async find(CPF) {
    const connection = await dbc();
    const [clientes] = await connection.execute(
      "SELECT * FROM Cliente WHERE CPF = ?",
      [CPF]
    );

    if (clientes.length === 0) {
      throw new Error("Cliente não encontrado");
    }

    return clientes[0];
  },

  async create(cliente) {
    const connection = await dbc();
    await connection.execute(
      "INSERT INTO Cliente (CPF, nome_cliente, RG_cliente, RG_UF, RG_orgao_emissor, data_nascimento_cliente, Endereco_cliente_sequencial_endereco) VALUES (?, ?, ?, ?, ?, ?, ?)",
      [
        cliente.CPF,
        cliente.nome_cliente,
        cliente.RG_cliente,
        cliente.RG_UF,
        cliente.RG_orgao_emissor,
        cliente.data_nascimento_cliente,
        cliente.Endereco_cliente_sequencial_endereco,
      ]
    );
  },

  async update(cliente) {
    const connection = await dbc();
    await connection.execute(
      "UPDATE Cliente SET nome_cliente = ?, RG_cliente = ?, RG_UF = ?, RG_orgao_emissor = ?, data_nascimento_cliente = ? WHERE CPF = ?",
      [
        cliente.nome_cliente,
        cliente.RG_cliente,
        cliente.RG_UF,
        cliente.RG_orgao_emissor,
        cliente.data_nascimento_cliente,
        cliente.CPF,
      ]
    );
  },

  async delete(CPF) {
    const connection = await dbc();
    await connection.execute("DELETE FROM Cliente WHERE CPF = ?", [CPF]);
  },
};
