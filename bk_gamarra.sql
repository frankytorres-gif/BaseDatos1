-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: dbGamarraMarket
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENTE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` char(3) DEFAULT NULL,
  `numero_documento` char(15) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(90) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `celular` char(9) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRENDA`
--

DROP TABLE IF EXISTS `PRENDA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRENDA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(90) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRENDA`
--

LOCK TABLES `PRENDA` WRITE;
/*!40000 ALTER TABLE `PRENDA` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRENDA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENDEDOR`
--

DROP TABLE IF EXISTS `VENDEDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENDEDOR` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_documento` char(3) DEFAULT NULL,
  `numero_documento` char(15) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(90) DEFAULT NULL,
  `salario` decimal(8,2) DEFAULT NULL,
  `celular` char(9) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENDEDOR`
--

LOCK TABLES `VENDEDOR` WRITE;
/*!40000 ALTER TABLE `VENDEDOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `VENDEDOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTA`
--

DROP TABLE IF EXISTS `VENTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENTA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint(1) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `vendedor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `vendedor_id` (`vendedor_id`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `CLIENTE` (`id`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`vendedor_id`) REFERENCES `VENDEDOR` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTA`
--

LOCK TABLES `VENTA` WRITE;
/*!40000 ALTER TABLE `VENTA` DISABLE KEYS */;
/*!40000 ALTER TABLE `VENTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENTA_DETALLE`
--

DROP TABLE IF EXISTS `VENTA_DETALLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENTA_DETALLE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `venta_id` int(11) DEFAULT NULL,
  `prenda_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venta_id` (`venta_id`),
  KEY `prenda_id` (`prenda_id`),
  CONSTRAINT `venta_detalle_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `VENTA` (`id`),
  CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`prenda_id`) REFERENCES `PRENDA` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENTA_DETALLE`
--

LOCK TABLES `VENTA_DETALLE` WRITE;
/*!40000 ALTER TABLE `VENTA_DETALLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `VENTA_DETALLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-05  2:02:07
