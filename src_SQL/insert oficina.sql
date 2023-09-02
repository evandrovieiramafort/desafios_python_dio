-- Inserindo os dados na tabela "cliente"

INSERT INTO `cliente` (`nome`, `tel`, `endereco`, `email`) 
VALUES
('João Silva', '(11)2143-5678', 'Rua Almirante Agenor, 123, Barueri-SP', 'joao@email.com'),
('Maria Souza', '(21)2154-8798', 'Av. Brasil, 1122, Rio De Janeiro-RJ', 'maria@email.com'),
('Carlos Oliveira', '(32)2565-8754', 'Rua Ceara, 21, Juiz de Fora-MG, 789', 'carlos@email.com'),
('Ana Santos', '(44)9828-2032', 'Av. Dom João VI, 101, Curitiba-PR', 'ana@email.com'),
('Pedro Pereira', '(55)9906-5550', 'Rua E, 222, Santa Rosa-RS', 'pedro@email.com'),
('ABC Construção S/A', '(11)2223-9998', 'Av. Fernão Dias, 333, São Paulo-SP', 'sandra@email.com'),
('Costura Fina eireli', '(22)2893-6497', 'Rua Gerdini, 444, Petrópolis-RJ', 'marcos@email.com'),
('Escola Pontinho Feliz', '(31)25225-3235', 'Av. Helder Câmara, 555, Betim-MG', 'fernanda@email.com'),
('Lima & Lima LTDA', '(85)9958-5421', 'Rua II, 666, Crato-CE', 'luiz@email.com'),
('Ferroso Ferragens', '(61)2223-8596', 'Av. L, 777, Brasília-DF', 'cristina@email.com');


-- Inserindo os dados na tabela "cliente_pf"

INSERT INTO `cliente_pf` (`cliente_id`, `cpf`) VALUES
(1, '123.456.789-01'),
(2, '987.654.321-02'),
(3, '111.222.333-03'),
(4, '444.555.666-04'),
(5, '777.888.999-05'),

-- Inserindo os dados na tabela "cliente_pj"

INSERT INTO `cliente_pj` (`cliente_id`, `cnpj`) VALUES
(6, '12.345.678/0001-01'),
(7, '23.456.789/0002-02'),
(8, '34.567.890/0003-03'),
(9, '45.678.901/0004-04'),
(10, '56.789.012/0005-05'),

-- Inserindo os dados na tabela "veículos"

INSERT INTO `veiculo` (`clientes_id`, `marca`, `modelo`, `ano`) VALUES
(1, 'Toyota', 'Corolla', 2005),
(1, 'Honda', 'Civic', 1999),
(2, 'Volkswagen', 'Gol', 1998),
(3, 'Chevrolet', 'Onix', 2022),
(4, 'Fiat', 'Strada', 2018),
(5, 'Hyundai', 'HB20', 2023),
(6, 'Ford', 'Ka', 2020),
(7, 'Renault', 'Sandero', 2019),
(8, 'Agrale', '1800', 2010),
(8, 'Nissan', 'Kicks', 2018),
(8, 'Toyota', 'Hilux', 2010),
(9, 'Volkswagen', 'T-Cross', 2023),
(10, 'Fiat', 'Uno', 2020);

-- Inserindo os dados na tabela "OS"

INSERT INTO `OS` (`veiculo_id`, `data_entrada`, `data_saida`, `descricao`, `total`) VALUES
(1, '2023-05-15 10:00:00', '2023-05-15 15:30:00', 'Troca de óleo e filtro', 150.00),
(1, '2023-06-17 14:30:00', '2023-06-17 16:45:00', 'Reparo no sistema elétrico', 220.00),
(2, '2023-07-16 09:30:00', '2023-07-16 12:45:00', 'Revisão completa', 280.00),
(2, '2023-08-18 11:00:00', '2023-08-18 14:15:00', 'Substituição de amortecedores', 360.00),
(3, '2023-09-19 14:15:00', '2023-09-19 11:30:00', 'Substituição de pneus', 450.00),
(4, '2023-10-20 08:45:00', '2023-10-20 16:15:00', 'Manutenção de freios', 320.00),
(5, '2023-11-21 13:20:00', '2023-11-21 17:30:00', 'Limpeza e polimento', 80.00),
(5, '2023-12-22 09:45:00', '2023-12-22 11:30:00', 'Reparo no sistema de ar condicionado', 180.00),
(6, '2022-01-23 11:30:00', '2022-01-23 15:45:00', 'Verificação de motor', 200.00),
(7, '2022-02-24 10:45:00', '2022-02-24 14:00:00', 'Substituição de bateria', 150.00),
(7, '2022-03-25 15:15:00', '2022-03-25 17:30:00', 'Reparo no sistema de ignição', 130.00),
(8, '2022-04-26 09:15:00', '2022-04-26 12:30:00', 'Troca de óleo e filtro', 120.00),
(9, '2022-05-27 07:30:00', '2022-05-27 17:30:00', 'Revisão completa', 400.00),
(10, '2022-06-28 14:30:00', '2022-06-28 18:45:00', 'Substituição de pneus', 520.00),
(10, '2022-07-29 10:30:00', '2022-07-29 13:45:00', 'Reparo no sistema de direção', 300.00);

-- Inserindo os dados na tabela "tipo_pgto"

INSERT INTO tipo_pgto (descricao) VALUES
('dinheiro'),
('pix'),
('débito'),
('crédito');

-- Inserindo os dados na tabela "pgto"

INSERT INTO `pgto` (`id`, `OS_id`, `tipo_pgto_id`, `data_pgto`, `modo_pgto`) VALUES
(1, 6, 1, '2022-02-22 14:30:00', 'Cartão de Crédito'),
(2, 7, 2, '2022-03-23 09:15:00', 'PIX'),
(3, 8, 3, '2022-04-24 16:30:00', 'Cartão de Débito'),
(4, 9, 4, '2022-05-25 13:45:00', 'Dinheiro'),
(5, 10, 1, '2022-06-26 11:00:00', 'Cartão de Crédito'),
(6, 1, 2, '2023-01-15 15:30:00', 'PIX'),
(7, 2, 3, '2023-02-16 12:45:00', 'Cartão de Débito'),
(8, 3, 4, '2023-03-19 11:30:00', 'Dinheiro'),
(9, 4, 1, '2023-04-20 16:15:00', 'Cartão de Crédito'),
(10, 5, 2, '2023-05-21 17:30:00', 'PIX'),
(11, 6, 3, '2023-06-22 15:45:00', 'Cartão de Débito'),
(12, 7, 4, '2023-07-23 17:30:00', 'Dinheiro'),
(13, 8, 1, '2023-08-24 12:30:00', 'Cartão de Crédito'),
(14, 9, 2, '2023-09-25 17:30:00', 'PIX'),
(15, 10, 3, '2023-10-26 13:45:00', 'Cartão de Débito');

-- Inserindo os dados na tabela "tipo_servico"

INSERT INTO `tipo_servico` (`id`, `OS_id`, `descricao`, `valor`) VALUES
(1, 1, 'Troca de óleo e filtro', 150.00),
(2, 2, 'Reparo no sistema elétrico', 220.00),
(3, 3, 'Revisão completa', 280.00),
(4, 4, 'Substituição de amortecedores', 360.00),
(5, 5, 'Substituição de pneus', 450.00),
(6, 6, 'Manutenção de freios', 320.00),
(7, 7, 'Limpeza e polimento', 80.00),
(8, 8, 'Reparo no sistema de ar condicionado', 180.00),
(9, 9, 'Verificação de motor', 200.00),
(10, 10, 'Substituição de bateria', 150.00);

-- Inserindo os dados na tabela "funcionario"

INSERT INTO `funcionario` (`nome`, `cargo`, `salario`, `data_admissao`, `telefone`)
VALUES
('Maria Silva', 'Atendente', 1500.00, '2023-01-01 08:00:00', '(11)1234-5678'),
('José Santos', 'Mecânico', 2000.00, '2023-01-02 09:00:00', '(11)2345-6789'),
('Ana Oliveira', 'Gerente', 3500.00, '2023-01-03 10:00:00', '(11)3456-7890'),
('Pedro Costa', 'Mecânico', 2000.00, '2023-01-04 11:00:00', '(11)4567-8901'),
('Cláudio Siqueira', 'Mecânico', 2000.00, '2023-01-05 12:00:00', '(11)5678-9012'),
('João Lopes', 'Atendente', 1500.00, '2023-01-01 08:00:00', '(11)1234-5678'),
('André Motta', 'Mecânico', 2000.00, '2023-01-02 09:00:00', '(11)2345-6789'),
('Carlos Marino', 'Mecânico', 2000.00, '2023-01-02 09:00:00', '(11)2345-6789');

-- Inserindo os dados na tabela "fornecedor"

INSERT INTO `fornecedor` (`id`, `nome`, `cnpj`, `endereco`, `UF`, `telefone`, `email`)
VALUES
(1, 'Fornecedor XYZ Ltda', '12.345.678/0001-01', 'Rua João da Silva, 123, São Paulo', 'SP', '(11)5555-5555', 'contato@fornecedorxyz.com'),
(2, 'Peças e Componentes S.A.', '23.456.789/0002-02', 'Av. Maria Souza, 456, Rio de Janeiro', 'RJ', '(21)4444-4444', 'vendas@pecasecomponentes.com.br'),
(3, 'Fornecedora Mecânica Nacional', '34.567.890/0003-03', 'Travessa José Oliveira, 789, Belo Horizonte', 'MG', '(31)3333-3333', 'atendimento@fornecedormecanico.com'),
(4, 'Autopeças do Sul Ltda', '45.678.901/0004-04', 'Rua Ana Santos, 101, Porto Alegre', 'RS', '(51)7777-7777', 'contato@autopecasdosul.com'),
(5, 'Comércio de Peças ABC', '56.789.012/0005-05', 'Avenida Pedro Pereira, 222, São Paulo', 'SP', '(11)8888-8888', 'vendas@pecasabc.com'),
(6, 'Peças e Acessórios Carro Novo', '67.890.123/0006-06', 'Rua Marcos Silva, 543, Curitiba', 'PR', '(41)9999-9999', 'contato@carronovopecas.com'),
(7, 'Distribuidora de Peças Automotivas Fast', '78.901.234/0007-07', 'Av. Cristina Oliveira, 987, Brasília', 'DF', '(61)3333-3333', 'vendas@fastpecas.com'),
(8, 'Motopeças Express', '89.012.345/0008-08', 'Avenida Luiz Santos, 654, São Paulo', 'SP', '(11)6666-6666', 'atendimento@motopecasexpress.com');

-- Inserindo os dados na tabela "peca"

INSERT INTO `peca` (`id`, `fornecedor_id`, `descricao`, `preco`, `qtde`)
VALUES
(1, 1, 'Filtro de óleo', 10.99, 50),
(2, 1, 'Filtro de ar', 5.99, 75),
(3, 2, 'Pastilhas de freio dianteiras', 25.50, 40),
(4, 2, 'Pastilhas de freio traseiras', 22.50, 30),
(5, 3, 'Lâmpada H7', 3.99, 100),
(6, 3, 'Lâmpada H4', 3.99, 100),
(7, 4, 'Bateria de carro 60Ah', 85.00, 20),
(8, 4, 'Bateria de carro 80Ah', 105.00, 15),
(9, 5, 'Correia dentada', 15.75, 60),
(10, 5, 'Correia de alternador', 9.99, 45),
(11, 6, 'Amortecedores dianteiros', 35.25, 25),
(12, 6, 'Amortecedores traseiros', 32.99, 20),
(13, 7, 'Óleo de motor 10W-30', 22.99, 80),
(14, 7, 'Óleo de motor 5W-40', 26.99, 70),
(15, 8, 'Radiador de alumínio', 75.00, 10),
(16, 8, 'Radiador de cobre', 68.50, 8);


-- Inserindo os dados na tabela "agenda"

INSERT INTO `agenda` (`id`, `funcionarios_id`, `clientes_id`, `data`, `complexidade`)
VALUES
(1, 2, 1, '2023-09-05 09:00:00', 'fácil'),
(2, 4, 2, '2023-09-06 10:30:00', 'médio'),
(3, 7, 3, '2023-09-07 14:00:00', 'dificil'),
(4, 8, 4, '2023-09-08 15:30:00', 'fácil'),
(5, 2, 5, '2023-09-09 08:00:00', 'médio'),
(6, 8, 6, '2023-09-10 11:30:00', 'dificil'),
(7, 4, 7, '2023-09-11 13:00:00', 'fácil'),
(8, 4, 8, '2023-09-12 16:30:00', 'médio');


-- Inserindo os dados na tabela "pecas_para_tipo_servico"

INSERT INTO `pecas_para_tipo_servico` (`pecas_id`, `tipo_servico_id`)
VALUES
(1, 1),
(2, 1),
(3, 6),
(4, 6),
(5, 10),
(6, 10),
(7, 1),
(8, 1),
(9, 9),
(10, 9),
(11, 4),
(12, 4),
(13, 1),
(14, 1),
(15, 6),
(16, 6);

-- Inserindo os dados na tabela "tipo_servico_para_OS"

INSERT INTO `tipo_servico_para_OS` (`tipo_servico_id`, `OS_id`)
VALUES
(1, 1),
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(6, 6), 
(7, 7), 
(8, 8), 
(9, 9), 
(10, 10), 
(1, 2), 
(2, 3), 
(3, 4), 
(4, 5), 
(5, 6), 
(6, 7);