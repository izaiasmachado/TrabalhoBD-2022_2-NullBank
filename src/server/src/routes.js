const express = require("express");
const router = express.Router();

// const ClienteController = require("./controllers/ClienteController");
const AgenciaController = require("./controllers/AgenciaController");

// router.get("/cliente", ClienteController.index);
// router.get("/cliente/:cpf", ClienteController.show);
// router.post("/cliente", ClienteController.store);
// router.put("/cliente/:cpf", ClienteController.update);

router.get("/agencia", AgenciaController.index);
router.get("/agencia/:numero_agencia", AgenciaController.show);
router.post("/agencia", AgenciaController.store);
router.put("/agencia/:numero_agencia", AgenciaController.update);

module.exports = router;
