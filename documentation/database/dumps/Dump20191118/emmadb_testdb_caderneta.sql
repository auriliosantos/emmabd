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
-- Table structure for table `caderneta`
--

DROP TABLE IF EXISTS `caderneta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caderneta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `presencas` int(11) DEFAULT NULL,
  `faltas` int(11) DEFAULT NULL,
  `progressao_plena` tinyint(1) DEFAULT NULL,
  `mes` tinyint(4) DEFAULT NULL,
  `situacao_academica` tinyint(4) DEFAULT NULL,
  `materia` tinyint(4) DEFAULT NULL,
  `matricula` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `caderneta_ibfk_1` (`matricula`),
  KEY `caderneta_ibfk_2` (`mes`),
  KEY `caderneta_ibfk_3` (`materia`),
  KEY `caderneta_ibfk_4` (`situacao_academica`),
  CONSTRAINT `caderneta_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `matricula` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `caderneta_ibfk_2` FOREIGN KEY (`mes`) REFERENCES `mes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `caderneta_ibfk_3` FOREIGN KEY (`materia`) REFERENCES `materia` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `caderneta_ibfk_4` FOREIGN KEY (`situacao_academica`) REFERENCES `situacao_academica` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caderneta`
--

LOCK TABLES `caderneta` WRITE;
/*!40000 ALTER TABLE `caderneta` DISABLE KEYS */;
/*!40000 ALTER TABLE `caderneta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-18 11:47:51
