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
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `idEmpresa` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NULL,
  `rua` VARCHAR(255) NOT NULL,
  `localidade` VARCHAR(255) NOT NULL,
  `cod_postal` VARCHAR(45) NOT NULL,
  `idRamo` INT NOT NULL,
  `ramo` VARCHAR(45) NOT NULL,
  `gerente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contacto` (
  `idEmpresa` INT NOT NULL,
  `tipo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`tipo`, `idEmpresa`),
  CONSTRAINT `cont_fk01`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `data_n` DATE NULL,
  `funcao` VARCHAR(255) NOT NULL,
  `idEmpresa` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  INDEX `func_fk01_idx` (`idEmpresa` ASC) VISIBLE,
  CONSTRAINT `func_fk01`
    FOREIGN KEY (`idEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `designacao` VARCHAR(45) NOT NULL,
  `Un` INT NOT NULL,
  `Preco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Local`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Local` (
  `idLocal` INT NOT NULL,
  `area` INT NOT NULL,
  `taxa` DECIMAL(4,3) NOT NULL,
  PRIMARY KEY (`idLocal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idLocal` INT NOT NULL,
  `Empresa_idEmpresa` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `cod_Venda` INT NOT NULL,
  `qtd` INT NOT NULL,
  `preco` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `taxa` DECIMAL(5,2) NOT NULL,
  `data` DATE NOT NULL,
  INDEX `fk_Vendas_Mes_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Vendas_Mes_Empresa1_idx` (`Empresa_idEmpresa` ASC) VISIBLE,
  PRIMARY KEY (`cod_Venda`),
  CONSTRAINT `vendas_fk01`
    FOREIGN KEY (`idLocal`)
    REFERENCES `mydb`.`Local` (`idLocal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Mes_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Mes_Empresa1`
    FOREIGN KEY (`Empresa_idEmpresa`)
    REFERENCES `mydb`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
