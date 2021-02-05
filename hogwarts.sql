-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hogwarts
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `bloodstatus`
--

DROP TABLE IF EXISTS `bloodstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodstatus` (
  `abbreviation` char(2) NOT NULL,
  `denotation` varchar(24) NOT NULL,
  `denotation_DE` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodstatus`
--

LOCK TABLES `bloodstatus` WRITE;
/*!40000 ALTER TABLE `bloodstatus` DISABLE KEYS */;
INSERT INTO `bloodstatus` VALUES ('HB','Half blood','Halbblut'),('MB','Muggle born','Muggelstämmig'),('PB','Pure blood','Reinblut');
/*!40000 ALTER TABLE `bloodstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diploma`
--

DROP TABLE IF EXISTS `diploma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diploma` (
  `abbreviation` char(4) NOT NULL,
  `denotation` varchar(48) NOT NULL,
  PRIMARY KEY (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diploma`
--

LOCK TABLES `diploma` WRITE;
/*!40000 ALTER TABLE `diploma` DISABLE KEYS */;
INSERT INTO `diploma` VALUES ('E','Expulsion'),('ND','No diploma'),('NDY','No diploma yet'),('NEWT','Nastily Exhausting Wizarding Test '),('OWL','Ordinary Wizarding Level'),('SE','Student exchange');
/*!40000 ALTER TABLE `diploma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `abbreviation` varchar(2) NOT NULL,
  `denotation` varchar(10) NOT NULL,
  PRIMARY KEY (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES ('G','Gryffindor'),('H','Hufflepuff'),('NH','No house'),('R','Ravenclaw'),('S','Slytherin');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housepoint`
--

DROP TABLE IF EXISTS `housepoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housepoint` (
  `housepointId` int NOT NULL AUTO_INCREMENT,
  `professorId` int NOT NULL,
  `studentId` int NOT NULL,
  `subject` varchar(5) NOT NULL,
  `date` date NOT NULL,
  `house_points` int NOT NULL,
  `penalty_points` int NOT NULL,
  `house` varchar(10) NOT NULL,
  PRIMARY KEY (`housepointId`),
  KEY `fkProfessorId_idx` (`professorId`) /*!80000 INVISIBLE */,
  KEY `fkStudentId_idx` (`studentId`),
  KEY `fkSubject_idx` (`subject`),
  CONSTRAINT `fkProfessorId` FOREIGN KEY (`professorId`) REFERENCES `professor` (`professorId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fkStudentId` FOREIGN KEY (`studentId`) REFERENCES `student` (`studentId`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fkSubject` FOREIGN KEY (`subject`) REFERENCES `subject` (`abbreviation`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housepoint`
--

LOCK TABLES `housepoint` WRITE;
/*!40000 ALTER TABLE `housepoint` DISABLE KEYS */;
INSERT INTO `housepoint` VALUES (1,12,7,'CMC','1994-03-05',10,0,'R'),(2,5,9,'TF','1991-01-18',10,0,'G'),(3,8,1,'P','1996-06-17',10,0,'G'),(4,6,16,'HB','1993-11-12',5,0,'S'),(5,8,11,'P','1996-05-09',5,0,'H'),(6,9,12,'DV','1994-04-11',5,0,'H'),(7,14,20,'HB','2017-12-17',10,0,'R'),(8,13,4,'FLY','1991-11-05',10,0,'G'),(9,4,49,'C','1993-02-24',0,5,'S'),(10,10,23,'AR','2014-05-13',10,0,'R'),(11,11,25,'HM','2019-01-30',10,0,'S'),(12,15,35,'ASN','1992-05-11',10,0,'G'),(13,6,50,'HB','1994-03-19',15,0,'S'),(14,13,31,'FLY','2015-03-04',10,0,'H'),(15,4,22,'C','2014-06-07',0,5,'R'),(16,16,29,'ART','2018-05-19',10,0,'S'),(17,9,34,'DV','1994-05-20',5,0,'G'),(18,8,10,'P','1996-07-15',10,0,'H'),(19,11,24,'HM','2018-12-13',5,0,'R'),(20,5,26,'TF','2018-02-04',0,15,'G'),(21,8,31,'P','2016-12-09',10,0,'H'),(22,13,18,'FLY','1992-01-25',0,10,'S'),(23,11,5,'HM','1996-03-14',10,0,'G'),(24,10,23,'AR','2018-06-27',25,0,'R'),(25,14,31,'HB','2017-11-06',10,0,'H');
/*!40000 ALTER TABLE `housepoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `professorId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(24) NOT NULL,
  `lastname` varchar(24) NOT NULL,
  `head_of_house` varchar(10) NOT NULL,
  `subject_I` varchar(5) NOT NULL,
  `subject_II` varchar(5) NOT NULL,
  `subject_III` varchar(5) NOT NULL,
  `birthday` date NOT NULL,
  `date_of_employment` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  PRIMARY KEY (`professorId`),
  KEY `fkSubjectI_idx` (`subject_I`,`subject_II`,`subject_III`),
  KEY `fkHouses_idx` (`head_of_house`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'Remus','Lupin','NH','DADA','NS','NS','1960-03-10','1993-09-01','1994-06-30'),(2,'Alastor','Moody','NH','DADA','NS','NS','1956-10-24','1994-09-01','1995-06-30'),(3,'Serverus','Snape','NH','DADA','P','NS','1960-01-09','1981-09-01','1998-06-30'),(4,'Filius','Flitwick','R','C','MU','AP','1945-10-17','1960-09-01','0000-00-00'),(5,'Minerva','McGonagall','G','TF','AP','NS','1935-10-04','1956-12-01','0000-00-00'),(6,'Pomona','Sprout','H','HB','NS','NS','1941-05-15','1958-09-01','0000-00-00'),(7,'Albus','Dumbledore','NH','TF','DADA','NS','1881-08-28','1912-09-01','1997-06-30'),(8,'Horace','Slughorn','S','P','ALC','NS','1889-04-28','1981-06-01','0000-00-00'),(9,'Sybill Patricia','Trelawney','NH','DV','NS','NS','1960-03-09','1981-09-01','0000-00-00'),(10,'Bathsheda','Babbling','NH','AR','NS','NS','1948-02-01','1983-09-01','0000-00-00'),(11,'Cuthbert','Binns','NH','HM','ALC','NS','1574-07-15','1600-09-01','0000-00-00'),(12,'Rubeus','Hagrid','NH','CMC','NS','NS','1928-12-06','1993-09-01','0000-00-00'),(13,'Rolanda','Hooch','NH','FLY','NS','NS','1912-04-14','1953-09-01','0000-00-00'),(14,'Neville','Longbottom','NH','HB','C','NS','1980-07-30','2000-09-01','0000-00-00'),(15,'Aurora','Sinistra','NH','ASN','NS','NS','1969-11-26','1989-09-01','0000-00-00'),(16,'Septima','Vector','NH','ART','NS','NS','1940-10-08','1967-09-01','0000-00-00');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentId` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(24) NOT NULL,
  `lastname` varchar(24) NOT NULL,
  `gender` char(1) NOT NULL,
  `house` varchar(12) NOT NULL,
  `bloodstatus` char(2) NOT NULL,
  `birthday` date NOT NULL,
  `date_of_enrollment` date NOT NULL,
  `date_of_leaving` date NOT NULL,
  `diploma` char(4) NOT NULL,
  PRIMARY KEY (`studentId`),
  KEY `fkHouse_idx` (`house`),
  KEY `fkBloodstatus_idx` (`bloodstatus`),
  KEY `fkDiploma_idx` (`diploma`),
  CONSTRAINT `fkBloodstatus` FOREIGN KEY (`bloodstatus`) REFERENCES `bloodstatus` (`abbreviation`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fkDiploma` FOREIGN KEY (`diploma`) REFERENCES `diploma` (`abbreviation`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fkHouse` FOREIGN KEY (`house`) REFERENCES `house` (`abbreviation`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Harry','Potter','m','G','HB','1980-07-31','1991-09-01','1998-06-30','OWL'),(2,'Hermine','Granger','f','G','MB','1979-09-19','1991-09-01','1998-06-30','NEWT'),(3,'Neville','Longbottom','m','G','PB','1980-07-30','1991-09-01','1998-06-30','NEWT'),(4,'Ronald','Weasley','m','G','PB','1980-03-01','1991-09-01','1998-06-30','OWL'),(5,'Fred','Weasley','m','G','PB','1978-04-01','1989-09-01','1994-06-10','NEWT'),(6,'George','Weasley','m','G','PB','1978-04-01','1989-09-01','1994-06-10','NEWT'),(7,'Luna','Lovegood','f','R','PB','1981-02-13','1992-09-01','1998-06-30','NEWT'),(8,'Ginny','Weasley','f','G','PB','1981-08-11','1992-09-01','1997-06-30','OWL'),(9,'Percy','Weasley','m','G','PB','1976-08-22','1987-09-01','1994-06-30','NEWT'),(10,'Ernest','Macmillian','m','H','MB','1980-09-06','1991-09-01','1998-06-30','NEWT'),(11,'Hannah','Abbott','f','H','HB','1980-05-20','1991-09-01','1998-06-30','NEWT'),(12,'Susan','Bones','f','H','HB','1980-10-09','1991-09-01','1998-06-30','NEWT'),(13,'Justin','Finch-Fletchley','m','H','MB','1980-03-24','1991-09-01','1998-06-30','NEWT'),(14,'Cho','Chang','f','R','HB','1979-11-18','1990-09-01','1997-06-30','NEWT'),(15,'Cedric','Diggory','m','H','PB','1997-10-10','1987-09-01','1994-06-30','NEWT'),(16,'Draco','Malfoy','m','S','PB','1980-06-05','1991-09-01','1998-06-30','NEWT'),(17,'Vincent','Crabbe','m','S','PB','1980-02-08','1991-09-01','1998-06-30','OWL'),(18,'Gregory','Goyle','m','S','PB','1980-07-15','1991-09-01','1998-06-30','OWL'),(19,'Pansy','Parkinson','f','S','PB','1980-08-01','1991-09-01','1998-06-30','OWL'),(20,'Emily Luna','Lowrey','f','R','PB','2005-01-20','2016-09-01','0000-00-00','NDY'),(21,'Lukas','Lowrey','m','R','PB','2004-02-05','2016-09-01','0000-00-00','NDY'),(22,'Amy','Lowrey','f','R','PB','2001-06-17','2012-09-01','2018-06-30','NEWT'),(23,'May','Lowrey','f','R','PB','2001-06-17','2012-09-01','2018-06-30','NEWT'),(24,'Vanessa','Harbor','f','R','HB','2000-10-21','2011-09-01','2017-06-30','NEWT'),(25,'Sakura','Yamamura','f','S','PB','2005-01-01','2018-09-01','0000-00-00','SE'),(26,'Lily Luna','Potter','f','G','PB','2005-09-01','2016-09-01','0000-00-00','NDY'),(27,'Hugo','Weasley','m','G','HB','2007-02-28','2018-09-01','0000-00-00','NDY'),(28,'Rose','Weasley','f','G','HB','2005-10-12','2016-09-01','0000-00-00','NDY'),(29,'Albus Serverus','Potter','m','S','PB','2003-08-17','2014-09-01','0000-00-00','NDY'),(30,'Scorpius','Malfoy','m','S','PB','2003-06-14','2014-09-01','0000-00-00','NDY'),(31,'July','Kennedy','f','H','MB','2003-10-31','2014-09-01','0000-00-00','NDY'),(32,'Jim','Harbor','m','R','HB','2003-07-19','2014-09-01','0000-00-00','NDY'),(33,'Michael','Harbor','m','R','HB','1999-04-07','2010-09-01','2016-06-30','NEWT'),(34,'Lavender','Brown','f','G','PB','1980-03-03','1991-09-01','1998-06-30','OWL'),(35,'Parvati','Patil','f','G','HB','1980-04-13','1991-09-01','1998-06-30','OWL'),(36,'Padma','Patil','f','R','HB','1980-04-13','1991-09-01','0000-00-00','OWL'),(37,'Seamus','Finnigan','m','G','HB','1980-03-09','1991-09-01','1998-06-30','OWL'),(38,'Dean','Thomas','m','G','HB','1980-02-05','1991-09-01','1998-06-30','OWL'),(39,'Megan','Jones','f','H','HB','1980-12-07','1991-09-01','1998-06-30','OWL'),(40,'Roger','Malone','m','R','MB','1980-11-28','1991-09-01','1998-06-30','OWL'),(41,'Mandy','Brocklehurst','f','R','HB','1980-04-12','1991-09-01','1998-06-30','OWL'),(42,'Sue','Li','f','R','HB','1980-06-07','1991-09-01','2000-06-30','NEWT'),(43,'Isobel','MacDougal','f','R','HB','1980-05-09','1991-09-01','1998-06-30','OWL'),(44,'Lisa','Turpin','f','R','MB','1980-09-09','1991-09-01','1998-06-30','OWL'),(45,'Terry','Boot','m','R','PB','1980-08-18','1991-09-01','1998-06-30','OWL'),(46,'Stephen','Cornfoot','f','R','PB','1980-07-16','1991-09-01','1998-06-30','OWL'),(47,'Michael','Corner','m','R','HB','1980-03-30','1991-09-01','2000-06-30','NEWT'),(48,'Theodore','Nott','m','S','PB','1980-10-18','1991-09-01','1998-06-30','OWL'),(49,'Blaise','Zabini','m','S','PB','1970-12-12','1991-09-01','1998-06-30','OWL'),(50,'Daphne','Greengrass','f','S','PB','1980-05-01','1991-09-01','1998-06-30','OWL'),(51,'Tim','Grzywocz','m','G','MB','2000-11-15','2015-09-01','0000-00-00','NDY');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `abbreviation` varchar(5) NOT NULL,
  `denotation` varchar(40) NOT NULL,
  PRIMARY KEY (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('ALC','Alchemy'),('AP','Apparition'),('AR','Ancient Runes'),('ART','Arithmancy'),('ASL','Astrology'),('ASN','Astronomy'),('C','Charms'),('CMC','Care of Magical Creatures'),('DADA','Defence Against the Dark Arts'),('DV','Divination'),('FLY','Flying'),('HB','Herbology'),('HM','History of Magic'),('MS','Muggle studies'),('MU','Music'),('NS','No (more) subject'),('P','Potions'),('TF','Transfiguration');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-05 13:29:15
