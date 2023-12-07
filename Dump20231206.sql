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
  KEY `Titulo` (`Titulo`),
  KEY `NomeDeUsuario` (`NomeDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliaçao`
--

LOCK TABLES `avaliaçao` WRITE;
/*!40000 ALTER TABLE `avaliaçao` DISABLE KEYS */;
INSERT INTO `avaliaçao` VALUES (NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,NULL,NULL),('Star Wars','blabla','oi',3,NULL),('Star','bla','oi',5,NULL),(NULL,NULL,NULL,NULL,NULL),(NULL,NULL,NULL,8,NULL),('Star wars','Elias','oi',5,NULL),(NULL,NULL,NULL,5,NULL),(NULL,NULL,NULL,7,NULL),('mystery','Elias','oi',7,NULL),('Senhor dos AnÃ©is','Luan','testezinho',7,NULL),('sei la','eu','qualquer coisa',3,'morte'),('non-fiction','MenorL','vai, funciona',NULL,'3'),('mystery','MenorL','iae',2,NULL),('mystery','MenorL','dale',2,'drama'),('non-fiction','MenorL','olÃ¡',1,'fiction, HistÃ³ria, terror, ComÃ©dia');
/*!40000 ALTER TABLE `avaliaçao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `Titulo` varchar(100) DEFAULT NULL,
  `NomeDeUsuario` varchar(100) DEFAULT NULL,
  `Descriçao` varchar(280) DEFAULT NULL,
  KEY `Titulo` (`Titulo`),
  KEY `NomeDeUsuario` (`NomeDeUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `titulo` varchar(100) NOT NULL,
  `editora` varchar(100) DEFAULT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `ano` int DEFAULT NULL,
  PRIMARY KEY (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
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
INSERT INTO `usuario` VALUES ('blabla','eliasjuniorradical@gmail.com','123456789pl'),('Elias','elias@gmail.com','sales123'),('opa','jeaijsdi@gmail.com','1234567p'),('Zezinho','denyel@gmail.com','zezinho123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'palavrasencantadas'
--

--
-- Dumping routines for database 'palavrasencantadas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 21:19:19
