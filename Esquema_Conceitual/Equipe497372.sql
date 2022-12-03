-- MySQL Script generated by MySQL Workbench
-- Tue Nov 22 11:32:58 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

drop database `Equipe497372`;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Equipe497372
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Equipe497372
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Equipe497372` DEFAULT CHARACTER SET utf8 ;
USE `Equipe497372` ;

-- -----------------------------------------------------
-- Table `Equipe497372`.`Agencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Agencia` (
  `numero_agencia` BIGINT(15) NOT NULL,
  `nome_agencia` VARCHAR(60) NOT NULL,
  `salaraio_montante_total` REAL NULL,
  `cidade_agencia` VARCHAR(60) NULL,
  PRIMARY KEY (`numero_agencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Funcionario` (
  `matricula_funcionario` BIGINT(15) NOT NULL,
  `Agencia_idAgencia` BIGINT(15) NOT NULL,
  `nome_funcionario` VARCHAR(80) NOT NULL,
  `senha_funcionario` VARCHAR(100) NOT NULL,
  `endereco_funcionario` VARCHAR(100) NOT NULL,
  `cidade_funcionario` VARCHAR(100) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `data_nascimento_funcionario` DATE NOT NULL,
  `salario_funcionario` REAL NOT NULL,
  `cargo_funcionario` CHAR(1) NOT NULL COMMENT 'Gerente (G), Atendente (A) ou Caixa (C)',
  `quantidade_dependentes` INT NULL,
  PRIMARY KEY (`matricula_funcionario`),
  INDEX `fk_Funcionario_Agencia1_idx` (`Agencia_idAgencia` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Agencia1`
    FOREIGN KEY (`Agencia_idAgencia`)
    REFERENCES `Equipe497372`.`Agencia` (`numero_agencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Gerente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Gerente` (
  `sequencial_gerente` BIGINT(15) NOT NULL,
  `Funcionario_matricula_funcionario` BIGINT(15) NOT NULL,
  PRIMARY KEY (`sequencial_gerente`, `Funcionario_matricula_funcionario`),
  INDEX `fk_Gerente_Funcionario_idx` (`Funcionario_matricula_funcionario` ASC) VISIBLE,
  CONSTRAINT `fk_Gerente_Funcionario`
    FOREIGN KEY (`Funcionario_matricula_funcionario`)
    REFERENCES `Equipe497372`.`Funcionario` (`matricula_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Dependente` (
  `nome_dependente` VARCHAR(100) NOT NULL,
  `data_nascimento_dependente` DATE NOT NULL,
  `parentesco` CHAR(1) NOT NULL COMMENT 'Só pode ser \'FILHO(A)\", \"CONJûGE\" ou \"GENITOR\". Podemos adicionar constraints dentro deste atributo para que seja escolhido apenas \"F\", \"C\", ou \"G\"',
  `idade` INT,
  `Funcionario_matricula_funcionario` BIGINT(15) NOT NULL,
  PRIMARY KEY (`nome_dependente`, `Funcionario_matricula_funcionario`),
  INDEX `fk_Dependente_Funcionario1_idx` (`Funcionario_matricula_funcionario` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Funcionario1`
    FOREIGN KEY (`Funcionario_matricula_funcionario`)
    REFERENCES `Equipe497372`.`Funcionario` (`matricula_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Endereco_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Endereco_cliente` (
  `sequencial_endereco` BIGINT(15) NOT NULL AUTO_INCREMENT,
  `tipo_logradouro` VARCHAR(15) NOT NULL,
  `nome_logradouro` VARCHAR(15) NOT NULL,
  `numero_logradouro` INT NOT NULL,
  `bairro` VARCHAR(100) NOT NULL,
  `cep_logradouro` CHAR(8) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  PRIMARY KEY (`sequencial_endereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Cliente` (
  `CPF` BIGINT(11) NOT NULL,
  `nome_cliente` VARCHAR(15) NOT NULL,
  `RG_cliente` BIGINT(15) NOT NULL,
  `RG_UF` CHAR(2) NOT NULL,
  `RG_orgao_emissor` VARCHAR(10) NOT NULL,
  `data_nascimento_cliente` DATE NOT NULL,
  `Endereco_cliente_sequencial_endereco` BIGINT(15) NOT NULL,
  UNIQUE INDEX `RG_cliente_UNIQUE` (`RG_cliente` ASC) VISIBLE,
  PRIMARY KEY (`CPF`),
  INDEX `fk_Cliente_Endereco_cliente1_idx` (`Endereco_cliente_sequencial_endereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereco_cliente1`
    FOREIGN KEY (`Endereco_cliente_sequencial_endereco`)
    REFERENCES `Equipe497372`.`Endereco_cliente` (`sequencial_endereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Telefone_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Telefone_cliente` (
  `telefone_cliente` BIGINT(11) NOT NULL,
  `Cliente_CPF` BIGINT(11) NOT NULL,
  PRIMARY KEY (`telefone_cliente`, `Cliente_CPF`),
  INDEX `fk_Telefone_cliente_Cliente1_idx` (`Cliente_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_cliente_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `Equipe497372`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Email_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Email_cliente` (
  `email_cliente` VARCHAR(60) NOT NULL,
  `Cliente_CPF` BIGINT(11) NOT NULL,
  PRIMARY KEY (`email_cliente`, `Cliente_CPF`),
  INDEX `fk_Email_cliente_Cliente1_idx` (`Cliente_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Email_cliente_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `Equipe497372`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Contas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Contas` (
  `numero_conta` BIGINT(10) NOT NULL,
  `saldo` DOUBLE ZEROFILL NOT NULL,
  `senha_conta` VARCHAR(50) NOT NULL,
  `tipo_conta` CHAR(1) CHARACTER SET 'armscii8' NOT NULL COMMENT 'tipo conta deve ter uma constraint para setar apenas P (poupança), C (corrente) ou E (especial)',
  `Agencia_idAgencia` BIGINT(15) NOT NULL,
  `Gerente_sequencial_gerente` BIGINT(15) NOT NULL,
  `Gerente_Funcionario_matricula_funcionario` BIGINT(15) NOT NULL,
  PRIMARY KEY (`numero_conta`),
  INDEX `fk_Contas_Agencia1_idx` (`Agencia_idAgencia` ASC) VISIBLE,
  INDEX `fk_Contas_Gerente1_idx` (`Gerente_sequencial_gerente` ASC, `Gerente_Funcionario_matricula_funcionario` ASC) VISIBLE,
  CONSTRAINT `fk_Contas_Agencia1`
    FOREIGN KEY (`Agencia_idAgencia`)
    REFERENCES `Equipe497372`.`Agencia` (`numero_agencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contas_Gerente1`
    FOREIGN KEY (`Gerente_sequencial_gerente` , `Gerente_Funcionario_matricula_funcionario`)
    REFERENCES `Equipe497372`.`Gerente` (`sequencial_gerente` , `Funcionario_matricula_funcionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Transacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Transacoes` (
  `numero_transacao` BIGINT(8) NOT NULL,
  `Contas_numero_conta` BIGINT(10) NOT NULL,
  `tipo_transacao` CHAR(1) NOT NULL COMMENT 'tipo_transacao: [podendo ser saque (S), depósito (D), pagamento (P), estorno ou transferência (T)]',
  `data_transacao` DATETIME NULL,
  `valor_transacao` DOUBLE NULL,
  PRIMARY KEY (`numero_transacao`, `Contas_numero_conta`),
  INDEX `fk_Transacoes_Contas1_idx` (`Contas_numero_conta` ASC) VISIBLE,
  CONSTRAINT `fk_Transacoes_Contas1`
    FOREIGN KEY (`Contas_numero_conta`)
    REFERENCES `Equipe497372`.`Contas` (`numero_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Poupanca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Poupanca` (
  `sequencial_poupanca` BIGINT(15) NOT NULL,
  `Contas_numero_conta` BIGINT(10) NOT NULL,
  `taxa_de_juros` DOUBLE NOT NULL,
  PRIMARY KEY (`sequencial_poupanca`, `Contas_numero_conta`),
  INDEX `fk_Poupanca_Contas1_idx` (`Contas_numero_conta` ASC) VISIBLE,
  CONSTRAINT `fk_Poupanca_Contas1`
    FOREIGN KEY (`Contas_numero_conta`)
    REFERENCES `Equipe497372`.`Contas` (`numero_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Corrente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Corrente` (
  `sequencial_corrente` BIGINT(15) NOT NULL,
  `Contas_numero_conta` BIGINT(10) NOT NULL,
  `data_aniversario_contrato` DATETIME NOT NULL,
  PRIMARY KEY (`sequencial_corrente`, `Contas_numero_conta`),
  INDEX `fk_Corrente_Contas1_idx` (`Contas_numero_conta` ASC) VISIBLE,
  CONSTRAINT `fk_Corrente_Contas1`
    FOREIGN KEY (`Contas_numero_conta`)
    REFERENCES `Equipe497372`.`Contas` (`numero_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Especial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Especial` (
  `sequencial_especial` BIGINT(15) NOT NULL,
  `Contas_numero_conta` BIGINT(10) NOT NULL,
  `limite_credito` DOUBLE NOT NULL,
  PRIMARY KEY (`sequencial_especial`, `Contas_numero_conta`),
  INDEX `fk_Especial_Contas1_idx` (`Contas_numero_conta` ASC) VISIBLE,
  CONSTRAINT `fk_Especial_Contas1`
    FOREIGN KEY (`Contas_numero_conta`)
    REFERENCES `Equipe497372`.`Contas` (`numero_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Equipe497372`.`Agencia_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Equipe497372`.`Agencia_Cliente` (
  `Cliente_CPF` BIGINT(11) NOT NULL,
  `Agencia_numero_agencia` BIGINT(15) NOT NULL,
  `Contas_numero_conta` BIGINT(10) NOT NULL,
  INDEX `fk_Agencia_Cliente_Cliente1_idx` (`Cliente_CPF` ASC) VISIBLE,
  INDEX `fk_Agencia_Cliente_Agencia1_idx` (`Agencia_numero_agencia` ASC) VISIBLE,
  PRIMARY KEY (`Cliente_CPF`, `Agencia_numero_agencia`),
  INDEX `fk_Agencia_Cliente_Contas1_idx` (`Contas_numero_conta` ASC) VISIBLE,
  CONSTRAINT `fk_Agencia_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `Equipe497372`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agencia_Cliente_Agencia1`
    FOREIGN KEY (`Agencia_numero_agencia`)
    REFERENCES `Equipe497372`.`Agencia` (`numero_agencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agencia_Cliente_Contas1`
    FOREIGN KEY (`Contas_numero_conta`)
    REFERENCES `Equipe497372`.`Contas` (`numero_conta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Equipe497372`.`Agencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Agencia` (`numero_agencia`, `nome_agencia`, `salaraio_montante_total`, `cidade_agencia`) VALUES (123, 'Agência dos bão', 2600, 'Sobral');

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
-- Data for table `Equipe497372`.`Endereco_cliente`
-- -----------------------------------------------------
START TRANSACTION;
USE `Equipe497372`;
INSERT INTO `Equipe497372`.`Endereco_cliente` (`sequencial_endereco`, `tipo_logradouro`, `nome_logradouro`, `numero_logradouro`, `bairro`, `cep_logradouro`, `cidade`, `estado`) VALUES (1, 'CASA', 'Rua Menino Deus', 123, 'Centro', '456', 'Sobral', 'CE');

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