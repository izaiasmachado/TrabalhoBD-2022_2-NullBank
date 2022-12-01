const dbc = require("../services/databaseConnection");
const Gerente = require("./Gerente");

module.exports = {
  async findAll() {
    const connection = await dbc();
    const [funcionarios] = await connection.execute(
      "SELECT * FROM Funcionario"
    );
    return funcionarios;
  },

  async find(matricula_funcionario) {
    const connection = await dbc();
    const [funcionarios] = await connection.execute(
      "SELECT * FROM Funcionario WHERE matricula_funcionario = ?",
      [matricula_funcionario]
    );

    if (funcionarios.length === 0) {
      throw new Error("Funcionário não encontrado");
    }

    const funcionario = funcionarios[0];
    return funcionario;
  },

  async create(funcionario) {
    const connection = await dbc();

    await connection.execute(
      "INSERT INTO Funcionario (matricula_funcionario, Agencia_idAgencia, nome_funcionario, senha_funcionario, endereco_funcionario, cidade_funcionario, sexo, data_nascimento_funcionario, salario_funcionario, cargo_funcionario, quantidade_dependentes) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)",
      [
        funcionario.matricula_funcionario,
        funcionario.Agencia_idAgencia,
        funcionario.nome_funcionario,
        funcionario.senha_funcionario,
        funcionario.endereco_funcionario,
        funcionario.cidade_funcionario,
        funcionario.sexo,
        funcionario.data_nascimento_funcionario,
        funcionario.salario_funcionario,
        funcionario.cargo_funcionario,
      ]
    );

    if (funcionario.cargo_funcionario === "G") {
      await Gerente.create(funcionario.matricula_funcionario);
    }
  },

  async update(funcionario) {
    const connection = await dbc();
    await connection.execute(
      "UPDATE Funcionario SET nome_funcionario = ?, senha_funcionario = ?, endereco_funcionario = ?, cidade_funcionario = ?, sexo = ?, data_nascimento_funcionario = ?, salario_funcionario = ?, cargo_funcionario = ? WHERE matricula_funcionario = ?",
      [
        funcionario.nome_funcionario,
        funcionario.senha_funcionario,
        funcionario.endereco_funcionario,
        funcionario.cidade_funcionario,
        funcionario.sexo,
        funcionario.data_nascimento_funcionario,
        funcionario.salario_funcionario,
        funcionario.cargo_funcionario,
        funcionario.matricula_funcionario,
      ]
    );
  },

  async delete(matricula_funcionario) {
    const connection = await dbc();
    await connection.execute(
      "DELETE FROM Funcionario WHERE matricula_funcionario = ?",
      [matricula_funcionario]
    );
  },
};
