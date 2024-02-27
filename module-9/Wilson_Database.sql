CREATE DATABASE  IF NOT EXISTS `wilsonfinancial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wilsonfinancial`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: wilsonfinancial
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `clientassets`
--

DROP TABLE IF EXISTS clientassets;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clientassets (
  assetsid int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  price decimal(10,0) DEFAULT NULL,
  clientid int NOT NULL,
  PRIMARY KEY (assetsid),
  KEY clientid (clientid),
  CONSTRAINT clientassets_ibfk_1 FOREIGN KEY (clientid) REFERENCES clients (clientid)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientassets`
--

INSERT INTO clientassets VALUES (1,'JONES ASSOCIATION','Teacher Club',45000,1);
INSERT INTO clientassets VALUES (2,'MARQUIS TRUCKING ','Trucking',115785,2);
INSERT INTO clientassets VALUES (3,'SHANTELL TRADING ','Stock Trading',96785,3);
INSERT INTO clientassets VALUES (4,'DAVID VOLTAGE LLC','Electrician',75854,4);
INSERT INTO clientassets VALUES (5,'MARK FIGHTS FIRES','FIREFIRE ASSOC',68745,5);
INSERT INTO clientassets VALUES (6,'AMY BAKERY','CULINARY',87456,6);

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS clients;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clients (
  clientid int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  occupation varchar(20) DEFAULT NULL,
  transactions int DEFAULT NULL,
  assets varchar(50) DEFAULT NULL,
  income decimal(10,0) DEFAULT NULL,
  address varchar(25) DEFAULT NULL,
  city varchar(20) DEFAULT NULL,
  state varchar(2) DEFAULT NULL,
  zip char(10) DEFAULT NULL,
  email varchar(30) DEFAULT NULL,
  empid int NOT NULL,
  PRIMARY KEY (clientid),
  KEY empid (empid),
  CONSTRAINT clients_ibfk_1 FOREIGN KEY (empid) REFERENCES employees (empid)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

INSERT INTO clients VALUES (1,'Alicia Jones','Teacher',5,'10700',65700,'325 Walter st','Orlando','FL','74563','ajones@gmail.com',1);
INSERT INTO clients VALUES (2,'Marquis Alexander','Trucker',7,'16400',102750,'394 mountain top','Jackson','TN','47569','males@malextrk.com',2);
INSERT INTO clients VALUES (3,'Shantell Marshall','NYSE',17,'45700',297540,'1001 E Center Dr.','Boston','MA','29453','smarshall@gmail.com',1);
INSERT INTO clients VALUES (4,'David Clemmons','Electrician',3,'88490',95870,'685 crossing st','San Francisco','CA','35247','dclemmons@elecconnect.com',2);
INSERT INTO clients VALUES (5,'Mark Thomas','Fire Fighter',11,'22000',64730,'9875 trade st','FairFax','VA','48563','mthomas@firestat3.org',2);
INSERT INTO clients VALUES (6,'Amy Stevns','cooking',11,'38325',108654,'7056 sharon rd','Denver','CO','25369','amy@gmail.com',2);

--
-- Table structure for table `clienttransactions`
--

DROP TABLE IF EXISTS clienttransactions;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clienttransactions (
  transid int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  otherparty varchar(20) DEFAULT NULL,
  amount decimal(10,0) DEFAULT NULL,
  clientid int NOT NULL,
  PRIMARY KEY (transid),
  KEY clientid (clientid),
  CONSTRAINT clienttransactions_ibfk_1 FOREIGN KEY (clientid) REFERENCES clients (clientid)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienttransactions`
--

INSERT INTO clienttransactions VALUES (1,'credit card','n',14563,1);
INSERT INTO clienttransactions VALUES (2,'check','n',74765,2);
INSERT INTO clienttransactions VALUES (3,'credit card','y',4085,3);
INSERT INTO clienttransactions VALUES (4,'credit card','n',78456,4);
INSERT INTO clienttransactions VALUES (5,'cash','y',736544,5);
INSERT INTO clienttransactions VALUES (6,'credit card','y',5263,6);

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS employees;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE employees (
  empid int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  phone varchar(10) DEFAULT NULL,
  email varchar(30) DEFAULT NULL,
  address varchar(25) DEFAULT NULL,
  city varchar(25) DEFAULT NULL,
  state varchar(2) DEFAULT NULL,
  zip char(10) DEFAULT NULL,
  department varchar(20) DEFAULT NULL,
  PRIMARY KEY (empid)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

INSERT INTO employees VALUES (1,'Jake Wilson','2084574512','jwilson@wilsonfinancial.com','123 Commerce St','New York','NY','10002','Operations');
INSERT INTO employees VALUES (2,'Ned Wilson','2087631489','nwilson@wilsonfinancial.com','123 Commerce St','New York','NY','10002','Operations');
INSERT INTO employees VALUES (3,'Phoenix TwoStar','2074430712','ptwostar@wilsonfinancial.com','123 Commerce St','New York','NY','10002','Operations');
INSERT INTO employees VALUES (4,'Phoenix TwoStar','2074430712','ptwostar@wilsonfinancial.com','123 Commerce St','New York','NY','10002','Operations');

--
-- Table structure for table `officesupplies`
--

DROP TABLE IF EXISTS officesupplies;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE officesupplies (
  supplyid int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  instock varchar(1) DEFAULT NULL,
  last_ordered date DEFAULT NULL,
  last_ordered_by varchar(20) DEFAULT NULL,
  portalid int NOT NULL,
  PRIMARY KEY (supplyid),
  KEY portalid (portalid),
  CONSTRAINT officesupplies_ibfk_1 FOREIGN KEY (portalid) REFERENCES employees (empid)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officesupplies`
--

INSERT INTO officesupplies VALUES (1,'printer paper','Y','2024-01-14','Phoenix',3);
INSERT INTO officesupplies VALUES (2,'printers','N','2023-07-11','Phoenix',3);

--
-- Table structure for table `portallogin`
--

DROP TABLE IF EXISTS portallogin;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE portallogin (
  portalid int NOT NULL AUTO_INCREMENT,
  username varchar(20) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  empid int NOT NULL,
  PRIMARY KEY (portalid),
  KEY empid (empid),
  CONSTRAINT portallogin_ibfk_1 FOREIGN KEY (empid) REFERENCES employees (empid)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portallogin`
--

INSERT INTO portallogin VALUES (1,'jakeexe','Welcome',1);
INSERT INTO portallogin VALUES (2,'nedexe','Welcome',2);
INSERT INTO portallogin VALUES (3,'phoenix2','Welcome',3);
INSERT INTO portallogin VALUES (4,'junesantos','Welcome',4);
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-24 22:15:48
SHOW TABLES;