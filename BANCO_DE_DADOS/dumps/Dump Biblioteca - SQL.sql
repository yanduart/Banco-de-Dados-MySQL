CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `livros2`
--

DROP TABLE IF EXISTS `livros2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` text,
  `autora` varchar(30) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `edicao` varchar(50) DEFAULT NULL,
  `editor` varchar(202) DEFAULT NULL,
  `anoPublicacao` year DEFAULT NULL,
  `qtdePaginas` int DEFAULT NULL,
  `genero` enum('poesia','soneto','romance','fábula','novela','cronica','conto','ensaio','biografia','chicklit','fantasia','distopia','ficcao cientifica','horror','fantastica','infanto juvenil','young adult','suspense','autoajuda','negocios','tecnologia','hq','aventura') DEFAULT NULL,
  `idioma` varchar(50) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `disponivel` int DEFAULT NULL,
  `nome3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros2`
--

LOCK TABLES `livros2` WRITE;
/*!40000 ALTER TABLE `livros2` DISABLE KEYS */;
INSERT INTO `livros2` VALUES (3,'orgulho e preconceito','jane austen','978-8544001820','sabedoria','martin claret',2018,424,'romance','portugues',5,1,''),(5,'tijolo','fernanda','-2343444640','bom','guiumers',2017,634,'fábula','spanhol',11,9,''),(6,'hitler','neclo','-1462544410','nazista','frederico',1950,789,'aventura','ingles',11,34,''),(8,'pedra','james','-2342544910','ruim','navalha',2007,234,'poesia','ingles',4,5,''),(10,'fogo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `livros2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 21:06:23
