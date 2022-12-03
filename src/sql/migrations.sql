SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Agencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Agencia` (`numero_agencia`, `nome_agencia`, `salario_montante_total`, `cidade_agencia`) VALUES (123, 'Agência dos bão', 2600, 'Sobral');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Funcionario`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Funcionario` (`matricula_funcionario`, `Agencia_idAgencia`, `nome_funcionario`, `senha_funcionario`, `endereco_funcionario`, `cidade_funcionario`, `sexo`, `data_nascimento_funcionario`, `salario_funcionario`, `cargo_funcionario`, `quantidade_dependentes`) VALUES (1234, 123, 'William Lima', '12345', 'Rua Rua', 'Sobral', 'M', '2002-10-06', 2600, 'G', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Gerente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Gerente` (`sequencial_gerente`, `Funcionario_matricula_funcionario`) VALUES (1, 1234);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Dependente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Dependente` (`nome_dependente`, `data_nascimento_dependente`, `parentesco`, `idade`, `Funcionario_matricula_funcionario`) VALUES ('Carlos Lucas', '2011-08-06', 'F', 11, 1234);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Endereco_Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Endereco_Cliente` (`sequencial_endereco`, `tipo_logradouro`, `nome_logradouro`, `numero_logradouro`, `bairro`, `cep_logradouro`, `cidade`, `estado`) VALUES (1, 'CASA', 'Rua Menino Deus', 123, 'Centro', '456', 'Sobral', 'CE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Cliente` (`CPF`, `nome_cliente`, `RG_cliente`, `RG_UF`, `RG_orgao_emissor`, `data_nascimento_cliente`, `Endereco_cliente_sequencial_endereco`) VALUES (12345678910, 'Izaias Machado', 456, 'CE', 'SSPCE', '2002-07-07', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Telefone_cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Telefone_cliente` (`telefone_cliente`, `Cliente_CPF`) VALUES (88888888, 12345678910);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Email_cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Email_cliente` (`email_cliente`, `Cliente_CPF`) VALUES ('izaias@izaias.me', 12345678910);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Contas`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Contas` (`numero_conta`, `saldo`, `senha_conta`, `tipo_conta`, `Agencia_idAgencia`, `Gerente_sequencial_gerente`, `Gerente_Funcionario_matricula_funcionario`) VALUES (123, 2, '123', 'P', 123, 1, 1234);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Transacoes`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Transacoes` (`numero_transacao`, `Contas_numero_conta`, `tipo_transacao`, `data_transacao`, `valor_transacao`) VALUES (1, 123, 'S', '2022-11-22', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Corrente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Corrente` (`sequencial_corrente`, `Contas_numero_conta`, `data_aniversario_contrato`) VALUES (1, 123, '2022-10-06');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Especial`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Especial` (`sequencial_especial`, `Contas_numero_conta`, `limite_credito`) VALUES (1, 123, 4000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Agencia_Cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Agencia_Cliente` (`Cliente_CPF`, `Agencia_numero_agencia`, `Contas_numero_conta`) VALUES (12345678910, 123, 123);

COMMIT;