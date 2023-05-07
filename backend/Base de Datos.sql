-- MySQL Script generated by MySQL Workbench
-- Sun May  7 20:11:29 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`niveluser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`niveluser` (
  `idNivelUser` TINYINT NOT NULL,
  PRIMARY KEY (`idNivelUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idUsers` INT UNSIGNED NOT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `NivelUser_idNivelUser` TINYINT NOT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE INDEX `idUsers_UNIQUE` (`idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_Users_NivelUser1`
    FOREIGN KEY (`NivelUser_idNivelUser`)
    REFERENCES `mydb`.`niveluser` (`idNivelUser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`userperfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`userperfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `tel` INT NULL DEFAULT NULL,
  `fechaDeNacimiento` DATETIME NOT NULL,
  `Users_idUsers` INT UNSIGNED NOT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `provincia` VARCHAR(45) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `codigoPostal` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idPerfil`),
  UNIQUE INDEX `idUsers_UNIQUE` (`idPerfil` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_UserPerfil_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`users` (`idUsers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carrito` (
  `id_movimiento` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `id_comprador` INT NOT NULL,
  PRIMARY KEY (`id_movimiento`),
  CONSTRAINT `CarritoComprador`
    FOREIGN KEY (`id_comprador`)
    REFERENCES `mydb`.`userperfil` (`idPerfil`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `idCategory` INT NOT NULL,
  `categoria` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`cod_condition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cod_condition` (
  `idCod_Condition` INT NOT NULL AUTO_INCREMENT,
  `precio` INT NULL DEFAULT NULL,
  `condicionDeCambio` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idCod_Condition`),
  UNIQUE INDEX `idCod_Condition_UNIQUE` (`idCod_Condition` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`statement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`statement` (
  `idStatement` INT NOT NULL,
  `estadoDelProducto` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idStatement`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `tittle` VARCHAR(45) NOT NULL,
  `descripcionProducto` VARCHAR(150) NOT NULL,
  `imagenProducto` LONGBLOB NULL DEFAULT NULL,
  `Users_idUsers` INT UNSIGNED NOT NULL,
  `Category_idCategory` INT NOT NULL,
  `Cod_Condition_idCod_Condition` INT NOT NULL,
  `Statement_idStatement` INT NOT NULL,
  PRIMARY KEY (`idProduct`),
  UNIQUE INDEX `idProduct_UNIQUE` (`idProduct` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Category`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `mydb`.`category` (`idCategory`),
  CONSTRAINT `fk_Product_Cod_Condition1`
    FOREIGN KEY (`Cod_Condition_idCod_Condition`)
    REFERENCES `mydb`.`cod_condition` (`idCod_Condition`),
  CONSTRAINT `fk_Product_Statement1`
    FOREIGN KEY (`Statement_idStatement`)
    REFERENCES `mydb`.`statement` (`idStatement`),
  CONSTRAINT `fk_Product_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`users` (`idUsers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`carrito_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`carrito_detalle` (
  `id_movimiento` INT NOT NULL,
  `id_producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` INT NOT NULL,
  `id_vendedor` INT NOT NULL,
  PRIMARY KEY (`id_movimiento`, `id_producto`),
  CONSTRAINT `Detalle_Carrito_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `mydb`.`product` (`idProduct`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Dettale_carrito`
    FOREIGN KEY (`id_movimiento`)
    REFERENCES `mydb`.`carrito` (`id_movimiento`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `producto_vendedor`
    FOREIGN KEY (`id_vendedor`)
    REFERENCES `mydb`.`userperfil` (`idPerfil`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`metodos_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`metodos_pago` (
  `Id_metodo_pago` INT NOT NULL,
  `Descripcion` INT NOT NULL,
  PRIMARY KEY (`Id_metodo_pago`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `idPayment` INT NOT NULL AUTO_INCREMENT,
  `trade` VARCHAR(45) NULL DEFAULT NULL,
  `pay` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPayment`),
  UNIQUE INDEX `idPayment_UNIQUE` (`idPayment` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`trade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trade` (
  `idTrade` INT NOT NULL AUTO_INCREMENT,
  `fechaTrade` DATETIME NOT NULL,
  `Users_idUsers` INT UNSIGNED NOT NULL,
  `Total_pago` INT NOT NULL,
  `Id_metodo_pago` INT NOT NULL,
  `Domicilio_envio` INT NOT NULL,
  PRIMARY KEY (`idTrade`),
  UNIQUE INDEX `idTrade_UNIQUE` (`idTrade` ASC) VISIBLE,
  CONSTRAINT `fk_Trade_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`users` (`idUsers`),
  CONSTRAINT `Metodo_Pago_Carrito`
    FOREIGN KEY (`Id_metodo_pago`)
    REFERENCES `mydb`.`metodos_pago` (`Id_metodo_pago`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`trade_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trade_product` (
  `Trade_idTrade` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Payment_idPayment` INT NOT NULL,
  `id_vendedor` INT NOT NULL,
  `Total_pago` INT NOT NULL,
  PRIMARY KEY (`Trade_idTrade`, `Product_idProduct`),
  INDEX `fk_Users_has_Trade_Trade1_idx` (`Trade_idTrade` ASC) VISIBLE,
  CONSTRAINT `fk_Trade_Product_Payment1`
    FOREIGN KEY (`Payment_idPayment`)
    REFERENCES `mydb`.`payment` (`idPayment`),
  CONSTRAINT `fk_Trade_Product_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`product` (`idProduct`),
  CONSTRAINT `fk_Users_has_Trade_Trade1`
    FOREIGN KEY (`Trade_idTrade`)
    REFERENCES `mydb`.`trade` (`idTrade`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;