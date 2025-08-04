CREATE DATABASE  IF NOT EXISTS `aula9` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `aula9`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aula9
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
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sigla` varchar(50) NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Polícia Rodoviária Federal','PRF'),(2,'Departamento de Engenharia Florestal','DEF'),(3,'Departamento Pessoal','DP');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `departamento` int(11) DEFAULT NULL,
  `salario` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `departamento` (`departamento`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Mariana Silva Pereira','Mariana@455',1,5000.00),(2,'Geovanna de Costas Gandefer','Geovanna@342',1,4673.00),(3,'Alanzoka Nextage','Alanzoka@567',2,1045.00),(4,'Jergio Sacani Foguetes','Jergio@666',2,10445.00),(5,'Miguel Merin Pastor','Miguel@332',3,7945.34);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxas_moeda`
--

DROP TABLE IF EXISTS `taxas_moeda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxas_moeda` (
  `moeda` varchar(10) NOT NULL,
  `taxa` decimal(10,4) DEFAULT NULL,
  `simbolo` varchar(5) DEFAULT NULL,
  `posicao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxas_moeda`
--

LOCK TABLES `taxas_moeda` WRITE;
/*!40000 ALTER TABLE `taxas_moeda` DISABLE KEYS */;
INSERT INTO `taxas_moeda` VALUES ('dolar',0.1760,'$','antes'),('euro',0.1630,'€','depois'),('libra',0.1450,'£','antes'),('peso',50.0000,'₱','antes'),('real',1.0000,'R$','antes');
/*!40000 ALTER TABLE `taxas_moeda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'aula9'
--

--
-- Dumping routines for database 'aula9'
--
/*!50003 DROP FUNCTION IF EXISTS `converter_salario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `converter_salario`(salario DECIMAL(10,2),
    moeda VARCHAR(10)
) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
    DECLARE taxa DECIMAL(10,4);
    DECLARE simbolo VARCHAR(5);
    DECLARE posicao_simbolo VARCHAR(5); -- 'antes' ou 'depois'
    DECLARE salario_convertido DECIMAL(10,2);
    DECLARE resultado VARCHAR(100);
    
    -- Transformando a moeda para minúsculas
    SET moeda = LOWER(moeda);

    -- Busca os dados da tabela de taxas
    SELECT t.taxa, t.simbolo, t.posicao
    INTO taxa, simbolo, posicao_simbolo
    FROM taxas_moeda t
    WHERE t.moeda = moeda;

    SET salario_convertido = salario * taxa;

    IF posicao_simbolo = 'antes' THEN
        SET resultado = CONCAT(simbolo, ' ', FORMAT(salario_convertido, 2));
    ELSE
        SET resultado = CONCAT(FORMAT(salario_convertido, 2), ' ', simbolo); -- format ta fazendo fução de saparar 2 casas decimais 
    END IF;

    RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Nome_Vogais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Nome_Vogais`(nome varchar(100)
) RETURNS varchar(100) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
begin
    declare i int default 1;
    declare letra char(1);
    declare tamanho int;
    declare vogais varchar(50) default '';
    
    set tamanho = LENGTH(nome);
    
    while i <= tamanho do
    SET letra = UPPER(SUBSTRING(nome, i, 1));
    -- IN VERIFICA UMA LISTA DE OPÇÕES!
    IF letra IN ('a', 'e', 'i', 'o', 'u') THEN
            SET vogais = CONCAT(vogais, letra, ' ');
        END IF;
        
        SET i = i + 1;
    end while;
    
    return vogais;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_iniciais` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_iniciais`(nome_completo VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE qtd_palavras INT;
    DECLARE palavra VARCHAR(255);
    DECLARE iniciais VARCHAR(255) DEFAULT '';
    
    SET qtd_palavras = LENGTH(nome_completo) - LENGTH(REPLACE(nome_completo, ' ', '')) + 1;
    
    WHILE i <= qtd_palavras DO
        SET palavra = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(nome_completo, ' ', i), ' ', -1));
        SET iniciais = CONCAT(iniciais, UPPER(LEFT(palavra, 1)), ' ');
        SET i = i + 1;
    END WHILE;
    
    RETURN TRIM(iniciais);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `media_salarial_departamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `media_salarial_departamento`(
    IN dept_id INT,
    OUT media DECIMAL(10,2)
)
BEGIN
    SELECT AVG(salario)
    INTO media
    FROM funcionario
    WHERE departamento = dept_id;
    
    -- Se não houver funcionários no departamento, a média será 0
    IF media IS NULL THEN
        SET media = 0;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-09 22:56:10
