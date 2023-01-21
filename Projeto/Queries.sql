USE mydb;

-- Query que mostra os dados de uma farmácia
SELECT Nome, Telefone, Horario, Designacao, Custo FROM Farmacia
	JOIN Farmacia_fornece_Medicamento ON Farmacia_Id = Farmacia.Id
	JOIN Medicamento ON Medicamento.Id = Medicamento_Id;

-- Query que lista todos os funcionários e o distrito em que trabalham
SELECT Nome, Distrito FROM Administrador
	UNION
	SELECT Nome, Distrito FROM Gestor
	UNION
	SELECT Nome, Distrito FROM Estafeta;

-- Query que mostra as compras de maior valor de faturação
SELECT ValorFaturacao, Nome FROM
	Pedido JOIN Cliente ON IdCliente = NumeroContribuinte
	ORDER BY ValorFaturacao DESC

-- Procedimento que lista os clientes com mais pedidos
DELIMITER $$
CREATE PROCEDURE TopClientes()
BEGIN
	SELECT P.IdCliente, C.Nome, COUNT(P.IdCliente) AS `total_compras`
		FROM Pedido AS P INNER JOIN Cliente AS C
			ON P.IdCliente=C.NumeroContribuinte
		GROUP BY IdCliente
		ORDER BY `total_compras` DESC
		LIMIT 5;
END $$

DROP PROCEDURE TopClientes;
CALL TopClientes;

-- Procedimento que lista os estafetas com mais entregas
DELIMITER $$
CREATE PROCEDURE TopEstafetas()
BEGIN
	SELECT P.IdEstafeta, E.Nome, COUNT(P.IdEstafeta) AS `total_entregas`
		FROM Pedido AS P INNER JOIN Estafeta AS E
			ON P.IdEstafeta=E.Id
		WHERE P.DataEntrega BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW()
		GROUP BY IdEstafeta
		ORDER BY `total_entregas` DESC;
END $$

DROP PROCEDURE TopEstafetas;
CALL TopEstafetas;

-- Procedimento para atualizar o preço dos medicamentos
DELIMITER $$
CREATE PROCEDURE AtualizaPrecoMedicamento
    (NovoPreco DECIMAL(5,2), MedId INT)
BEGIN
    UPDATE Medicamento SET Custo = NovoPreco WHERE Id = MedId;
END $$

DROP PROCEDURE AtualizaPrecoMedicamento;
CALL AtualizaPrecoMedicamento(9.60,1);´
SELECT * FROM Medicamento;

-- Procedimento que lista os pedidos que ainda não foram entregues num certo distrito
DELIMITER $$
CREATE PROCEDURE PedidosNaoEntregues
	(Dist VARCHAR(45))
BEGIN
	SELECT Cliente.Nome, Endereco.Localidade, Endereco.CodigoPostal, Endereco.Rua, Pedido.Id AS `Id do Pedido` FROM
		Pedido INNER JOIN Cliente ON Cliente.NumeroContribuinte = Pedido.IdCliente
        INNER JOIN Endereco ON Cliente.IdEndereco = Endereco.EnderecoId
        WHERE Pedido.DataEntrega IS NULL AND Endereco.Distrito = Dist;
END $$

DROP PROCEDURE PedidosNaoEntregues;
CALL PedidosNaoEntregues('Aveiro');

-- Procedimento que mostra o total de pedidos por cada distrito
DELIMITER $$
CREATE PROCEDURE TotalPedidos()
BEGIN
	SELECT Endereco.Distrito, COUNT(Pedido.Id) AS `Número de Encomendas` FROM
		Pedido INNER JOIN Cliente ON Cliente.NumeroContribuinte = Pedido.IdCliente
		INNER JOIN Endereco ON Cliente.IdEndereco = Endereco.EnderecoId
		GROUP BY Endereco.Distrito
        ORDER BY `Número de Encomendas` DESC;
END $$

DROP PROCEDURE TotalPedidos;
CALL TotalPedidos;

-- Função que, dado um pedido, mostra o número de telefone do cliente que o realizou
DELIMITER $$
CREATE FUNCTION TelefoneCliente
    (IdPed INT)
    RETURNS INT
    DETERMINISTIC
BEGIN
	DECLARE telefoneCliente INT;
	SELECT Cliente.Telefone INTO telefoneCliente FROM
		Pedido INNER JOIN Cliente ON Pedido.IdCliente = Cliente.NumeroContribuinte
        WHERE Pedido.Id = IdPed;
	RETURN telefoneCliente;
END $$

DROP FUNCTION TelefoneCliente;
SELECT TelefoneCliente(5);

-- Índice
CREATE INDEX email ON Estafeta (Email);

SHOW INDEX FROM Estafeta;

SELECT Email FROM Estafeta;

DROP INDEX email ON Estafeta;

-- Vista que lista todos os funcionários da empresa
CREATE VIEW Funcionarios 
AS
	SELECT * FROM
		(
		SELECT Id, Nome, Email, Distrito, 'Gestor' AS 'Função' FROM Gestor
        UNION
        SELECT Id, Nome, Email, Distrito, 'Administrador' AS 'Função' FROM Administrador
        UNION
        SELECT Id, Nome, Email, Distrito, 'Estafeta' AS 'Função' FROM Estafeta
        ORDER BY Função DESC, Distrito
        ) AS f;

DROP VIEW Funcionarios;
SELECT * FROM Funcionarios;