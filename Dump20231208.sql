CREATE DATABASE  IF NOT EXISTS `palavrasencantadas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `palavrasencantadas`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: palavrasencantadas
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `avaliaçao`
--

DROP TABLE IF EXISTS `avaliaçao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliaçao` (
  `Titulo` varchar(100) DEFAULT NULL,
  `NomeDeUsuario` varchar(100) DEFAULT NULL,
  `Descriçao` varchar(280) DEFAULT NULL,
  `nota` int DEFAULT NULL,
  `genero` varchar(244) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `Titulo` (`Titulo`),
  KEY `NomeDeUsuario` (`NomeDeUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliaçao`
--

LOCK TABLES `avaliaçao` WRITE;
/*!40000 ALTER TABLE `avaliaçao` DISABLE KEYS */;
INSERT INTO `avaliaçao` VALUES ('star-wars','Elias','ruim',3,'Fantasia, Ficcao Cientifica',1),('star-wars','algo','teste de mais cedo\r\n',3,'',2),('star-wars','algo','avaliado legal',5,'',3),('star-wars','algo','opazinho',3,'',4),('star-wars','algo','iae,massa',3,'',5),('star-wars','algo','teste mais um',4,'Fantasia, Ficcao Cientifica',6);
/*!40000 ALTER TABLE `avaliaçao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` varchar(100) NOT NULL,
  `NomeDeUsuario` varchar(100) DEFAULT NULL,
  `Descriçao` varchar(280) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Titulo` (`id`),
  KEY `NomeDeUsuario` (`NomeDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES ('star wars','opa','Ã© bom');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `NomeDeUsuario` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Senha` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`NomeDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('algo','algumacoisa@gmail.com','jpfzqTCV3DzVg+ZwP1PuC2z9+w9MCEinl6LdkJsnoxw='),('luanbrabo','luan.omito@gmal.com','7dT9U6HuQsxyDxVtGQ2d+F7buZ+T+3I7egp/A+IpOXw=');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'palavrasencantadas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 16:42:58
