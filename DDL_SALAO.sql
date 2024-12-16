-- MySQL Script generated by MySQL Workbench
-- Sat Dec 14 12:17:51 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `salario` DECIMAL(7,2) NOT NULL,
  `email` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `dataAdm` DATE NOT NULL,
  `sexo` CHAR(1) NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Agendamento` (
  `idAgendamento` INT NOT NULL AUTO_INCREMENT,
  `dataAgend` DATETIME NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idAgendamento`),
  INDEX `fk_Agendamento_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  INDEX `fk_Agendamento_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Agendamento_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `mydb`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Agendamento_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_cliente` (
  `Cliente_idCliente` INT NOT NULL,
  `numero` VARCHAR(11) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  INDEX `fk_Telefone_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `preco` DECIMAL(6,2) NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idServico`),
  INDEX `fk_Servico_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `mydb`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `cep` VARCHAR(8) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  INDEX `fk_Endereço_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Endereço_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `mydb`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`agendamentoServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`agendamentoServico` (
  `Agendamento_idAgendamento` INT NOT NULL,
  `Servico_idServico` INT NOT NULL,
  INDEX `fk_agendamentoServico_Agendamento1_idx` (`Agendamento_idAgendamento` ASC) VISIBLE,
  INDEX `fk_agendamentoServico_Servico1_idx` (`Servico_idServico` ASC) VISIBLE,
  CONSTRAINT `fk_agendamentoServico_Agendamento1`
	FOREIGN KEY (`Agendamento_idAgendamento`)
	REFERENCES `mydb`.`Agendamento` (`idAgendamento`)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
  CONSTRAINT `fk_agendamentoServico_Servico1`
	FOREIGN KEY (`Servico_idServico`)
	REFERENCES `mydb`.`Servico` (`idServico`)
	ON DELETE CASCADE
	ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendas` (
  `idVendas` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `ValorTotal` DECIMAL(6,2) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NULL,
  PRIMARY KEY (`idVendas`),
  INDEX `fk_Vendas_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Vendas_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Vendas_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Vendas_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `mydb`.`Funcionario` (`cpf`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento` (
  `idPagamento` INT NOT NULL AUTO_INCREMENT,
  `valorPago` DECIMAL(6,2) NOT NULL,
  `formaPag` VARCHAR(45) NOT NULL,
  `desconto` DECIMAL(4,2) NOT NULL,
  `Vendas_idVendas` INT NOT NULL,
  PRIMARY KEY (`idPagamento`),
  INDEX `fk_Pagamento_Vendas1_idx` (`Vendas_idVendas` ASC) VISIBLE,
  CONSTRAINT `fk_Pagamento_Vendas1`
    FOREIGN KEY (`Vendas_idVendas`)
    REFERENCES `mydb`.`Vendas` (`idVendas`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Feedback`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Feedback` (
  `idFeedback` INT NOT NULL AUTO_INCREMENT,
  `dataFeedback` DATETIME NOT NULL,
  `comentario` TEXT(200) NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idFeedback`),
  INDEX `fk_Feedback_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Feedback_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_funcionario` (
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  `numero` VARCHAR(11) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  INDEX `fk_Telefone_funcionario_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_funcionario_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `mydb`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dependentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dependentes` (
  `cpf` VARCHAR(14)NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `parentesco` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `Funcionario_cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cpf`),
  INDEX `fk_Dependentes_Funcionario1_idx` (`Funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Dependentes_Funcionario1`
    FOREIGN KEY (`Funcionario_cpf`)
    REFERENCES `mydb`.`Funcionario` (`cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroServico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroServico` (
  `idRegistroServico` INT NOT NULL AUTO_INCREMENT,
  `dataRegistro` DATETIME NOT NULL,
  `Agendamento_idAgendamento` INT NULL,
  `Vendas_idVendas` INT NOT NULL,
  `Servico_idServico` INT NOT NULL,
  PRIMARY KEY (`idRegistroServico`),
  INDEX `fk_RegistroServico_Agendamento1_idx` (`Agendamento_idAgendamento` ASC) VISIBLE,
  INDEX `fk_RegistroServico_Vendas1_idx` (`Vendas_idVendas` ASC) VISIBLE,
  INDEX `fk_RegistroServico_Servico1_idx` (`Servico_idServico` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroServico_Agendamento1`
    FOREIGN KEY (`Agendamento_idAgendamento`)
    REFERENCES `mydb`.`Agendamento` (`idAgendamento`)
    ON DELETE CASCADE
    ON UPDATE SET NULL,
  CONSTRAINT `fk_RegistroServico_Vendas1`
    FOREIGN KEY (`Vendas_idVendas`)
    REFERENCES `mydb`.`Vendas` (`idVendas`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_RegistroServico_Servico1`
    FOREIGN KEY (`Servico_idServico`)
    REFERENCES `mydb`.`Servico` (`idServico`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
