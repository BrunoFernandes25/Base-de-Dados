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
CREATE SCHEMA IF NOT EXISTS `mydb3` DEFAULT CHARACTER SET utf8 ;
USE `mydb3` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`Cliente` (
  `Numero` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Datanascimento` DATE NULL,
  `Profissao` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `CodPostal` VARCHAR(45) NOT NULL,
  `Contrinuinte` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `RecomendadoPor` INT NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Cliente_Cliente_idx` (`RecomendadoPor` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Cliente`
    FOREIGN KEY (`RecomendadoPor`)
    REFERENCES `mydb3`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dourado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`Dourado` (
  `Cliente` INT NOT NULL,
  `Plafond` DECIMAL(8,2) NOT NULL,
  `Desconto` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`Cliente`),
  INDEX `fk_Dourado_Cliente1_idx` (`Cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Dourado_Cliente1`
    FOREIGN KEY (`Cliente`)
    REFERENCES `mydb3`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`Venda` (
  `Numero` INT NOT NULL,
  `Data` DATETIME NULL,
  `Estado` CHAR(1) NULL,
  `Total` DECIMAL(8,2) NULL,
  `Cliente_Numero` INT NOT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_Numero`)
    REFERENCES `mydb3`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clientetelefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`Clientetelefones` (
  `telefone` VARCHAR(45) NOT NULL,
  `Cliente_Numero` INT NOT NULL,
  PRIMARY KEY (`telefone`, `Cliente_Numero`),
  INDEX `fk_Clientetelefones_Cliente1_idx` (`Cliente_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_Clientetelefones_Cliente1`
    FOREIGN KEY (`Cliente_Numero`)
    REFERENCES `mydb3`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ClienteCupoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`ClienteCupoes` (
  `NRCupao` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Desconto` DECIMAL(6,2) NOT NULL,
  `Cliente_Numero` INT NOT NULL,
  PRIMARY KEY (`NRCupao`, `Cliente_Numero`),
  INDEX `fk_ClienteCupoes_Cliente1_idx` (`Cliente_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_ClienteCupoes_Cliente1`
    FOREIGN KEY (`Cliente_Numero`)
    REFERENCES `mydb3`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`Produto` (
  `Numero` INT NOT NULL,
  `Designacao` VARCHAR(45) NOT NULL,
  `Unidade` VARCHAR(45) NOT NULL,
  `Preco` VARCHAR(45) NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda_has_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb3`.`Venda_has_Produto` (
  `Venda_Numero` INT NOT NULL,
  `Produto_Numero` INT NOT NULL,
  `Quantidade` DECIMAL(5,2) NOT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  `Valor` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`Venda_Numero`, `Produto_Numero`),
  INDEX `fk_Venda_has_Produto_Produto1_idx` (`Produto_Numero` ASC) VISIBLE,
  INDEX `fk_Venda_has_Produto_Venda1_idx` (`Venda_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_has_Produto_Venda1`
    FOREIGN KEY (`Venda_Numero`)
    REFERENCES `mydb3`.`Venda` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_has_Produto_Produto1`
    FOREIGN KEY (`Produto_Numero`)
    REFERENCES `mydb3`.`Produto` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;