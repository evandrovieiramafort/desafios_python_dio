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
