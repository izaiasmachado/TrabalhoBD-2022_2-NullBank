const Cliente = require("../models/Cliente");

module.exports = {
  async index(req, res) {
    const clientes = await Cliente.findAll();
    console.log(clientes);

    return await res.json(clientes);
  },
};
