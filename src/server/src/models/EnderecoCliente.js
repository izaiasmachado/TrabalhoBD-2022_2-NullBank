const dbc = require("../services/databaseConnection");
const { randomInt } = require("../utils");

module.exports = {
  async create() {
    const connection = await dbc();

    const endereco = {
      sequencial_endereco: randomInt(),
      tipo_logradouro: "Rua",
      nome_logradouro: "Rua das Flores",
      numero_logradouro: "123",
      bairro: "Centro",
      cep_logradouro: "12345678",
      cidade: "São Paulo",
      estado: "SP",
    };

    await connection.execute(
      "INSERT INTO Endereco_Cliente (sequencial_endereco, tipo_logradouro, nome_logradouro, numero_logradouro, bairro, cep_logradouro, cidade, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      [
        endereco.sequencial_endereco,
        endereco.tipo_logradouro,
        endereco.nome_logradouro,
        endereco.numero_logradouro,
        endereco.bairro,
        endereco.cep_logradouro,
        endereco.cidade,
        endereco.estado,
      ]
    );

    return endereco;
  },
};
