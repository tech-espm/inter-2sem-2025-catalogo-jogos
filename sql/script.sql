-- Script SQL Completo: Criação do Banco de Dados e Inserção de Dados
-- Baseado em pasted_content.txt (estrutura) e pasted_content_2.txt (dados)

-- 1. Configuração Inicial e Criação do Banco de Dados
-- 1. Configuração Inicial e Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS catalogojogos ;
USE catalogojogos;



-- 2. Criação das Tabelas (Ordem ajustada para respeitar dependências)

-- 2.1. Tabela `catalogojogos`.`plataforma`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`plataforma` (
  `id_plataforma` INT NOT NULL AUTO_INCREMENT,
  `nm_plataforma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_plataforma`))
ENGINE = InnoDB;

-- 2.2. Tabela `catalogojogos`.`usuario`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nm_usuario` VARCHAR(30) NOT NULL,
  `email_usuario` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;

-- 2.3. Tabela `catalogojogos`.`subgenero_jogo`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`subgenero_jogo` (
  `id_subgenero` INT NOT NULL AUTO_INCREMENT,
  `nm_subgenero` VARCHAR(100) NOT NULL,
  `desc_subgenero` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_subgenero`))
ENGINE = InnoDB;

-- 2.4. Tabela `catalogojogos`.`genero_jogo` (Depende de SUBGENERO_JOGO)
CREATE TABLE IF NOT EXISTS `catalogojogos`.`genero_jogo` (
  `id_genero_jogo` INT NOT NULL AUTO_INCREMENT,
  `nm_genero_jogo` VARCHAR(45) NOT NULL,
  `desc_genero_jogo` VARCHAR(255) NOT NULL,
  `id_subgenero` INT NOT NULL,
  PRIMARY KEY (`id_genero_jogo`),
  INDEX `id_subgenero_idx` (`id_subgenero` ASC),
  CONSTRAINT `fk_genero_subgenero`
    FOREIGN KEY (`id_subgenero`)
    REFERENCES `catalogojogos`.`subgenero_jogo` (`id_subgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 2.5. Tabela `catalogojogos`.`estúdio`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`estúdio` (
  `id_estudio` INT NOT NULL AUTO_INCREMENT,
  `nm_estudio` VARCHAR(255) NOT NULL,
  `pais_estudio` VARCHAR(50) NULL,
  PRIMARY KEY (`id_estudio`))
ENGINE = InnoDB;

-- 2.6. Tabela `catalogojogos`.`idioma`
CREATE TABLE IF NOT EXISTS `catalogojogos`.`idioma` (
  `id_idioma` INT NOT NULL AUTO_INCREMENT,
  `nm_idioma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_idioma`))
ENGINE = InnoDB;

-- 2.7. Tabela `catalogojogos`.`jogos` (Depende de GENERO_JOGO, PLATAFORMA, ESTÚDIO, IDIOMA)
-- Usando a estrutura final sem a coluna `nota_jogo`, conforme indicado no final do pasted_content.txt
CREATE TABLE IF NOT EXISTS `catalogojogos`.`jogos` (
  `id_jogo` INT NOT NULL AUTO_INCREMENT,
  `id_genero_jogo` INT NOT NULL,
  `id_plataforma` INT NOT NULL,
  `id_estudio` INT NOT NULL,
  `id_idioma` INT NOT NULL,
  `nm_jogo` VARCHAR(255) NOT NULL, -- Aumentado para 255 para consistência
  `duracao_jogo` INT NOT NULL,
  `classIndicativa_jogo` VARCHAR(45) NOT NULL, -- Aumentado para 45 para consistência
  `desc_jogo` VARCHAR(300) NOT NULL,
  `dt_lancamento` DATETIME NULL,
  PRIMARY KEY (`id_jogo`),
  INDEX `id_genero_jogo_idx` (`id_genero_jogo` ASC),
  INDEX `id_plataforma_idx` (`id_plataforma` ASC),
  INDEX `id_estudio_idx` (`id_estudio` ASC),
  INDEX `id_idioma_idx` (`id_idioma` ASC),
  INDEX `dt_lancamento_idx` (`dt_lancamento`),
  CONSTRAINT `fk_jogo_genero`
    FOREIGN KEY (`id_genero_jogo`)
    REFERENCES `catalogojogos`.`genero_jogo` (`id_genero_jogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogo_plataforma`
    FOREIGN KEY (`id_plataforma`)
    REFERENCES `catalogojogos`.`plataforma` (`id_plataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogo_estudio`
    FOREIGN KEY (`id_estudio`)
    REFERENCES `catalogojogos`.`estúdio` (`id_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jogo_idioma`
    FOREIGN KEY (`id_idioma`)
    REFERENCES `catalogojogos`.`idioma` (`id_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- 2.8. Tabela `catalogojogos`.`avaliacoes` (Depende de USUARIO e JOGOS)
CREATE TABLE IF NOT EXISTS `catalogojogos`.`avaliacoes` (
  `id_avaliacao` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NOT NULL,
  `nota_avaliacao` FLOAT NOT NULL,
  `desc_avaliacao` VARCHAR(300) NULL,
  `id_jogo` INT NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  INDEX `id_jogo_idx` (`id_jogo` ASC),
  CONSTRAINT `fk_avaliacao_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `catalogojogos`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_avaliacao_jogo`
    FOREIGN KEY (`id_jogo`)
    REFERENCES `catalogojogos`.`jogos` (`id_jogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `catalogojogos`.`wishlist` (
  `id_usuario` INT NOT NULL,
  `id_jogo` INT NOT NULL,
  `dt_adicionado` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);

