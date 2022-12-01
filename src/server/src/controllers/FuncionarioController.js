const Funcionario = require("../models/Funcionario");
const Gerente = require("../models/Gerente");

module.exports = {
  async index(req, res) {
    const funcionarios = await Funcionario.findAll();
    return await res.json(funcionarios);
  },

  async show(req, res) {
    const { matricula_funcionario } = req.params;

    try {
      const funcionario = await Funcionario.find(matricula_funcionario);
      return await res.json(funcionario);
    } catch (error) {
      return await res
        .status(404)
        .json({ error: "Funcionário não encontrado" });
    }
  },

  async store(req, res) {
    const {
      matricula_funcionario,
      Agencia_idAgencia,
      nome_funcionario,
      senha_funcionario,
      endereco_funcionario,
      cidade_funcionario,
      sexo,
      data_nascimento_funcionario,
      salario_funcionario,
      cargo_funcionario,
      quantidade_dependentes,
    } = req.body;

    const funcionario = {
      matricula_funcionario,
      Agencia_idAgencia,
      nome_funcionario,
      senha_funcionario,
      endereco_funcionario,
      cidade_funcionario,
      sexo,
      data_nascimento_funcionario,
      salario_funcionario,
      cargo_funcionario,
      quantidade_dependentes,
    };

    try {
      await Funcionario.create(funcionario);
      const funcionarioEncontrado = await Funcionario.find(
        matricula_funcionario
      );

      return await res.status(201).json(funcionarioEncontrado);
    } catch (error) {
      return await res
        .status(400)
        .json({ code: error.code, message: "Erro ao criar funcionário" });
    }
  },

  async update(req, res) {
    const { matricula_funcionario } = req.params;
    const {
      nome_funcionario,
      senha_funcionario,
      endereco_funcionario,
      cidade_funcionario,
      sexo,
      data_nascimento_funcionario,
      salario_funcionario,
      cargo_funcionario,
    } = req.body;

    try {
      await Funcionario.update({
        matricula_funcionario,
        nome_funcionario,
        senha_funcionario,
        endereco_funcionario,
        cidade_funcionario,
        sexo,
        data_nascimento_funcionario,
        salario_funcionario,
        cargo_funcionario,
      });
      const funcionarioEncontrado = await Funcionario.find(
        matricula_funcionario
      );
      return await res.status(200).json(funcionarioEncontrado);
    } catch (error) {
      return await res
        .status(400)
        .json({ code: error.code, message: "Erro ao atualizar funcionário" });
    }
  },

  async delete(req, res) {
    const { matricula_funcionario } = req.params;

    try {
      await Funcionario.find(matricula_funcionario);
      await Gerente.delete(matricula_funcionario);
      await Funcionario.delete(matricula_funcionario);
      return await res.sendStatus(204);
    } catch (error) {
      return await res
        .status(400)
        .json({ code: error.code, message: "Erro ao deletar funcionário" });
    }
  },
};
