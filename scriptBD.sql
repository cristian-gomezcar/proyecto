-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema gidora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gidora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gidora` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `gidora` ;

-- -----------------------------------------------------
-- Table `gidora`.`agente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gidora`.`agente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre1` VARCHAR(45) NULL DEFAULT NULL,
  `nombre2` VARCHAR(45) NULL DEFAULT NULL,
  `apellido1` VARCHAR(45) NULL DEFAULT NULL,
  `apellido2` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NULL DEFAULT NULL,
  `direccion` VARCHAR(45) NULL DEFAULT NULL,
  `usuario` VARCHAR(45) NULL DEFAULT NULL,
  `contra` VARCHAR(45) NULL DEFAULT NULL,
  `codigo` VARCHAR(45) NULL DEFAULT NULL,
  `saldo` VARCHAR(45) NULL DEFAULT NULL,
  `ganancias` VARCHAR(45) NULL DEFAULT NULL,
  `registro` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gidora`.`beneficiario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gidora`.`beneficiario` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` VARCHAR(45) NOT NULL,
  `segundo_nombre` VARCHAR(45) NULL DEFAULT NULL,
  `primer_apellido` VARCHAR(45) NULL DEFAULT NULL,
  `segundo_apellido` VARCHAR(45) NULL DEFAULT NULL,
  `dpi` BIGINT(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gidora`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gidora`.`cliente` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `primer_nombre` VARCHAR(45) NOT NULL,
  `segundo_nombre` VARCHAR(45) NULL DEFAULT NULL,
  `primer_apellido` VARCHAR(45) NOT NULL,
  `segundo_apellido` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gidora`.`transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gidora`.`transaccion` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `pin` VARCHAR(45) NOT NULL,
  `monto` VARCHAR(45) NOT NULL,
  `fecha_giro` DATETIME NOT NULL,
  `origen` VARCHAR(45) NOT NULL,
  `destino` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL DEFAULT 'Sin cobrar',
  `fecha_cobro` VARCHAR(45) NOT NULL DEFAULT 'Sin cobrar',
  `destino_fondos` VARCHAR(45) NOT NULL,
  `parentesco` VARCHAR(45) NOT NULL,
  `beneficiario_id` INT(11) NOT NULL,
  `cliente_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `pin_UNIQUE` (`pin` ASC),
  INDEX `fk_transaccion_beneficiario_idx` (`beneficiario_id` ASC),
  INDEX `fk_transaccion_cliente1_idx` (`cliente_id` ASC),
  CONSTRAINT `fk_transaccion_beneficiario`
    FOREIGN KEY (`beneficiario_id`)
    REFERENCES `gidora`.`beneficiario` (`id`),
  CONSTRAINT `fk_transaccion_cliente1`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `gidora`.`cliente` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gidora`.`ganancias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gidora`.`ganancias` (
  `id` INT(11) NOT NULL,
  `fecha` VARCHAR(45) NULL DEFAULT NULL,
  `monto` DOUBLE NULL DEFAULT NULL,
  `transaccion_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ganancias_transaccion1_idx` (`transaccion_id` ASC),
  CONSTRAINT `fk_ganancias_transaccion1`
    FOREIGN KEY (`transaccion_id`)
    REFERENCES `gidora`.`transaccion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
