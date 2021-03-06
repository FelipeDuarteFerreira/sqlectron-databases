-- MySQL Script generated by MySQL Workbench
-- Sun Sep 20 16:04:48 2015
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema authentication
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema authentication
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `authentication` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `authentication` ;

-- -----------------------------------------------------
-- Table `authentication`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `authentication`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(150) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `authentication`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `authentication`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rolename` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `authentication`.`users_has_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `authentication`.`users_has_role` (
  `users_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `role_id`),
  INDEX `fk_users_has_role_role1_idx` (`role_id` ASC),
  INDEX `fk_users_has_role_users_idx` (`users_id` ASC),
  CONSTRAINT `fk_users_has_role_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `authentication`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_role_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `authentication`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
