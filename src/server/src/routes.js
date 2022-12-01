const express = require("express");
const router = express.Router();

const AgenciaController = require("./controllers/AgenciaController");
const FuncionarioController = require("./controllers/FuncionarioController");
const ClienteController = require("./controllers/ClienteController");

router.get("/agencia", AgenciaController.index);
router.get("/agencia/:numero_agencia", AgenciaController.show);
router.post("/agencia", AgenciaController.store);
router.put("/agencia/:numero_agencia", AgenciaController.update);
router.delete("/agencia/:numero_agencia", AgenciaController.delete);

router.get("/funcionario", FuncionarioController.index);
router.get("/funcionario/:matricula_funcionario", FuncionarioController.show);
router.post("/funcionario", FuncionarioController.store);
router.put("/funcionario/:matricula_funcionario", FuncionarioController.update);
router.delete(
  "/funcionario/:matricula_funcionario",
  FuncionarioController.delete
);

router.get("/cliente", ClienteController.index);
router.get("/cliente/:cpf", ClienteController.show);
router.post("/cliente", ClienteController.store);
router.put("/cliente/:cpf", ClienteController.update);
router.delete("/cliente/:cpf", ClienteController.delete);

module.exports = router;
