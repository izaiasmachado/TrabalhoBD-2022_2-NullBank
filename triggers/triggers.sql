delimiter //;

-------------------------------------------
-- TRIGGERS E CONSTRAINTS DE FUNCIONÁRIO --
-------------------------------------------

-- Trigger para a checagem do campo "sexo" de Funcionario
CREATE TRIGGER SexCheck BEFORE INSERT ON  Funcionario
FOR EACH ROW
BEGIN
    IF New.sexo NOT IN('F', 'M') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.sexo failed';
    END IF;
END;//

-- Trigger para a checagem do campo "salario_funcionario" de Funcionario
CREATE TRIGGER SalarioCheck BEFORE INSERT ON  Funcionario
FOR EACH ROW
BEGIN
    IF New.salario_funcionario < 2500 THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.salario_funcionario failed';
    END IF;
END;//

CREATE TRIGGER SalarioCheck BEFORE UPDATE ON  Funcionario
FOR EACH ROW
BEGIN
    IF New.salario_funcionario < 2500 THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.salario_funcionario failed';
    END IF;
END;//

-- Trigger para a checagem do campo "cargo_funcionario" de Funcionario
CREATE TRIGGER CargoCheck BEFORE INSERT ON  Funcionario
FOR EACH ROW
BEGIN
    IF New.cargo_funcionario NOT IN ('G', 'A', 'C') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.cargo_funcionario failed';
    END IF;
END;//

CREATE TRIGGER CargoCheck BEFORE UPDATE ON  Funcionario
FOR EACH ROW
BEGIN
    IF New.cargo_funcionario NOT IN ('G', 'A', 'C') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.cargo_funcionario failed';
    END IF;
END;//

-------------------------------------------
-- TRIGGERS E CONSTRAINTS DE DEPENDENTE  --
-------------------------------------------

-- Trigger para a checagem do campo "parentesco" de Depdendente
CREATE TRIGGER ParentescoCheck BEFORE INSERT ON  Dependente
FOR EACH ROW
BEGIN
    IF New.parentesco NOT IN('F', 'C', 'G') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Dependente.parentesco failed';
    END IF;
END;//

-------------------------------------------
--   TRIGGERS E CONSTRAINTS DE CONTAS    --
-------------------------------------------

-- Trigger para a checagem do campo "tipo_conta" de Contas
CREATE TRIGGER TipoContaCheck BEFORE INSERT ON  Contas
FOR EACH ROW
BEGIN
    IF New.tipo_conta NOT IN('P', 'C', 'E') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Contas.tipo_conta failed';
    END IF;
END;//
