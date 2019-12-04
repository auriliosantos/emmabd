-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: emmadb_testdb
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade_de_nascimento` varchar(32) DEFAULT NULL,
  `estado_de_nascimento` int(11) DEFAULT NULL,
  `Grupo_sanguineo` varchar(2) DEFAULT NULL,
  `Fator_RH` tinyint(1) DEFAULT NULL,
  `tem_necessidades_especiais` tinyint(1) DEFAULT NULL,
  `utiliza_transporte_escolar` tinyint(1) DEFAULT NULL,
  `eh_de_area_rural` tinyint(1) DEFAULT NULL,
  `NIS` int(11) DEFAULT NULL,
  `NIS_familia` int(11) DEFAULT NULL,
  `SUS` int(11) DEFAULT NULL,
  `cor` tinyint(4) DEFAULT NULL,
  `pessoa` int(11) DEFAULT NULL,
  `certidao_de_nascimento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aluno_ibfk_1` (`pessoa`),
  KEY `aluno_ibfk_2` (`certidao_de_nascimento`),
  KEY `aluno_ibfk_3` (`cor`),
  CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`certidao_de_nascimento`) REFERENCES `certidao_de_nascimento` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `aluno_ibfk_3` FOREIGN KEY (`cor`) REFERENCES `cor` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-18 11:47:48
