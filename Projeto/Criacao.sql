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
-- Table `mydb`.`Gestor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gestor` (
  `Id` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Distrito` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `Id` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Distrito` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estafeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estafeta` (
  `Id` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Distrito` VARCHAR(45) NOT NULL,
  `MatriculaVeiculo` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco` (
  `EnderecoId` INT NOT NULL,
  `Distrito` VARCHAR(45) NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `CodigoPostal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EnderecoId`),
  UNIQUE INDEX `EndereçoId_UNIQUE` (`EnderecoId` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `NumeroContribuinte` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `DataNascimento` VARCHAR(10) NOT NULL,
  `Telefone` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `NumeroSNS` INT NOT NULL,
  `IdEndereco` INT NOT NULL,
  UNIQUE INDEX `NumeroContribuinte_UNIQUE` (`NumeroContribuinte` ASC) VISIBLE,
  PRIMARY KEY (`NumeroContribuinte`),
  INDEX `fk_Cliente_Endereço1_idx` (`IdEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Endereço1`
    FOREIGN KEY (`IdEndereco`)
    REFERENCES `mydb`.`Endereco` (`EnderecoId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `Id` INT NOT NULL,
  `CustoEntrega` DECIMAL(5,2) NOT NULL,
  `ValorFaturacao` DECIMAL(5,2) NOT NULL,
  `Urgente` BINARY(1) NOT NULL,
  `DataPedido` DATETIME NOT NULL,
  `DataEntrega` DATETIME NULL,
  `IdAdministrador` INT NOT NULL,
  `IdCliente` INT NOT NULL,
  `IdEstafeta` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Pedido_Administrador1_idx` (`IdAdministrador` ASC) VISIBLE,
  INDEX `fk_Pedido_Cliente1_idx` (`IdCliente` ASC) VISIBLE,
  INDEX `fk_Pedido_Estafeta1_idx` (`IdEstafeta` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Administrador1`
    FOREIGN KEY (`IdAdministrador`)
    REFERENCES `mydb`.`Administrador` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `mydb`.`Cliente` (`NumeroContribuinte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Estafeta1`
    FOREIGN KEY (`IdEstafeta`)
    REFERENCES `mydb`.`Estafeta` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicamento` (
  `Id` INT NOT NULL,
  `Designacao` VARCHAR(45) NOT NULL,
  `Custo` DECIMAL(5,2) NOT NULL,
  `Descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido_inclui_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido_inclui_Medicamento` (
  `IdPedido` INT NOT NULL,
  `IdMedicamento` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Custo` DECIMAL(5,2) NOT NULL,
  `IVA` INT NOT NULL,
  `Preco` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`IdMedicamento`, `IdPedido`),
  INDEX `fk_Pedido_has_Medicamento_Medicamento1_idx` (`IdMedicamento` ASC) VISIBLE,
  INDEX `fk_Pedido_has_Medicamento_Pedido1_idx` (`IdPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_has_Medicamento_Pedido1`
    FOREIGN KEY (`IdPedido`)
    REFERENCES `mydb`.`Pedido` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Medicamento_Medicamento1`
    FOREIGN KEY (`IdMedicamento`)
    REFERENCES `mydb`.`Medicamento` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Farmacia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Farmacia` (
  `Id` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Horario` VARCHAR(200) NOT NULL,
  `IdGestor` INT NOT NULL,
  `IdEndereco` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Farmacia_Gestor1_idx` (`IdGestor` ASC) VISIBLE,
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_Farmacia_Endereço1_idx` (`IdEndereco` ASC) VISIBLE,
  CONSTRAINT `fk_Farmacia_Gestor1`
    FOREIGN KEY (`IdGestor`)
    REFERENCES `mydb`.`Gestor` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Farmacia_Endereço1`
    FOREIGN KEY (`IdEndereco`)
    REFERENCES `mydb`.`Endereco` (`EnderecoId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ReceitaMedica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ReceitaMedica` (
  `Id` INT NOT NULL,
  `Medico` VARCHAR(45) NOT NULL,
  `IdCliente` INT NOT NULL,
  `IdMedicamento` INT NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC) VISIBLE,
  INDEX `fk_ReceitaMedica_Cliente1_idx` (`IdCliente` ASC) VISIBLE,
  INDEX `fk_ReceitaMedica_Medicamento1_idx` (`IdMedicamento` ASC) VISIBLE,
  CONSTRAINT `fk_ReceitaMedica_Cliente1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `mydb`.`Cliente` (`NumeroContribuinte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ReceitaMedica_Medicamento1`
    FOREIGN KEY (`IdMedicamento`)
    REFERENCES `mydb`.`Medicamento` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Farmacia_fornece_Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Farmacia_fornece_Medicamento` (
  `Farmacia_Id` INT NOT NULL,
  `Medicamento_Id` INT NOT NULL,
  PRIMARY KEY (`Farmacia_Id`, `Medicamento_Id`),
  INDEX `fk_Farmacia_has_Medicamento_Medicamento1_idx` (`Medicamento_Id` ASC) VISIBLE,
  INDEX `fk_Farmacia_has_Medicamento_Farmacia1_idx` (`Farmacia_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Farmacia_has_Medicamento_Farmacia1`
    FOREIGN KEY (`Farmacia_Id`)
    REFERENCES `mydb`.`Farmacia` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Farmacia_has_Medicamento_Medicamento1`
    FOREIGN KEY (`Medicamento_Id`)
    REFERENCES `mydb`.`Medicamento` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;