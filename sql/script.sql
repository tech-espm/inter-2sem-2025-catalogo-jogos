-- Script SQL Completo: Criação do Banco de Dados e Inserção de Dados
-- Baseado em pasted_content.txt (estrutura) e pasted_content_2.txt (dados)

-- 1. Configuração Inicial e Criação do Banco de Dados
-- 1. Configuração Inicial e Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS catalogojogos ;
USE catalogojogos;



-- 2. Criação das Tabelas (Ordem ajustada para respeitar dependências)

-- 2.1. Tabela `catalogojogos`.`PLATAFORMA`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`PLATAFORMA` (
  `id_plataforma` INT NOT NULL,
  `nm_plataforma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_plataforma`))
ENGINE = InnoDB;

-- 2.2. Tabela `catalogojogos`.`USUARIO`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`USUARIO` (
  `id_usuario` INT NOT NULL,
  `nm_usuario` VARCHAR(30) NOT NULL,
  `email_usuario` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;

-- 2.3. Tabela `catalogojogos`.`SUBGENERO_JOGO`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`SUBGENERO_JOGO` (
  `id_subgenero` INT NOT NULL,
  `nm_subgenero` VARCHAR(100) NOT NULL,
  `desc_subgenero` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_subgenero`))
ENGINE = InnoDB;

-- 2.4. Tabela `catalogojogos`.`GENERO_JOGO` (Depende de SUBGENERO_JOGO)
CREATE TABLE IF NOT EXISTS `catalogojogos`.`GENERO_JOGO` (
  `id_genero_jogo` INT NOT NULL,
  `nm_genero_jogo` VARCHAR(45) NOT NULL,
  `desc_genero_jogo` VARCHAR(255) NOT NULL,
  `id_subgenero` INT NOT NULL,
  PRIMARY KEY (`id_genero_jogo`),
  INDEX `id_subgenero_idx` (`id_subgenero` ASC),
  CONSTRAINT `fk_genero_subgenero`
    FOREIGN KEY (`id_subgenero`)
    REFERENCES `catalogojogos`.`SUBGENERO_JOGO` (`id_subgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 2.5. Tabela `catalogojogos`.`ESTÚDIO`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`ESTÚDIO` (
  `id_estudio` INT NOT NULL,
  `nm_estudio` VARCHAR(255) NOT NULL,
  `pais_estudio` VARCHAR(50) NULL,
  PRIMARY KEY (`id_estudio`))
ENGINE = InnoDB;

-- 2.6. Tabela `catalogojogos`.`IDIOMA`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`IDIOMA` (
  `id_idioma` INT NOT NULL,
  `nm_idioma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_idioma`))
ENGINE = InnoDB;

-- 2.7. Tabela `catalogojogos`.`JOGOS` (Depende de GENERO_JOGO, PLATAFORMA, ESTÚDIO, IDIOMA)
-- Usando a estrutura final sem a coluna `nota_jogo`, conforme indicado no final do pasted_content.txt
CREATE TABLE IF NOT EXISTS `catalogojogos`.`JOGOS` (
  `id_jogo` INT NOT NULL AUTO_INCREMENT,
  `id_genero_jogo` INT NOT NULL,
  `id_plataforma` INT NOT NULL,
  `id_estudio` INT NOT NULL,
  `id_idioma` INT NOT NULL,
  `nm_jogo` VARCHAR(255) NOT NULL, -- Aumentado para 255 para consistência
  `duracao_jogo` INT NOT NULL,
  `classIndicativa_jogo` VARCHAR(45) NOT NULL, -- Aumentado para 45 para consistência
  `desc_jogo` VARCHAR(300) NOT NULL,
  `dt_lancamento` DATE NULL,
  PRIMARY KEY (`id_jogo`),
  INDEX `id_genero_jogo_idx` (`id_genero_jogo` ASC),
  INDEX `id_plataforma_idx` (`id_plataforma` ASC),
  INDEX `id_estudio_idx` (`id_estudio` ASC),
  INDEX `id_idioma_idx` (`id_idioma` ASC),
  INDEX `dt_lancamento_idx` (`dt_lancamento`),
  CONSTRAINT `fk_jogo_genero`
    FOREIGN KEY (`id_genero_jogo`)
    REFERENCES `catalogojogos`.`GENERO_JOGO` (`id_genero_jogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogo_plataforma`
    FOREIGN KEY (`id_plataforma`)
    REFERENCES `catalogojogos`.`PLATAFORMA` (`id_plataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogo_estudio`
    FOREIGN KEY (`id_estudio`)
    REFERENCES `catalogojogos`.`ESTÚDIO` (`id_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogo_idioma`
    FOREIGN KEY (`id_idioma`)
    REFERENCES `catalogojogos`.`IDIOMA` (`id_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 2.8. Tabela `catalogojogos`.`AVALIACOES` (Depende de USUARIO e JOGOS)
CREATE TABLE IF NOT EXISTS `catalogojogos`.`AVALIACOES` (
  `id_avaliacao` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `nota_avaliacao` FLOAT NOT NULL,
  `desc_avaliacao` VARCHAR(300) NULL,
  `id_jogo` INT NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  INDEX `id_jogo_idx` (`id_jogo` ASC),
  CONSTRAINT `fk_avaliacao_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `catalogojogos`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avaliacao_jogo`
    FOREIGN KEY (`id_jogo`)
    REFERENCES `catalogojogos`.`JOGOS` (`id_jogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


