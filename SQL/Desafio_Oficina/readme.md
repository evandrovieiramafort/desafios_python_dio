<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>Desafio - Projeto Lógico de Banco de Dados do Zero.</h1>
  <section>
    <img src="oficina-mecanica-organizada.jpg" />
  </section>
    <h2>Sobre o desafio:</h2>
    <p>Segundo desafio do bootcamp <a href="https://web.dio.me/track/fd133067-6f2b-47c8-9763-edd87ec6b1cc"><b>Potência Tech powered by iFood | Ciência de 
    Dados</b></a>, ele consiste na elaboração de um esquema conceitual de um banco de dados para uma oficina mecânica. Primeiramente, é pedido para que seja construído um MER (Modelagem Entidade-Relacionamento), exibindo todas as entidades que iremos modelar e as relações que elas possuem. Posterior a modelagem conceitual, vamos para a modelagem lógica, que é nada mais do que uma aprofundação do modelo conceitual, onde explicitamos as chaves primárias e estrangeiras e os tipos primitivos de cada atributo, dentre outras informações. Finda essa parte, vamos para a criação do script SQL, onde todas as tabelas são criadas, daí essas mesmas tabelas terão informações inseridas nelas e, finalmente, poderemos elaborar perguntas de negócio - simples e complexas - para que sejam respondidas via consultas (as chamadas <i> Queries </i>). Não há um rigor quanto a regras de negócios ou um grau de fidelidade com informações do mundo real, então não esperem uma coisa tão fidedigna (em que mundo uma retífica de motor custa, por exemplo, 300 reais?).</p>
    <h2>Minhas notas</h2>
      <p>É o segundo de uma série de códigos SQL que monto fora da faculdade. Investi um tempinho bom montando eles e, comparando aos projetos de uma pessoa que trabalha a aaaaanos com SQL, são coisas bem amadoras, mas feito com o que melhor que pude dar nesse momento. Os créditos pela inspiração vão pro Júlio César Okuda (outro participante desse bootcamp; se não fosse ele, eu estaria perdidaço pra montar tudo - <a href="https://github.com/Jcnok">perfil do GitHub dele aqui</a>).</p>
      <p><i>Ferramentas que usei?</i> MySQL Workbench, para montar o MER e obter o script do BD, e o PHPMyAdmin, para corrigir eventuais disparidades entre o script gerado pelo Workbench e ser um <i>testbed</i> para inserts e consultas. Optei por não construir algo complexo justamente por ser o meu primeiro desafio onde monto tudo do zero e também por não haverem regras rigorosas e específicas sobre regras de negócio, o que me deu a liberdade de optar por nada super complexo - portanto, paciência 😬. </p>
      <p>Ainda estarei por outros bootcamps e acredito que este projeto vá fazer parte deles, assim como o outro projeto envolvendo o refinamento do banco de dados para uma loja de e-commerce, portanto sinta-se livre para pegar o meu projeto como inspiração (porém dê os créditos - plágio é feio). Posteriormente irei escrever, no Medium, sobre a minha experiência neste bootcamp.</p>
      <p><b>ENTÃO SIGAM-ME OS BONS</b></p>
    <h2 id="contexto">Contexto</h2>
    <h3 id="funcionamento">Como as coisas funcionam nesse mini-mundo?</h3>
    <ul>
      <li>O cliente entra em contato com a oficina - seja por email ou telefone.</li>
      <li>Um dos atendentes registra todas as informações pertinentes (o que será feito, informações pessoais e do carro, etc).</li>
      <li>O atendente registra na agenda todas as informações.</li>
      <li>Um mecânico fica responsável pelo serviço, com data e horário marcados para o cliente trazer o carro.</li>
      <li>Tudo o que foi feito no carro, sejam trocas ou revisões, é devidamente registrado em sistema através de OS.</li>
      <li>Todo serviço tem suas características (descrição e valor).</li>
      <li>Todas as peças, assim como os seus fornecedores, são devidamente registradas em sistema para fins de controle e estoque.</li>
      <li>Assim que o serviço é concluído, a nota fiscal da OS é gerada e o pagamento (assim como a forma de pagamento) são devidamente registradas.</li>
    </ul>
    <h2 id="atores">Atores e seus atributos</h2>
    <ul>
  <li><strong>Clientes</strong></li>
  <ul>
    <li>Podem ser pessoas físicas ou jurídicas - optei por estabelecer um relacionamento de herança entre as 3 tabelas</li>
    <li>Podem possuir mais de um carro</li>
    <li>Tem endereço, telefone e e-mail</li>
  </ul>
  <br> <!-- Linha em branco para espaçamento -->
  <li><strong>Veículos</strong></li>
  <ul>
    <li>Um cliente pode ter mais de um carro</li>
    <li>Cada carro pertence a um cliente - nenhum carro (obviamente) tem mais de um dono</li>
  </ul>
  <br>
  <li><strong>OS (Ordens de Serviço)</strong></li>
  <ul>
    <li>Uma OS pertence a apenas um cliente</li>
    <li>Nela constam as datas de entrada e saída do carro</li>
    <li>Podem haver vários serviços ligados a uma OS</li>
    <li>O total do serviço está na OS, sendo relacionada à tabela "pgto"</li>
  </ul>
  <br>
  <li><strong>Pagamento e Tipo de Pagamento</strong></li>
  <ul>
    <li>Relacionamento 1:n - Várias OS têm um tipo de pagamento, mas um tipo de pagamento apenas é permitido por OS</li>
    <li>A tabela "tipo_pgto" foi pensada para questões de escalabilidade - em 2018, você preveria o uso maciço do PIX? Pois é, nem eu.</li>
  </ul>
  <br>
  <li><strong>Tipo de Serviço</strong></li>
  <ul>
    <li>Serve para registrar o valor de cada serviço, individualmente, para que seja posteriormente calculado</li>
    <li>Está atrelada à tabela "pecas" - para uma troca de óleo, precisamos de... óleo, que está em outra tabela</li>
    <li>Várias OS podem ter vários serviços e vários serviços podem estar atrelados a várias OS - portanto, uma tabela associativa foi essencial para a construção dessa parte do modelo</li>
    <li>Assim como um serviço pode ser dependente de várias peças e várias peças podem estar inclusas em outros serviços - mais uma tabela associativa (única "tabela-origem" que possui dois relacionamentos <strong>N:N</strong> com outras tabelas)</li>
  </ul>
  <br>
  <li><strong>Peças e Fornecedores</strong></li>
  <ul>
    <li>Várias peças podem estar em um serviço (a retífica de um motor, por exemplo, depende muito de um sem fim de peças), assim como vários serviços dependem de uma peça (muitos carros possuem peças "cambiáveis" entre eles, por exemplo). Logo, tabela associativa foi usada, como dito acima</li>
    <li>Todas as peças têm quantidade registrada, para fins de estoque e controle</li>
    <li>Para o modelo e para fins de simplificação, um fornecedor pode fornecer várias peças, mas cada peça está atrelada a apenas um fornecedor</li>
  </ul>
  <br>
  <li><strong>Funcionários</strong></li>
  <ul>
    <li>Um mecânico pode estar atrelado a um "espaço" na agenda, mas cada espaço pertence a apenas um mecânico</li>
    <li>Há vários funcionários - Atendente, mecânico e gerente, mas apenas mecânicos podem pegar serviços</li>
    <li>Todos possuem data de admissão e salários registrados em sistema</li>
  </ul>
  <br>
  <li><strong>Agenda</strong></li>
  <ul>
    <li>Nela estão o id do serviço, a um funcionário e a um cliente</li>
    <li>Também estão registrados a data e horário do serviço</li>
    <li>Assim como a complexidade de um serviço - item essencial para entender a data e hora de início e fim do serviço</li>
  </ul>
</ul>
  
  <h2 id="MER">Modelo Entidade-Relacionamento</h2>
  <p>Optei por separar cada "hotpoint" por essas divisões coloridas, para que cada "setor" ficasse bem representado.<br>
  <b>"Clientela"</b> diz respeito ao cliente e as suas possessões (no caso, os carros).<br>
  <b>"Oficina"</b>, a tudo o que diz respeito das operações diárias e seus responsáveis.<br>
  <b>"Fornecimento"</b>, aos responsáveis pela produção e distribuição dos insumos para a oficina</p>
      <img src="banco de dados oficina img.png" />
    </center>
    <h2 id="maos_a_obra">Mãos a obra</h2>
    <h2 id="codigo_create">Primeira fase: CREATE</h2>
    <p>Aqui é onde tudo começa: Com os comandos de criação das tabelas.<br>
    Apesar de o Workbench fornecer o script pronto, optei por fazer algumas modificações. Por exemplo, uma das alterações que fiz foi substituir as opções "ON UPDATE NO ACTION" e "ON DELETE NO ACTION" por "ON UPDATE CASCADE" e "ON DELETE CASCADE", respectivamente. Isso ajuda a evitar sérios problemas de inconsistência nos dados, garantindo que tudo o que for deletado nas tabelas-pai seja deletado nas tabelas-filha, quando necessário. O comando CONSTRAINT foi utilizado "a rodo" para evitar a inserção de chaves primárias nulas e resolver problemas relacionados a chaves estrangeiras, entre outras questões. Em resumo, todas as alterações foram cuidadosamente planejadas para evitar erros grotescos ao escrever as consultas.</p>

```sql
CREATE SCHEMA IF NOT EXISTS `bd_oficina` DEFAULT CHARACTER SET utf8 ;
USE `bd_oficina`;

-- TABELA "cliente"
CREATE TABLE IF NOT EXISTS `cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `tel` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- TABELA "cliente_pf"

CREATE TABLE IF NOT EXISTS `cliente_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `cpf` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `cliente_id`),
  INDEX `fk_cliente_pf_clientes_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_cliente_pf_clientes`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cliente` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "cliente_pj"

CREATE TABLE IF NOT EXISTS `cliente_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `cnpj` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `cliente_id`),
  INDEX `fk_cliente_pj_clientes1_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_cliente_pj_clientes1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cliente` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "veiculo"

CREATE TABLE IF NOT EXISTS `veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `clientes_id` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `ano` YEAR NULL,
  PRIMARY KEY (`id`, `clientes_id`),
  INDEX `fk_veiculos_clientes1_idx` (`clientes_id` ASC),
  CONSTRAINT `fk_veiculos_clientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `cliente` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "OS"

CREATE TABLE IF NOT EXISTS `OS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `veiculo_id` INT NOT NULL,
  `data_entrada` DATETIME NULL,
  `data_saida` DATETIME NULL,
  `descricao` VARCHAR(100) NULL,
  `total` DECIMAL NULL,
  PRIMARY KEY (`id`, `veiculo_id`),
  INDEX `fk_OS_veiculos1_idx` (`veiculo_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_OS_veiculos1`
    FOREIGN KEY (`veiculo_id`)
    REFERENCES `veiculo` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "tipo_pgto"

CREATE TABLE IF NOT EXISTS `tipo_pgto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
) ENGINE = InnoDB;


-- TABELA "pgto"

CREATE TABLE IF NOT EXISTS `pgto` (
  `id` INT NOT NULL,
  `OS_id` INT NOT NULL,
  `tipo_pgto_id` INT NOT NULL,
  `data_pgto` DATETIME NULL,
  `modo_pgto` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `OS_id`, `tipo_pgto_id`),
  INDEX `fk_pgto_OS1_idx` (`OS_id` ASC),
  INDEX `fk_pgtos_tipos_pgto1_idx` (`tipo_pgto_id` ASC),
  CONSTRAINT `fk_pgto_OS1`
    FOREIGN KEY (`OS_id`)
    REFERENCES `OS` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pgtos_tipos_pgto1`
    FOREIGN KEY (`tipo_pgto_id`)
    REFERENCES `tipo_pgto` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "tipo_servico"

CREATE TABLE IF NOT EXISTS `tipo_servico` (
  `id` INT NOT NULL,
  `OS_id` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `valor` DECIMAL NULL,
  PRIMARY KEY (`id`, `OS_id`),
  INDEX `fk_servicos_OS1_idx` (`OS_id` ASC),
  CONSTRAINT `fk_servicos_OS1`
    FOREIGN KEY (`OS_id`)
    REFERENCES `OS` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "funcionario"

CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `salario` DECIMAL NULL,
  `data_admissao` DATETIME NULL,
  `telefone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
) ENGINE = InnoDB;


-- TABELA "fornecedor"

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `UF` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;


-- TABELA "peca"

CREATE TABLE IF NOT EXISTS `peca` (
  `id` INT NOT NULL,
  `fornecedor_id` INT NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `preco` DECIMAL(10,2) NULL,
  `qtde` INT NULL,
  PRIMARY KEY (`id`, `fornecedor_id`),
  INDEX `fk_estoque_fornecedores1_idx` (`fornecedor_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_estoque_fornecedores1`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `fornecedor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "agenda"

CREATE TABLE IF NOT EXISTS `agenda` (
  `id` INT NOT NULL,
  `funcionarios_id` INT NOT NULL,
  `clientes_id` INT NOT NULL,
  `data` DATETIME NULL,
  `complexidade` VARCHAR(11) NULL,
  PRIMARY KEY (`id`, `funcionarios_id`, `clientes_id`),
  INDEX `fk_agenda_clientes1_idx` (`clientes_id` ASC),
  INDEX `fk_agenda_funcionarios1_idx` (`funcionarios_id` ASC),
  CONSTRAINT `fk_agenda_clientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `cliente` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_agenda_funcionarios1`
    FOREIGN KEY (`funcionarios_id`)
    REFERENCES `funcionario` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "pecas_para_tipo_servico"

CREATE TABLE IF NOT EXISTS `pecas_para_tipo_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pecas_id` INT NOT NULL,
  `tipo_servico_id` INT NOT NULL,
  PRIMARY KEY (`id`, `pecas_id`, `tipo_servico_id`),
  INDEX `fk_pecas_has_tipo_servico_tipo_servico1_idx` (`tipo_servico_id` ASC),
  INDEX `fk_pecas_has_tipo_servico_pecas1_idx` (`pecas_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_pecas_has_tipo_servico_pecas1`
    FOREIGN KEY (`pecas_id`)
    REFERENCES `peca` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pecas_has_tipo_servico_tipo_servico1`
    FOREIGN KEY (`tipo_servico_id`)
    REFERENCES `tipo_servico` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;


-- TABELA "tipo_servico_para_OS"

CREATE TABLE IF NOT EXISTS `tipo_servico_para_OS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_servico_id` INT NOT NULL,
  `OS_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tipo_servico_id`, `OS_id`),
  INDEX `fk_tipo_servico_has_OS_OS1_idx` (`OS_id` ASC),
  INDEX `fk_tipo_servico_has_OS_tipo_servico1_idx` (`tipo_servico_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_tipo_servico_has_OS_tipo_servico1`
    FOREIGN KEY (`tipo_servico_id`)
    REFERENCES `tipo_servico` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_servico_has_OS_OS1`
    FOREIGN KEY (`OS_id`)
    REFERENCES `OS` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
```

  <h2 id="codigo_insert">Segunda fase: INSERT</h2>
  <p>A fase mais trabalhosa, de longe - já que é preciso pensar nas informações que irão entrar no banco de dados. Também a mais chata, já que é necessário pensar em como tudo vai ficar disposto antes de sair inserindo os dados (a fim de evitar dores de cabeça usando ALTER TABLE aqui e ali). Novamente, não esquentei tanto com a fidelidade de alguns valores ou salários (eu mesmo iria amar se os amortecedores dianteiros do meu carro, por exemplo, custassem 35 reais 🤣), então pus valores que podem ser como podem não ser a realidade. Também não me preocupei tanto com a quantidade de entradas em cada tabela, salvo as que precisavam de coerência no preenchimento por conta dos CONSTRAINT (evitar conflito entre chaves primárias e estrangeiras). Como são desafios mais voltados para verificar se o programador tem o domínio básico sobre os comandos SQL, o número médio de entradas por tabela é 10.</p>

  ```sql
-- Inserindo os dados na tabela "cliente"

INSERT INTO `cliente` (`nome`, `tel`, `endereco`, `email`) VALUES
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
```
<h2 id="codigo_select">Terceira fase: SELECT FROM</h2>
<p>Se a fase anterior foi maçante, essa foi a mais divertida. O trabalho de um profissional dos dados é, sobretudo, saber analisar e tirar conclusões do que vê. E, pra isso, temos que ter em mente a dimensão dos dados que pretendemos obter - onde eles podem estar localizados, que cara eles podem ter, que tipo de dado pode ser, o tamanho deles e assim por diante.. <br>
<br>
<i>E como obter o que queremos ver?<br>
Sabendo como pedir o que queremos ter.</i><br>
<br>
Realizei um total de 10 queries - imagino que outras pessoas fizeram bem mais do que isso. Fiz o melhor para oscilar entre o simples e o complexo, tanto que vou explicar cada conceito que usei em cada consulta, pra fins didáticos.</p>

```sql
-- 1: Listar todos os clientes e exibir se um determinado cliente é pessoa física ou jurídica

SELECT cliente.*, 

CASE 
WHEN cliente.id IN (SELECT cliente_id FROM cliente_pf) THEN 'Pessoa Física'
WHEN cliente.id IN (SELECT cliente_id FROM cliente_pj) THEN 'Pessoa Jurídica'
ELSE 'Desconhecido'
END AS tipo_cliente
FROM cliente;

-- CONCEITOS USADOS:
-- SELECT, FROM, CASE/WHEN/THEN/ELSE/END AS e Subconsultas com IN
```
<table border="1">
  <tr>
    <th>Nome</th>
    <th>Tipo de Cliente</th>
  </tr>
  <tr>
    <td>João Silva</td>
    <td>Pessoa Física</td>
  </tr>
  <tr>
    <td>Maria Souza</td>
    <td>Pessoa Física</td>
  </tr>
  <tr>
    <td>Carlos Oliveira</td>
    <td>Pessoa Física</td>
  </tr>
  <tr>
    <td>Ana Santos</td>
    <td>Pessoa Física</td>
  </tr>
  <tr>
    <td>Pedro Pereira</td>
    <td>Pessoa Física</td>
  </tr>
  <tr>
    <td>ABC Construção S/A</td>
    <td>Pessoa Jurídica</td>
  </tr>
  <tr>
    <td>Costura Fina eireli</td>
    <td>Pessoa Jurídica</td>
  </tr>
  <tr>
    <td>Escola Pontinho Feliz</td>
    <td>Pessoa Jurídica</td>
  </tr>
  <tr>
    <td>Lima & Lima LTDA</td>
    <td>Pessoa Jurídica</td>
  </tr>
  <tr>
    <td>Ferroso Ferragens</td>
    <td>Pessoa Jurídica</td>
  </tr>
</table>


```sql
-- 2: listar todos os clientes que pagaram com algum cartão, seja débito ou crédito

SELECT c.nome, tp.descricao
FROM cliente c
JOIN veiculo v on (v.clientes_id = c.id)
JOIN OS on (OS.veiculo_id = v.id)
JOIN pgto p on (p.OS_id = os.id)
JOIN tipo_pgto tp on (tp.id = p.tipo_pgto_id)

WHERE tp.descricao = "debito" OR tp.descricao = "credito"

-- CONCEITOS USADOS:
-- SELECT, FROM, JOIN, WHERE, OR e Condição Composta 
```
<table border="1">
  <tr>
    <th>Nome</th>
    <th>Descrição</th>
  </tr>
  <tr>
    <td>Ana Santos</td>
    <td>Débito</td>
  </tr>
  <tr>
    <td>João Silva</td>
    <td>Débito</td>
  </tr>
  <tr>
    <td>Carlos Oliveira</td>
    <td>Débito</td>
  </tr>
  <tr>
    <td>ABC Construção S/A</td>
    <td>Débito</td>
  </tr>
  <tr>
    <td>Pedro Pereira</td>
    <td>Crédito</td>
  </tr>
  <tr>
    <td>João Silva</td>
    <td>Crédito</td>
  </tr>
  <tr>
    <td>Ana Santos</td>
    <td>Crédito</td>
  </tr>
</table>


```sql
-- 3: mostrar quantos funcionários ganham acima da média e quantos ganham abaixo da média

SELECT status_salario, COUNT(*) AS quantidade
FROM (
    SELECT nome, 
           salario,
           CASE WHEN salario > (SELECT AVG(salario) FROM funcionario) THEN 'acima da média'
                ELSE 'abaixo da média'
           END AS status_salario
    FROM funcionario
) AS qtde_media
GROUP BY status_salario;

-- CONCEITOS USADOS:
-- SELECT, FROM, CASE/WHEN/THEN/ELSE/END AS, GROUP BY, Funções de medida (AVG)
```
<table border="1">
  <tr>
    <th>status_salario</th>
    <th>quantidade</th>
  </tr>
  <tr>
    <td>abaixo da média</td>
    <td>7</td>
  </tr>
  <tr>
    <td>acima da média</td>
    <td>1</td>
  </tr>
</table>


```sql
-- 4. listar a quantidade de carros por cliente

SELECT c.nome AS Cliente, COUNT(v.id) AS qtde
FROM cliente c
LEFT JOIN veiculo v ON c.id = v.clientes_id
GROUP BY c.nome
ORDER BY qtde desc

-- CONCEITOS USADOS:
-- SELECT, FROM, AS, Funções de medida (COUNT), LEFT JOIN, GROUP BY, ORDER BY
```

<table border="1">
  <tr>
    <th>Cliente</th>
    <th>Qtde Descendente</th>
  </tr>
  <tr>
    <td>Escola Pontinho Feliz</td>
    <td>3</td>
  </tr>
  <tr>
    <td>João Silva</td>
    <td>2</td>
  </tr>
  <tr>
    <td>Ferroso Ferragens</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Pedro Pereira</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Costura Fina eireli</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Maria Souza</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Lima & Lima LTDA</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Ana Santos</td>
    <td>1</td>
  </tr>
  <tr>
    <td>ABC Construção S/A</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Carlos Oliveira</td>
    <td>1</td>
  </tr>
</table>

```sql
-- 5. listar as 5 peças com maior quantidade em estoque e o nome dos fornecedores delas

SELECT f.nome, SUM(p.qtde) AS total_quantidade
FROM fornecedor f
JOIN peca p ON p.fornecedor_id = f.id
GROUP BY f.nome
ORDER BY total_quantidade desc limit 5

-- CONCEITOS USADOS:
-- SELECT, Funções de medida (SUM), JOIN, GROUP BY, ORDER BY
```
<table border="1">
  <tr>
    <th>Nome</th>
    <th>Total Quantidade</th>
  </tr>
  <tr>
    <td>Fornecedora Mecânica Nacional</td>
    <td>200</td>
  </tr>
  <tr>
    <td>Distribuidora de Peças Automotivas Fast</td>
    <td>150</td>
  </tr>
  <tr>
    <td>Fornecedor XYZ Ltda</td>
    <td>125</td>
  </tr>
  <tr>
    <td>Comércio de Peças ABC</td>
    <td>105</td>
  </tr>
  <tr>
    <td>Peças e Componentes S.A.</td>
    <td>70</td>
  </tr>
</table>

```sql
-- 6. Retornar o nome do cliente junto com o nome do carro, apenas dos modelos produzidos entre 2010 e 2020

SELECT CONCAT(c.nome, ' - ', v.modelo) AS carro_cliente
FROM cliente c
JOIN veiculo v ON c.id = v.clientes_id
WHERE v.ano BETWEEN 2010 AND 2020;

-- CONCEITOS USADOS:
-- SELECT, CONCAT, AS, JOIN, ON, WHERE, BEWTEEN
```

<table border="1">
  <tr>
    <th>Carro do Cliente</th>
  </tr>
  <tr>
    <td>Ana Santos - Strada</td>
  </tr>
  <tr>
    <td>ABC Construção S/A - Ka</td>
  </tr>
  <tr>
    <td>Costura Fina eireli - Sandero</td>
  </tr>
  <tr>
    <td>Escola Pontinho Feliz - 1800</td>
  </tr>
  <tr>
    <td>Escola Pontinho Feliz - Kicks</td>
  </tr>
  <tr>
    <td>Escola Pontinho Feliz - Hilux</td>
  </tr>
  <tr>
    <td>Ferroso Ferragens - Uno</td>
  </tr>
</table>

```sql
-- 7. selecionar APENAS os fornecedores do Sudeste que comecem com a letra "F"
SELECT f.nome, f.endereco
FROM fornecedor f
WHERE UF IN ('SP', 'RJ', 'MG', 'ES')
AND SUBSTRING(nome, 1, 1) = 'F';

-- CONCEITOS USADOS:
-- SELECT, FROM, WHERE, IN, SUBSTRING
```

<table border="1">
  <tr>
    <th>Nome</th>
    <th>Endereço</th>
  </tr>
  <tr>
    <td>Fornecedor XYZ Ltda</td>
    <td>Rua João da Silva, 123, São Paulo</td>
  </tr>
  <tr>
    <td>Fornecedora Mecânica Nacional</td>
    <td>Travessa José Oliveira, 789, Belo Horizonte</td>
  </tr>
</table>

```sql
-- 8. selecionar todos os clientes do sudeste e os seus respectivos emails

SELECT c.nome, c.email
FROM cliente c
WHERE c.endereco LIKE '%SP%' OR c.endereco LIKE '%RJ%' OR c.endereco LIKE '%MG%' OR c.endereco LIKE '%ES%';

-- CONCEITOS USADOS:
-- SELECT, FROM, WHERE, LIKE, OR
```

<table border="1">
  <tr>
    <th>Nome</th>
    <th>Email</th>
  </tr>
  <tr>
    <td>João Silva</td>
    <td>joao@email.com</td>
  </tr>
  <tr>
    <td>Maria Souza</td>
    <td>maria@email.com</td>
  </tr>
  <tr>
    <td>Carlos Oliveira</td>
    <td>carlos@email.com</td>
  </tr>
  <tr>
    <td>ABC Construção S/A</td>
    <td>sandra@email.com</td>
  </tr>
  <tr>
    <td>Costura Fina eireli</td>
    <td>marcos@email.com</td>
  </tr>
  <tr>
    <td>Escola Pontinho Feliz</td>
    <td>fernanda@email.com</td>
  </tr>
</table>

```sql
-- 9. exibir os mecânicos que mais fizeram serviços, tendo uma contagem acima de 1 serviço feito

SELECT f.nome, COUNT(*) AS qtde_os
FROM funcionario f 
JOIN agenda a ON (a.funcionarios_id = f.id)
JOIN cliente c ON (a.clientes_id = c.id)
JOIN veiculo v ON (c.id = v.clientes_id)
JOIN os ON (os.veiculo_id = v.id)
GROUP BY f.nome
HAVING qtde_os > 1
ORDER BY qtde_os DESC;

-- CONCEITOS USADOS:
-- SELECT, FROM, múltiplos JOIN, GROUP BY, HAVING, ORDER BY
```
<table border="1">
  <tr>
    <th>Nome</th>
    <th>Quantidade de OS</th>
  </tr>
  <tr>
    <td>Pedro Costa</td>
    <td>5</td>
  </tr>
  <tr>
    <td>José Santos</td>
    <td>5</td>
  </tr>
  <tr>
    <td>Carlos Marino</td>
    <td>4</td>
  </tr>
</table>

```sql
-- 10. Exibir todos os serviços da oficina, do mais caro ao mais barato, e determinar se
-- os valores estão acima ou abaixo da média do estabelecimento

SELECT tp.descricao, tp.valor,
  CASE
    WHEN tp.valor > media.media THEN 'Acima da média'
    WHEN tp.valor < media.media THEN 'Abaixo da média'
    ELSE 'Na média'
  END AS media_regua
FROM tipo_servico tp
JOIN (SELECT AVG(valor) AS media FROM tipo_servico) media
ORDER BY tp.valor DESC;

-- CONCEITOS USADOS:
-- SELECT, FROM, ORDER BY, DESC, LIMIT
```

<table border="1">
  <thead>
    <tr>
      <th>Descrição</th>
      <th>Valor</th>
      <th>Classificação</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Troca de amortecedores</td>
      <td>300</td>
      <td>Acima da média</td>
    </tr>
    <tr>
      <td>Verificação de motor</td>
      <td>200</td>
      <td>Acima da média</td>
    </tr>
    <tr>
      <td>Troca de pneus</td>
      <td>200</td>
      <td>Acima da média</td>
    </tr>
    <tr>
      <td>Reparo no sistema de ar condicionado</td>
      <td>180</td>
      <td>Acima da média</td>
    </tr>
    <tr>
      <td>Substituição de bateria</td>
      <td>150</td>
      <td>Abaixo da média</td>
    </tr>
    <tr>
      <td>Revisão</td>
      <td>150</td>
      <td>Abaixo da média</td>
    </tr>
    <tr>
      <td>Manutenção de freios</td>
      <td>120</td>
      <td>Abaixo da média</td>
    </tr>
    <tr>
      <td>Reparo no sistema elétrico</td>
      <td>100</td>
      <td>Abaixo da média</td>
    </tr>
    <tr>
      <td>Limpeza e polimento</td>
      <td>80</td>
      <td>Abaixo da média</td>
    </tr>
    <tr>
      <td>Troca de óleo</td>
      <td>50</td>
      <td>Abaixo da média</td>
    </tr>
  </tbody>
</table>

<h2 id="conclusao">Conclusões:</h2>
<ul>
  <li>Temos um número equilibrado de clientes físicos e jurídicos, o que significa que evitamos a criação de um nicho na oficina.</li>
  <li>Mais pessoas preferem pagar no débito do que no crédito, o que <b>poderia</b> mostrar uma certa "segurança" financeira por parte dos clientes - já que pressupõe-se que os pagamentos no débito são todos a vista.</li>
  <li>A média salarial é um tanto quanto desequilibrada, já que apenas o gerente é quem ganha um salário acima da média.</li>
  <li>A quantidade de carros para clientes físicos e jurídicos é a mesma - 7 para cada segmento.</li>
  <li>Os números de peças em estoque seguem um certo equilíbrio aparente em termos de quantidade.</li>
  <li>Carros que ainda se encontram pagando IPVA em muitos estados são maioria entre os clientes - o que <b>poderia</b> corroborar uma certa segurança financeira dos clientes.</li>
  <li>Temos poucas fornecedoras de peças nos estados de São Paulo e Minas Gerais, mas em contrapartida temos muitos clientes do Sudeste, o que poderia gerar um certo problema em suprir a demanda destes clientes caso os seus carros quebrem em um intervalo curto de tempo.</li>
  <li>De todos os mecânicos da oficina, a maior parte recebe quantidades iguais de trabalho.</li>
  <li>Avaliando a classificação dos valores da oficina, temos que os seus preços estão abaixo da média do que é cobrado no estabelecimento, deixando a entender que não é um lugar bem acessível.</li>
</ul>

<p>Obviamente são hipóteses obtidas através do puro "olhômetro" nas consultas obtidas. Poderíamos fazer N testes para verificar correlação, causalidade, fazer regressões lineares e mais um sem fim de coisas. Mas é um banco de dados com poucas informações, então tudo o que podemos fazer é especular.<br>
Obrigado por ter lido até aqui e espero que tenham gostado da minha resolução do desafio! Aceito feedbacks, de verdade.</p>

</body>
</html>

