-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbmovies
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `idMovies` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `duration` varchar(45) NOT NULL,
  `language` varchar(45) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `day1` varchar(45) NOT NULL,
  `day2` varchar(45) NOT NULL,
  `day3` varchar(45) NOT NULL,
  `schedule1` varchar(45) NOT NULL,
  `schedule2` varchar(45) NOT NULL,
  `schedule3` varchar(45) NOT NULL,
  `idCinema` int(11) NOT NULL,
  `idDirector` int(11) NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idMovies`),
  KEY `idCinema_idx` (`idCinema`),
  KEY `idDirector` (`idDirector`),
  CONSTRAINT `idCinema` FOREIGN KEY (`idCinema`) REFERENCES `cinemas` (`idCinemas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idDirector` FOREIGN KEY (`idDirector`) REFERENCES `persons` (`idPersons`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Thor 3 Ragnarok','2h10','VF',0,'2017-10-25','2017-12-20','Wednesday','Friday','Saturday','20:00','19:00','15:30',1,6,'image/Thor3.jpg'),(10,'Star Wars VIII','2h30','VOSTFR',0,'2017-12-13','2018-02-09','Wednesday','Thursday','Saturday','16:0','19:30','22:10',1,2,'image/StarWars8.jpg'),(11,'Suburbicon','1h45','',0,'2017-12-06','2018-04-01','Tuesday','Thursday','Sunday','15:45','19:0','14:55',1,9,'image/Suburbicon.jpg'),(12,'Forrest Gump','2h22','VF',0,'2017-12-10','2018-01-10','Monday','Tuesday','Friday','14:0','19:15','16:55',1,14,'image/ForrestGump.jpg');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-03 19:21:18
