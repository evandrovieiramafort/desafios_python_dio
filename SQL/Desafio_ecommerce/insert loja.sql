-- Inserção de dados na tabela cliente
INSERT INTO `cliente` (`cliente_id`, `nome`, `endereco`, `telefone`) VALUES
(1, 'Zé Maria', 'Rua das Flores, 123 - São Paulo/SP', '1123456789'),
(2, 'Ana Cláudia Lopes', 'Avenida Principal, 456 - Rio de Janeiro/RJ', '21987654321'),
(3, 'Brincadeira de Criança LTDA', 'Rua da Infância, 789 - Belo Horizonte/MG', '3123568454'),
(4, 'Fernão & Marelli Eireli', 'Avenida Comercial, 101 - Porto Alegre/RS', '51987653314'),
(5, 'Lojas Mais S/A', 'Rua das Oportunidades, 222 - Curitiba/PR', '41992531478'),
(6, 'Rápido Calçados LTDA', 'Avenida dos Sapatos, 333 - Fortaleza/CE', '8523457893'),
(7, 'Eugênio Dutra', 'Rua das Flores, 555 - Brasília/DF', '6128746625'),
(8, 'Marina Brandão Vargas', 'Avenida Beira-Mar, 777 - Recife/PE', '81998745487'),
(9, 'Brakestore S/A', 'Rua da Velocidade, 999 - Salvador/BA', '7126858754'),
(10, 'Albertino Gama', 'Avenida da Coragem, 888 - Manaus/AM', '9222554477');

-- Inserção de dados na tabela cliente_pj
INSERT INTO `cliente_pj` (`id`, `cliente_id`, `cnpj`, `data_abertura`)
VALUES
(1, 3, 12457896000100, '2013-01-15'),
(2, 4, 65145614000199, '2020-02-20'),
(3, 5, 28484842000133, '1990-03-10'),
(4, 6, 49824898000122, '2005-04-05'),
(5, 9, 98641645000111, '1998-05-30');

-- Inserção de dados na tabela cliente_pf
INSERT INTO `cliente_pf` (`id`, `cliente_id`, `cpf`, `data_nasc`)
VALUES
(1, 1, 01245832121, '1990-03-15'),
(2, 2, 85274196314, '1985-08-25'),
(3, 7, 75342698741, '1995-12-10'),
(4, 8, 25436985274, '1980-04-05'),
(5, 10, 45781256356, '1975-09-30');

-- Inserção de dados na tabela fornecedor
INSERT INTO `fornecedor` (`descricao`, `endereco`, `telefone`)
VALUES
('Tim Ramos', 'Rua Gedarmerie, 123 - São Paulo/SP', '1112345678'),
('Distribuidora Vivace Ltda', 'Avenida Tim Lopes, 456 - Rio de Janeiro/RJ', '2199025487'),
('Minas Fabril Ltda', 'Rua jardel Hottz, 789 - Belo Horizonte/MG', '3123568978'),
('Gustavo Almeida', 'Avenida Julio Thurler, 101 - Porto Alegre/RS', '51997852200'),
('Importadora Nacional Eireli', 'Rua Wilton Pirazzo, 222 - Curitiba/PR', '4121346587'),
('Litoral Calçados', 'Avenida Geremias Fontes, 333 - Fortaleza/CE', '8525416396'),
('Flávia Siqueira Souza', 'Rua Rua D3, 555 - Brasília/DF', '61998752154'),
('Indústria Costeira S.A.', 'Avenida Beira-Mar, 777 - Recife/PE', '8125857414'),
('Sotero Peças S.A', 'Rua Cornélio Fudge, 999 - Salvador/BA', '7124356798'),
('Manauara Jeans Eireli', 'Avenida Raul Sertã, 888 - Manaus/AM', '9221548798');

-- Populando a tabela fornecedor_pj com fornecedores pessoas jurídicas
INSERT INTO `fornecedor_pj` (`fornecedor_id`, `cnpj`)
VALUES
(2, '12345678901234'),  -- Distribuidora Vivace Ltda
(3, '98765432109876'),  -- Minas Fabril Ltda
(5, '56789012345678'),  -- Importadora Nacional Eireli
(8, '34567890123456'),  -- Indústria Costeira S.A.
(9, '67890123456789');  -- Sotero Peças S.A

-- Populando a tabela fornecedor_pf com fornecedores pessoas físicas
INSERT INTO `fornecedor_pf` (`fornecedor_id`, `cpf`)
VALUES
(1, '1112345678'),  -- Tim Ramos
(4, '51997852200'),  -- Gustavo Almeida
(6, '8525416396'),  -- Litoral Calçados
(7, '61998752154'),  -- Flávia Siqueira Souza
(10, '9221548798');  -- Manauara Jeans Eireli

-- Tabela produto
INSERT INTO `produto` (`fornecedor_id`, `nome`, `categoria`, `avaliacao`, `preco`)
VALUES
(1, 'Regata tam G', 'Moda', 4.5, 24.99),
(1, 'Bermuda Jeans', 'Moda', 4.0, 34.99),
(2, 'Smartphone G5', 'Tecnologia', 4.8, 449.99),
(3, 'Escrivaninha branca', 'Móveis', 4.5, 169.99),
(4, 'Bolsa de Couro', 'Acessórios', 4.2, 69.99),
(5, 'Nintendo DS', 'Tecnologia', 4.6, 699.99),
(6, 'Chinelos tam 42', 'Moda', 4.3, 44.99),
(7, 'Conjunto infantil tam P', 'Moda', 4.7, 17.99),
(8, 'Abajur Florido', 'Decoração', 4.4, 129.99),
(9, 'Óleo Automotivo 10W40', 'Automotivo', 4.1, 59.99),
(10, 'Calça Skinny tam 40', 'Moda', 4.0, 29.99);

-- Tabela transportadora
INSERT INTO `transportadora` (`nome`, `endereco`, `telefone`, `avaliacao`)
VALUES
('Correios', 'Avenida Paulista, 123 - São Paulo/SP', '1122334455', 5),
('TAM Cargo', 'Aeroporto de Guarulhos - Guarulhos/SP', '1199887766', 7),
('Gollog', 'Aeroporto de Congonhas - São Paulo/SP', '1133669988', 10),
('Azul Cargo', 'Aeroporto de Viracopos - Campinas/SP', '1933445566', 9),
('Total Express', 'Avenida Faria Lima, 789 - São Paulo/SP', '1155667788', 3),
('TransNordestina', 'Avenida Nordeste, 456 - Recife/PE', '8199888777', 10),
('SertãoLog', 'Rua Sertão, 789 - Natal/RN', '8499777666', 10),
('TransSul', 'Rua das Araucárias, 123 - Curitiba/PR', '4133445566', 7),
('SulLog', 'Avenida Beira-Rio, 45 - Porto Alegre/RS', '5133669977', 8),
('TransBrasília', 'Quadra 100, Brasília/DF', '6123456789', 6),
('TransAmazônica', 'Avenida da Amazônia, 785 - Manaus/AM', '9299888777', 7);

-- Tabela tipo_pgto
INSERT INTO `tipo_pgto` (`forma_pgto`)
VALUES
('Crédito'),
('Débito'),
('Boleto'),
('PIX'),
('Dinheiro'),
('Cheque');

-- Inserindo informações na tabela `venda` com a coluna `id`
INSERT INTO venda (cliente_id, tipo_pgto_id, qtde, data_venda, total)
VALUES
(1, 1, 2, '2022-12-10', 59.98),
(2, 2, 1, '2022-12-15', 44.99),
(3, 3, 3, '2022-12-20', 179.97),
(3, 4, 2, '2022-12-25', 139.98),
(5, 5, 1, '2022-12-30', 29.99),
(6, 1, 1, '2023-01-05', 44.99),
(7, 2, 4, '2023-01-10', 71.96),
(8, 3, 2, '2023-01-15', 35.98),
(9, 4, 1, '2023-01-20', 69.99),
(1, 5, 3, '2023-01-25', 209.97),
(4, 1, 2, '2023-02-10', 59.98),
(7, 2, 1, '2023-02-15', 44.99),
(10, 1, 3, '2023-02-20', 179.97),
(10, 4, 2, '2022-02-25', 139.98),
(5, 5, 1, '2023-02-28', 29.99),
(8, 1, 2, '2022-09-10', 59.98),
(9, 2, 1, '2022-09-11', 44.99),
(9, 3, 3, '2022-09-12', 179.97),
(6, 5, 2, '2022-09-10', 139.98),
(4, 5, 1, '2023-09-11', 29.99),
(2, 1, 1, '2023-09-15', 44.99),
(4, 2, 4, '2023-09-16', 71.96),
(3, 3, 2, '2022-09-20', 35.98),
(5, 4, 1, '2022-09-21', 69.99),
(7, 5, 3, '2023-09-25', 209.97),
(1, 1, 2, '2023-09-26', 59.98),
(9, 3, 3, '2023-10-05', 89.98),
(8, 2, 5, '2023-10-06', 59.98),
(5, 3, 1, '2022-10-10', 24.99),
(10, 4, 4, '2022-10-12', 69.99),
(3, 5, 3, '2023-10-15', 134.97);

-- Inserção de dados na tabela `entrega`
INSERT INTO `entrega` (`venda_id`, `transportadora_id`, `status`, `cod_rastreio`, `data_saida`, `data_entrega`, `entrega_no_prazo`)
VALUES
(63, 1, 'Entregue', 123456, '2023-02-11', '2023-02-15', 1),
(64, 2, 'Entregue', 789012, '2023-02-16', '2023-02-17', 1),
(65, 3, 'Entregue', 345678, '2023-02-21', '2023-02-24', 0),
(66, 4, 'Entregue', 567890, '2023-02-26', '2023-02-28', 0),
(67, 5, 'Entregue', 234567, '2023-03-01', '2023-03-03', 1),
(68, 6, 'Entregue', 890123, '2023-03-05', '2023-03-06', 0),
(69, 7, 'Entregue', 456789, '2023-03-08', '2023-03-09', 1),
(70, 8, 'Aguardando Envio', 654321, NULL, NULL, 0),
(71, 9, 'Entregue', 987654, '2023-03-12', '2023-03-14', 0),
(72, 10, 'Aguardando Envio', 321098, NULL, NULL, 0),
(73, 1, 'Entregue', 234567, '2023-03-15', '2023-03-17', 1),
(74, 2, 'Entregue', 543210, '2023-03-19', '2023-03-20', 1),
(75, 3, 'Entregue', 876543, '2023-03-22', '2023-03-24', 0),
(76, 4, 'Entregue', 987654, '2023-03-27', '2023-03-29', 1),
(77, 5, 'Entregue', 765432, '2023-04-01', '2023-04-03', 0),
(78, 6, 'Entregue', 234567, '2023-04-05', '2023-04-06', 0),
(79, 7, 'Entregue', 654321, '2023-04-08', '2023-04-09', 1),
(80, 8, 'Aguardando Envio', 432109, NULL, NULL, 0),
(81, 9, 'Entregue', 876543, '2023-04-12', '2023-04-14', 1),
(82, 10, 'Aguardando Envio', 321098, NULL, NULL, 0),
(83, 1, 'Entregue', 123456, '2023-04-15', '2023-04-17', 1),
(84, 2, 'Entregue', 789012, '2023-04-19', '2023-04-20', 0),
(85, 3, 'Entregue', 345678, '2023-04-22', '2023-04-24', 1),
(86, 4, 'Entregue', 567890, '2023-04-26', '2023-04-28', 0),
(87, 5, 'Entregue', 234567, '2023-05-01', '2023-05-03', 1),
(88, 6, 'Entregue', 890123, '2023-05-05', '2023-05-06', 0),
(89, 7, 'Entregue', 456789, '2023-05-08', '2023-05-09', 1),
(90, 8, 'Aguardando Envio', 654321, NULL, NULL, 0),
(91, 9, 'Entregue', 987654, '2023-05-12', '2023-05-14', 1),
(92, 10, 'Aguardando Envio', 321098, NULL, NULL, 0),
(93, 10, 'Aguardando Envio', 456488, NULL, NULL, 0);


-- Inserindo dados na tabela `estoque`
INSERT INTO `estoque` (`endereco`, `telefone`) VALUES
('Avenida Paulista, 123 - São Paulo/SP', '1122334455'),
('Rua Copacabana, 456 - Rio de Janeiro/RJ', '2199887766'),
('Rua Belo Horizonte, 789 - Belo Horizonte/MG', '3122998877'),
('Avenida Ipiranga, 101 - São Paulo/SP', '1133669988'),
('Avenida Porto Alegre, 123 - Porto Alegre/RS', '5199887766'),
('Rua Curitiba, 456 - Curitiba/PR', '4122998877'),
('Avenida Fortaleza, 123 - Fortaleza/CE', '8522334455'),
('Rua Recife, 456 - Recife/PE', '8199887766'),
('Avenida Manaus, 123 - Manaus/AM', '9299887766'),
('Avenida Brasília, 123 - Brasília/DF', '6122334455');

-- Inserindo dados na tabela balanco_de_vendas
INSERT INTO balanco_de_vendas (produto_id, venda_id, qtde_vendida)
VALUES
(1, 63, 2),
(2, 63, 1),
(3, 64, 3),
(4, 65, 2),
(5, 66, 1),
(6, 67, 1),
(7, 68, 4),
(8, 69, 2),
(1, 70, 2),
(2, 71, 1),
(3, 72, 3),
(4, 73, 2),
(5, 74, 1),
(6, 75, 1),
(7, 76, 4),
(8, 77, 2),
(9, 78, 3),
(10, 79, 1),
(1, 80, 2),
(2, 81, 5),
(3, 82, 1),
(4, 83, 4),
(5, 84, 3),
(6, 85, 2),
(7, 86, 1),
(8, 87, 3),
(9, 88, 4),
(10, 89, 5),
(1, 90, 1),
(2, 91, 2),
(3, 92, 3),
(4, 93, 4);

-- Inserindo dados na tabela `quantidade_estoque`
INSERT INTO `quantidade_estoque` (`estoque_id`, `produto_id`, `qtde`)
SELECT
  e.id AS estoque_id,
  p.id AS produto_id,
  FLOOR(RAND() * 20) + 1 AS qtde -- Quantidade fictícia entre 1 e 20
FROM
  `estoque` e
CROSS JOIN
  `produto` p;
