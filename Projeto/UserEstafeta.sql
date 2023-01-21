-- tabela com todas as entregas a realizar pelo estafeta com Id 31
SELECT cliente.NumeroContribuinte, Cliente.Telefone, endereco.Distrito,endereco.Localidade,endereco.Rua,endereco.CodigoPostal, ValorFaturacao
FROM Cliente
INNER JOIN endereco ON endereco.EnderecoId = Cliente.IdEndereco
INNER JOIN pedido ON pedido.IdCliente = Cliente.NUmeroContribuinte
INNER JOIN estafeta ON estafeta.Id = Pedido.IdEstafeta
WHERE Estafeta.Id = 31;

-- Tabela de todos os pedidos
SELECT * FROM pedido;