USE mydb;

INSERT INTO Medicamento (Id, Designacao, Custo, Descricao) VALUES
	(1, 'Brufen', 8.40, '600mg, anti-inflamatório não esteroide'),
	(2, 'Ben-u-ron', 2.71, '500mg, analgésico e antipirético'),
	(3, 'Caladryl', 14.90, '150ml'),
	(4, 'Aerius', 4.99, 'Anti-histamínico tricíclico'),
	(5, 'Bephantene', 12.85, '50g'),
	(6, 'Strepsils', 9.80, 'Pastilhas antiinflamatórias de ação específica na garganta'),
	(7, 'Griponal', 9.95, 'Alívio rápido de sintomas das gripes e constipações como dores e febre'),
	(8, 'Vicks Vaporub', 10.50, 'Pomada para o tratamento de constipações e gripes'),
	(9, 'Betaserc', 6.63, 'Fármaco antivertiginoso'),
	(10, 'Aspirina', 5.95, 'É utilizado para tratar dores de cabeça'),
	(11, 'Victan', 5.04, 'Medicamentos Sistema nervoso central');
-- SELECT * FROM Medicamento;

INSERT INTO Gestor (Id, Nome, Email, Distrito) VALUES
	(11, 'José Vilhena', 'jv@farmacia.com', 'Braga'),
	(12, 'Maria Costa', 'mc@farmacia.com', 'Porto'),
	(13, 'Joaquim Mirante', 'jm@farmacia.com', 'Viana do Castelo'),
	(14, 'Rita Balado', 'rb@farmacia.com', 'Aveiro');
-- SELECT * FROM Gestor;

INSERT INTO Administrador (Id, Nome, Email, Distrito) VALUES
	(21,'Alberto Oliveira', 'ao@farmacia.com', 'Braga'),
	(22,'Bruna Guimarães', 'bg@farmacia.com', 'Braga'),
	(23,'Lucia Enriques', 'le@farmacia.com', 'Porto'),
	(24,'Artur Silva', 'as@farmacia.com', 'Porto'),
	(25,'Rodrigo Salvador', 'rs@farmacia.com', 'Aveiro'),
	(26,'Carla Nogueira', 'cn@farmacia.com', 'Aveiro'),
	(27,'Nuno Martins', 'nm@farmacia.com', 'Viana do Castelo'),
	(28,'Maria Martins', 'mm@farmacia.com', 'Viana do Castelo');
-- SELECT * FROM Administrador;

INSERT INTO Endereco (EnderecoId, Distrito, Localidade, Rua, CodigoPostal) VALUES
	(1, 'Braga', 'Amares', 'Rua da Bela Vista nº 12' , '4720-001'),
	(2, 'Braga', 'Brito', 'Rua dos Oito Moinhos nº 134', '4805-630'),
	(3, 'Braga', 'Braga', 'Rua do Paço nº 346', '4715-439'),
	(4, 'Braga', 'Barco', 'Rua de São Martinho nº 87', '4809-005'),
	(5, 'Braga', 'Guardizela', 'Rua da Granja nº 859', '4765-410'),
	(6, 'Porto', 'São Félix Da Marinha', 'Rua Parque Gondarim nº 243', '4410-148'),
	(7, 'Porto', 'Vila Chã', 'Rua Patrão Caramelho nº 276', '4485-861'),
	(8, 'Porto', 'Rio Tinto', 'Rua Pádua Correia nº 765', '4435-011'),
	(9, 'Porto', 'Maia', 'Rua Oliveirinhas nº 52', '4425-687'),
	(10, 'Porto', 'Porto', 'Rua Comércio Porto nº 45', '4150-200'),
	(11, 'Aveiro', 'Mealhada', 'Rua do Jardim nº 877', '3054-001'),
	(12, 'Aveiro', 'Ovar', 'Rua Alexandre Herculano nº 634', '3884-005'),
	(13, 'Aveiro', 'Cabeço', 'Rua Tenente Coronel Afonso Lucas nº 24', '3800-531'),
	(14, 'Aveiro', 'Espinho', 'Rua Sales de Cima Anta nº 11', '4500-009'),
	(15, 'Aveiro', 'Águeda', 'Rua Fernando Caldeira nº 97', '3754-501'),
	(16, 'Viana do Castelo','Arão', 'Caminho de Alvarães nº 463', '4930-003'),
	(17, 'Viana do Castelo', 'Vila Nova de Anha', 'Avenida de Viana do Castelo nº 33' , '4935-415'),
	(18, 'Viana do Castelo', 'Viana do Castelo', 'Rua Santiago da Barra nº 444', '4904-882'),
	(19, 'Viana do Castelo', 'Afife', 'Caminho do Pião nº 788', '4900-101'),
	(20, 'Viana do Castelo', 'Caminha', 'Avenida Padre Pinheiro nº 999', '4910-106');
-- SELECT * FROM Endereco;

INSERT INTO Estafeta (Id, Nome, Email, Distrito, MatriculaVeiculo) VALUES
	(31, 'Fernando Albino', 'fa@farmacia.com', 'Braga', '23-34-AR'),
	(32, 'Henrique Finorio', 'hf@farmacia.com', 'Braga', '37-TU-56'),
	(33, 'Almirante Melo', 'am@farmacia.com', 'Braga', '92-33-VR'),
	(34, 'Alenquer Guerreiro', 'ag@farmacia.com', 'Braga', '55-34-GF'),
	(35, 'Fernanda Taveira', 'ft@farmacia.com', 'Braga', '74-AB-37'),
	(36, 'João Matos', 'jm@farmacia.com', 'Braga', 'HM-77-11'),
	(37, 'Martim Janota', 'mj@farmacia.com', 'Braga', '00-12-MJ'),
	(38, 'Ribeiro Mendes', 'rm@farmacia.com', 'Porto', '87-22-OL'),
	(39, 'Kevin Rendeiro', 'kr@farmacia.com', 'Porto', '69-JN-26'),
	(40, 'Yousuf Nabila', 'yn@farmacia.com', 'Porto', 'MJ-57-49'),
	(41, 'Guilherme Dias', 'gd@farmacia.com', 'Porto', '78-LJ-25'),
	(42, 'Diogo Bilhar', 'db@farmacia.com', 'Porto', '26-89-GI'),
	(43, 'Passos Dias', 'pd@farmacia.com', 'Porto', 'GI-26-18'),
	(44, 'Aguiar Mota', 'am@farmacia.com', 'Porto', 'FO-26-18'),
	(45, 'João Costa', 'jc@farmacia.com', 'Aveiro', '12-42-FR'),
	(46, 'Mario Machado', 'mm@farmacia.com', 'Aveiro', '76-TH-51'),
	(47, 'Pedro Silva', 'ps@farmacia.com', 'Aveiro', '32-23-HG'),
	(48, 'António Mota', 'am@farmacia.com', 'Aveiro', '43-94-MF'),
	(49, 'Joana Sousa', 'js@farmacia.com', 'Aveiro', '54-AC-67'),
	(50, 'Rui Matos', 'rm@farmacia.com', 'Aveiro', '90-FF-11'),
	(51, 'Carlos Lisboa', 'cl@farmacia.com', 'Aveiro', '32-GH-26'),
	(52, 'Paulo Campos', 'pc@farmacia.com', 'Viana do Castelo', '51-PA-56'),
	(53, 'Mariana Lima', 'ml@farmacia.com', 'Viana do Castelo', 'AJ-53-41'),
	(54, 'Miguel Mendes', 'mm@farmacia.com', 'Viana do Castelo', '23-MJ-19'),
	(55, 'Rúben Andrade', 'ra@farmacia.com', 'Viana do Castelo', '14-91-PU'),
	(56, 'Alice Brito', 'ab@farmacia.com', 'Viana do Castelo', 'AT-51-79'),
	(57, 'Carlos Melo', 'cm@farmacia.com', 'Viana do Castelo', '81-SS-58'),
	(58, 'Sílvia Freitas', 'sf@farmacia.com', 'Viana do Castelo', '71-34-58');
-- SELECT * FROM Estafeta;

INSERT INTO Cliente (NumeroContribuinte, Nome, DataNascimento, Telefone, Email, NumeroSNS, IdEndereco) VALUES
	(251998161,'Maria Augusta','1969-12-05',964856174,NULL,111111111,2),
	(257787161,'João Moura','1980-12-15',912415230,'johnmoura22@gmail.com',222222222,3),
	(185449529,'Maria Manuela','2000-12-26',925155432,'manuelamaria1989@gmail.com',333333333,4),
	(239981691,'Luiz Miguel Almeida','1988-10-13',931948912,'lmalmeida@gmail.com',444444444,5),
	(244948120,'Daniela Santos','2022-11-15',934840000,'danny_danny222@gmail.com',555555555,7),
	(251098561,'Diego da Cunha','1988-09-07',944448595,'DieguinhoCunha@gmail.com',666666666,8),
	(221578164,'Emanuel Vieira','1975-08-08',930001114,'EmanuelVSilva@gmail.com',777777777,9),
	(185198162,'Alice Moreira','1976-02-14',966666667,'alimoreira123@gmail.com',888888888,10),
	(191098178,'Rafael Gomes','1988-01-01',984848484,'rafinha449@gmail.com',999999999,12),
	(874442799,'Antonio Saraiva','1975-03-11',958454874,'tonioS@gmail.com',121212121,13),
	(305672973,'Albino José Costa','2022-05-24',934748947,'binojosé543@gmail.com',131313131,15),
	(747026991,'Silvio Freitas','1988-06-27',961978912,'silv44@gmail.com',141414141,16),
	(443036645,'Ricardo da Silva','1988-05-05',911947350,NULL,151515151,18),
	(904484256,'Sara Daniela','1984-11-20',961486312,'saritaa20@gmail.com',161616161,19),
	(512444984,'Tania Silvéria','1983-10-10',919756910,NULL,171717171,20);
-- SELECT * FROM Cliente;

INSERT INTO ReceitaMedica (Id, Medico, IdCliente, IdMedicamento) VALUES
	(50, 'Pedro Manuel Silva', 251998161, 1),
	(51, 'Antonio Gaspar', 257787161, 1),
	(52, 'Ana Maria Silveira', 185449529, 7),
	(53, 'Rita Antunes', 239981691, 7),
	(54, 'Francisca Carvalho Lima', 244948120, 9),
	(55, 'Manuel Augusto dos Santos Cruz', 251098561, 9),
	(56, 'Rogério Macedo de Oliveira', 221578164, 1),
	(57, 'Maria Eduarda Ramos ', 185198162, 7),
	(58, 'Isaac Farias', 191098178, 9);
-- SELECT * FROM ReceitaMedica;

INSERT INTO Farmacia (Id, Nome, Telefone, Email, Horario, IdGestor, IdEndereco) VALUES
	(1, 'Farmácia Monteiro', 253123123, 'fm@farmacia.com', 'De segunda a sabado: 7h-23h; Domingos e feriados: 7h-20h', 11, 1),
	(2, 'Farmácia Sao Jõao', 250124568, 'fsj@farmacia.com', 'De segunda a sabado: 7h-22h; Domingos e feriados: 24h', 13, 6),
	(3, 'Farmácia Nova', 240231567, 'fn@farmacia.com', 'De segunda a sabado: 24h; Domingos e feriados: 7h-13h', 12, 11),
	(4, 'Farmácia Popular', 246852852, 'fp@farmacia.com', 'De segunda a sabado: 8h-24h; Domingos e feriados: 8h-14h', 14, 17);
-- SELECT * FROM Farmacia;

INSERT INTO Pedido (Id, CustoEntrega, ValorFaturacao, Urgente, DataPedido, DataEntrega, IdAdministrador, IdCliente, IdEstafeta) VALUES
	(1, 3.0, 11.90, 0, '2023-01-05 15:31', '2023-01-06 10:17', 21, 251998161, 31),
	(2, 7.0, 15.16, 1, '2023-01-15 12:07', '2023-01-15 12:40', 25, 191098178, 45),
	(3, 3.0, 23.78, 0, '2022-12-10 10:10', '2022-12-11 9:35', 27, 747026991, 52),
	(4, 3.0, 13.55, 0, '2023-01-09 20:11', '2023-01-11 9:15', 23, 244948120, 38),
	(5, 7.0, 23.03, 1, '2022-12-19 12:24', '2022-12-19 17:35', 22, 185449529, 32),
	(6, 3.0, 76.73, 0, '2022-12-22 17:55', '2022-12-24 12:43', 24, 251098561, 39),
	(7, 3.0, 13.39, 0, '2022-12-23 9:50', '2022-12-24 10:50', 28, 443036645, 53),
	(8, 7.0, 13.31, 1, '2022-12-26 18:10', NULL, 26, 874442799, 46),
	(9, 3.0, 15.32, 0, '2022-12-28 15:17', '2022-12-31 13:30', 21, 251998161, 31);
-- SELECT * FROM Pedido;

INSERT INTO Pedido_inclui_Medicamento (IdPedido, IdMedicamento, Quantidade, Custo, IVA, Preco) VALUES
	(1, 1, 1, 8.40, 6, 8.90),
	(2, 2, 1, 2.71, 6, 2.87),
	(2, 3, 1, 4.99, 6, 5.29),
	(3, 6, 2, 9.80, 6, 20.78),
	(4, 7, 1, 9.95, 6, 10.55),
	(5, 11, 3, 5.04, 6, 16.03),
	(6, 7, 1, 9.95, 6, 10.55),
	(6, 3, 4, 14.90, 6, 63.18),
	(6, 6, 1, 9.80, 6, 10.39),
	(6, 10, 1, 5.95, 6, 6.31),
	(6, 4, 1, 4.99, 6, 5.29),
	(6, 9, 1, 6.63, 6, 7.03);
-- SELECT * FROM Pedido_inclui_Medicamento;

INSERT INTO Farmacia_fornece_Medicamento (Farmacia_Id, Medicamento_Id) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(1, 6),
	(1, 7),
	(1, 9),
	(1, 11),
	(2, 1),
	(2, 3),
	(2, 5),
	(2, 7),
	(2, 8),
	(2, 9),
	(2, 10),
	(3, 2),
	(3, 3),
	(3, 6),
	(3, 7),
	(3, 10),
	(3, 11),
	(4, 1),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 6),
	(4, 7),
	(4, 8),
	(4, 11);
-- SELECT * FROM Farmacia_fornece_Medicamento;