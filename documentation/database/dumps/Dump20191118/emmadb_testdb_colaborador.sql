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
-- Table structure for table `colaborador`
--

DROP TABLE IF EXISTS `colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colaborador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pasep` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `eh_contatado` tinyint(1) DEFAULT NULL,
  `cargo` varchar(20) DEFAULT NULL,
  `funcao` varchar(20) DEFAULT NULL,
  `eh_readaptado` tinyint(1) DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  `data_de_admissao` date DEFAULT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  `habilitacao` varchar(20) DEFAULT NULL,
  `estado_civil` tinyint(4) DEFAULT NULL,
  `formacao_academica` tinyint(4) DEFAULT NULL,
  `pessoa` int(11) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `portaria` int(11) DEFAULT NULL,
  `titulo_de_eleitor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `colaborador_ibfk_1` (`pessoa`),
  KEY `colaborador_ibfk_2` (`formacao_academica`),
  KEY `colaborador_ibfk_3` (`estado_civil`),
  KEY `colaborador_ibfk_4` (`carga_horaria`),
  KEY `colaborador_ibfk_5` (`portaria`),
  KEY `colaborador_ibfk_6` (`titulo_de_eleitor`),
  CONSTRAINT `colaborador_ibfk_1` FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `colaborador_ibfk_2` FOREIGN KEY (`formacao_academica`) REFERENCES `formacao_academica` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `colaborador_ibfk_3` FOREIGN KEY (`estado_civil`) REFERENCES `estado_civil` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `colaborador_ibfk_4` FOREIGN KEY (`carga_horaria`) REFERENCES `carga_horaria` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `colaborador_ibfk_5` FOREIGN KEY (`portaria`) REFERENCES `portaria` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `colaborador_ibfk_6` FOREIGN KEY (`titulo_de_eleitor`) REFERENCES `titulo_de_eleitor` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colaborador`
--

LOCK TABLES `colaborador` WRITE;
/*!40000 ALTER TABLE `colaborador` DISABLE KEYS */;
/*!40000 ALTER TABLE `colaborador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-18 11:47:43
