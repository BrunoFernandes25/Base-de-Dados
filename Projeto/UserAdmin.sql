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