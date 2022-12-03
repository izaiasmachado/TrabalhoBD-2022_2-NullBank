delimiter //;

-- ------------------------------------- --
-- TRIGGERS E CONSTRAINTS DE FUNCIONÁRIO --
-- ------------------------------------- --

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
CREATE TRIGGER SalarioCheckInsert BEFORE INSERT ON Funcionario
FOR EACH ROW
BEGIN
    IF New.salario_funcionario < 2500 THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.salario_funcionario failed';
    END IF;
END;//

CREATE TRIGGER SalarioCheckUpdate BEFORE UPDATE ON Funcionario
FOR EACH ROW
BEGIN
    IF New.salario_funcionario < 2500 THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.salario_funcionario failed';
    END IF;
END;//

-- Trigger para a checagem do campo "cargo_funcionario" de Funcionario
CREATE TRIGGER CargoCheckInsert BEFORE INSERT ON  Funcionario
FOR EACH ROW
BEGIN
    IF New.cargo_funcionario NOT IN ('G', 'A', 'C') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.cargo_funcionario failed';
    END IF;
END;//

CREATE TRIGGER CargoCheckUpdate BEFORE UPDATE ON  Funcionario
FOR EACH ROW
BEGIN
    IF New.cargo_funcionario NOT IN ('G', 'A', 'C') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Funcionario.cargo_funcionario failed';
    END IF;
END;//

-- ------------------------------------- --
-- TRIGGERS E CONSTRAINTS DE DEPENDENTE  --
-- ------------------------------------- --

-- Trigger para a checagem do campo "parentesco" de Depdendente
CREATE TRIGGER ParentescoCheck BEFORE INSERT ON  Dependente
FOR EACH ROW
BEGIN
    IF New.parentesco NOT IN('F', 'C', 'G') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Dependente.parentesco failed';
    END IF;
END;//

-- ------------------------------------- --
--   TRIGGERS E CONSTRAINTS DE CONTAS    --
-- ------------------------------------- --

-- Trigger para a checagem do campo "tipo_conta" de Contas
CREATE TRIGGER TipoContaCheck BEFORE INSERT ON  Contas
FOR EACH ROW
BEGIN
    IF New.tipo_conta NOT IN('P', 'C', 'E') THEN
		SIGNAL SQLSTATE '10000'
			SET MESSAGE_TEXT = 'check constraint on Contas.tipo_conta failed';
    END IF;
END;//

-- ------------------------------------------ --
--   TRIGGERS E CONSTRAINTS DE DEPENDENTES    --
-- ------------------------------------------ --

-- Trigger para calcular idade de acordo com a data de nascimento do dependente
create trigger IdadeCalc before insert on Dependente
for each row
begin
	set new.idade = datediff(now(), new.data_nascimento_dependente) / 365;
end//



-- ------------------------------------------ --
--     TRIGGERS E CONSTRAINTS DE AGÊNCIA      --
-- ------------------------------------------ --

create trigger UpdateSalarioMontante after insert on Funcionario
for each row
begin
	update Agencia set salario_montante_total = salario_montante_total + new.salario_funcionario
where numer_agencia = Agencia_idAgencia; 
end//

create trigger UpdateSalarioMontanteAfterUpdate after update on Funcionario
for each row
begin
	update AGencia set salario_montante_total = salario_montante_total - old.salario_funcionario;
	update Agencia set salario_montante_total = salario_montante_total + new.salario_funcionario
where numer_agencia = Agencia_idAgencia; 
end//

create trigger UpdateSalarioMontanteAfterDelete after delete on Funcionario
for each row
begin
	update Agencia set salario_montante_total = salario_montante_total - old.salario_funcionario
where numer_agencia = Agencia_idAgencia; 
end//