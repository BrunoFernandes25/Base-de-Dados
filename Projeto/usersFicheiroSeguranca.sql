-- USERESTAFETA -------------------------------------------------------

-- tabela com todas as entregas a realizar pelo estafeta com Id 31
SELECT cliente.NumeroContribuinte, Cliente.Telefone, endereco.Distrito,endereco.Localidade,endereco.Rua,endereco.CodigoPostal, ValorFaturacao
FROM Cliente
INNER JOIN endereco ON endereco.EnderecoId = Cliente.IdEndereco
INNER JOIN pedido ON pedido.IdCliente = Cliente.NUmeroContribuinte
INNER JOIN estafeta ON estafeta.Id = Pedido.IdEstafeta
WHERE Estafeta.Id = 31;

-- Tabela de todos os pedidos
SELECT * FROM pedido;


-- USERADMIN -------------------------------------------------------
-- Ver tabela de clientes
SELECT * FROM cliente;

-- Inserção de cliente na tabela cliente
INSERT INTO Cliente (NumeroContribuinte, Nome, DataNascimento, Telefone, Email, NumeroSNS, IdEndereco) VALUES
	(102030409,'Zeze Titi','1988-10-20',914914914,NULL,900090009,2);

-- Remoção de cliente criado da tabela cliente   
DELETE FROM Cliente WHERE NumeroContribuinte = 102030409; 

-- Ver tabela de clientes
SELECT * FROM Pedido;

-- Criação de pedido na tabela Pedido
INSERT INTO Pedido (Id, CustoEntrega, ValorFaturacao, Urgente, DataPedido, DataEntrega, IdAdministrador, IdCliente, IdEstafeta) VALUES
	(10, 5.0, 15.00, 0, '2023-01-08 15:31', '2023-01-9 10:30', 21, 251998161, 31);

-- eliminação de pedido na tabela Pedido
DELETE FROM Pedido WHERE Id = 10; 




-- USERS -------------------------------------------------------

-- Administrativos
CREATE USER 'Admin1'@'localhost'
IDENTIFIED BY '1234';

CREATE USER 'Admin2'@'localhost'
IDENTIFIED BY '2222';

CREATE USER 'Admin3'@'localhost'
IDENTIFIED BY '333';

CREATE USER 'Admin4'@'localhost'
IDENTIFIED BY '4444';

-- Gestores
CREATE USER 'Gestor1'@'localhost'
IDENTIFIED BY '1212';

CREATE USER 'Gestor2'@'localhost'
IDENTIFIED BY '1313';

CREATE USER 'Gestor3'@'localhost'
IDENTIFIED BY '1414';

CREATE USER 'Gestor4'@'localhost'
IDENTIFIED BY '1515';

-- Estafetas
CREATE USER 'Estafeta1'@'localhost'
IDENTIFIED BY '1010';

CREATE USER 'Estafeta2'@'localhost'
IDENTIFIED BY '2020';

CREATE USER 'Estafeta3'@'localhost'
IDENTIFIED BY '3030';

CREATE USER 'Estafeta4'@'localhost'
IDENTIFIED BY '4040';

CREATE USER 'Estafeta5'@'localhost'
IDENTIFIED BY '5050';

CREATE USER 'Estafeta6'@'localhost'
IDENTIFIED BY '6060';

CREATE USER 'Estafeta7'@'localhost'
IDENTIFIED BY '7070';

CREATE USER 'Estafeta8'@'localhost'
IDENTIFIED BY '8080';

-- Ver quais users tem acesso à BD
SELECT *
FROM mysql.user;
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------


-- PRIVILEGIOS ADMINISTRADORES
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
GRANT ALL PRIVILEGES
ON mydb.cliente
TO 'Admin1'@'localhost';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES
ON mydb.pedido
TO 'Admin1'@'localhost';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES
ON mydb.cliente
TO 'Admin2'@'localhost';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES
ON mydb.pedido
TO 'Admin2'@'localhost';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES
ON mydb.cliente
TO 'Admin3'@'localhost';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES
ON mydb.pedido
TO 'Admin3'@'localhost';
FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES
ON mydb.cliente
TO 'Admin4'@'localhost';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES
ON mydb.pedido
TO 'Admin4'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'Admin4'@'localhost';


-- PRIVILEGIOS ESTAFETAS
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
GRANT SELECT 
ON mydb.pedido
TO 'Estafeta1'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta1'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta1'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta1'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT 
ON mydb.pedido
TO 'Estafeta2'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta2'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta2'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta2'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT 
ON mydb.pedido
TO 'Estafeta3'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta3'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta3'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta3'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT 
ON mydb.pedido
TO 'Estafeta4'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta4'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta4'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta4'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT 
ON mydb.pedido
TO 'Estafeta5'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta5'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta5'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta5'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT 
ON mydb.pedido
TO 'Estafeta6'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta6'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta6'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta6'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT 
ON mydb.pedido
TO 'Estafeta7'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta7'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta7'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta7'@'localhost';
FLUSH PRIVILEGES;

GRANT SELECT 
ON mydb.pedido
TO 'Estafeta8'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (NumeroContribuinte,IdEndereco,Telefone)
ON mydb.cliente
TO 'Estafeta8'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (EnderecoId,Distrito,Localidade,Rua,CodigoPostal)
ON mydb.endereco
TO 'Estafeta8'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT (Id)
ON mydb.estafeta
TO 'Estafeta8'@'localhost';
FLUSH PRIVILEGES;

SHOW GRANTS FOR 'Estafeta5'@'localhost';
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
