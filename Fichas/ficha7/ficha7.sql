-- Povoamento da tabela "Cliente"
CREATE DATABASE `mydb3`;
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
--
-- Esquema: "Ficha 7"
CREATE SCHEMA IF NOT EXISTS `mydb3` DEFAULT CHARACTER SET utf8 ;
USE `mydb3` ;

--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';



-- -----------------------------------------------------
-- Table `mydb3`.`Cliente`
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
  `RecomendadoPor` INT NULL,
  PRIMARY KEY (`Numero`),
  INDEX `fk_Cliente_Cliente_idx` (`RecomendadoPor` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Cliente`
    FOREIGN KEY (`RecomendadoPor`)
    REFERENCES `mydb3`.`Cliente` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb3`.`Dourado`
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
  `Data` DATETIME NOT NULL,
  `Estado` CHAR(1) NOT NULL,
  `Total` DECIMAL(8,2) NOT NULL,
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

--
-- Povoamento da tabela "ClienteTelefones"
INSERT INTO Clientetelefones
	(Cliente_Numero, telefone)
	VALUES 
		(1,  '678 546 234'),
		(2,  '142 356 429'),
		(3,  '998 765 420'),
		(4,  '675 008 976'),
		(4,  '776 879 332'),
		(5,  '465 423 890'),
		(6,  '866 543 420'),
		(6,  '654 545 218')
	;

--
-- Povoamento da tabela "ClienteCupoes"
INSERT INTO ClienteCupoes
	(Cliente_Numero, NrCupao, Tipo, Desconto)
	VALUES 
		(1, 1,'Normal'  , 0.10),
		(1, 2,'Superior', 0.20),
		(1, 3,'Extra'   , 0.10),
		(2, 1,'Normal'  , 0.10),
		(4, 1,'Normal'  , 0.10),
		(6, 1,'Normal'  , 0.10),
		(7, 1,'Extra'   , 0.10)
	;

--
-- Povoamento da tabela "Dourado"
INSERT INTO Dourado
	(Cliente, Plafond, Desconto)
	VALUES 
		(1, 100.00, 0.10),
		(7,  50.00, 0.15)
	;

--
-- Povoamento da tabela "Produto"
INSERT INTO Produto
	(Numero, Designacao, Unidade, Preco, Tipo)
	VALUES 
		(1,  'Arroz Belo Campo', 		'Un', 1.00, 'Cereais'),
		(2,  'Leite Pasto Sagrado', 	'Lt', 0.60, 'Lacticínios'),
		(3,  'Yogurt Ar do Brejo', 		'Un', 0.25, 'Lacticínios'),
		(4,  'Massa Pão de Anjo', 		'Kg', 0.75, 'Massas'),
		(5,  'Azeite da Magnífica', 	'Lt', 3.70, 'Óleos'),
		(6,  'Pão de Centeio do Prado',	'Un', 0.15, 'Padaria'),
		(7,  'Água Rochas Doces', 		'Lt', 0.50, 'Águas'),
		(8,  'Mortadela da Luz', 		'Kg', 4.20, 'Charcutaria'),
		(9,  'Bife Corte Real Embalado','Kg', 8.50, 'Carne'),
		(10, 'Pescada do Ártico', 		'Kg', 4.30, 'Peixe'),
		(11, 'Salmão Fumado Rio ALto', 	'Kg', 6.45, 'Peixe'),
		(12, 'Chocolate Cacau Real',	'Un', 1.75, 'Doces')
	;

--
-- Povoamento da tabela "Venda"
INSERT INTO Venda
	(Numero, Data, Estado, Total, Cliente_Numero)
	VALUES 
		(1,  '2017/10/05', 'S',  61.00, 1),
		(2,  '2017/10/05', 'S',  44.40, 2),
		(3,  '2017/10/07', 'S',  52.50, 3),
		(4,  '2017/10/08', 'S',  38.70, 1),
		(5,  '2017/10/08', 'N',  52.00, 5)
	;

--
-- Povoamento da tabela "VendaProduto"
INSERT INTO Venda_Has_Produto
	(Venda_Numero, Produto_Numero, Quantidade, Preco, Valor)
	VALUES 
		(1, 1, 10.00, 1.00, 10.00),
		(1, 2, 10.00, 0.60,  6.00),
		(1, 9,  5.00, 8.50, 42.50),
		(1, 7,  5.00, 0.50,  2.50),
		(2, 5, 12.00, 3.70, 44.40),
		(3, 1, 13.00, 1.00, 10.00),
		(3, 9,  5.00, 8.50, 42.50),
		(4, 11, 6.00, 6.45, 38.70),
		(5, 4, 20.00, 0.75, 15.00),
		(5, 5, 10.00, 3.70, 37.00)
	;
    

INSERT INTO Cliente 
	(Numero,Nome,Datanascimento,profissao,Rua,Localidade,CodPostal,Contrinuinte,email,RecomendadoPor)
    VALUES
    	(1, 'João da Costa e Campos', 	'1983/12/31',	'Taberneiro', 'Rua das Adegas Felizes, 12, 1ª Cave', 'Aguada do Queixo', 
			'9999-99-99 Queijadas', 	123456789, 'jcc@acacia.pt', 3),		-- nao deveria ser possivel ser recomendado por um cliente que nem sequer existe mas vamos ignorar isto
		(2, 'Josefina Vivida da Paz', 	'1965/10/03',	'Hospedeira', 'Av dos Castros Reais, 122, 3º', 'Friso do Eixo', 
			'7799-77-77 Friso do Eixo', 122133144, 'josefina@acacia.pt',NULL),
		(3, 'Ana Santa do Carmo', 		'1990/08/12',	'Professora', 'Travessa do Jacob, 21', 'Abre o Tacho', 
			'4534-54-21 Vale do Tacho', 876543298, 'saca@acacia.pt', NULL),
		(4, 'Jesualdo Peza-Mor', 		'1978/11/30',	'Carpinteiro', 'Estrada do Sossego, Km10', 'Vale dos Lençóis', 
			'1245-64-11 Camadas', 		564352786, 'pezamor@acacia.pt', NULL),
		(5, 'Maria da Trindade Pascoal','1982/02/05',	'Cozinheira', 'Rua das Adegas da Rua, 15, 10 Esq/T', 'Aguada do Queixo', 
			'9999-99-99 Queijadas', 	777666555, 'trindade@acacia.pt', NULL),
		(6, 'Florindo Teixo Figueirinha','1970/05/22',	'Motorista', 'Autódromo das Vagas, Garagem 123', 'Veloandro', 
			'5555-59-55 Veloandro', 	787676651, 'teixof@acacia.pt', NULL),
		(7, 'Carminho Cunha Bastos', 	'1976/01/13',	'Doméstica', 'Rua do Mus-Vitalis, 56, r/c ', 'Vitalis do Sousa', 
			'6532-A2-43 Vitalis', 		543234111, 'cbastos@acacia.pt', NULL)
	;
-- 1.
SELECT * FROM Cliente;

-- 2.
SELECT nome
FROM cliente
WHERE localidade = 'Aguada do Queixo';

-- 3.
SELECT DISTINCT profissao
FROM cliente;
-- para ver todos os clientes e as suas profissoes 
SELECT nome,profissao
FROM cliente;

-- 4.
SELECT designacao,preco
FROM produto
ORDER BY designacao ASC;

-- 5. 
SELECT Cliente.numero, Nome, sum(Total)
FROM Cliente
INNER JOIN Venda
ON Cliente.Numero = Venda.Cliente_Numero
GROUP BY Cliente.numero, Cliente.Nome
ORDER BY 3 DESC 
LIMIT 3;

-- 6.
SELECT Numero,Total
FROM venda
WHERE data = '2017/10/05';

-- 7.
SELECT designacao, sum(quantidade)
From Produto
INNER JOIN Venda_has_Produto
ON Venda_has_Produto.Produto_Numero = Produto.Numero
INNER JOIN Venda
ON Venda.Numero = Venda_has_Produto.Venda_Numero
WHERE WEEK(data) = '40'
GROUP BY designacao
ORDER BY 2 DESC;

-- 8.
SELECT DAYNAME(data),AVG(total)
FROM Venda
GROUP BY DAYNAME(data);


-- d) 1.
INSERT INTO Cliente 
	(Numero,Nome,Datanascimento,profissao,Rua,Localidade,CodPostal,Contrinuinte,email,RecomendadoPor)
    VALUES
    	(8, 'Manel', '1993/03/30',	'Tabaqueiro', 'Rua das Ganzas, 66, 1ª Cave', 'Aguada do Fumo Preto', 
			'6666-66-66 Pedradas', 	123123123, 'metemaistabaco@acacia.pt', 5);
            
SELECT * FROM Cliente;

-- 2.
 UPDATE Cliente 
 SET Rua = 'Rua das Mocas' 
 WHERE Numero = 8;
 
 -- 3.
 UPDATE Produto 
 SET preco = preco + preco*0.10;
 
 SELECT preco
 FROM Produto
 WHERE tipo= 'Peixe';
 
 -- 4.
 INSERT INTO Venda
	(Numero, Data, Estado, Total, Cliente_Numero)
	VALUES 
		(6,  '2023/01/16', 'S', 29.25, 8);

--
-- Povoamento da tabela "VendaProduto"
INSERT INTO Venda_Has_Produto
	(Venda_Numero, Produto_Numero, Quantidade, Preco, Valor)
	VALUES 
		(6, 1, 10.00, 1.00, 10.00),
		(6, 2, 10.00, 0.60,  6.00),
		(6, 3,  8.00, 0.25, 2.00),
		(6, 4,  15.00, 0.75,  11.25);
        
SELECT Venda.Numero As Venda_Num, venda_has_produto.Produto_Numero, venda_has_produto.Quantidade, venda_has_produto.Preco, venda_has_produto.Valor, Produto.designacao,Produto.Tipo
FROM Venda 
INNER JOIN venda_has_produto
On venda_has_produto.Venda_Numero = Venda.Numero
INNER JOIN Produto
On Produto.Numero = venda_has_produto.Produto_Numero
Where Venda.Numero = '6';

DELETE From Venda
WHERE Numero = '6';

DELETE From Venda_has_Produto
WHERE Venda_Numero = '6';




-- ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- --------------------    FICHA 8     ------------------------------------------------------------------------------------------------------------------------ 
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. 
SELECT Venda.Numero
FROM Venda
JOIN Cliente
ON Cliente.Numero = Venda.Cliente_Numero
WHERE (Cliente.Numero = 1 OR Cliente.Numero = 2 OR Cliente.Numero = 3) AND month(Venda.data) =2 AND year(Venda.data) = 2018;

SELECT * FROM Venda;

-- 2.
SELECT DISTINCT Cliente.Nome, produto.Designacao, SUM(venda_has_produto.Valor) AS total
FROM Produto
INNER JOIN venda_has_produto
ON venda_has_produto.Produto_Numero = Produto.Numero
INNER JOIN Venda
ON Venda.Numero = venda_has_produto.Venda_Numero
INNER JOIN Cliente
ON Cliente.Numero = venda.Cliente_Numero
WHERE Localidade = 'Aguada do Queixo' or Localidade = 'Friso do Feixo'
GROUP BY Cliente.Nome,produto.Designacao;

-- 3.
SELECT Produto.Designacao, Produto.Tipo, SUM(venda_has_produto.Quantidade) AS total
FROM Produto
INNER JOIN venda_has_produto
ON venda_has_produto.Produto_Numero = Produto.Numero
INNER JOIN venda
ON venda.Numero = venda_has_produto.Venda_Numero
WHERE week(Venda.data) = 40 AND year(Venda.data) = 2017  -- para a semana 3 de 2017 nao havia vendas nenhumas
GROUP BY Produto.Designacao, Produto.Tipo
ORDER BY 3 DESC 
LIMIT 3; 

Select week(Venda.data) From Venda;
Select year(Venda.data) From Venda;

-- 4.  Todos os produtos que existem - Os que estao vendidos nas Venda_has_Produto
SELECT produto.Numero
FROM Produto 
WHERE Produto.Numero NOT IN (
SELECT Produto.Numero
FROM Produto
INNER JOIN Venda_has_Produto
ON  Venda_has_Produto.Produto_Numero = Produto.Numero);

SELECT * FROM produto;
select * FROM venda_has_produto;
select * FROM venda;
 
 
 -- 5.    azeite nao soma nao sei porque o resdto faz tudo direito
 SELECT DISTINCT Produto.Designacao, Venda_has_Produto.Valor,sum(Venda_has_Produto.Quantidade) as Total_Vendas,sum(Venda_has_Produto.Valor) as preco_total 
 FROM Produto
INNER JOIN Venda_has_Produto 
ON Venda_has_Produto.Produto_Numero = Produto.Numero
INNER JOIN Venda
ON Venda.Numero = Venda_has_Produto.Venda_Numero
WHERE year(Venda.data) = 2017
GROUP BY  Produto.Designacao, Venda_has_Produto.Valor 
ORDER BY 3 DESC
LIMIT 6;


-- 6.
CREATE VIEW idades_Clientes AS 
SELECT Datanascimento, year(now()) - year(Datanascimento) as idade
FROM cliente;

SELECT * FROM idades_Clientes;

