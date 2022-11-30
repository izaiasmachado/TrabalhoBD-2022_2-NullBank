const Agencia = require("../models/Agencia");

module.exports = {
  async index(req, res) {
    const agencias = await Agencia.findAll();
    return await res.json(agencias);
  },

  async show(req, res) {
    const { numero_agencia } = req.params;
    const agencia = await Agencia.find(numero_agencia);

    if (!agencia) {
      return await res.status(404).json({ error: "Agência não encontrada" });
    }

    return await res.json(agencia);
  },

  async store(req, res) {
    const { numero_agencia, nome_agencia, cidade_agencia } = req.body;

    const agencia = {
      numero_agencia,
      nome_agencia,
      cidade_agencia,
    };

    try {
      await Agencia.create(agencia);
      return await res.status(201).json(agencia);
    } catch (error) {
      return await res
        .status(400)
        .json({ code: error.code, message: "Erro ao criar agência" });
    }
  },

  async update(req, res) {
    const { numero_agencia } = req.params;
    const { nome_agencia, cidade_agencia } = req.body;

    const agencia = {
      numero_agencia,
      nome_agencia,
      cidade_agencia,
    };

    try {
      await Agencia.update(agencia);
      return await res.status(200).json(agencia);
    } catch (error) {
      return await res
        .status(400)
        .json({ code: error.code, message: "Erro ao atualizar agência" });
    }
  },
};
