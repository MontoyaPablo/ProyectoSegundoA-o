
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;


DROP TABLE IF EXISTS `mydb`.`Category` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Category` (
  `idCategory` INT NOT NULL,
  `categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Cod_Condition` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cod_Condition` (
  `idCod_Condition` INT NOT NULL AUTO_INCREMENT,
  `precio` INT NULL,
  `condicionDeCambio` VARCHAR(100) NULL,
  PRIMARY KEY (`idCod_Condition`),
  UNIQUE INDEX `idCod_Condition_UNIQUE` (`idCod_Condition` ASC) VISIBLE)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Domicilio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Domicilio` (
  `idDomicilio` INT NOT NULL,
  `ciudad` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `codigoPostal` INT NULL,
  PRIMARY KEY (`idDomicilio`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`NivelUser` ;

CREATE TABLE IF NOT EXISTS `mydb`.`NivelUser` (
  `idNivelUser` TINYINT NOT NULL,
  PRIMARY KEY (`idNivelUser`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Payment` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `idPayment` INT NOT NULL AUTO_INCREMENT,
  `trade` VARCHAR(45) NULL,
  `pay` VARCHAR(45) NULL,
  PRIMARY KEY (`idPayment`),
  UNIQUE INDEX `idPayment_UNIQUE` (`idPayment` ASC) VISIBLE)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Product` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `idProduct` INT NOT NULL AUTO_INCREMENT,
  `tittle` VARCHAR(45) NOT NULL,
  `descripcionProducto` VARCHAR(150) NOT NULL,
  `imagenProducto` LONGBLOB NULL,
  `Users_idUsers` INT UNSIGNED NOT NULL,
  `Category_idCategory` INT NOT NULL,
  `Cod_Condition_idCod_Condition` INT NOT NULL,
  `Statement_idStatement` INT NOT NULL,
  PRIMARY KEY (`idProduct`),
  UNIQUE INDEX `idProduct_UNIQUE` (`idProduct` ASC) VISIBLE,
  INDEX `fk_Product_Category_idx` (`Category_idCategory` ASC) VISIBLE,
  INDEX `fk_Product_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  INDEX `fk_Product_Cod_Condition1_idx` (`Cod_Condition_idCod_Condition` ASC) VISIBLE,
  INDEX `fk_Product_Statement1_idx` (`Statement_idStatement` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Category`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `mydb`.`Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Cod_Condition1`
    FOREIGN KEY (`Cod_Condition_idCod_Condition`)
    REFERENCES `mydb`.`Cod_Condition` (`idCod_Condition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_Statement1`
    FOREIGN KEY (`Statement_idStatement`)
    REFERENCES `mydb`.`Statement` (`idStatement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Statement` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Statement` (
  `idStatement` INT NOT NULL,
  `estadoDelProducto` VARCHAR(45) NULL,
  PRIMARY KEY (`idStatement`))
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Trade` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Trade` (
  `idTrade` INT NOT NULL AUTO_INCREMENT,
  `fechaTrade` DATETIME NOT NULL,
  `Users_idUsers` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTrade`),
  UNIQUE INDEX `idTrade_UNIQUE` (`idTrade` ASC) VISIBLE,
  INDEX `fk_Trade_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  CONSTRAINT `fk_Trade_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Trade_Product` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Trade_Product` (
  `idTradeProduct` INT NOT NULL AUTO_INCREMENT,
  `Trade_idTrade` INT NOT NULL,
  `Product_idProduct` INT NOT NULL,
  `Payment_idPayment` INT NOT NULL,
  INDEX `fk_Users_has_Trade_Trade1_idx` (`Trade_idTrade` ASC) VISIBLE,
  PRIMARY KEY (`idTradeProduct`),
  INDEX `fk_Trade_Product_Product1_idx` (`Product_idProduct` ASC) VISIBLE,
  INDEX `fk_Trade_Product_Payment1_idx` (`Payment_idPayment` ASC) VISIBLE,
  CONSTRAINT `fk_Users_has_Trade_Trade1`
    FOREIGN KEY (`Trade_idTrade`)
    REFERENCES `mydb`.`Trade` (`idTrade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trade_Product_Product1`
    FOREIGN KEY (`Product_idProduct`)
    REFERENCES `mydb`.`Product` (`idProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trade_Product_Payment1`
    FOREIGN KEY (`Payment_idPayment`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`UserPerfil` ;

CREATE TABLE IF NOT EXISTS `mydb`.`UserPerfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `tel` INT NULL,
  `fechaDeNacimiento` DATETIME NOT NULL,
  `Users_idUsers` INT UNSIGNED NOT NULL,
  `Domicilio_idDomicilio` INT NOT NULL,
  PRIMARY KEY (`idPerfil`),
  UNIQUE INDEX `idUsers_UNIQUE` (`idPerfil` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_UserPerfil_Users1_idx` (`Users_idUsers` ASC) VISIBLE,
  INDEX `fk_UserPerfil_Domicilio2_idx` (`Domicilio_idDomicilio` ASC) VISIBLE,
  CONSTRAINT `fk_UserPerfil_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `mydb`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserPerfil_Domicilio2`
    FOREIGN KEY (`Domicilio_idDomicilio`)
    REFERENCES `mydb`.`Domicilio` (`idDomicilio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`Users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `idUsers` INT UNSIGNED NOT NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `NivelUser_idNivelUser` TINYINT NOT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE INDEX `idUsers_UNIQUE` (`idUsers` ASC) VISIBLE,
  INDEX `fk_Users_NivelUser1_idx` (`NivelUser_idNivelUser` ASC) VISIBLE,
  CONSTRAINT `fk_Users_NivelUser1`
    FOREIGN KEY (`NivelUser_idNivelUser`)
    REFERENCES `mydb`.`NivelUser` (`idNivelUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


DROP TABLE IF EXISTS `mydb`.`mercadopago` ;

CREATE TABLE IF NOT EXISTS `mydb`.`mercadopago` (
  `Payment_idPayment` INT NOT NULL,
  PRIMARY KEY (`Payment_idPayment`),
  CONSTRAINT `fk_table1_Payment1`
    FOREIGN KEY (`Payment_idPayment`)
    REFERENCES `mydb`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


