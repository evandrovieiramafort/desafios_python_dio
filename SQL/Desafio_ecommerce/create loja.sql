-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS bd_ecommerce;
USE bd_ecommerce;

-- Tabela cliente
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

-- Tabela cliente_pj
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

-- Tabela cliente_pf
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

-- Tabela fornecedor
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

-- Tabela fornecedor_pj
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

-- Tabela fornecedor_pf
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

-- Tabela produto
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

-- Tabela transportadora
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

-- Tabela tipo_pgto
CREATE TABLE IF NOT EXISTS `tipo_pgto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `forma_pgto` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela venda
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

-- Tabela entrega
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

-- Tabela estoque
CREATE TABLE IF NOT EXISTS `estoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- Tabela quantidade_estoque
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

-- Tabela balanco_de_vendas
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
