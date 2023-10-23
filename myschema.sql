-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: schoolDatabase
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CLASS`
--

DROP TABLE IF EXISTS `CLASS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLASS` (
  `ClassID` int NOT NULL,
  `ClassName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLASS`
--

LOCK TABLES `CLASS` WRITE;
/*!40000 ALTER TABLE `CLASS` DISABLE KEYS */;
INSERT INTO `CLASS` VALUES (100,'Homeroom','Student Homeroom','None'),(231,'Intro to Art','A brief intro to art.','ART'),(456,'History','History of rivers in Montana.','HIST'),(870,'Anthropology','Intro to anthropology','ANTHRO');
/*!40000 ALTER TABLE `CLASS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GRADELEVEL`
--

DROP TABLE IF EXISTS `GRADELEVEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GRADELEVEL` (
  `ClassID` int NOT NULL,
  `GradeLevel` varchar(10) NOT NULL,
  PRIMARY KEY (`ClassID`,`GradeLevel`),
  CONSTRAINT `GRADELEVEL_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `CLASS` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GRADELEVEL`
--

LOCK TABLES `GRADELEVEL` WRITE;
/*!40000 ALTER TABLE `GRADELEVEL` DISABLE KEYS */;
INSERT INTO `GRADELEVEL` VALUES (100,'0'),(231,'100'),(456,'200'),(870,'150');
/*!40000 ALTER TABLE `GRADELEVEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERSON`
--

DROP TABLE IF EXISTS `PERSON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PERSON` (
  `PersonID` int NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERSON`
--

LOCK TABLES `PERSON` WRITE;
/*!40000 ALTER TABLE `PERSON` DISABLE KEYS */;
INSERT INTO `PERSON` VALUES (111,'Jane','Doe'),(222,'John','Doe'),(544,'Melissa','Johnson'),(677,'Erica','Reeve');
/*!40000 ALTER TABLE `PERSON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECTION`
--

DROP TABLE IF EXISTS `SECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SECTION` (
  `SectionID` int NOT NULL,
  `ClassID` int DEFAULT NULL,
  `RoomNumber` varchar(20) DEFAULT NULL,
  `TeacherID` int DEFAULT NULL,
  PRIMARY KEY (`SectionID`),
  KEY `ClassID` (`ClassID`),
  KEY `TeacherID` (`TeacherID`),
  CONSTRAINT `SECTION_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `CLASS` (`ClassID`),
  CONSTRAINT `SECTION_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `TEACHER` (`TeacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECTION`
--

LOCK TABLES `SECTION` WRITE;
/*!40000 ALTER TABLE `SECTION` DISABLE KEYS */;
INSERT INTO `SECTION` VALUES (200,456,'221',6773),(220,231,'121',5445),(300,870,'321',5445),(400,100,'25',5445);
/*!40000 ALTER TABLE `SECTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDENT`
--

DROP TABLE IF EXISTS `STUDENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STUDENT` (
  `StudentID` int NOT NULL,
  `PersonID` int DEFAULT NULL,
  `HomeroomClassroomID` int DEFAULT NULL,
  PRIMARY KEY (`StudentID`),
  KEY `PersonID` (`PersonID`),
  KEY `HomeroomClassroomID` (`HomeroomClassroomID`),
  CONSTRAINT `STUDENT_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `PERSON` (`PersonID`),
  CONSTRAINT `STUDENT_ibfk_2` FOREIGN KEY (`HomeroomClassroomID`) REFERENCES `SECTION` (`SectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENT`
--

LOCK TABLES `STUDENT` WRITE;
/*!40000 ALTER TABLE `STUDENT` DISABLE KEYS */;
INSERT INTO `STUDENT` VALUES (1110,111,400),(2220,222,400);
/*!40000 ALTER TABLE `STUDENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEACHER`
--

DROP TABLE IF EXISTS `TEACHER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEACHER` (
  `TeacherID` int NOT NULL,
  `PersonID` int DEFAULT NULL,
  PRIMARY KEY (`TeacherID`),
  KEY `PersonID` (`PersonID`),
  CONSTRAINT `TEACHER_ibfk_1` FOREIGN KEY (`PersonID`) REFERENCES `PERSON` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEACHER`
--

LOCK TABLES `TEACHER` WRITE;
/*!40000 ALTER TABLE `TEACHER` DISABLE KEYS */;
INSERT INTO `TEACHER` VALUES (5445,544),(6773,677);
/*!40000 ALTER TABLE `TEACHER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23  3:19:51
