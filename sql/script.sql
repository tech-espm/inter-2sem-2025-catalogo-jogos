-- Caso ocorra algum problema no login, executar o código abaixo, para arrumar a senha do usuário root:
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

-- Esse script vale para o MySQL 8.x. Se seu MySQL for 5.x, precisa executar essa linha comentada:
-- CREATE DATABASE IF NOT EXISTS catalogojogos;
CREATE DATABASE IF NOT EXISTS catalogojogos DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_0900_ai_ci;

USE catalogojogos;


CREATE TABLE IF NOT EXISTS `catalogojogos`.`PLATAFORMA` (
  `id_plataforma` INT NOT NULL,
  `nm_plataforma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_plataforma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catalogojogos`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalogojogos`.`USUARIO` (
  `id_usuario` INT NOT NULL,
  `nm_usuario` VARCHAR(45) NOT NULL,
  `email_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catalogojogos`.`SUBGENERO_JOGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalogojogos`.`SUBGENERO_JOGO` (
  `id_subgenero` INT NOT NULL,
  `nm_subgenero` VARCHAR(45) NOT NULL,
  `desc_subgenero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_subgenero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catalogojogos`.`GENERO_JOGO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalogojogos`.`GENERO_JOGO` (
  `id_genero_jogo` INT NOT NULL,
  `nm_genero_jogo` VARCHAR(45) NOT NULL,
  `desc_genero_jogo` VARCHAR(45) NOT NULL,
  `id_subgenero` INT NOT NULL,
  PRIMARY KEY (`id_genero_jogo`),
  INDEX `id_subgenero_idx` (`id_subgenero` ASC),
  CONSTRAINT `id_subgenero`
    FOREIGN KEY (`id_subgenero`)
    REFERENCES `catalogojogos`.`SUBGENERO_JOGO` (`id_subgenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catalogojogos`.`ESTÚDIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalogojogos`.`ESTÚDIO` (
  `id_estudio` INT NOT NULL,
  `nm_estudio` VARCHAR(45) NOT NULL,
  `pais_estudio` VARCHAR(45) NULL,
  PRIMARY KEY (`id_estudio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catalogojogos`.`IDIOMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalogojogos`.`IDIOMA` (
  `id_idioma` INT NOT NULL,
  `nm_idioma` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_idioma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catalogojogos`.`JOGOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalogojogos`.`JOGOS` (
  `id_jogo` INT NOT NULL,
  `id_genero_jogo` INT NOT NULL,
  `id_plataforma` INT NOT NULL,
  `id_estudio` INT NOT NULL,
  `id_idioma` INT NOT NULL,
  `nm_jogo` VARCHAR(45) NOT NULL,
  `nota_jogo` FLOAT NOT NULL,
  `duracao_jogo` INT NOT NULL,
  `classIndicativa_jogo` VARCHAR(45) NOT NULL,
  `desc_jogo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_jogo`),
  INDEX `id_genero_jogo_idx` (`id_genero_jogo` ASC),
  INDEX `id_plataforma_idx` (`id_plataforma` ASC),
  INDEX `id_estudio_idx` (`id_estudio` ASC),
  INDEX `id_idioma_idx` (`id_idioma` ASC),
  CONSTRAINT `id_genero_jogo`
    FOREIGN KEY (`id_genero_jogo`)
    REFERENCES `catalogojogos`.`GENERO_JOGO` (`id_genero_jogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_plataforma`
    FOREIGN KEY (`id_plataforma`)
    REFERENCES `catalogojogos`.`PLATAFORMA` (`id_plataforma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_estudio`
    FOREIGN KEY (`id_estudio`)
    REFERENCES `catalogojogos`.`ESTÚDIO` (`id_estudio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_idioma`
    FOREIGN KEY (`id_idioma`)
    REFERENCES `catalogojogos`.`IDIOMA` (`id_idioma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catalogojogos`.`AVALIACOES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catalogojogos`.`AVALIACOES` (
  `id_avaliacao` INT NOT NULL,
  `id_usuario` INT NOT NULL,
  `nota_avaliacao` FLOAT NOT NULL,
  `desc_avaliacao` VARCHAR(45) NULL,
  `id_jogo` INT NOT NULL,
  PRIMARY KEY (`id_avaliacao`),
  INDEX `id_usuario_idx` (`id_usuario` ASC),
  INDEX `id_jogo_idx` (`id_jogo` ASC),
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `catalogojogos`.`USUARIO` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_jogo`
    FOREIGN KEY (`id_jogo`)
    REFERENCES `catalogojogos`.`JOGOS` (`id_jogo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
