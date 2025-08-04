CREATE DATABASE  IF NOT EXISTS `comercio_eletronico` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `comercio_eletronico`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: comercio_eletronico
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `IDC` int(11) NOT NULL AUTO_INCREMENT,
  `IDTC` char(2) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `DTCAD` datetime NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDC`),
  KEY `IDTC` (`IDTC`),
  KEY `idx_cliente_cpf` (`CPF`),
  KEY `idx_cliente_cnpj` (`CNPJ`),
  KEY `idx_cliente_email` (`EMAIL`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`IDTC`) REFERENCES `tipocliente` (`IDTC`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'PJ','Tech Solutions SA','2025-05-29 15:45:31','suporte@techsolutions.com',NULL,'98765432000155');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenspedido`
--

DROP TABLE IF EXISTS `itenspedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itenspedido` (
  `IDIP` int(11) NOT NULL AUTO_INCREMENT,
  `NUMPEDIDO` int(11) DEFAULT NULL,
  `IDPR` int(11) DEFAULT NULL,
  `QUANTIDADE` int(11) DEFAULT NULL,
  `VALOR` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`IDIP`),
  KEY `NUMPEDIDO` (`NUMPEDIDO`),
  KEY `IDPR` (`IDPR`),
  CONSTRAINT `fk_itenspedido_pedido` FOREIGN KEY (`NUMPEDIDO`) REFERENCES `pedido` (`NUMPEDIDO`) ON DELETE CASCADE,
  CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`IDPR`) REFERENCES `produto` (`IDPR`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenspedido`
--

LOCK TABLES `itenspedido` WRITE;
/*!40000 ALTER TABLE `itenspedido` DISABLE KEYS */;
INSERT INTO `itenspedido` VALUES (1003,2026,4,3,101.97),(1004,2027,4,3,101.97);
/*!40000 ALTER TABLE `itenspedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_pos_inserir_item
AFTER INSERT ON itenspedido
FOR EACH ROW
BEGIN
    UPDATE pedido
    SET TOTALITEM = TOTALITEM + NEW.QUANTIDADE,
        VALORPEDIDO = VALORPEDIDO + NEW.VALOR
    WHERE NUMPEDIDO = NEW.NUMPEDIDO;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `NUMPEDIDO` int(11) NOT NULL AUTO_INCREMENT,
  `IDC` int(11) NOT NULL,
  `DTPEDIDO` datetime DEFAULT NULL,
  `TOTALITEM` int(11) DEFAULT 0,
  `VALORPEDIDO` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`NUMPEDIDO`),
  KEY `IDC` (`IDC`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IDC`) REFERENCES `cliente` (`IDC`)
) ENGINE=InnoDB AUTO_INCREMENT=2028 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (2026,1,'2025-05-29 00:00:00',3,101.97),(2027,1,'2025-05-29 00:00:00',3,101.97);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `IDPR` int(11) NOT NULL AUTO_INCREMENT,
  `DESCPRODUTO` varchar(50) DEFAULT NULL,
  `VALOR` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`IDPR`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'TAMPA PARA ESPUMANTE',19.99),(2,'DVD MARISA MONTE - VERDADE UMA ILUSAO',25.99),(3,'PEN DRIVE 16G EMC',10.99),(4,'DVD THE BEST OF NIRVANA - AO VIVO',33.99),(5,'ESPUMANTE CASA VALDUGA - TIPO BRUT',66.99),(6,'CD JOTA QUEST - ALEM DO HORIZONTE',9.99),(7,'DVD SKANK - AO VIVO OURO PRETO',30.99),(8,'Notebook Dell Inspiron',3500.00),(9,'Smartphone Samsung Galaxy',2500.00),(10,'Teclado Mecânico RGB',450.00),(11,'Mouse Gamer Logitech',300.00),(12,'Monitor LG 24 polegadas',1200.00),(13,'Impressora HP LaserJet',900.00),(14,'Fone de Ouvido Sony',350.00),(15,'SSD Kingston 480GB',550.00),(16,'Placa de Vídeo NVIDIA GTX 1660',2200.00),(17,'Memória RAM 16GB DDR4',700.00),(18,'Cadeira Gamer DXRacer',1300.00),(19,'Webcam Logitech HD',400.00),(20,'Processador Intel i7',1800.00),(21,'Fonte Corsair 650W',600.00),(22,'Gabinete Cooler Master',350.00),(23,'Tablet Samsung Galaxy Tab',1500.00),(24,'Roteador TP-Link AC1200',250.00),(25,'HD Externo Seagate 2TB',450.00),(26,'Caixa de Som JBL',500.00),(27,'Adaptador USB-C',120.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocliente`
--

DROP TABLE IF EXISTS `tipocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipocliente` (
  `IDTC` char(2) NOT NULL DEFAULT '',
  `TIPOCLIENTE` varchar(25) NOT NULL,
  PRIMARY KEY (`IDTC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocliente`
--

LOCK TABLES `tipocliente` WRITE;
/*!40000 ALTER TABLE `tipocliente` DISABLE KEYS */;
INSERT INTO `tipocliente` VALUES ('PF','PESSOA FISICA'),('PJ','PESSOA JURIDICA');
/*!40000 ALTER TABLE `tipocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_pedidos_detalhados`
--

DROP TABLE IF EXISTS `vw_pedidos_detalhados`;
/*!50001 DROP VIEW IF EXISTS `vw_pedidos_detalhados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedidos_detalhados` AS SELECT 
 1 AS `NUMPEDIDO`,
 1 AS `CLIENTE`,
 1 AS `DOCUMENTO`,
 1 AS `DTPEDIDO`,
 1 AS `TOTALITEM`,
 1 AS `VALORPEDIDO`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'comercio_eletronico'
--

--
-- Dumping routines for database 'comercio_eletronico'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_total_pedidos_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_pedidos_cliente`(doc VARCHAR(20)) RETURNS int(11)
    DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(p.NUMPEDIDO)
    INTO total
    FROM pedido p
    JOIN cliente c ON p.IDC = c.IDC
    WHERE c.CPF = doc OR c.CNPJ = doc;

    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CriarClienteEPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CriarClienteEPedido`(
    IN IDTC CHAR(2),
    IN NOME VARCHAR(50),
    IN EMAIL VARCHAR(30),
    IN CPF VARCHAR(11),
    IN CNPJ VARCHAR(20),
    OUT NUMPEDIDO INT
)
BEGIN
    DECLARE NEW_IDC INT;

    -- Inserir cliente
    INSERT INTO cliente (IDTC, NOME, DTCAD, EMAIL, CPF, CNPJ)
    VALUES (IDTC, NOME, NOW(), EMAIL, CPF, CNPJ);

    -- Obter o IDC recém-criado
    SET NEW_IDC = LAST_INSERT_ID();

    -- Criar pedido para o cliente novo
    INSERT INTO pedido (IDC, DTPEDIDO, TOTALITEM, VALORPEDIDO)
    VALUES (NEW_IDC, NOW(), 0, 0.00);

    -- Retornar o NUMPEDIDO gerado
    SET NUMPEDIDO = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CriarPedidoPorDocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CriarPedidoPorDocumento`(
    IN DOC VARCHAR(20),
    OUT NUMPEDIDO_OUT INT
)
BEGIN
    DECLARE V_IDC INT;

    -- Busca o cliente por CPF ou CNPJ
    SELECT IDC INTO V_IDC
    FROM cliente
    WHERE CPF = DOC OR CNPJ = DOC
    LIMIT 1;

    -- Se não encontrou, dispara erro
    IF V_IDC IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cliente não encontrado com esse CPF ou CNPJ.';
    END IF;

    -- Cria o pedido
    INSERT INTO pedido (IDC, DTPEDIDO, TOTALITEM, VALORPEDIDO)
    VALUES (V_IDC, CURRENT_DATE(), 0, 0.00);

    SET NUMPEDIDO_OUT = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_InserirProduto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_InserirProduto`(
    IN NUMPEDIDOO INT,
    IN IDPRO INT,
    IN QUANTIDADE INT
)
BEGIN
    DECLARE PRECO DECIMAL(15,2);

    -- Buscar o valor do produto
    SELECT VALOR INTO PRECO
    FROM produto
    WHERE IDPR = IDPRO;

    -- Inserir na tabela de itens do pedido
    INSERT INTO itenspedido (NUMPEDIDO, IDPR, QUANTIDADE, VALOR)
    VALUES (NUMPEDIDOO, IDPRO, QUANTIDADE, PRECO * QUANTIDADE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_pedidos_detalhados`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedidos_detalhados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedidos_detalhados` AS select `p`.`NUMPEDIDO` AS `NUMPEDIDO`,`c`.`NOME` AS `CLIENTE`,coalesce(`c`.`CPF`,`c`.`CNPJ`) AS `DOCUMENTO`,`p`.`DTPEDIDO` AS `DTPEDIDO`,`p`.`TOTALITEM` AS `TOTALITEM`,`p`.`VALORPEDIDO` AS `VALORPEDIDO` from (`pedido` `p` join `cliente` `c` on(`p`.`IDC` = `c`.`IDC`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 16:34:36
