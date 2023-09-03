<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <body>
    <h1>Desafio - Construindo seu Primeiro Projeto Lógico de Banco de Dados.</h1>
  <section>
    <img src="opencommerces.webp" />
  </section>
    <h2>Sobre o desafio:</h2>
    <p>Primeiro desafio de SQL do bootcamp <a href="https://web.dio.me/track/potencia-tech-powered-ifood-ciencias-de-dados-com-python">Potência Tech powered by iFood | Ciência de Dados</a>, consiste em refinar um banco de dados que foi construído ao longo do curso de Modelagem de Dados, simulando o sistema de uma loja de e-commerce. Esse desafio é na linha do segundo (sendo que o outro projeto consiste em montar um banco de dados do zero, com poucas referências em aula). Do mesmo modo que o segundo desafio, primeiro montamos o MER (Modelo Entidade-Relacionamento) para depois irmos para o script SQL. Feito o script, é feita a inserção dos dados no schema e, a partir disso, as consultas (ou queries) são elaboradas para que possamos responder perguntas de negócios. A intenção neste projeto, assim como o outro, é desenvolver a proficiência do desenvolvedor em SQL e análise de dados - portanto, o que está nesse banco de dados não representa a realidade como ela é.</p>
    <h2>Minhas notas:</h2>
    <p>Optei por fazer “ao contrário”: Primeiro, concluí o segundo desafio e daí fiz esse. O meu schema ficou um tanto quanto diferente do schema da instrutora, porém funciona de modo semelhante. Pessoalmente considerei este desafio mais intrincado, por conta dos vários perrengues que passei para deixar o código mais uniforme possível Acredito ter passado mais tempo desenvolvendo esse sistema do que o outro - mesmo com o outro sendo feito totalmente do zero.</p>
      <p>Mais uma vez, contei com a dupla “MySQL Workbench – PHPMyAdmin” para poder desenvolver a minha solução de negócio. Se utilizadas em conjunto, são instrumentos poderosíssimos para todas as linguagens de manipulação de dados (DML, DCL e DDL). E, de novo, todos os créditos pela inspiração irão para o Júlio César Okuda (<a href="https://github.com/Jcnok">perfil do GitHub dele aqui</a>) e os créditos pela construção e análise do meu código irão para o meu professor, Rafael Guimarães. Um conselho que dou para vocês: Troquem ideia com os seus professores de faculdade. Sempre vai ter um professor gente fina que vai querer te ajudar.</p>
      <p>De novo, estarei por outros bootcamps e acredito que este projeto também vá fazer parte deles, portanto sinta-se livre para pegar o meu projeto como inspiração (porém dê os créditos - plágio é feio). Posteriormente irei escrever, no Medium, sobre a minha experiência neste bootcamp.</p>
      <p><b>ENTÃO SIGAM-ME OS BONS</b></p>
    <h2>Contexto</h2>
    <h3>Como as coisas funcionam nesse mini-mundo?</h3>
    <ul>
        <li>O cliente informa seus dados pessoais no site da loja</li>
        <li>A partir disso, escolhe os seus produtos e fecha a compra</li>
        <li>As compras podem ser pagas de várias formas</li>
        <li>Assim que uma compra é feita, ela é passada para um dos estoques, que separam o produto</li>
        <li>Com o produto separado, ele é encaminhado para uma transportadora</li>
        <li>A transportadora fará o envio do produto para a localidade informada</li>
        <li>As transportadoras são avaliadas e informam se o produto foi entregue dentro do prazo ou não</li>
    </ul>
    <h2>Atores e seus atributos</h2>
    <ul>
        <li><h3>Clientes</h3>
            <ul>
                <li>Podem ser pessoas físicas ou jurídicas - optei por estabelecer um relacionamento de herança entre as 3 tabelas</li>
                <li>Tem endereço e telefone, que são devidamente registrados</li>
            </ul>
        </li>
    <li><h3>Produtos, fornecedores e estoque</h3>
            <ul>
                <li>Pelas regras de negócio, cada produto é disponibilizado por um fornecedor, precisando estes realizar o cadastro na loja.</li>
                <li>Fornecedores podem ser pessoas físicas ou jurídicas (novamente optei por uma relação de herança)</li>
                <li>Todos os produtos pertencem a uma categoria, que é descrita quando se registra o produto em sistema, e possuem uma nota de avalição.</li>
                <li>É feito o controle do que saiu por venda e da quantidade de cada produto em cada um dos estoques que a loja possui Brasil afora.</li>
                <li>Cada estoque possui registro na firma, tendo seus endereços e meios de contato.</li>
                <li>Cada venda associada a cada produto é registrada em uma tabela de balanço de vendas, para que posteriormente seja avaliado o termômetro de venda para um determinado produto</li>
            </ul>
        </li>
    <li><h3>Vendas</h3>
            <ul>
                <li>Um cliente pode fazer várias compras, mas cada compra está associada a um cliente</li>
                <li>Na venda é informado quais itens serão comprados, a quantidade, forma de pagamento e o total.</li>
                <li>Cada forma de pagamento é registrada em uma tabela a parte, por motivos de escalabilidade (caso, por exemplo, a loja decida adotar uma nova forma de pagamento sem que isso comprometa a estrutura geral do banco de dados).</li>
            </ul>
        </li>
    <li><h3>Entregas e transportadoras</h3>
            <ul>
                <li>Cada compra, assim que realizada, é encaminhada para um estoque, que solicita o envio para uma transportadora</li>
                <li>Do mesmo modo que os estoques possuem registro, as transportadoras também possuem</li>
                <li>As transportadoras são avaliadas pelos clientes assim que cada entrega é feita e é informado se a entrega foi feita dentro do prazo, para que a loja tenha controle sobre quais transportadoras são vantajosas para se trabalhar.</li>
            </ul>
        </li>
    </ul>
  <h2 id="MER">Modelo Entidade-Relacionamento</h2>
  <p>Optei por separar cada "hotpoint" por essas divisões coloridas, para que cada "setor" ficasse bem representado.<br>
  <b>"Clientela"</b> diz respeito aos clientes, sejam físicos ou jurídicos.<br>
  <b>"Vendas"</b>, a tudo o que diz respeito as vendas, entregas e transportadoras.<br>
  <b>"Management"</b>, é relativo aos produtos, fornecedores e estoque.</p>
      <img src="banco de dados loja img.png" />
  <h2 id="maos_a_obra">Mãos a obra</h2>
  <h2 id="codigo_create">Primeira fase: CREATE</h2>
  <p>Aqui é onde tudo começa: Com os comandos de criação das tabelas.<br>
Apesar de o Workbench fornecer o script pronto, optei por fazer algumas modificações. Por exemplo, uma das alterações que fiz foi substituir as opções "ON UPDATE NO ACTION" e "ON DELETE NO ACTION" por "ON UPDATE CASCADE" e "ON DELETE CASCADE", respectivamente. Isso ajuda a evitar sérios problemas de inconsistência nos dados, garantindo que tudo o que for deletado nas tabelas-pai seja deletado nas tabelas-filha, quando necessário. O comando CONSTRAINT foi utilizado "a rodo" para evitar a inserção de chaves primárias nulas e resolver problemas relacionados a chaves estrangeiras, entre outras questões. Em resumo, todas as alterações foram cuidadosamente planejadas para evitar erros grotescos ao escrever as consultas.</p>

```sql
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS bd_ecommerce;
USE bd_ecommerce;

-- Tabela "Cliente"
CREATE TABLE IF NOT EXISTS `cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC),
  UNIQUE INDEX `endereco_UNIQUE` (`endereco` ASC)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Cliente_pj"
CREATE TABLE IF NOT EXISTS `cliente_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `cnpj` VARCHAR(15) NOT NULL,
  `data_abertura` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `cliente_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_cliente_pj_cliente1_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_cliente_pj_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cliente` (`cliente_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Cliente_pf"
CREATE TABLE IF NOT EXISTS `cliente_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`id`, `cliente_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_cliente_pf_cliente1_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_cliente_pf_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cliente` (`cliente_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Fornecedor"
CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idfornecedor_UNIQUE` (`id` ASC)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Fornecedor_pj"
CREATE TABLE IF NOT EXISTS `fornecedor_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fornecedor_id` INT NOT NULL,
  `cnpj` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `fornecedor_id`),
  INDEX `fk_fornecedor_pj_fornecedor1_idx` (`fornecedor_id` ASC),
  CONSTRAINT `fk_fornecedor_pj_fornecedor1`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `fornecedor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Fornecedor_pf"
CREATE TABLE IF NOT EXISTS `fornecedor_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fornecedor_id` INT NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`, `fornecedor_id`),
  INDEX `fk_fornecedor_pf_fornecedor1_idx` (`fornecedor_id` ASC),
  CONSTRAINT `fk_fornecedor_pf_fornecedor1`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `fornecedor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Produto"
CREATE TABLE IF NOT EXISTS `produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fornecedor_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `avaliacao` DECIMAL(3, 2) NOT NULL,
  `preco` DECIMAL(8, 2) NOT NULL,
  PRIMARY KEY (`id`, `fornecedor_id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome` ASC),
  INDEX `fk_produto_fornecedor1_idx` (`fornecedor_id` ASC),
  CONSTRAINT `fk_produto_fornecedor1`
    FOREIGN KEY (`fornecedor_id`)
    REFERENCES `fornecedor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Transportadora"
CREATE TABLE IF NOT EXISTS `transportadora` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `avaliacao` TINYINT(2) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Tipo_pgto"
CREATE TABLE IF NOT EXISTS `tipo_pgto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `forma_pgto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Venda"
CREATE TABLE IF NOT EXISTS `venda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NOT NULL,
  `tipo_pgto_id` INT NOT NULL,
  `qtde` INT NOT NULL,
  `data_venda` DATE NOT NULL,
  `total` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`id`, `cliente_id`, `tipo_pgto_id`),
  INDEX `fk_venda_Cliente1_idx` (`cliente_id` ASC),
  INDEX `fk_venda_tipo_pgto1_idx` (`tipo_pgto_id` ASC),
  CONSTRAINT `fk_venda_Cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `cliente` (`cliente_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_venda_tipo_pgto1`
    FOREIGN KEY (`tipo_pgto_id`)
    REFERENCES `tipo_pgto` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Entrega"
CREATE TABLE IF NOT EXISTS `entrega` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `venda_id` INT NOT NULL,
  `transportadora_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `cod_rastreio` INT(11) NOT NULL,
  `data_saida` DATE DEFAULT NULL,
  `data_entrega` DATE DEFAULT NULL,
  `entrega_no_prazo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`, `venda_id`, `transportadora_id`),
  INDEX `fk_entrega_venda1_idx` (`venda_id` ASC),
  INDEX `fk_entrega_transportadora1_idx` (`transportadora_id` ASC),
  CONSTRAINT `fk_entrega_transportadora1`
    FOREIGN KEY (`transportadora_id`)
    REFERENCES `transportadora` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_entrega_venda1`
    FOREIGN KEY (`venda_id`)
    REFERENCES `venda` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Estoque"
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Quantidade_estoque"
CREATE TABLE IF NOT EXISTS `quantidade_estoque` (
  `estoque_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `qtde` INT NOT NULL,
  PRIMARY KEY (`estoque_id`, `produto_id`),
  INDEX `fk_quantidade_estoque_produto1_idx` (`produto_id` ASC),
  INDEX `fk_quantidade_estoque_estoque1_idx` (`estoque_id` ASC),
  CONSTRAINT `fk_quantidade_estoque_produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `produto` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_quantidade_estoque_estoque1`
    FOREIGN KEY (`estoque_id`)
    REFERENCES `estoque` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela "Balanco_de_vendas"
CREATE TABLE IF NOT EXISTS `balanco_de_vendas` (
  `produto_id` INT NOT NULL,
  `venda_id` INT NOT NULL,
  `qtde_vendida` INT NOT NULL,
  PRIMARY KEY (`produto_id`, `venda_id`),
  INDEX `fk_balanco_de_vendas_venda1_idx` (`venda_id` ASC),
  INDEX `fk_balanco_de_vendas_produto1_idx` (`produto_id` ASC),
  CONSTRAINT `fk_balanco_de_vendas_produto1`
    FOREIGN KEY (`produto_id`)
    REFERENCES `produto` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_balanco_de_vendas_venda1`
    FOREIGN KEY (`venda_id`)
    REFERENCES `venda` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
```

  <h2 id="codigo_insert">Segunda fase: INSERT</h2>
  <p>A fase mais trabalhosa, de longe - já que é preciso pensar nas informações que irão entrar no banco de dados. Também a mais chata, já que é necessário pensar em como tudo vai ficar disposto antes de sair inserindo os dados (a fim de evitar dores de cabeça usando ALTER TABLE aqui e ali). Fidelidade com o mundo real não é uma prioridade, então pus valores fictícios. Também não me preocupei tanto com a quantidade de entradas em cada tabela, salvo as que precisavam de coerência no preenchimento por conta dos CONSTRAINT (evitar conflito entre chaves primárias e estrangeiras). Como são desafios mais voltados para verificar se o programador tem o domínio básico sobre os comandos SQL, o número médio de entradas por tabela é 10.</p>
  <br>
  <p>Um pensamento que adotei com relação ao preenchimento de tabelas neste desafio foi com relação a tabela 'balanco_de_vendas'. Como são 10 produtos e cada produto está em cada um dos 10 estoques, seriam 100 entradas no fim das contas. Utilizei uma função de preenchimento para adiantar o trabalho - entrada por entrada seria muito maçante. </p>


```sql
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
-- Utilizei esta função para que eu pudesse gerar os números que representassem as quantidades nos estoques
INSERT INTO `quantidade_estoque` (`estoque_id`, `produto_id`, `qtde`)
SELECT
  e.id AS estoque_id,
  p.id AS produto_id,
  ROUND(RAND() * 19) + 1 AS qtde
FROM
  `estoque` e
JOIN
  `produto` p;

/*
    É uma função relativamente simples:
    - Primeiro, invoco INSERT INTO normalmente
    - Dentro dela, escolho os ids das tabelas que quero
    - Após isso, invoco a função RAND(), que irá gerar números aleatórios entre um determinado intervalo
    - No caso, escolhi "(RAND() * 19) + 1" para ter números aleatórios entre 1 a 20
    - Feito isto, no fim utilizei um JOIN para juntar as tabelas para que tudo funcione
    - E voilá!
*/
```

  <h2 id="codigo_select">Terceira fase: SELECT FROM</h2>
  <p>Se a fase anterior foi maçante, essa foi a mais divertida. O trabalho de um profissional dos dados é, sobretudo, saber analisar e tirar conclusões do que vê. E, pra isso, temos que ter em mente a dimensão dos dados que pretendemos obter - onde eles podem estar localizados, que cara eles podem ter, que tipo de dado pode ser, o tamanho deles e assim por diante..</p>
  <i>E como obter o que queremos ver?<br>
  Sabendo como pedir o que queremos ter.</i><br>
  <br>
  <p>Realizei um total de 10 queries - imagino que outras pessoas fizeram bem mais do que isso. Fiz o melhor para oscilar entre o simples e o complexo, tanto que vou explicar cada conceito que usei em cada consulta, pra fins didáticos.</p>

  ```sql
/* 1. Liste todos os clientes com suas informações de nome, endereço e
telefone, ordenados por nome, e exiba os telefones no formato (xx) xxxx-xxxx:*/

SELECT nome, endereco, 
CONCAT('(', SUBSTRING(telefone, 1, 2), ') ', SUBSTRING(telefone, 3, 4), '-', SUBSTRING(telefone, 7, 4)) AS telefone
FROM cliente
ORDER BY nome DESC;

-- Conceitos usados: SELECT, CONCAT, SUBSTRING, FROM, ORDER BY, DESC
  ```
<table>
  <tr>
    <th>nome</th>
    <th>endereco</th>
    <th>telefone</th>
  </tr>
  <tr>
    <td>Albertino Gama</td>
    <td>Avenida da Coragem, 888 - Manaus/AM</td>
    <td>(92) 2255-4477</td>
  </tr>
  <tr>
    <td>Ana Cláudia Lopes</td>
    <td>Avenida Principal, 456 - Rio de Janeiro/RJ</td>
    <td>(21) 9876-5432</td>
  </tr>
  <tr>
    <td>Brakestore S/A</td>
    <td>Rua da Velocidade, 999 - Salvador/BA</td>
    <td>(71) 2685-8754</td>
  </tr>
  <tr>
    <td>Brincadeira de Criança LTDA</td>
    <td>Rua da Infância, 789 - Belo Horizonte/MG</td>
    <td>(31) 2356-8454</td>
  </tr>
  <tr>
    <td>Eugênio Dutra</td>
    <td>Rua das Flores, 555 - Brasília/DF</td>
    <td>(61) 2874-6625</td>
  </tr>
  <tr>
    <td>Fernão & Marelli Eireli</td>
    <td>Avenida Comercial, 101 - Porto Alegre/RS</td>
    <td>(51) 9876-5331</td>
  </tr>
  <tr>
    <td>Lojas Mais S/A</td>
    <td>Rua das Oportunidades, 222 - Curitiba/PR</td>
    <td>(41) 9925-3147</td>
  </tr>
  <tr>
    <td>Marina Brandão Vargas</td>
    <td>Avenida Beira-Mar, 777 - Recife/PE</td>
    <td>(81) 9987-4548</td>
  </tr>
  <tr>
    <td>Rápido Calçados LTDA</td>
    <td>Avenida dos Sapatos, 333 - Fortaleza/CE</td>
    <td>(85) 2345-7893</td>
  </tr>
  <tr>
    <td>Zé Maria</td>
    <td>Rua das Flores, 123 - São Paulo/SP</td>
    <td>(11) 2345-6789</td>
  </tr>
</table>

```sql
/* 2. Exiba o nome e o total de vendas feitas por cada cliente que gastou mais 
de $100, ordenados pelo total de vendas em ordem decrescente: */

SELECT c.nome, SUM(v.total) AS total_vendas
FROM cliente AS c
JOIN venda AS v ON c.cliente_id = v.cliente_id
GROUP BY c.nome
HAVING total_vendas > 100
ORDER BY total_vendas DESC;

-- Conceitos usados: SELECT, SUM(), AS, FROM, JOIN, ON, GROUP BY, HAVING, ORDER BY, DESC

```

<table>
  <tr>
    <th>nome</th>
    <th>total_vendas</th>
  </tr>
  <tr>
    <td>Brincadeira de Criança LTDA</td>
    <td>490.90</td>
  </tr>
  <tr>
    <td>Albertino Gama</td>
    <td>389.94</td>
  </tr>
  <tr>
    <td>Brakestore S/A</td>
    <td>384.93</td>
  </tr>
  <tr>
    <td>Zé Maria</td>
    <td>329.93</td>
  </tr>
  <tr>
    <td>Eugênio Dutra</td>
    <td>326.92</td>
  </tr>
  <tr>
    <td>Rápido Calçados LTDA</td>
    <td>184.97</td>
  </tr>
  <tr>
    <td>Fernão & Marelli Eireli</td>
    <td>161.93</td>
  </tr>
  <tr>
    <td>Marina Brandão Vargas</td>
    <td>155.94</td>
  </tr>
  <tr>
    <td>Lojas Mais S/A</td>
    <td>154.96</td>
  </tr>
</table>

```sql
/* 3. Liste todos os produtos e suas categorias com uma coluna adicional que 
mostre o preço médio dos produtos naquela categoria, ordenados por categoria e com as casas
decimais depois do ponto sendo apenas duas */

SELECT p.nome, p.categoria, ROUND(AVG(p.preco), 2) AS preco_medio
FROM produto AS p
GROUP BY p.categoria
ORDER BY p.categoria;


-- Conceitos utilizados: SELECT, ROUND, AVG (funções aninhadas), AS, FROM, GROUP BY, ORDER BY 
```

<table>
  <thead>
    <tr>
      <th>categoria</th>
      <th>preco_medio</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Bolsa de Couro</td>
      <td>69.99</td>
    </tr>
    <tr>
      <td>Óleo Automotivo 10W40</td>
      <td>59.99</td>
    </tr>
    <tr>
      <td>Abajur Florido</td>
      <td>129.99</td>
    </tr>
    <tr>
      <td>Regata tam G</td>
      <td>30.59</td>
    </tr>
    <tr>
      <td>Escrivaninha branca</td>
      <td>169.99</td>
    </tr>
    <tr>
      <td>Smartphone G5</td>
      <td>574.99</td>
    </tr>
  </tbody>
</table>

```sql
/* 4. Recupere o nome dos clientes que fizeram compras 
após 1º de janeiro de 2023 e gastaram mais de $50, ordenados 
por data de compra e exiba o total gasto: */

SELECT c.nome, SUM(v.total) AS total_gasto
FROM cliente AS c
JOIN venda AS v ON c.cliente_id = v.cliente_id
WHERE v.data_venda > '2023-01-01' AND v.total > 50
GROUP BY c.nome
ORDER BY v.data_venda;

-- Conceitos utilizados: SELECT, SUM, AS, FROM, JOIN, ON, WHERE, AND, GROUP BY, ORDER BY
```
<table>
  <thead>
    <tr>
      <th>nome</th>
      <th>total_gasto</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Eugênio Dutra</td>
      <td>281.93</td>
    </tr>
    <tr>
      <td>Brakestore S/A</td>
      <td>159.97</td>
    </tr>
    <tr>
      <td>Zé Maria</td>
      <td>269.95</td>
    </tr>
    <tr>
      <td>Fernão & Marelli Eireli</td>
      <td>131.94</td>
    </tr>
    <tr>
      <td>Albertino Gama</td>
      <td>179.97</td>
    </tr>
    <tr>
      <td>Marina Brandão Vargas</td>
      <td>59.98</td>
    </tr>
    <tr>
      <td>Brincadeira de Criança LTDA</td>
      <td>134.97</td>
    </tr>
  </tbody>
</table>

```sql
/* 5.Liste todos os fornecedores e o número de produtos diferentes que 
eles fornecem, ordenados pelo número de produtos em ordem decrescente: */

SELECT f.descricao, COUNT(DISTINCT p.id) AS num_produtos
FROM fornecedor AS f
LEFT JOIN produto AS p ON f.id = p.fornecedor_id
GROUP BY f.descricao
ORDER BY num_produtos DESC;

-- Conceitos utilizados: SELECT, AS, FROM, LEFT JOIN, GROUP BY, ORDER BY
```

<table>
  <thead>
    <tr>
      <th>descricao</th>
      <th>num_produtos</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Tim Ramos</td>
      <td>2</td>
    </tr>
    <tr>
      <td>Litoral Calçados</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Distribuidora Vivace Ltda</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Minas Fabril Ltda</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Gustavo Almeida</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Indústria Costeira S.A.</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Manauara Jeans Eireli</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Flávia Siqueira Souza</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Sotero Peças S.A</td>
      <td>1</td>
    </tr>
    <tr>
      <td>Importadora Nacional Eireli</td>
      <td>1</td>
    </tr>
  </tbody>
</table>

```sql
/* 6.Recupere o nome do cliente e o total de vendas para cada cliente que fez 
pelo menos duas compras, ordenados por total de vendas em ordem decrescente: */

SELECT c.nome, SUM(v.total) AS total_vendas
FROM cliente AS c
JOIN venda AS v ON c.cliente_id = v.cliente_id
GROUP BY c.nome
HAVING COUNT(v.cliente_id) >= 2
ORDER BY total_vendas DESC;

-- Conceitos utilizados: SELECT, SUM, AS, FROM, JOIN, ON, GROUP BY, HAVING COUNT, ORDER BY, DESC
```

<table>
  <thead>
    <tr>
      <th>nome</th>
      <th>total_vendas</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Brincadeira de Criança LTDA</td>
      <td>490.90</td>
    </tr>
    <tr>
      <td>Albertino Gama</td>
      <td>389.94</td>
    </tr>
    <tr>
      <td>Brakestore S/A</td>
      <td>384.93</td>
    </tr>
    <tr>
      <td>Zé Maria</td>
      <td>329.93</td>
    </tr>
    <tr>
      <td>Eugênio Dutra</td>
      <td>326.92</td>
    </tr>
    <tr>
      <td>Rápido Calçados LTDA</td>
      <td>184.97</td>
    </tr>
    <tr>
      <td>Fernão & Marelli Eireli</td>
      <td>161.93</td>
    </tr>
    <tr>
      <td>Marina Brandão Vargas</td>
      <td>155.94</td>
    </tr>
    <tr>
      <td>Lojas Mais S/A</td>
      <td>154.96</td>
    </tr>
    <tr>
      <td>Ana Cláudia Lopes</td>
      <td>89.98</td>
    </tr>
  </tbody>
</table>

```sql
/* 7.Liste o id dos produtos com estoque disponível (quantidade > 0) e os
agrupe pela quantidade, do maior para o menor, listando se o estoque
está abaixo da média ou em um bom número (vamos supor que a média de estoque calculada
em um determinado período tenha sido de 120 unidades): */

SELECT q.produto_id, SUM(qtde) as qtde,
  CASE
    WHEN SUM(qtde) < 120 THEN 'Abaixo do estoque'
    WHEN SUM(qtde) = 120 THEN 'Na média'
    ELSE 'Acima do estoque'
  END AS situacao
FROM quantidade_estoque q
GROUP BY produto_id
ORDER BY qtde DESC;

--Conceitos utilizados: SELECT, CASE/WHEN/THEN/ELSE/END AS, FROM, JOIN, ON, WHERE, GROUP BY, ORDER BY
```

<table>
  <thead>
    <tr>
      <th>produto_id</th>
      <th>qtde Descendente 1</th>
      <th>situacao</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>161</td>
      <td>Acima do estoque</td>
    </tr>
    <tr>
      <td>9</td>
      <td>133</td>
      <td>Acima do estoque</td>
    </tr>
    <tr>
      <td>6</td>
      <td>130</td>
      <td>Acima do estoque</td>
    </tr>
    <tr>
      <td>2</td>
      <td>112</td>
      <td>Abaixo do estoque</td>
    </tr>
    <tr>
      <td>11</td>
      <td>111</td>
      <td>Abaixo do estoque</td>
    </tr>
    <tr>
      <td>7</td>
      <td>108</td>
      <td>Abaixo do estoque</td>
    </tr>
    <tr>
      <td>5</td>
      <td>107</td>
      <td>Abaixo do estoque</td>
    </tr>
    <tr>
      <td>3</td>
      <td>102</td>
      <td>Abaixo do estoque</td>
    </tr>
    <tr>
      <td>8</td>
      <td>102</td>
      <td>Abaixo do estoque</td>
    </tr>
    <tr>
      <td>10</td>
      <td>96</td>
      <td>Abaixo do estoque</td>
    </tr>
    <tr>
      <td>4</td>
      <td>73</td>
      <td>Abaixo do estoque</td>
    </tr>
  </tbody>
</table>



```sql
/* 8.Recupere o nome das transportadoras e a média de avaliações das entregas 
realizadas por cada uma, ordenadas por avaliação em ordem decrescente, listando
apenas quem tem mais de uma entrega realizada: */

SELECT t.nome AS Transportadora,
    CASE
        WHEN t.avaliacao >= 8 THEN 'Boa'
        WHEN t.avaliacao >= 5 THEN 'Média'
        ELSE 'Ruim'
    END AS Classificacao, COUNT(e.id) AS Quantidade_Entregas
FROM transportadora t
LEFT JOIN entrega e ON t.id = e.transportadora_id
GROUP BY t.nome, Classificacao
HAVING Quantidade_Entregas > 1
ORDER BY t.nome;

-- Conceitos utilizados: SELECT, AS, CASE, WHEN/ELSE/END AS, FROM, LEFT JOIN, GROUP BY, HAVING, ORDER BY
```

<table>
  <thead>
    <tr>
      <th>Transportadora</th>
      <th>Classificacao</th>
      <th>Quantidade_Entregas</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Azul Cargo</td>
      <td>Boa</td>
      <td>3</td>
    </tr>
    <tr>
      <td>Correios</td>
      <td>Média</td>
      <td>3</td>
    </tr>
    <tr>
      <td>Gollog</td>
      <td>Boa</td>
      <td>3</td>
    </tr>
    <tr>
      <td>SertãoLog</td>
      <td>Boa</td>
      <td>3</td>
    </tr>
    <tr>
      <td>SulLog</td>
      <td>Boa</td>
      <td>3</td>
    </tr>
    <tr>
      <td>TAM Cargo</td>
      <td>Média</td>
      <td>3</td>
    </tr>
    <tr>
      <td>Total Express</td>
      <td>Ruim</td>
      <td>3</td>
    </tr>
    <tr>
      <td>TransBrasília</td>
      <td>Média</td>
      <td>4</td>
    </tr>
    <tr>
      <td>TransNordestina</td>
      <td>Boa</td>
      <td>3</td>
    </tr>
    <tr>
      <td>TransSul</td>
      <td>Média</td>
      <td>3</td>
    </tr>
  </tbody>
</table>

```sql
/* 9.Liste os clientes e a quantidade de compras feitas por cada um, apenas para clientes 
que compraram mais de três vezes, ordenados pela quantidade de compras em ordem decrescente: */

SELECT c.nome, COUNT(v.id) AS num_compras
FROM cliente AS c
LEFT JOIN venda AS v ON c.cliente_id = v.cliente_id
GROUP BY c.nome
HAVING num_compras > 3
ORDER BY num_compras DESC;

-- Conceitos utilizados: SELECT, COUNT, AS, FROM, LEFT JOIN, ON, HAVING, ORDER BY
```
<table>
  <thead>
    <tr>
      <th>nome</th>
      <th>num_compras</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Brakestore S/A</td>
      <td>4</td>
    </tr>
    <tr>
      <td>Lojas Mais S/A</td>
      <td>4</td>
    </tr>
    <tr>
      <td>Brincadeira de Criança LTDA</td>
      <td>4</td>
    </tr>
  </tbody>
</table>

```sql
/* 10. Recupere o nome do cliente e o total de vendas para cada cliente que fez compras com 
pagamento em dinheiro, ordenados por total de vendas em ordem decrescente: */

SELECT c.nome, SUM(v.total) AS total_vendas
FROM cliente AS c
JOIN venda AS v ON c.cliente_id = v.cliente_id
JOIN tipo_pgto AS tp ON v.tipo_pgto_id = tp.id
WHERE tp.forma_pgto = 'Dinheiro'
GROUP BY c.nome
ORDER BY total_vendas DESC;

-- Conceitos utilizados: SELECT, SUM, AS, FROM, JOIN, ON, WHERE, GROUP BY, ORDER BY, DESC
```
<table>
  <thead>
    <tr>
      <th>nome</th>
      <th>total_vendas</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Zé Maria</td>
      <td>209.97</td>
    </tr>
    <tr>
      <td>Eugênio Dutra</td>
      <td>209.97</td>
    </tr>
    <tr>
      <td>Rápido Calçados LTDA</td>
      <td>139.98</td>
    </tr>
    <tr>
      <td>Brincadeira de Criança LTDA</td>
      <td>134.97</td>
    </tr>
    <tr>
      <td>Lojas Mais S/A</td>
      <td>59.98</td>
    </tr>
    <tr>
      <td>Fernão & Marelli Eireli</td>
      <td>29.99</td>
    </tr>
  </tbody>
</table>

<h2>O que podemos concluir?</h2>
<ul>
  <li>Os clientes que mais realizaram compras foram clientes jurídicos.</li>
  <li>Porém pessoas físicas possuem um poder aquisitivo muito bom, já que ocuparam ótimas posições nos rankings de venda.</li>
  <li>De cara, se vê que o índice de retenção é bom, já que muitos clientes retornaram para fazer compras em períodos distintos.</li>
  <li>É necessária uma revisão no estoque, já que boa parte do estoque se encontra abaixo da média esperada.</li>
  <li>O que também acarreta em um ponto bom, já que a demanda aumentou e, com isso, a margem de lucro também.</li>
</ul>

<p>E é isso. Algumas breves conclusões podem ser tiradas de todos os dados obtidos. Optei por 5 observações por acreditar ser o suficiente por enquanto. Obviamente poderíamos tirar muito mais insights (por exemplo, criar um "hotmap" de regiões por lucro, estabelecer uma correlação entre atrasos nas entregas e feriados, como o desvio padrão de algumas variáveis se parece, uma análise de pareto para entendermos quais produtos oferecem uma maior margem de lucro, etc).</p>
<p>Posteriormente, irei escrever sobre os desafios na plataforma Medium e postarei no meu LinkedIn. Tanto este projeto como o outro estarão disponíveis no formato <i>.sql</i>. Se leu até aqui, aceito feedbacks e você tem o meu muito obrigado!</p>
</body>
</html>
