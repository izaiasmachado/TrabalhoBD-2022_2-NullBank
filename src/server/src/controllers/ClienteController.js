const Cliente = require("../models/Cliente");
const EnderecoCliente = require("../models/EnderecoCliente");

module.exports = {
  async index(req, res) {
    const clientes = await Cliente.findAll();
    return await res.json(clientes);
  },

  async show(req, res) {
    const { cpf } = req.params;

    try {
      const cliente = await Cliente.find(cpf);
      return await res.status(200).json(cliente);
    } catch (error) {
      return await res.status(404).json({ error: "Cliente não encontrado" });
    }
  },

  async store(req, res) {
    const {
      CPF,
      nome_cliente,
      RG_cliente,
      RG_UF,
      RG_orgao_emissor,
      data_nascimento_cliente,
    } = req.body;

    const endereco = await EnderecoCliente.create();

    const cliente = {
      CPF,
      nome_cliente,
      RG_cliente,
      RG_UF,
      RG_orgao_emissor,
      data_nascimento_cliente,
      Endereco_cliente_sequencial_endereco: endereco.sequencial_endereco,
    };

    try {
      await Cliente.create(cliente);
      return await res.status(201).json(cliente);
    } catch (error) {
      return await res
        .status(400)
        .json({ code: error.code, error: "Erro ao criar cliente" });
    }
  },

  async update(req, res) {
    const CPF = req.params.cpf;

    const {
      nome_cliente,
      RG_cliente,
      RG_UF,
      RG_orgao_emissor,
      data_nascimento_cliente,
    } = req.body;

    const cliente = {
      CPF,
      nome_cliente,
      RG_cliente,
      RG_UF,
      RG_orgao_emissor,
      data_nascimento_cliente,
    };

    console.log(cliente);

    try {
      await Cliente.find(CPF);
      await Cliente.update(cliente);
      return await res.status(200).json(cliente);
    } catch (error) {
      return await res
        .status(404)
        .json({ code: error.code, error: "Erro ao atualizar cliente" });
    }
  },

  async delete(req, res) {
    const CPF = req.params.cpf;

    try {
      await Cliente.find(CPF);
      await Cliente.delete(CPF);
      return await res.status(204).json();
    } catch (error) {
      return await res
        .status(404)
        .json({ code: error.code, error: "Erro ao deletar cliente" });
    }
  },
};
