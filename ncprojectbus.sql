-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ncprojectbus
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bus_numbers`
--

DROP TABLE IF EXISTS `bus_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bus_numbers` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `tickets_av` int(11) NOT NULL,
  `departure` datetime NOT NULL,
  `arrival` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `route_id_idx` (`route_id`),
  KEY `operator_id_idx` (`operator_id`),
  KEY `vehicle_id_idx` (`vehicle_id`),
  CONSTRAINT `operator_id` FOREIGN KEY (`operator_id`) REFERENCES `operators` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `route_id` FOREIGN KEY (`route_id`) REFERENCES `bus_routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vehicle_id` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_numbers`
--

LOCK TABLES `bus_numbers` WRITE;
/*!40000 ALTER TABLE `bus_numbers` DISABLE KEYS */;
INSERT INTO `bus_numbers` VALUES (10102,101,2,3,13,'2018-11-05 12:23:00','2018-11-05 18:49:00'),(10103,101,3,5,13,'2018-11-06 19:38:00','2018-11-07 05:24:00'),(10104,101,1,5,13,'2018-11-08 12:50:00','2018-11-09 18:33:00'),(20102,101,4,1,13,'2018-11-06 10:45:00','2018-11-07 15:40:00'),(30108,101,3,5,13,'2018-11-07 05:54:00','2018-11-08 15:21:00'),(40102,101,4,2,13,'2018-11-07 18:25:00','2018-11-08 16:39:00'),(50101,101,1,3,13,'2018-11-06 07:11:00','2018-11-07 23:20:00'),(60102,101,3,3,13,'2018-11-08 03:46:00','2018-11-09 21:35:00'),(310101,101,2,2,13,'2018-11-07 11:29:00','2018-11-08 22:44:00'),(310107,101,2,1,13,'2018-11-08 09:35:00','2018-11-09 17:08:00');
/*!40000 ALTER TABLE `bus_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_routes`
--

DROP TABLE IF EXISTS `bus_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bus_routes` (
  `id` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `dest` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `start_city_idx` (`start`),
  KEY `dest_city_idx` (`dest`),
  CONSTRAINT `dest_city` FOREIGN KEY (`dest`) REFERENCES `cities` (`id`),
  CONSTRAINT `start_city` FOREIGN KEY (`start`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_routes`
--

LOCK TABLES `bus_routes` WRITE;
/*!40000 ALTER TABLE `bus_routes` DISABLE KEYS */;
INSERT INTO `bus_routes` VALUES (101,11,1),(201,11,2),(301,11,3),(401,11,4),(501,11,5),(3101,11,31);
/*!40000 ALTER TABLE `bus_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `country` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Minsk','Belarus'),(2,'Moscow','Russia'),(3,'Kiev','Ukraine'),(4,'Warsaw','Poland'),(5,'Vilnius','Lithuania'),(11,'Gomel','Belarus'),(31,'Lviv','Ukraine');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `est_year` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (1,'Ecolines',1991),(2,'FlixBus',1995),(3,'Eurolines',1982),(4,'PolskiBus',1990);
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'MAN 105',45),(2,'NEOPLAN 228',60),(3,'IKARUS 66',56),(5,'Mercedes 88',38);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-06  0:42:30
