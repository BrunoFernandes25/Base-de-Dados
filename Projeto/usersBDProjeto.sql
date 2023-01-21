-- USERS
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------

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
