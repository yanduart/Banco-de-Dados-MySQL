-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: comercio_eletronico
-- ------------------------------------------------------
-- Server version	8.0.26

CREATE DATABASE IF NOT EXISTS comercio_eletronico;
USE comercio_eletronico;

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
  `IDC` int NOT NULL AUTO_INCREMENT,
  `IDTC` char(2) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `DTCAD` datetime NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `CNPJ` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDC`),
  KEY `IDTC` (`IDTC`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`IDTC`) REFERENCES `tipocliente` (`IDTC`)
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'PF','CRISTIANO MARTINS NUNES','2016-02-24 12:35:10','cristiano@martinsnunes.com.br','11122233344',NULL),(2,'PJ','INDUSTRIA DE BEBIDAS PONCHIC','2016-02-24 12:36:26','sac@ponchic.com.br',NULL,'201500001209901'),(123,'PF','PEDRO NUNES','2016-03-01 09:14:49','pedro@super11.com.br','12332100011',NULL),(124,'PJ','FORMULA BIKE ','2016-01-02 19:15:03','formulabike@gmail.com',NULL,'153300001203307'),(125,'PF','LUCIANA LAGE','2016-03-02 11:25:12','lulu@super11.com.br','54321100011',NULL),(126,'PF','REANTO FELIX PRACA LEITE','2016-03-02 11:31:41','rfpl@super11.com.br','91020304050',NULL),(2025,'PF','ALUNO ANHANGUERA','2025-05-23 12:00:56','fap@anhanguera.com.br','00011122299',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itenspedido`
--

DROP TABLE IF EXISTS `itenspedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itenspedido` (
  `IDIP` int NOT NULL AUTO_INCREMENT,
  `NUMPEDIDO` int DEFAULT NULL,
  `IDPR` int DEFAULT NULL,
  `QUANTIDADE` int DEFAULT NULL,
  `VALOR` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`IDIP`),
  KEY `NUMPEDIDO` (`NUMPEDIDO`),
  KEY `IDPR` (`IDPR`),
  CONSTRAINT `itenspedido_ibfk_1` FOREIGN KEY (`NUMPEDIDO`) REFERENCES `pedido` (`NUMPEDIDO`),
  CONSTRAINT `itenspedido_ibfk_2` FOREIGN KEY (`IDPR`) REFERENCES `produto` (`IDPR`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itenspedido`
--

LOCK TABLES `itenspedido` WRITE;
/*!40000 ALTER TABLE `itenspedido` DISABLE KEYS */;
INSERT INTO `itenspedido` VALUES (31,1007,1,1,19.99),(32,1007,5,2,133.98),(33,1008,7,1,30.99);
/*!40000 ALTER TABLE `itenspedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `NUMPEDIDO` int NOT NULL AUTO_INCREMENT,
  `IDC` int NOT NULL,
  `DTPEDIDO` datetime DEFAULT NULL,
  `TOTALITEM` int DEFAULT NULL,
  `VALORPEDIDO` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`NUMPEDIDO`),
  KEY `IDC` (`IDC`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`IDC`) REFERENCES `cliente` (`IDC`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1007,1,'2016-03-02 11:45:10',3,153.97),(1008,124,'2016-03-02 11:50:58',1,30.99);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `IDPR` int NOT NULL AUTO_INCREMENT,
  `DESCPRODUTO` varchar(50) DEFAULT NULL,
  `VALOR` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`IDPR`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'TAMPA PARA ESPUMANTE',19.99),(2,'DVD MARISA MONTE - VERDADE UMA ILUSAO',25.99),(3,'PEN DRIVE 16G EMC',10.99),(4,'DVD THE BEST OF NIRVANA - AO VIVO',33.99),(5,'ESPUMANTE CASA VALDUGA - TIPO BRUT',66.99),(6,'CD JOTA QUEST - ALEM DO HORIZONTE',9.99),(7,'DVD SKANK - AO VIVO OURO PRETO',30.99);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocliente`
--

LOCK TABLES `tipocliente` WRITE;
/*!40000 ALTER TABLE `tipocliente` DISABLE KEYS */;
INSERT INTO `tipocliente` VALUES ('PF','PESSOA FISICA'),('PJ','PESSOA JURIDICA');
/*!40000 ALTER TABLE `tipocliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-23 12:11:30
