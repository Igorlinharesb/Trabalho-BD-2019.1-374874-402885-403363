-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDTur
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BDTur` ;

-- -----------------------------------------------------
-- Schema BDTur
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDTur` DEFAULT CHARACTER SET utf8 ;
USE `BDTur` ;

-- -----------------------------------------------------
-- Table `BDTur`.`Cidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Cidade` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Cidade` (
  `ID_Cidade` INT(6) UNSIGNED NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `Populacao` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_Cidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Local`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Local` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Local` (
  `ID` INT(6) NOT NULL,
  `Tipo_Logradouro` VARCHAR(20) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Numero` VARCHAR(45) NOT NULL,
  `Bairro` VARCHAR(45) NOT NULL,
  `CEP` VARCHAR(45) NOT NULL,
  `Complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Restaurante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Restaurante` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Restaurante` (
  `ID_Restaurante` INT(6) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(10) NOT NULL,
  `Cidade_ID` INT(6) UNSIGNED NOT NULL,
  INDEX `fk_Restaurante_Cidade1_idx` (`Cidade_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurante_Endereco1`
    FOREIGN KEY (`ID_Restaurante`)
    REFERENCES `BDTur`.`Local` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurante_Cidade1`
    FOREIGN KEY (`Cidade_ID`)
    REFERENCES `BDTur`.`Cidade` (`ID_Cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Hotel` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Hotel` (
  `ID_Hotel` INT(6) NOT NULL,
  `Nome_Hotel` VARCHAR(45) NOT NULL,
  `Categoria` INT(1) NOT NULL,
  `Cidade_ID` INT(6) UNSIGNED NOT NULL,
  `Restaurante_ID` INT(6) NULL,
  PRIMARY KEY (`ID_Hotel`),
  INDEX `fk_Hotel_Cidade1_idx` (`Cidade_ID` ASC) VISIBLE,
  INDEX `fk_Hotel_Restaurante1_idx` (`Restaurante_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Hotel_Endereco`
    FOREIGN KEY (`ID_Hotel`)
    REFERENCES `BDTur`.`Local` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hotel_Cidade1`
    FOREIGN KEY (`Cidade_ID`)
    REFERENCES `BDTur`.`Cidade` (`ID_Cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hotel_Restaurante1`
    FOREIGN KEY (`Restaurante_ID`)
    REFERENCES `BDTur`.`Restaurante` (`ID_Restaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Quarto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Quarto` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Quarto` (
  `Numero` INT(6) NOT NULL,
  `Valor` DECIMAL(6,2) ZEROFILL NOT NULL,
  `Tipo` VARCHAR(10) NOT NULL,
  `Hotel_ID` INT NOT NULL,
  PRIMARY KEY (`Numero`, `Hotel_ID`),
  INDEX `fk_Quarto_Hotel1_idx` (`Hotel_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Quarto_Hotel1`
    FOREIGN KEY (`Hotel_ID`)
    REFERENCES `BDTur`.`Hotel` (`ID_Hotel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Ponto_Turistico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Ponto_Turistico` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Ponto_Turistico` (
  `ID_PT` INT(6) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(140) NULL,
  `Tefelone` VARCHAR(14) NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `Cidade_ID` INT(6) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_PT`),
  INDEX `fk_Pontos_Turisticos_Cidade1_idx` (`Cidade_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Pontos_Turisticos_Endereco1`
    FOREIGN KEY (`ID_PT`)
    REFERENCES `BDTur`.`Local` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pontos_Turisticos_Cidade1`
    FOREIGN KEY (`Cidade_ID`)
    REFERENCES `BDTur`.`Cidade` (`ID_Cidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Igreja`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Igreja` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Igreja` (
  `PT_ID` INT(6) NOT NULL,
  `Data_Funcadacao` DATE NOT NULL,
  `Estilo` VARCHAR(45) NOT NULL,
  INDEX `fk_Igreja_Ponto_Turistico1_idx` (`PT_ID` ASC) VISIBLE,
  PRIMARY KEY (`PT_ID`),
  CONSTRAINT `fk_Igreja_Ponto_Turistico1`
    FOREIGN KEY (`PT_ID`)
    REFERENCES `BDTur`.`Ponto_Turistico` (`ID_PT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Museu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Museu` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Museu` (
  `PT_ID` INT(6) NOT NULL,
  `Data_Fundacao` DATE NOT NULL,
  `Entrada` DECIMAL(6,2) NOT NULL,
  `Qtde_Salas` INT(3) NOT NULL,
  INDEX `fk_Museu_Pontos_Turisticos1_idx` (`PT_ID` ASC) VISIBLE,
  PRIMARY KEY (`PT_ID`),
  CONSTRAINT `fk_Museu_Pontos_Turisticos1`
    FOREIGN KEY (`PT_ID`)
    REFERENCES `BDTur`.`Ponto_Turistico` (`ID_PT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Casa_de_Show`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Casa_de_Show` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Casa_de_Show` (
  `PT_ID` INT(6) NOT NULL,
  `Horario_Inicio` VARCHAR(8) NOT NULL,
  `Dia_de_Fechamento` VARCHAR(45) BINARY NOT NULL,
  `Preco_Medio_Rest` DECIMAL(6,2) NULL,
  `Especialidade_Rest` VARCHAR(45) NULL,
  `Restaurante_ID` INT(6) NULL,
  INDEX `fk_Casa_de_Show_Pontos_Turisticos1_idx` (`PT_ID` ASC) VISIBLE,
  PRIMARY KEY (`PT_ID`),
  INDEX `fk_Casa_de_Show_Restaurante1_idx` (`Restaurante_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Casa_de_Show_Pontos_Turisticos1`
    FOREIGN KEY (`PT_ID`)
    REFERENCES `BDTur`.`Ponto_Turistico` (`ID_PT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Casa_de_Show_Restaurante1`
    FOREIGN KEY (`Restaurante_ID`)
    REFERENCES `BDTur`.`Restaurante` (`ID_Restaurante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Fundador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Fundador` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Fundador` (
  `ID` INT(6) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `DN` DATE NOT NULL,
  `Morte` DATE NULL,
  `Nacionalidade` VARCHAR(45) NOT NULL,
  `Profissao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Museu_has_Fundador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Museu_has_Fundador` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Museu_has_Fundador` (
  `Museu_ID` INT(6) NOT NULL,
  `Fundador_ID` INT(6) NOT NULL,
  PRIMARY KEY (`Museu_ID`, `Fundador_ID`),
  INDEX `fk_Museu_has_Fundador_Fundador1_idx` (`Fundador_ID` ASC) VISIBLE,
  INDEX `fk_Museu_has_Fundador_Museu1_idx` (`Museu_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Museu_has_Fundador_Museu1`
    FOREIGN KEY (`Museu_ID`)
    REFERENCES `BDTur`.`Museu` (`PT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Museu_has_Fundador_Fundador1`
    FOREIGN KEY (`Fundador_ID`)
    REFERENCES `BDTur`.`Fundador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDTur`.`Igreja_has_Fundador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDTur`.`Igreja_has_Fundador` ;

CREATE TABLE IF NOT EXISTS `BDTur`.`Igreja_has_Fundador` (
  `Igreja_ID` INT(6) NOT NULL,
  `Fundador_ID` INT(6) NOT NULL,
  PRIMARY KEY (`Igreja_ID`, `Fundador_ID`),
  INDEX `fk_Igreja_has_Fundador_Fundador1_idx` (`Fundador_ID` ASC) VISIBLE,
  INDEX `fk_Igreja_has_Fundador_Igreja1_idx` (`Igreja_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Igreja_has_Fundador_Igreja1`
    FOREIGN KEY (`Igreja_ID`)
    REFERENCES `BDTur`.`Igreja` (`PT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Igreja_has_Fundador_Fundador1`
    FOREIGN KEY (`Fundador_ID`)
    REFERENCES `BDTur`.`Fundador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Cidade`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Cidade` (`ID_Cidade`, `Nome`, `UF`, `Populacao`) VALUES (01, 'Sobral', 'CE', 147353);
INSERT INTO `BDTur`.`Cidade` (`ID_Cidade`, `Nome`, `UF`, `Populacao`) VALUES (02, 'Fortaleza', 'CE', 2643000);
INSERT INTO `BDTur`.`Cidade` (`ID_Cidade`, `Nome`, `UF`, `Populacao`) VALUES (03, 'Rio de Janeiro', 'RJ', 6320000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Local`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (101, 'Rua', 'Rua Jornalista Barreto', '274', 'Centro', '62011-172', 'Em frente ao Museu Dom José');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (102, 'Rua', 'Rua Margem Esquerda', '1', 'Centro', '62128-030', 'Margem Esquerda');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (103, 'Rua', 'Rua Dona Maria Tomasia', '355', 'Boulevard do Arco', '62011-230', 'Boulevard do Arco');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (104, 'Avenida', 'Av. Atlântica', '1702', 'Copacabana', '22021-001', 'Praia de Copacabana');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (105, 'Avenida', 'Av. Bartolomeu Mitre', '385', 'Leblon', '22431-003', 'Praia do Leblon');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (106, 'Rua', 'Rua República da Armênia', '1154', 'Parque Manibum', '60831-760', 'Zona Sul');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (107, 'Avenida', 'Av. José Aluísio Pinto', '300', 'Dom Expedito', '62050-255', 'Ao lado Shopping Sobral');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (108, 'Avenida', 'Av. Beira-Mar', '3130', 'Meirelles', '60165-211', 'Beira-Mar');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (109, 'Avenida', 'Av. Zé Diogo', '4945', 'Praia do Futuro', '60180-005', 'Praia do Futuro');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (110, 'Rua', 'Rua Dona Maria Tomásia', '375', 'Santa Rita', '62011-230', 'Próximo ao Posto');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (111, 'Praça', 'Cidade do Rock', '1', 'Parque Olímpico', '22030-081', 'Parque Olímpico');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (112, 'Avenida', 'Av. Almirante Josegua', '386', 'Dona Monica', '62011-172', 'Ao lado da Praça Santa Quitéria');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (201, 'Rua', 'Rua Visconde de Mauá', '185', 'Meireles', '60125-160', 'Próximo ao Shopping Parangaba');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (202, 'Rua', 'Rua Duputado João Adeodato', '721', 'Centro', '62010-467', 'Próximo a Rodoviária');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (203, 'Rua', 'Rua Duputado João Adeodato', '619', 'Centro', '62010-450', 'Rua Duputado João Adeodato');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (204, 'Avenida', 'Av. José Aluísio Pinto', '300', 'Dom Expedito', '62050-255', 'Ao lado Shopping Sobral');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (205, 'Avenida', 'Av. Atlântica', '1702', 'Copacabana', '22021-001', 'Praia de Copacabana');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (206, 'Rua', 'Rua Tapirá', '284', 'Centro', '13320-030', 'Próxima a Igreja das Dores');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (207, 'Avenida', 'Av. Almirante Barroso', '885', 'Centro', '60741-900', 'Praia de Iracema ');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (208, 'Avenida', 'Av. Bartolomeu Mitre', '385', 'Leblon', '22431-003', 'Praia do Leblon');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (209, 'Rua', 'Rua Praça da Sé', '22', 'Centro', '20020-210', 'Praça da Sé');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (210, 'Avenida', 'Av. Beira-Mar', '3130', 'Meirelles', '60165-211', 'Beira-Mar');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (501, 'Rua', 'Dona Maria Tomásia', '375', 'Santa Rita', '62011-230', 'Próximo ao Posto');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (502, 'Avenida', 'Almirante Josegua', '386', 'Dona Monica', '62011-172', 'Ao lado da Praça Santa Quitéria');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (503, 'Praça', 'Cidade do Rock', '1', 'Parque Olímpico', '22030-081', 'Parque Olímpico');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (504, 'Avenida', 'Dom José', '878', 'Centro', '62015-400', 'Próximo ao Teatro São João');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (505, 'Praça', 'Mauá', '1', 'Centro', '20081-262', 'Praça Mauá');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (506, 'Rua', 'Dragão do Mar', '81', 'Centro', '60060-172', 'Dragão do Mar');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (507, 'Rua', 'Galdino Goldin', '52', 'Centro', '62010-180', 'Em frente a camara dos vereadores');
INSERT INTO `BDTur`.`Local` (`ID`, `Tipo_Logradouro`, `Nome`, `Numero`, `Bairro`, `CEP`, `Complemento`) VALUES (509, 'Praça', 'da Sé', '1', 'Centro', '60055-150', 'Praça da Sé');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Restaurante`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (101, 'Cicero\'s', 'Super-Luxo', 01);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (102, 'Delicia.com', 'Simples', 01);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (103, 'Tako Sushi', 'Luxo', 01);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (104, 'Copacabana Restaurant', 'Super-Luxo', 03);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (105, 'Leblon Restaurant', 'Super-Luxo', 03);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (106, 'Coco Bambu', 'Super-Luxo', 02);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (107, 'Tullip Inn Restaurant', 'Super-Luxo', 01);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (108, 'Beira-Mar Restaurant', 'Super-Luxo', 02);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (109, 'Chico do Carangueijo', 'Simples', 02);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (110, 'Sobrado335 Restaurant', 'Luxo', 01);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (111, 'Rock in Rio Restaurant', 'Super-Luxo', 03);
INSERT INTO `BDTur`.`Restaurante` (`ID_Restaurante`, `Nome`, `Categoria`, `Cidade_ID`) VALUES (112, 'Lancelot Restaurant', 'Luxo', 02);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Hotel`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (201, 'Visconti', 3, 01, NULL);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (202, 'Beira-Rio', 4, 01, NULL);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (203, 'Hugo Plaza', 2, 01, NULL);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (204, 'Tulipp Inn', 5, 01, 107);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (205, 'Copacabana Palace', 5, 03, 104);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (206, 'Casa da Tia', 2, 02, NULL);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (207, 'Iracema', 4, 02, NULL);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (208, 'Leblon Palace', 5, 03, 105);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (209, 'Meu Cantinho Pelourinho', 3, 03, NULL);
INSERT INTO `BDTur`.`Hotel` (`ID_Hotel`, `Nome_Hotel`, `Categoria`, `Cidade_ID`, `Restaurante_ID`) VALUES (210, 'Beira-Mar Hotel', 4, 02, 108);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Quarto`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 201);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 201);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 201);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 201);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 201);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 202);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 202);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 202);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 202);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 202);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 203);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 203);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 203);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 203);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 203);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 204);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 204);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 204);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 204);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 204);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 205);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 205);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 205);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 205);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 205);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 206);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 206);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 206);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 206);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 206);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 207);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 207);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 207);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 207);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 207);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 208);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 208);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 208);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 208);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 208);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 209);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 209);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 209);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 79, 'Standard', 209);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'Super-Luxo', 209);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (1, 150, 'Luxo', 210);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (2, 250, 'Super-Luxo', 210);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (3, 100, 'Master', 210);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (4, 70, 'Standard', 210);
INSERT INTO `BDTur`.`Quarto` (`Numero`, `Valor`, `Tipo`, `Hotel_ID`) VALUES (5, 250, 'SuperLuxo', 210);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Ponto_Turistico`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (501, 'Sobrado335', 'Bar', '88 99625-7682', 'Casa_de_Show', 01);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (502, 'Lancelot', 'Bar', '85 99901-0413', 'Casa_de_Show', 02);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (503, 'Rock in Rio', 'Espaço Cultural', '21 2233-5379', 'Casa_de_Show', 03);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (504, 'Museu Dom José', 'Cultura', '88 3611-3525', 'Museu', 01);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (505, 'Museu do Amanhã', 'Cultura', '21 2233-0721', 'Museu', 03);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (506, 'Museu Dragão do Mar', 'Cultura', '85 3488-8600', 'Museu', 02);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (507, 'Igreja da Sé', 'Cultura', '88 3611-0848', 'Igreja', 01);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (508, 'Igreja da Candelaria', 'Cultura', '21 2233-2324', 'Igreja', 03);
INSERT INTO `BDTur`.`Ponto_Turistico` (`ID_PT`, `Nome`, `Descricao`, `Tefelone`, `Tipo`, `Cidade_ID`) VALUES (509, 'Catedral Metropolitana de Fortaleza', 'Cultura', '85 3231-4196', 'Igreja', 02);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Igreja`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Igreja` (`PT_ID`, `Data_Funcadacao`, `Estilo`) VALUES (507, '1778-03-27', 'Rococó');
INSERT INTO `BDTur`.`Igreja` (`PT_ID`, `Data_Funcadacao`, `Estilo`) VALUES (508, '1811-11-02', 'Arquitetura Neoclássica');
INSERT INTO `BDTur`.`Igreja` (`PT_ID`, `Data_Funcadacao`, `Estilo`) VALUES (509, '1978-05-19', 'Neogótico');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Museu`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Museu` (`PT_ID`, `Data_Fundacao`, `Entrada`, `Qtde_Salas`) VALUES (504, '1951-05-29', 5, 35);
INSERT INTO `BDTur`.`Museu` (`PT_ID`, `Data_Fundacao`, `Entrada`, `Qtde_Salas`) VALUES (505, '2015-12-17', 20, 50);
INSERT INTO `BDTur`.`Museu` (`PT_ID`, `Data_Fundacao`, `Entrada`, `Qtde_Salas`) VALUES (506, '1999-04-01', 15, 41);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Casa_de_Show`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Casa_de_Show` (`PT_ID`, `Horario_Inicio`, `Dia_de_Fechamento`, `Preco_Medio_Rest`, `Especialidade_Rest`, `Restaurante_ID`) VALUES (501, '22:00', 'Segunda-Feira', 40, 'Churrasco', 110);
INSERT INTO `BDTur`.`Casa_de_Show` (`PT_ID`, `Horario_Inicio`, `Dia_de_Fechamento`, `Preco_Medio_Rest`, `Especialidade_Rest`, `Restaurante_ID`) VALUES (502, '22:00', 'Segunda-Feira', 50, 'Churrasco', 112);
INSERT INTO `BDTur`.`Casa_de_Show` (`PT_ID`, `Horario_Inicio`, `Dia_de_Fechamento`, `Preco_Medio_Rest`, `Especialidade_Rest`, `Restaurante_ID`) VALUES (503, '22:00', 'Segunda-Feira', 100, 'Fast Food', 111);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Fundador`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (401, 'Dom José Tupinambá da Frota', '1905-03-19', '1959-09-25', 'Brasileira', 'Bispo');
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (402, 'Fundação Roberto Marinho', '1977-11-03', NULL, 'Brasileira', 'Fundação');
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (403, 'Francisco José do Nascimento', '1839-04-15', '1914-05-05', 'Brasileira', 'Comerciante');
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (404, 'Antônio de Carvalho e Albuquerque', '1701-03-02', '1883-07-09', 'Brasileira', 'Padre');
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (405, 'Luis de Santa Teresa', '1692-08-05', '1875-01-17', 'Brasileira', 'Bispo');
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (406, 'Antonio Martins de Palma', '1572-03-18', '1654-12-04', 'Portuguesa', 'Marinheiro');
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (407, 'Leonor Gonçalves', '1778-04-28', '1669-02-27', 'Portuguesa', 'Do Lar');
INSERT INTO `BDTur`.`Fundador` (`ID`, `Nome`, `DN`, `Morte`, `Nacionalidade`, `Profissao`) VALUES (408, 'Antônio José Álvares de Carvalho', '1732-01-19', '1803-07-13', 'Brasileira', 'Padre');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Museu_has_Fundador`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Museu_has_Fundador` (`Museu_ID`, `Fundador_ID`) VALUES (504, 401);
INSERT INTO `BDTur`.`Museu_has_Fundador` (`Museu_ID`, `Fundador_ID`) VALUES (505, 402);
INSERT INTO `BDTur`.`Museu_has_Fundador` (`Museu_ID`, `Fundador_ID`) VALUES (506, 403);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDTur`.`Igreja_has_Fundador`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDTur`;
INSERT INTO `BDTur`.`Igreja_has_Fundador` (`Igreja_ID`, `Fundador_ID`) VALUES (507, 404);
INSERT INTO `BDTur`.`Igreja_has_Fundador` (`Igreja_ID`, `Fundador_ID`) VALUES (507, 405);
INSERT INTO `BDTur`.`Igreja_has_Fundador` (`Igreja_ID`, `Fundador_ID`) VALUES (508, 406);
INSERT INTO `BDTur`.`Igreja_has_Fundador` (`Igreja_ID`, `Fundador_ID`) VALUES (508, 407);
INSERT INTO `BDTur`.`Igreja_has_Fundador` (`Igreja_ID`, `Fundador_ID`) VALUES (509, 408);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
